'''
'''

from metahtml.property.__common__ import BaseExtractor

class Extractor(BaseExtractor):
    # FIXME:
    # need to add the jsonpaths
    jsonpaths = []

    xpaths = [
        # see: https://www.w3schools.com/tags/tag_meta.asp
        ( None, '//meta[@name="author"]/@content' ),

        # see: https://stackoverflow.com/questions/7290504/which-html5-tag-should-i-use-to-mark-up-an-author-s-name
        ( None, '//*[contains(@rel,"author")]' ),
        ( None, '//*[contains(@itemprop,"author")]'),
        ( None, '//*[contains(@class,"author")]' ),

        # custom xpaths
        ( 'theguardian.com',            '//p[@class="byline"]' ),
        ( 'nytimes.com',                '//meta[@name="byl"]/@content' ),
        ( 'washingtonpost.com',         '//span[contains(@class,"author-name")]' ),
        ]
