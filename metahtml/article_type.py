
import copy
import re
from urllib.parse import urlparse
import lxml
import lxml.html

from metahtml.timestamp import worst_tz_lo, worst_tz_hi

def get_article_type(parser, url, meta_best, fast=False):

    best_timestamps = meta_best['timestamp_published']
    url_parsed = urlparse(url)

    article_types = []

    # pages with no timestamps have an unknown article_type
    if best_timestamps is None or len(best_timestamps)==0:
        if best_timestamps is None:
            pattern_details = 'None'
        else:
            pattern_details = 'len(best_timestamps)==0'
        article_types.append({
            'article_type' : 'unknown',
            'valid_for_hostname' : True,
            'pattern' : 'meta_best',
            'pattern_details' : pattern_details,
            })

    # pages with too many timestamps are probably not an article, 
    # but instead a "category" page listing many article types;
    if best_timestamps is not None and len(best_timestamps) != 0:

        # Some articles have several timestamps close together, however,
        # possibly due to misconfigured publishing platforms;
        # therefore we have to calculate the range of the timestamps appearing on the page first
        min_lo = None
        max_hi = None
        for best in best_timestamps:
            # modified timestamps include worst case timezones if no timezone specified
            best_lo_mod = best['timestamp_lo']
            if best_lo_mod.tzinfo is None:
                best_lo_mod = copy.copy(best_lo_mod).replace(tzinfo = worst_tz_lo)
            best_hi_mod = best['timestamp_hi']
            if best_hi_mod.tzinfo is None:
                best_hi_mod = copy.copy(best_hi_mod).replace(tzinfo = worst_tz_hi)

            # update min/max
            if min_lo is None or best_lo_mod < min_lo:
                min_lo = best_lo_mod
            if max_hi is None or best_hi_mod > max_hi:
                max_hi = best_hi_mod

        if min_lo is not None and max_hi is not None:
            timestamp_range =  max_hi - min_lo

        # the webpage is determined to be a catalog if there are 
        # too many timestamps spaced too far apart
        # NOTE: the selected range is 1 day if no timezones are given 
        # FIXME: this check is very heuristic and needs more evaluation
        if len(best_timestamps) > 5 or abs(timestamp_range.total_seconds()) > 48*60*60:
            article_types.append({
                'article_type' : 'catalog',
                'valid_for_hostname' : True,
                'pattern' : 'len(best_timestamps)',
                'pattern_details' : str(len(best_timestamps)),
                })

    # xpath-based patterns
    xpaths = [
        ( 'cnbc.com', '//meta[@property="og:type"]/@content' ),
        ]
    for hostname,xpath in xpaths:

        # if in fast mode, then only search for elements that will apply to the hostname
        valid_for_hostname = hostname is None or hostname in url_parsed.hostname
        if fast and not valid_for_hostname:
            continue

        # loop through all elements found by the xpath
        for element in parser.xpath(xpath):

            # element can be one of several different types of lxml objects;
            # depending on the type, we need to extract the text in different ways
            if type(element) is lxml.etree._ElementUnicodeResult:
                text = str(element)
            elif type(element) is lxml.etree._Element:
                text = element.text
            elif type(element) is lxml.html.HtmlElement:
                text = element.text_content()

            # FIXME: this is a hack
            if text=='video':
                text = 'article'

            # generate the article_type from text
            article_types.append({
                'article_type' : text,
                'pattern' : 'xpath',
                'pattern_details' : xpath,
                'valid_for_hostname' : valid_for_hostname,
                })

    # url-based patterns
    regexs = [
        # these regexs match webpages that contain only dates
        ( None, r'/(19|20)\d{2}/[a-zA-Z]{3}/\d{2}/?$' ),
        ( None, r'/(19|20)\d{2}/\d{2}/\d{2}/?$' ),
        ( None, r'/(19|20)\d{2}/\d{2}/?$' ),
        ( None, r'/(19|20)\d{2}/?$' ),
        ( None, r'^/?$' ),
        ( None, r'^/article/?$' ),
        ( None, r'^/category/?$' ),
        ( None, r'^/category/uncategorized/?$' ),

        ( None, r'^/en/?$' ),
        ( None, r'^/pt/?$' ),
        ( None, r'^/es/?$' ),

        # FIXME:
        # is everything that ends in a / a category?

        # hostname specific regexs
        ( 'abc3340.com', r'/news/nation-world$' ),
        ( 'bbc.co.uk', r'/asia_pacific$' ),
        ( 'bbc.co.uk', r'/history/historic_figures/?$' ),
        ( 'bbc.com', r'/asia_pacific$' ),
        ( 'breitbart.com', r'^/radio/?$' ),
        ( 'breitbart.com', r'^/asia/?$' ),
        ( 'breitbart.com', r'^/national-security/?$' ),
        ( 'cnn.com', r'^/asia/?$' ),
        ( 'coronavirus.delaware.gov', r'^/tag/delaware-student-meals/?$' ),
        ( 'elmundo.es', r'^/internacional.html$' ),
        ( 'elmundo.es', r'^/internacional/?$' ),
        ( 'foxnews.com', r'^/politics/?$' ),
        ( 'cnnespanol.cnn.com', r'^/video/$' ),
        ( 'elnacional.com.do', r'^/category/' ),
        ( 'lci.fr', r'^/sante/$' ),
        ( 'lci.fr', r'^/bien-etre/$' ),
        ( 'news.un.org', r'^/es/node?$' ),
        ( 'sportbreakingnews.com', r'^/category/uncategorized/$' ),
        ( 'thanhnien.vn', r'^/doi-song/$' ),
        ( 'vietnamartnews.com', r'^/category/uncategorized/$' ),
        ]

    for hostname, regex in regexs:
        # if in fast mode, then only search for elements that will apply to the hostname
        valid_for_hostname = hostname is None or hostname in url_parsed.hostname
        if fast and not valid_for_hostname:
            continue

        # if pattern in url, then add article type
        if re.search(regex, url_parsed.path):
            article_types.append({
                'article_type' : 'category',
                'pattern' : 'regex',
                'pattern_details' : regex,
                'valid_for_hostname' : valid_for_hostname,
                })

    # return results
    article_types.append({
        'article_type' : 'article',
        'pattern' : 'default',
        'valid_for_hostname' : True,
        })

    for article_type in article_types:
        if article_type['valid_for_hostname']:
            best_article_type = article_type
            break

    return best_article_type,article_types


