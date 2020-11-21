'''
'''

from metahtml.property.__common__ import BaseExtractor

class Extractor(BaseExtractor):
    # FIXME:
    # need to add the jsonpaths
    jsonpaths = []

    xpaths = [
        ( None,                     '//title' ),
        ( None,                     '//h1' ),
        ( None,                     '//meta[@*="dc.title"]/@content' ),
        ( None,                     '//meta[@*="og:title"]/@content' ),
        ( None,                     '//meta[@*="twitter:text:title"]/@content' ),
        ( None,                     '//meta[@*="twitter:title"]/@content' ),
        ]


    @staticmethod
    def filter_results(titles, require_valid_for_hostname=True):
        # FIXME:
        # Currently, the function just selects the shortest possible title as the best title;
        # there's probably much better techniques for this
        best_title = None
        for title in titles:
            if best_title is None or len(best_title['value']) < len(title['value']):
                best_title = title
        return [best_title]
