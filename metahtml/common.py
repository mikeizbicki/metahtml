import copy
import datetime
import jsonpath_ng
import lxml
import lxml.html
import re
from urllib.parse import urlparse

################################################################################

# NOTE: url_jsonpaths
url_jsonpaths = [
    '$..url',
    '$..@id',
    '$..mainEntityOfPage',
    ]
url_jsonpath = '(' + ')|('.join(url_jsonpaths) + ')'
compiled_url_jsonpath = jsonpath_ng.parse(url_jsonpath)

#from collections import namedtuple
#WebpageInfo = namedtuple(parser, ldjsons, url)

def compile_jsonpaths(jsonpaths):
    return [ ( hostname, jsonpath, jsonpath_ng.parse(jsonpath)) for hostname,jsonpath in jsonpaths ]

def compile_xpaths(xpaths):
    return [ ( hostname, xpath, lxml.etree.XPath(xpath)) for hostname,xpath in xpaths ]

def compile_regexes(regexes):
    return [ ( hostname, regex, re.compile(regex)) for hostname,regex in regexes ]

def load_all_xpaths(pattern):
    import glob
    import ast
    xpaths = []
    for filename in glob.glob(pattern):
        with open(filename) as f:
            xpaths += ast.literal_eval(f.read())
    return xpaths

def get_timestamp(
        parser, 
        ldjsons, 
        url, 
        compiled_jsonpaths, 
        compiled_xpaths,
        compiled_regexes,
        parse_timestamp_str,
        get_best_timestamps,
        fast=True,
        ):
    '''
    FIXME: make the xpath code faster using
    https://www.ibm.com/developerworks/xml/library/x-hiperfparse/
    '''
    url_parsed = urlparse(url)
    url_hostname = url_parsed.hostname

    timestamps = []

    #################################################################################
    # get timestamps from jsonpaths
    #################################################################################

    # find all entries in the ldjsons that match a jsonpath
    matches = []
    for ldjson in ldjsons:
        for hostname, jsonpath, compiled_jsonpath in compiled_jsonpaths:
            matches += list(compiled_jsonpath.find(ldjson))

    # compute the total number of unique matches;
    # this number is used to help interpret malformed ld+json entries;
    # if there is only 1 unique match found,
    # then we assume that value must be the value for the entire page
    # even if this is not explicitly stated in the ld+json entry
    # NOTE:
    # this is wrapped in a try/except block because if the match contains a dictionary,
    # it cannot be placed inside of a set
    try:
        num_unique_matches = len(set([match.value for match in matches]))
    except:
        num_unique_matches = 2

    # parsing timestamps is very expensive,
    # therefore, we don't want to parse the same timestamp twice;
    # this list holds all the previously found timestamps
    match_values_added = []

    # we're now ready to extract the timestamps from the matches
    for match in matches:

        # skip the match if we've already found it
        if match.value in match_values_added:
            continue

        # all matches correspond to a timestamp,
        # but they are not necessarily a timestamp for the current article;
        # we will reject the match if ld+json entry does not contain the current url inside of it;
        # but if there is only 1 timestamp,
        # we assume it is the timestamp of the current article;
        # this step is not an optimization, it is required for correctness
        if num_unique_matches>1:
            found_urls = [ found_url.value for found_url in compiled_url_jsonpath.find(match.context) if found_url.value is not None]
            if not any (url in found_url for found_url in found_urls):
                continue
            # NOTE:
            # we must use the condition above rather than the simpler condition below
            # because the url may be followed by a #id symbol with the ld+json
            #if not url in found_urls:
                #continue

        # the match was not rejected, so we parse the timestamp from the match
        timestamp = parse_timestamp_str(match.value)
        if timestamp is not None:
            timestamp['is_valid_for_hostname'] = True
            timestamp['pattern'] = 'ld+json'
            timestamps.append(timestamp)
        match_values_added.append(match.value)

    #################################################################################
    # get timestamps from xpaths
    #################################################################################

    xpaths_visited = set()

    # if a hostname specific xpath is found, then we will disable the universal xpaths;
    # this variable keeps track of whether the hostname specific hostname has been found
    disable_universal_xpaths = False

    # sort the xpaths in alphabetical order by hostname, with universal paths at the end;
    # sorting improves determinism by ensuring that we always visit xpaths in the same order,
    # and in particular that we always visit hostname-specific xpaths before universal xpaths;
    # this ensures the disable_universal_xpaths flag always works
    compiled_xpaths.sort(key = lambda x: (x[0] is None, x[0]))

    for hostname,xpath,compiled_xpath in compiled_xpaths:

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
            elements = compiled_xpath(parser)
        except Exception as e:
            raise ValueError('hostname=',hostname,' xpath=',xpath,' ; e=',e)

        # loop through all elements found by the xpath
        for element in elements:

            # element can be one of several different types of lxml objects;
            # depending on the type, we need to extract the text in different ways
            if type(element) is lxml.etree._ElementUnicodeResult:
                timestamp_str = str(element)
            elif type(element) is lxml.etree._Element:
                timestamp_str = element.text
            elif type(element) is lxml.html.HtmlElement:
                timestamp_str = element.text_content()

            # generate the timestamp from text
            timestamp = parse_timestamp_str(timestamp_str)
            if timestamp is not None:
                timestamp['is_valid_for_hostname'] = valid_for_hostname
                timestamp['pattern'] = xpath
                timestamps.append(timestamp)

                # NOTE:
                # the following check is tempting but wrong;
                # we need to ensure that pages with many urls 
                # get treated as categories and not articles
                #if valid_for_hostname and fast:
                    #break

    #################################################################################
    # get timestamp from url
    #################################################################################

    for hostname, regex, compiled_regex in compiled_regexes:
        date_match = re.search(regex, url)
        if date_match:
            timestamp_str = date_match.group(1)
            timestamp = parse_timestamp_str(timestamp_str)
            timestamp['is_valid_for_hostname'] = True
            timestamp['pattern'] = 'url'
            timestamps.append(timestamp)

    #################################################################################
    # extract the best timestamp from the list of available timestamps
    #################################################################################

    best_timestamps = get_best_timestamps(timestamps)

    return best_timestamps, timestamps

