'''
'''

import lxml
from urllib.parse import urlparse


def get_url_canonical(parser, ldjsons, url, fast=False):
    '''
    '''
    url_parsed = urlparse(url)

    urls = []

    xpaths = [
        ( None, '//link[@rel="canonical"]/@href' ),
        #( None, '//meta[@name="og:canoncial"]/@content' ),
        ]

    # get timestamps from xpaths
    for hostname,xpath in xpaths:

        # if in fast mode, then only search for elements that will apply to the hostname
        valid_for_hostname = hostname is None or hostname in url_hostname
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

            # parse text
            canonical_url = text
            if len(canonical_url)>0 and canonical_url[0] == '/':
                canonical_url = url_parsed.scheme + '://' + url_parsed.hostname + canonical_url

            # generate the timestamp from text
            urls.append({
                'url' : canonical_url,
                'valid_for_hostname' : valid_for_hostname,
                'pattern' : 'xpath',
                'pattern_details' : xpath
                })

    # return results
    if len(urls) == 0:
        urls.append({
            'url' : url,
            'valid_for_hostname' : valid_for_hostname,
            'pattern' : 'default',
            })

    return urls[0], urls


def get_altlang_urls(parser, url, fast=False):
    '''
    '''

    url_parsed = urlparse(url)
    urls = []

    # get page translations for websites following html5 standard
    xpath = '//link[@rel="alternate"]'
    for element in parser.xpath(xpath):
        hreflang = element.attrib.get('hreflang')
        href = element.attrib.get('href')
        if href[:2]=='//':
            href = url_parsed.scheme+':'+href
        if hreflang is not None and href is not None:
            urls.append({
                'lang' : hreflang,
                'url' : href,
                })

    # custom websites
    if 'english.khan.co.kr' in url_parsed.hostname:
        xpath = '//div[@class="article_txt"]/a'
        for element in parser.xpath(xpath):
            lang = 'ko'
            href = element.attrib.get('href')
            if href[:2]=='//':
                href = url_parsed.scheme+':'+href
            if lang is not None and href is not None:
                urls.append({
                    'lang' : lang,
                    'url' : href,
                    })

    if 'news.khan.co.kr' in url_parsed.hostname:
        xpath = '//div[@class="btn_engtrans"]/a'
        for element in parser.xpath(xpath):
            lang = 'en'
            href = element.attrib.get('href')
            if href[:2]=='//':
                href = url_parsed.scheme+':'+href
            if lang is not None and href is not None:
                urls.append({
                    'lang' : lang,
                    'url' : href,
                    })

    # nonstandard:
    # http://english.khan.co.kr/khan_art_view.html?artid=202005221946377
    # https://www.dailynk.com/english/source-kim-jong-un-recently-cardiovascular-operation/
    # https://mainichi.jp/english/articles/20200523/p2a/00m/0na/023000c
    # https://mondediplo.com/2020/05/03covid-ecology
    # https://carnegie-mec.org/diwan/81781
    # https://www.cdc.gov/flu/pandemic-resources/pandemic-timeline-1930-and-beyond.htm

    # direct translations without links:
    # https://bles.com/mundo/rusia-uso-hidroxicloroquina-medicamento-tratar-virus-pcch-sugerido-trump.html
    # https://thebl.com/world-news/russia-supports-hydroxychloroquine-drug-ccp-virus-trump.html

    return urls


