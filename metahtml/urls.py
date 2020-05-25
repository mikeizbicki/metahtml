'''
'''

import lxml
from urllib.parse import urlparse


def get_altlang_urls(html, url, fast=False):
    '''
    '''

    parser = lxml.html.fromstring(html)
    url_hostname = urlparse(url).hostname

    # get page translations for websites following html5 standard
    xpath = '//link[@rel="alternate"]'
    urls = []
    for element in parser.xpath(xpath):
        hreflang = element.attrib.get('hreflang')
        href = element.attrib.get('href')
        if href[:2]=='//':
            href = 'https:'+href
        if hreflang is not None and href is not None:
            urls.append({
                'lang' : hreflang,
                'url' : href,
                })

    # nonstandard:
    # http://english.khan.co.kr/khan_art_view.html?artid=202005221946377&code=710100
    # https://www.dailynk.com/english/source-kim-jong-un-recently-cardiovascular-operation/
    # https://mainichi.jp/english/articles/20200523/p2a/00m/0na/023000c
    # https://mondediplo.com/2020/05/03covid-ecology
    # https://carnegie-mec.org/diwan/81781

    return urls


