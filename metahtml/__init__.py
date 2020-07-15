'''
'''

from collections import defaultdict
import simplejson as json
import lxml

from . import article_type
from . import authors
from . import language
from . import timestamp
from . import title
from . import urls
from . import content


def parse_all(html, url, fast=False):

    meta_best = defaultdict(lambda: None)
    meta_all = defaultdict(lambda: None)

    parser = lxml.html.fromstring(html)

    # ld+json
    try:
        xpath = '//script[@type="application/ld+json"]'
        jsonlds = [ json.loads(element.text) for element in parser.xpath(xpath) ]
    except json.JSONDecodeError:
        jsonlds = []
    except TypeError: # this happens when the input html is bytes instead of text
        jsonlds = []

    meta_best['url_canonical'], meta_all['url_canonical'] = urls.get_url_canonical(parser, url, fast=fast)

    meta_best['timestamp_published'], meta_all['timestamp_published'] = timestamp.get_timestamp_published(parser, jsonlds, url, fast=fast)
    meta_best['article_type'], meta_all['article_type'] = article_type.get_article_type(parser, url, meta_best=meta_best, fast=fast)
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
        meta_best['timestamp_modified'], meta_all['timestamp_modified'] = timestamp.get_timestamp_modified(parser, jsonlds, url, fast=fast)
        if len(meta_best['timestamp_modified'])>0:
            meta_best['timestamp_modified'] = meta_best['timestamp_modified'][0] 
        else:
            meta_best['timestamp_modified'] = None

        meta_best['lang'], meta_all['lang'] = language.get_language(parser, url, fast=fast)
        #meta_best['content'], meta_all['content'] = content.get_content(parser, url, html, meta_best, fast=fast)

        meta_best['authors'], meta_all['authors'] = authors.get_authors(parser, url, fast=fast)
        meta_best['title'], meta_all['title'] = title.get_title(parser, url, fast=fast)

    altlang_urls = urls.get_altlang_urls(parser, url, fast=fast)
    meta_best['altlang_urls'] = altlang_urls
    meta_all['altlang_urls'] = altlang_urls

    return meta_best, meta_all


def parse(html, url):
    meta_best, meta_all = parse_all(html, url, fast=True)
    return meta_best
