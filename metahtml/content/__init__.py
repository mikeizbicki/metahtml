'''
'''

def extract(parser):

    from metahtml.content.simple import simple_extractor

    parser.meta['content'] = simple_extractor(parser)

