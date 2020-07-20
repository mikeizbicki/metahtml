
import copy
import re
from urllib.parse import urlparse
import lxml
import lxml.html

from metahtml.timestamp import worst_tz_lo, worst_tz_hi, timestamp_range


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
    # but instead a "catalog" page listing many articles;
    # FIXME: this check is very heuristic and needs more evaluation
    if len(best_timestamps) > 5:
        
        # FIXME: 
        # another way to do this check is to use the range of time the timestamps cover;
        # it's not clear if this would lead to a more accurate check
        # bests_range = timestamp_range(best_timestamps)
        # or (len(best_timestamps) > 3 and abs(bests_range.total_seconds()) > 48*60*60):

        article_types.append({
            'article_type' : 'catalog',
            'valid_for_hostname' : True,
            'pattern' : 'len(best_timestamps)',
            'pattern_details' : str(len(best_timestamps)),
            })

    # xpath-based patterns
    # FIXME:
    # extracting the article type from the page itself seems like a good idea,
    # but it's not at all clear how to do this in a consistent way,
    # as almost all websites seem to be misusing the existing semantic tags
    xpaths = [
        #( 'cnbc.com', '//meta[@property="og:type"]/@content' ),
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
            if text=='article':
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

        ( 'bloomberg.com', r'/(19|20)\d{2}-\d{2}-\d{2}/?$' ),
        ( None, r'^/(19|20)\d{2}-[a-zA-Z]{3}-\d{2}/?$' ),
        ( None, r'^/(19|20)\d{2}-\d{2}-\d{2}/?$' ),
        ( None, r'^/(19|20)\d{2}-\d{2}/?$' ),

        ( None, r'^/?$' ),
        ( None, r'^/article/?$' ),
        ( None, r'^/category/' ),
        ( None, r'^/category$' ),
        ( None, r'^/tag/' ),
        ( None, r'^/tag$' ),

        # NOTE: 
        # this catches all 1 word page-names; is that too strict?
        # it's definitely too strict to catch names that include -_/ etc
        ( None, r'^/[a-zA-Z]*/?$' ), 

        # hostname specific regexs
        ( 'abc3340.com', r'/news/nation-world$' ),
        ( 'bbc.co.uk', r'/asia_pacific$' ),
        ( 'bbc.co.uk', r'/history/historic_figures/?$' ),
        ( 'bbc.com', r'/asia_pacific$' ),
        ( 'breitbart.com', r'^/national-security/?$' ),
        ( 'cnbc.com', r'^/2020-elections/?$' ),
        ( 'cnn.com', r'^/ASIANOW/time/?$' ),
        ( 'crofsblogs.typepad.com', r'^/h5n1/?$' ),
        ( 'elmundo.es', r'^/internacional.html$' ),
        ( 'en.mediamass.net', r'^/people/kim-jong-un/?$' ),
        ( 'hannity.com', r'^/media-room/?$' ),
        ( 'imf.org', r'^/external/french/?$' ),
        ( 'lavanguardia.com', r'^/internacional/20200421/48659090331/?$' ),
        ( 'lavanguardia.com', r'^/internacional/20200421/?$' ),
        ( 'lci.fr', r'^/actualite/terrorisme-10020/?$' ),
        ( 'lci.fr', r'^/bien-etre/?$' ),
        ( 'marca.com', r'^/claro-mx/?$' ),
        ( 'news.un.org', r'^/es/node?$' ),
        ( 'scvo.org', r'^/coronavirus-covid-19-information-guidance/resources/?$' ),
        ( 'scvo.org', r'^/coronavirus-covid-19-information-guidance/?$' ),
        ( 'scvo.org', r'^/support/running-your-organisation/leaving-lockdown/?$' ),
        ( 'smnyct.org', r'^/informacion-general/?$' ),
        ( 'state.gov', r'^/press-releases/$' ),
        ( 'thanhnien.vn', r'^/doi-song/$' ),
        ( 'thethaiger.com', r'^/thai-th/?$' ),
        ( 'treasury.gov', r'^/press-center/?$' ),
        ( 'treasury.gov', r'^/press-center/press-releases/?$' ),
        ( 'treasury.gov', r'^/resource-center/?$' ),
        ( 'viaouest.com', r'^/actualite-daesh.html' ),
        ( 'weather.com', r'^/health/coronavirus/?$' ),
        ( 'whitehouse.gov', r'^/briefings-statements/?$' ),

        ( 'shutterstock.com', r'' ),
        ]

    if len(url_parsed.query)<5:
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


