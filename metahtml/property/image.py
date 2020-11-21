'''
'''

from metahtml.property.__common__ import BaseExtractor

class Extractor(BaseExtractor):
    # FIXME:
    # need to add the jsonpaths
    jsonpaths = []

    xpaths = [
        ( None,                     '//meta[@*="og:image"]/@content' ),
        ( None,                     '//meta[@*="twitter:image"]/@content' ),
        ]
