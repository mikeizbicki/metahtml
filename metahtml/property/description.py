'''
'''

from metahtml.property.__common__ import BaseExtractor

class Extractor(BaseExtractor):
    # FIXME:
    # need to add the jsonpaths
    jsonpaths = []

    xpaths = [
        ( None, '//meta[@*="dc.description"]/@content' ),
        ( None, '//meta[@*="description"]/@content' ),
        ( None, '//meta[@*="og:description"]/@content' ),
        ( None, '//meta[@*="twitter:description"]/@content' ),
        ]

