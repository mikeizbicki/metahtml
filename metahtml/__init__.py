'''
'''

from collections import defaultdict

from . import authors
from . import language
from . import timestamp
from . import title
from . import urls


def parse_all(html, url, fast=False):

    meta_best = defaultdict(lambda: None)
    meta_all = defaultdict(lambda: None)

    meta_best['timestamp_published'], meta_all['timestamp_published'] = timestamp.get_timestamp_published(html, url, fast=fast)

    if not fast or meta_best['timestamp_published'] is not None:
        meta_best['timestamp_modified'], meta_all['timestamp_modified'] = timestamp.get_timestamp_modified(html, url, fast=fast)
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
