import copy
import datetime
import jsonpath_ng
import lxml
import lxml.html
import unicodedata
import re
from urllib.parse import urlparse

################################################################################

# these jsonpaths are used to extract the url from a segment of json
url_jsonpaths = [
    '$..url',
    '$..@id',
    '$..mainEntityOfPage',
    ]
url_jsonpath = '(' + ')|('.join(url_jsonpaths) + ')'
compiled_url_jsonpaths = jsonpath_ng.parse(url_jsonpath)


class BaseExtractor():
    '''
    Every extractor follows the same basic formula:

    1) Generate a list of `matches` that potentially contain the property's information.
       The primary source for this list are the following variables,
       which should be redefined in any derived class:
        a) `xpaths` points to locations in the html document
        b) `jsonpaths` points to locations in the ld+json script tags
        c) `regexes` points to locations within the url
       Some properties cannot be extracted using these patterns only,
       and so a `custom_patterns` function can also be implemented for these patterns.

    2) The list of `matches` is passed to the `filter_results` method to generate the `filtered` list.

    3) The `filtered_list` is passed to the `get_best` method to extract the final property value.

    '''

    xpaths = []
    jsonpaths = []
    regexes = []


    @staticmethod
    def custom_patterns(parser, results):
        pass


    @staticmethod
    def result_to_str(result):
        try:
            return result['best']['value']
        except TypeError:
            return 


    @staticmethod
    def str_to_result(result):
        return {
            'value' : simplify_text(result),
            'raw' : result,
            }


    @staticmethod
    def filter_results(results):
        return results


    @staticmethod
    def get_best(results):
        if len(results)>0:
            return results[0]


    @classmethod
    def _compile_paths(cls):
        '''
        This function precompiles all of the values in the `xpaths`, `jsonpaths`, and `regexes` lists.
        Precompiling these paths improves parsing efficiency by about 2-5x.
        This function is called automatically the first time that the `extract` function is called,
        and does not need to be called directly.

        NOTE:
        This function should not be reimplemented in any derived class.
        '''
        try:
            cls.compiled_jsonpaths
        except (NameError,AttributeError):
            cls.compiled_jsonpaths = [ ( hostname, jsonpath, jsonpath_ng.parse(jsonpath)) for hostname,jsonpath in cls.jsonpaths ]
            cls.compiled_xpaths = [ ( hostname, xpath, lxml.etree.XPath(xpath)) for hostname,xpath in cls.xpaths ]
            cls.compiled_regexes = [ ( hostname, regex, re.compile(regex)) for hostname,regex in cls.regexes ]


    @classmethod
    def extract(cls, parser):
        cls._compile_paths()
        doc = parser.doc
        url_hostname = parser.url_parsed.hostname
        fast = True

        results = []

        #################################################################################
        # get results from jsonpaths
        #################################################################################

        # if a hostname specific jsonpath is found, then we will disable the universal jsonpaths;
        # this variable keeps track of whether the hostname specific hostname has been found
        disable_universal_jsonpaths = False

        # find all entries in the ldjsons that match a jsonpath
        ldjson_matches = []
        for ldjson in parser.ldjsons:
            for hostname, jsonpath, cls.compiled_jsonpath in cls.compiled_jsonpaths:

                # determine whether the jsonpath applies to this hostname
                if hostname is not None:
                    disable_universal_jsonpaths = disable_universal_jsonpaths or (hostname == url_hostname or 'www.'+hostname == url_hostname)
                    valid_for_hostname = hostname in url_hostname
                else:
                    valid_for_hostname = not disable_universal_jsonpaths

                # apply the jsonpath
                if valid_for_hostname:
                    for match in cls.compiled_jsonpath.find(ldjson):
                        ldjson_matches.append((jsonpath,match))

        # compute the total number of unique ldjson_matches;
        # this number is used to help interpret malformed ld+json entries;
        # if there is only 1 unique match found,
        # then we assume that value must be the value for the entire page
        # even if this is not explicitly stated in the ld+json entry
        # NOTE:
        # this is wrapped in a try/except block because if the match contains a dictionary,
        # it cannot be placed inside of a set
        try:
            num_unique_matches = len(set([match.value for jsonpath,match in ldjson_matches]))
        except:
            num_unique_matches = 2

        # parsing ldjson_matches is very expensive,
        # therefore, we don't want to parse the same match twice;
        # this list holds all the previously found ldjson_matches
        match_values_added = []

        # we're now ready to extract the results from the ldjson_matches
        for jsonpath,match in ldjson_matches:

            # skip the match if we've already found it
            if match.value in match_values_added:
                continue

            # all ldjson_matches correspond to a match,
            # but they are not necessarily a match for the current article;
            # we will reject the match if ld+json entry does not contain the current url inside of it;
            # but if there is only 1 match,
            # we assume it is the match of the current article;
            # this step is not an optimization, it is required for correctness
            if num_unique_matches>1:
                found_urls = [ found_url.value for found_url in compiled_url_jsonpaths.find(match.context) if found_url.value is not None]
                if not any (parser.url in found_url for found_url in found_urls):
                    continue
                # NOTE:
                # we must use the condition above rather than the simpler condition below
                # because the url may be followed by a #id symbol with the ld+json
                #if not url in found_urls:
                    #continue

            # get the value from the match;
            # most websites store the value directly in the specified location,
            # but some websites store the value as a list with one element
            # (e.g. https://cn.reuters.com/news/picture/pictures-report-idCNRTXBCF81),
            # and we must extract the value from this list
            value = match.value
            if type(value) is list and len(value) == 1:
                value = value[0]

            # the match was not rejected, so we parse the match from the match
            result = cls.str_to_result(value)
            if result is not None:
                result['is_valid_for_hostname'] = True
                result['pattern'] = 'ld+json'
                result['pattern_details'] = jsonpath
                results.append(result)
            match_values_added.append(match.value)

        #################################################################################
        # get results from xpaths
        #################################################################################

        xpaths_visited = set()

        # if a hostname specific xpath is found, then we will disable the universal xpaths;
        # this variable keeps track of whether the hostname specific hostname has been found
        disable_universal_xpaths = False

        # sort the xpaths in alphabetical order by hostname, with universal paths at the end;
        # sorting improves determinism by ensuring that we always visit xpaths in the same order,
        # and in particular that we always visit hostname-specific xpaths before universal xpaths;
        # this ensures the disable_universal_xpaths flag always works
        cls.compiled_xpaths.sort(key = lambda x: (x[0] is None, x[0]))

        for hostname,xpath,cls.compiled_xpath in cls.compiled_xpaths:

            # determine whether the xpath applies to this hostname
            if hostname is not None:
                disable_universal_xpaths = disable_universal_xpaths or (hostname == url_hostname or 'www.'+hostname == url_hostname)
                valid_for_hostname = hostname in url_hostname

                # FIXME:
                # this special case is needed because other blogspot blogs add too many xpaths,
                # and there's no other way currently to disable some xpaths for subdomains
                if url_hostname in ['egoistenblog.blogspot.com']:
                    valid_for_hostname = False
            else:
                valid_for_hostname = not disable_universal_xpaths

            # if in fast mode, then only search for elements that will apply to the hostname
            if fast and not valid_for_hostname:
                continue

            # If we've already looked at this xpath, then skip it
            # unless it's valid_for_hostname, then we must keep it.
            # We skip because many hostnames can have the same xpath,
            # and we don't want to include the same xpath multiple times
            # FIXME:
            # Currently, if we insert an xpath that's not valid_for_hostname,
            # then when we insert the same xpath that is valid_for_hostname,
            # we don't remove the previous results, so we get duplicates
            if xpath in xpaths_visited and not valid_for_hostname:
                continue
            xpaths_visited.add(xpath)

            # calculate the elements found by the xpath;
            # this is wrapped in a try/except block so that when an error occurs,
            # we can see the offending test case;
            # this aids debugging
            try:
                elements = cls.compiled_xpath(doc)
            except Exception as e:
                raise ValueError('hostname=',hostname,' xpath=',xpath,' ; e=',e)

            # loop through all elements found by the xpath
            for element in elements:

                # element can be one of several different types of lxml objects;
                # depending on the type, we need to extract the text in different ways
                if type(element) is lxml.etree._ElementUnicodeResult:
                    result_str = str(element)
                elif type(element) is lxml.etree._Element:
                    result_str = element.text
                elif type(element) is lxml.html.HtmlElement:
                    result_str = element.text_content()

                # generate the result from text
                result = cls.str_to_result(result_str)
                if result is not None:
                    result['is_valid_for_hostname'] = valid_for_hostname
                    result['pattern'] = xpath
                    results.append(result)

                    # NOTE:
                    # the following check is tempting but wrong;
                    # we need to ensure that pages with many urls 
                    # get treated as categories and not articles
                    #if valid_for_hostname and fast:
                        #break

        #################################################################################
        # get match from url
        #################################################################################

        disable_universal_regexes = False
        # FIXME:
        # this condition prevents the url checks from being run on webpages 
        # that use query arguments to index their pages;
        # it's an ugly hack that's not guaranteed to work in general
        if len(parser.url_parsed.path) >8 or len(parser.url_parsed.query)<5:
            for hostname, regex, compiled_regex in cls.compiled_regexes:
                date_match = re.search(regex, parser.url_parsed.path)
                if hostname is not None:
                    disable_universal_regexes = disable_universal_regexes or (hostname == url_hostname or 'www.'+hostname == url_hostname)
                if (hostname is None and not disable_universal_regexes) or (hostname is not None and hostname in url_hostname):
                    if date_match:
                        result_str = date_match.group(1)
                        result = cls.str_to_result(result_str)
                        result['is_valid_for_hostname'] = True
                        result['pattern'] = 'url'
                        results.append(result)

        #################################################################################
        # custom patterns
        #################################################################################

        cls.custom_patterns(parser, results)

        #################################################################################
        # extract the best match from the list of available results 
        #################################################################################

        filtered = cls.filter_results(results)
        best = cls.get_best(filtered)

        return {
            'best' : best,
            'filtered' : filtered,
            'results' : results
            }


