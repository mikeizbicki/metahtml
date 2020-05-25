'''
'''

import lxml
from urllib.parse import urlparse


def authors2str(authors):
    if authors is not None:
        return authors['authors_str']


def parse_authors_str(text):
    return text


def get_authors(html, url, fast=False):
    '''
    '''

    parser = lxml.html.fromstring(html)
    url_hostname = urlparse(url).hostname

    authors = []

    xpaths = [
        # see: https://www.w3schools.com/tags/tag_meta.asp
        ( None, '//meta[@name="author"]/@content' ),

        # see: https://stackoverflow.com/questions/7290504/which-html5-tag-should-i-use-to-mark-up-an-author-s-name
        ( None, '//*[contains(@rel,"author")]' ),
        #( None, '//*[contains(@itemprop,"author")]'),
        #( None, '//*[contains(@class,"author")]' ),

        # custom xpaths
        ( 'theguardian.com',            '//p[@class="byline"]' ),
        ( 'nytimes.com',                '//meta[@name="byl"]/@content' ),
        ( 'washingtonpost.com',         '//span[contains(@class,"author-name")]' ),
        ]

    # get authors from xpaths
    for hostname,xpath in xpaths:
        for element in parser.xpath(xpath):
            # element can be one of several different types of lxml objects;
            # depending on the type, we need to extract the text in different ways
            if type(element) is lxml.etree._ElementUnicodeResult:
                text = str(element)
            elif type(element) is lxml.etree._Element:
                text = element.text
            elif type(element) is lxml.html.HtmlElement:
                text = element.text_content()

            # register the authors
            if text is not None:
                authors.append({
                    'authors' : parse_authors_str(text),
                    'raw' : text,
                    'pattern' : xpath,
                    'is_valid_for_hostname' : hostname is None or hostname in url_hostname
                    })
                if fast:
                    break

    # return
    if len(authors)>0:
        best_authors = authors[0]
    else:
        best_authors = None
    return best_authors, authors
