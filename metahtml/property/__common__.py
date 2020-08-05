import copy
import datetime
import jsonpath_ng
import lxml
import lxml.html
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
            'value' : result,
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

            # the match was not rejected, so we parse the match from the match
            result = cls.str_to_result(match.value)
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

        # FIXME:
        # this condition prevents the url checks from being run on webpages 
        # that use query arguments to index their pages;
        # it's an ugly hack that's not guaranteed to work in general
        if len(parser.url_parsed.path) >8 or len(parser.url_parsed.query)<5:
            for hostname, regex, compiled_regex in cls.compiled_regexes:
                #date_match = re.search(regex, parser.url)
                date_match = re.search(regex, parser.url_parsed.path)
                if hostname is None or hostname in parser.url_parsed.hostname:
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

