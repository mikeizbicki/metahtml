'''
'''

import lxml
import langid
from urllib.parse import urlparse


def lang2str(lang):
    if lang is not None:
        return lang['value']


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
            if lang['value'] in best['value']:
                found_match = True
                break

            # the languages match, but the best doesn't not have a locale;
            # then update with the more precise lang-locale pair
            if lang['value'][:2] == best['value'] and len(best['value'])==2:
                bests[i] = lang
                found_match = True

        if not found_match:
            bests.append(lang)

    return bests


def extract(parser):
    '''
    '''
    doc = parser.doc
    url_hostname = parser.url_parsed.hostname
    fast = False

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
        for element in doc.xpath(xpath):
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
                    'value' : parse_lang_str(text),
                    'raw' : text,
                    'pattern' : xpath,
                    'is_valid_for_hostname' : hostname is None or hostname in url_hostname
                    })

    # use the langid library to automatically detect the language
    # this is computationally expensive, but it can always be done
    if not fast or len(langs)==0:
        alltext = doc.text_content()
        langs.append({
            'value' : langid.classify(alltext)[0],
            'pattern' : 'langid',
            'is_valid_for_hostname' : True,
            })

from metahtml.property.__common__ import BaseExtractor

class Extractor(BaseExtractor):
    jsonpaths = []
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

    @staticmethod
    def str_to_result(text):
        return {
            'value' : text.replace('_','-').lower(),
            'raw' : text,
            }

    @staticmethod
    def filter_results(langs, require_valid_for_hostname=True):
        bests = []

        for lang in langs:
            found_match = False

            # loop through the currently found langs to check for duplicates
            for i,best in enumerate(bests):

                # found an exact match;
                # or the lang agrees with but is less specific than the already found best
                if lang['value'] in best['value']:
                    found_match = True
                    break

                # the languages match, but the best doesn't not have a locale;
                # then update with the more precise lang-locale pair
                if lang['value'][:2] == best['value'] and len(best['value'])==2:
                    bests[i] = lang
                    found_match = True

            if not found_match:
                bests.append(lang)

        return bests


    @staticmethod
    def custom_patterns(parser, results):
        # use the langid library to automatically detect the language
        # this is computationally expensive, but it can always be done
        print('custom_patterns')
        if len(results)==0:
            alltext = parser.doc.text_content()
            result = {
                'value' : langid.classify(alltext)[0],
                'pattern' : 'langid',
                'is_valid_for_hostname' : True,
                }
            print("result=",result)
            results.append(result)
