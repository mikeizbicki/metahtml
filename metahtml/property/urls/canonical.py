'''
'''

from metahtml.property.__common__ import BaseExtractor

class Extractor(BaseExtractor):
    # FIXME:
    # need to add the jsonpaths
    jsonpaths = []

    xpaths = [
        ( None, '//link[@rel="canonical"]/@href' ),
        ( None, '//meta[@*="og:canoncial"]/@content' ),
        ( None, '//meta[@*="twitter:url"]/@content' ),
        ]

    #regexes = [
        #( None, '.*')
        #]

    # FIXME:
    # canonicalize urls
