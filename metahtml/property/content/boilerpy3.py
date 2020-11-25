from boilerpy3 import extractors

def boilerpy3_fulltext(parser, language):
    extractor = extractors.ArticleExtractor()
    content = extractor.get_content(parser.tostring())
