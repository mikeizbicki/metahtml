'''
'''

def extract(parser):

    from metahtml.content.simple import simple_extractor

    parser.meta['content'] = simple_extractor(parser)

'''
'''

from metahtml.property.__common__ import BaseExtractor
from metahtml.property.content.simple import simple_extractor

class Extractor(BaseExtractor):

    @staticmethod
    def custom_patterns(parser, results):
        results.append(simple_extractor(parser))
