'''
'''

import lxml
import langid
from urllib.parse import urlparse


def lang2str(lang):
    if lang is not None:
        return lang['lang']


def parse_lang_str(text):
    return text.replace('_','-').lower()


def get_best_langs(langs, require_valid_for_hostname=True):
    bests = []

    for lang in langs:
        found_match = False

        # loop through the currently found langs to check for duplicates
        for i,best in enumerate(bests):

            # found an exact match;
            # or the lang agrees with but is less specific than the already found best
            if lang['lang'] in best['lang']:
                found_match = True
                break

            # the languages match, but the best doesn't not have a locale;
            # then update with the more precise lang-locale pair
            if lang['lang'][:2] == best['lang'] and len(best['lang'])==2:
                bests[i] = lang
                found_match = True

        if not found_match:
            bests.append(lang)

    return bests


def get_language(html, url, fast=False):
    '''
    '''

    parser = lxml.html.fromstring(html)
    url_hostname = urlparse(url).hostname

    langs = []

    xpaths = [
        # extract language specified according to html standard;
        # most major news outlets support this method
        # see: https://www.w3.org/International/questions/qa-html-language-declarations
        ( None, '//html/@lang' ),
        ( None, '//html/@xml:lang' ),
        
        # open graph
        # see: https://neilpatel.com/blog/open-graph-meta-tags/
        ( None, '//meta[@property="og:locale"]/@content'),
        ( None, '//meta[@name="og:locale"]/@content'),

        # extract language from non-standardized meta tags;
        # these tags are likely only to exist on older webpages
        # see: https://www.w3.org/International/questions/qa-http-and-lang
        ( None, '//meta[@http-equiv=content-language]/@content'),
        ( None, '//meta[@name=dc.language]/@content'),
        ( None, '//meta[@name=lang]/@content'),
        ( None, '//meta[@name=language]/@content'),
        ( None, '//meta[@itemprop=inLanguage]/@content'),
        ]

    # get language from xpaths
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

            # register the language
            if text is not None:
                langs.append({
                    'lang' : parse_lang_str(text),
                    'raw' : text,
                    'pattern' : xpath,
                    'is_valid_for_hostname' : hostname is None or hostname in url_hostname
                    })

    # use the langid library to automatically detect the language
    # this is computationally expensive, but it can always be done
    if not fast or len(langs)==0:
        alltext = parser.text_content()
        langs.append({
            'lang' : langid.classify(alltext)[0],
            'pattern' : 'langid',
            'is_valid_for_hostname' : True,
            })

    # finalize
    best_langs = get_best_langs(langs)

    return best_langs[0], best_langs

