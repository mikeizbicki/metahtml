'''
'''

import lxml.etree
import uritools
import url_normalize
from metahtml.property.__common__ import BaseExtractor

cxpath_href = lxml.etree.XPath('//a')

class Extractor(BaseExtractor):

    @staticmethod
    def custom_patterns(parser, results):
        a_tags = []
        elements = cxpath_href(parser.doc)
        for element in elements:
            href = element.get('href')

            # skip links to invalid hrefs
            if not href:
                continue
            if href.startswith('javascript:'):
                continue
            
            # canonicalize the href
            href = uritools.urijoin(parser.url, href)
            href = uritools.uridefrag(href).uri
            href = clean_url(href)
            href = url_normalize.url_normalize(href)
            a_tag = { 'href' : href }

            # extract the rel
            if element.get('rel') is not None:
                rel = element.get('rel').strip()
                if len(rel)>0:
                    a_tag['rel'] = rel

            # extract the text_content
            if element.text_content() is not None:
                text_content = element.text_content().strip()
                if len(text_content)>0:
                    a_tag['text_content'] = text_content

            # add to list
            a_tags.append(a_tag)

        # remove duplicate tags 
        a_tags.sort(key=lambda x: x['href'])
        a_tags_dedup = []
        prev_href = None
        for a_tag in a_tags:
            if a_tag['href'] != prev_href:
                prev_href = a_tag['href']
                a_tags_dedup.append(a_tag)

        results.append({ 'value' : a_tags_dedup })


################################################################################
# helper code below taken from https://gist.github.com/tyndyll/e254ae3da2d0427371733443152c1337

from urllib.parse import parse_qs
from urllib.parse import urlencode
from urllib.parse import urlparse

params_to_remove = [
    "mkt_tok",
    "utm_source",  # identifies which site sent the traffic, and is a required parameter
    "utm_medium",  # identifies what type of link was used, such as cost per click or email
    "utm_campaign",#	identifies a specific product promotion or strategic campaign
    "utm_term",    # identifies search terms
    "utm_content", # identifies what specifically was clicked to bring the user to the site
    "sc_country",
    "sc_category",
    "sc_channel",
    "sc_campaign",
    "sc_publisher",
    "sc_content",
    "sc_funnel",
    "sc_medium",
    "sc_segment",
]


def remove_tracker_params(query_string):
    """
    Given a query string from a URL, strip out the known trackers
    >>> remove_tracker_params("utm_campaign=2018-05-31&utm_medium=email&utm_source=courtside-20180531")
    ''
    >>> remove_tracker_params("a=b&utm_campaign=2018-05-31&utm_medium=email&utm_source=courtside-20180531")
    'a=b'
    >>> remove_tracker_params("type=test&type=test2")
    'type=test&type=test2'
    """

    params = []
    for param, values in parse_qs(query_string).items():
        if param not in params_to_remove:
            # value will be a list, extract each one out
            for value in values:
                params.append((param, value))
    return urlencode(params)


def clean_url(url):
    """
    Given a URL, return it with the UTM parameters removed
    >>> clean_url("https://dribbble.com/stories/2018/05/29/an-interview-with-user-interface-designer-olga?utm_campaign=2018-05-31&utm_medium=email&utm_source=courtside-20180531")
    'https://dribbble.com/stories/2018/05/29/an-interview-with-user-interface-designer-olga'
    It will also clean the UTM parameters from fragments
    >>> clean_url("https://blog.mozvr.com/introducing-hubs-a-new-way-to-get-together-online/?sample_rate=0.001#utm_source=desktop-snippet&utm_medium=snippet&utm_campaign=MozillaHubsIntro&utm_term=8322&utm_content=PRE")
    'https://blog.mozvr.com/introducing-hubs-a-new-way-to-get-together-online/?sample_rate=0.001'
    """

    parsed = urlparse(url)
    parsed = parsed._replace(query=remove_tracker_params(parsed.query))
    parsed = parsed._replace(fragment=remove_tracker_params(parsed.fragment))
    return parsed.geturl()
