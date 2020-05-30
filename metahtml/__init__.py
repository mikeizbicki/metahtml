'''
'''

from collections import defaultdict

from . import article_type
from . import authors
from . import language
from . import timestamp
from . import title
from . import urls


def parse_all(html, url, fast=False):

    meta_best = defaultdict(lambda: None)
    meta_all = defaultdict(lambda: None)

    meta_best['timestamp_published'], meta_all['timestamp_published'] = timestamp.get_timestamp_published(html, url, fast=fast)
    meta_best['article_type'], meta_all['article_type'] = article_type.get_article_type(html, url, meta_best=meta_best, fast=fast)
    is_article = meta_best['article_type']['article_type'] == 'article'
    #meta_best['article_type'] = is_article

    # FIXME:
    if len(meta_best['timestamp_published'])>0:
        meta_best['timestamp_published'] = meta_best['timestamp_published'][0] 
    else:
        meta_best['timestamp_published'] = None
    if not is_article:
        meta_best['timestamp_published'] = None

    # gather other information
    if not fast or is_article:
        meta_best['timestamp_modified'], meta_all['timestamp_modified'] = timestamp.get_timestamp_modified(html, url, fast=fast)
        if len(meta_best['timestamp_modified'])>0:
            meta_best['timestamp_modified'] = meta_best['timestamp_modified'][0] 
        else:
            meta_best['timestamp_modified'] = None

        meta_best['lang'], meta_all['lang'] = language.get_language(html, url, fast=fast)

        meta_best['authors'], meta_all['authors'] = authors.get_authors(html, url, fast=fast)
        meta_best['title'], meta_all['title'] = title.get_title(html, url, fast=fast)
        meta_best['text'], meta_all['text'] = None, None

    altlang_urls = urls.get_altlang_urls(html, url, fast=fast)
    meta_best['altlang_urls'] = altlang_urls
    meta_all['altlang_urls'] = altlang_urls

    return meta_best, meta_all


def parse(html, url):
    meta_best, meta_all = parse_all(html, url, fast=True)
    return meta_best
