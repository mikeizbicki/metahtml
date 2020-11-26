'''
'''

import langid

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

        # some pages include the html meta tags to specify a language,
        # but they leave the corresponding attribute blank;
        # this if statement ensures that we only create a result when a valid language is specified;
        # FIXME:
        # we should make this check more robust by using a list of valid ISO 639-1 codes
        # https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes
        if len(text)>=2:
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
        if len(results)==0:
            alltext = parser.doc.text_content()
            result = {
                'value' : langid.classify(alltext)[0],
                'pattern' : 'langid',
                'is_valid_for_hostname' : True,
                }
            results.append(result)

