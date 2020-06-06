'''
'''

import lxml.etree
import newspaper


# FIXME: Implement this function from scratch using the spacy or polyglot library for NLP support
def get_content(parser, url, html, meta_best, fast=False):

    contents = []

    # use newspaper3k specifying the language;
    # newspaper3k has limited language support,
    # and so this fails for rare languages
    try:
        article = newspaper.Article(
            url,
            keep_article_html=True,
            MAX_TEXT=None,
            language=meta_best['lang']['lang'][:2]
            )
        article.download(input_html=html)
        article.parse()
        contents.append({
            'text' : article.text,
            'html' : article.article_html,
            'pattern' : 'newspaper3k',
            'pattern_details' : 'known_language',
            'valid_for_hostname' : True
            })
    except:
        pass

    # use newspaper3k without specifying the language;
    # this should not fail, but may give worse result
    if not fast or len(contents)==0:
        article = newspaper.Article(
            url,
            keep_article_html=True,
            MAX_TEXT=None,
            )
        article.download(input_html=html)
        article.parse()
        contents.append({
            'text' : article.text,
            'html' : article.article_html,
            'pattern' : 'newspaper3k',
            'pattern_details' : 'known_language',
            'valid_for_hostname' : True
            })


    return contents[0],contents
