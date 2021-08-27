'''
'''

from urllib.parse import urlparse

from metahtml.property.__common__ import BaseExtractor

# configure langid
# the library mistakenly calls many english language webpages as latin and chinese as quetchua;
# latin webpages are very rare, however, so we explicitly disable latin as a prediction language;
# langid does not support directly disabling a language,
# it only supports enabling languages,
# so we enable all languages that it supports except 'la'
import langid
langid.set_languages(['af', 'am', 'an', 'ar', 'as', 'az', 'be', 'bg', 'bn', 'br', 'bs', 'ca', 'cs', 'cy', 'da', 'de', 'dz', 'el', 'en', 'eo', 'es', 'et', 'eu', 'fa', 'fi', 'fo', 'fr', 'ga', 'gl', 'gu', 'he', 'hi', 'hr', 'ht', 'hu', 'hy', 'id', 'is', 'it', 'ja', 'jv', 'ka', 'kk', 'km', 'kn', 'ko', 'ku', 'ky', 'lb', 'lo', 'lt', 'lv', 'mg', 'mk', 'ml', 'mn', 'mr', 'ms', 'mt', 'nb', 'ne', 'nl', 'nn', 'no', 'oc', 'or', 'pa', 'pl', 'ps', 'pt', 'ro', 'ru', 'rw', 'se', 'si', 'sk', 'sl', 'sq', 'sr', 'sv', 'sw', 'ta', 'te', 'th', 'tl', 'tr', 'ug', 'uk', 'ur', 'vi', 'vo', 'wa', 'xh', 'zh', 'zu'])

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
                'value' : text.replace('_','-').lower().strip('"'),
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

        # some domains have broken labels for their language;
        # for these domains we hardcode the language;
        # NOTE:
        # in the future, we should switch this to using a better machine learning label detection approach,
        # but for now we simply hard code these values to ensure the test cases are high quality;
        # if the language value is None,
        # then langid will be used to determine the language automatically;
        # this is useful for domains that can have multiple languages present,
        # but langid isn't accurate enough that we should rely on it when we don't have to
        broken_hostnames = [
            ('buchlesengerat.blogspot.com', 'de'),
            ('digitaljournal.com',          'en'),
            ('hindi.moneycontrol.com',      'hi'),
            ('hljxinwen.cn',                'ko'),
            ('hljxinwen.dbw.cn',            'ko'),
            ('koratdaily.com',              'th'),
            ('kr.xinhuanet.com',            'ko'),
            ('krcnr.cn',                    'ko'), # this has some non-korean translations on other domains; we should add those
            ('lokwannee.com',               'th'),
            ('mgronline.com',               'th'),
            ('mthai.com',                   'th'),
            ('napolitoday.it',              'it'),
            ('news-medical.net',            None), # has at least 'fr','it', 'pt', 'es' as valid values; these appear to be direct translations, so this is a good candidate for linking translations
            ('pattayablatt.com',            'de'),
            ('patterico.com',               'en'),
            ('people.com.cn',               'zh'),
            ('posttoday.com',               'th'),
            ('pro-und-kontra.info',         'de'),
            ('thumbsup.in.th',              'th'),
            ('www.ce.cn',                   'zh'), # we normally don't include the www. so that it captures any subdomains as well, but this has a small name (so it would capture too much), and there are subdomains in other languages that we don't want to capture; FIXME: we should add test cases for the other languages
            ]
        url_parsed = urlparse(parser.url)
        for hostname, language in broken_hostnames:
            if hostname in url_parsed.hostname:

                # we've found a broken webpage;
                # therefore, we delete all the previous results;
                # if the language is None, then langid will get triggered,
                # otherwise we'll set the language manually
                results.clear()
                if language is not None:
                    results.append({
                        'value' : language,
                        'pattern' : 'broken_hostname',
                        'is_valid_for_hostname' : True,
                        })

        # use the langid library to automatically detect the language
        # this is computationally expensive, but it can always be done
        if len(results)==0:
            alltext = parser.doc.text_content()
            languages = langid.classify(alltext)
            result = {
                'value' : languages[0],
                'raw_languages' : languages,
                'pattern' : 'langid',
                'is_valid_for_hostname' : True,
                }
            results.append(result)

