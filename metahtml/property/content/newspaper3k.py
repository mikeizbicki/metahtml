import newspaper
import lxml

def newspaper_fulltext(parser, language, url):
    '''
    This is a slow version of the function that uses newspaper3k's standard API
    '''
    article = newspaper.Article(
            url = '',
            language=language,
            keep_article_html=True
            )
    article.download(input_html=lxml.etree.tostring(parser))
    article.parse()

    return {
        'value' : {
            'text' : article.text,
            'html' : article.html,
            },
        'pattern' : 'newspaper3k',
        }


def newspaper_fulltext2(parser, language, url):
    '''
    This is a faster version of the function that uses some internal newspaper3k functions
    so that the lxml parse tree doesn't need to be recreated.
    Adapted from https://github.com/codelucas/newspaper/blob/master/newspaper/api.py#L71
    but modified to use an already existing lxml parser
    '''
    from newspaper.cleaners import DocumentCleaner
    from newspaper.configuration import Configuration
    from newspaper.extractors import ContentExtractor
    from newspaper.outputformatters import OutputFormatter

    config = Configuration()
    config.language = language
    config.keep_article_html = True
    extractor = ContentExtractor(config)
    document_cleaner = DocumentCleaner(config)
    output_formatter = OutputFormatter(config)
    doc = parser
    doc = document_cleaner.clean(doc)
    doc = extractor.calculate_best_node(doc)
    if doc is not None:
        doc = extractor.post_cleanup(doc)
        text, html = output_formatter.get_formatted(doc)
    else:
        text = ''
        html = ''

    return {
        'value' : {
            'text' : text,
            'html' : html,
            },
        'pattern' : 'newspaper3k',
        }