################################################################################
# text formatting
################################################################################

def normalize_unidecode_punctuation(text):
    '''
    converts unicode punctuation into equivalent ascii punctuation symbols
    see: https://lexsrv3.nlm.nih.gov/LexSysGroup/Projects/lvg/current/docs/designDoc/UDF/unicode/DefaultTables/symbolTable.html
    '''
    return ''.join(map(lambda c: unicode_punctuation.get(c,c), unicodedata.normalize('NFC',text)))

unicode_punctuation = {
    '\u00AB':'"',
    '\u00AD':'-',
    '\u00B4':'\'',
    '\u00BB':'"',
    '\u00F7':'/',
    '\u01C0':'|',
    '\u01C3':'!',
    '\u02B9':'\'',
    '\u02BA':'"',
    '\u02BC':'\'',
    '\u02C4':'^',
    '\u02C6':'^',
    '\u02C8':'\'',
    '\u02CB':'`',
    '\u02CD':'_',
    '\u02DC':'~',
    '\u0300':'`',
    '\u0301':'\'',
    '\u0302':'^',
    '\u0303':'~',
    '\u030B':'"',
    '\u030E':'"',
    '\u0331':'_',
    '\u0332':'_',
    '\u0338':'/',
    '\u0589':':',
    '\u05C0':'|',
    '\u05C3':':',
    '\u066A':'%',
    '\u066D':'*',
    '\u200B':'',
    '\u2010':'-',
    '\u2011':'-',
    '\u2012':'-',
    '\u2013':'-',
    '\u2014':'-',
    '\u2015':'-',
    '\u2016':'|',
    '\u2017':'_',
    '\u2018':'\'',
    '\u2019':'\'',
    '\u201A':',',
    '\u201B':'\'',
    '\u201C':'"',
    '\u201D':'"',
    '\u201E':'"',
    '\u201F':'"',
    '\u2032':'\'',
    '\u2033':'"',
    '\u2034':'\'',
    '\u2035':'`',
    '\u2036':'"',
    '\u2037':'\'',
    '\u2038':'^',
    '\u2039':'<',
    '\u203A':'>',
    '\u203D':'?',
    '\u2044':'/',
    '\u204E':'*',
    '\u2052':'%',
    '\u2053':'~',
    '\u2060':' ',
    '\u20E5':'\\',
    '\u2212':'-',
    '\u2215':'/',
    '\u2216':'\\',
    '\u2217':'*',
    '\u2223':'|',
    '\u2236':':',
    '\u223C':'~',
    '\u2264':'<',
    '\u2265':'>',
    '\u2266':'<',
    '\u2267':'>',
    '\u2303':'^',
    '\u2329':'<',
    '\u232A':'>',
    '\u266F':'#',
    '\u2731':'*',
    '\u2758':'|',
    '\u2762':'!',
    '\u27E6':'[',
    '\u27E8':'<',
    '\u27E9':'>',
    '\u2983':'{',
    '\u2984':'}',
    '\u3003':'"',
    '\u3008':'<',
    '\u3009':'>',
    '\u301B':']',
    '\u301C':'~',
    '\u301D':'"',
    '\u301E':'"',
    '\uFEFF':'',
    }

_RE_COMBINE_WHITESPACE = re.compile(r"\s+")

def simplify_text(text):
    '''
    converts unicode punctuation and whitespace symbols into equivalent ascii symbols,
    and removes excess whitespace
    '''
    return normalize_unidecode_punctuation(_RE_COMBINE_WHITESPACE.sub(" ", text).strip())

