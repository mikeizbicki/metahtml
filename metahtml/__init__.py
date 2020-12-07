'''
'''

import importlib
import lxml
import lxml.html
import lxml.etree
from urllib.parse import urlparse
from collections import defaultdict
import logging
import time

import metahtml.adblock


cxpath_ldjson = lxml.etree.XPath('//script[@type="application/ld+json"]')

def parse(html, url, fast=False):
    '''
    return the dictionary of meta information for a given html/url combination
    '''

    start_time = time.process_time()

    # create the parser object
    import bunch
    parser = bunch.Bunch()
    parser.html = html
    parser.url = url
    parser.url_parsed = urlparse(url)
    parser.meta = defaultdict(lambda: None)
    parser.meta['version'] = version

    # parse the raw html using lxml;
    # lxml fails whenever the html is empty, so we pass it a minimal html document;
    # this ensures that we will return a valid result 
    # (it will have no data, but it will be valid schematically)
    try:
        parser.doc = lxml.html.fromstring(html)
    except lxml.etree.ParserError:
        parser.doc = lxml.html.fromstring('<html></html>')

    # extract and decode any ld+json elements within the html;
    # these will be parsed for properties later;
    # we use multiple json docs since each is able to handle different types of malformed input
    import ujson
    import simplejson
    json_libs = [ujson,simplejson]

    parser.ldjsons = []
    for element in cxpath_ldjson(parser.doc):
        for lib in json_libs:
            try:
                parser.ldjsons.append(lib.loads(element.text))
            except Exception as e:
                # FIXME:
                # these warning messages should get added into the parser.meta somehow
                logging.warn('url='+url+' '+lib.__name__+': '+"e="+e.__repr__())

    # remove ads
    metahtml.adblock.rm_ads(parser)

    # extract the properties
    def calculate_property(property):
        module = importlib.import_module('metahtml.property.'+property)
        logging.debug('property='+property)
        parser.meta[property] = module.Extractor.extract(parser)

    calculate_property('timestamp.published')
    calculate_property('type')

    if parser.meta['type']['best']['value'] == 'article':
        calculate_property('language')
        calculate_property('timestamp.modified')

        if not fast:
            calculate_property('urls.canonical')
            calculate_property('urls.altlang')
            calculate_property('author')
            calculate_property('title')
            calculate_property('description')
            calculate_property('links')

            # extract the content;
            # this function is allowed to arbitrarily modify parser.doc,
            # and so it must come last
            #metahtml.content.extract(parser)
            calculate_property('content')

            # FIXME:
            # calculate the links of the article html?
    else:
        parser.meta['timestamp.published'] = None

    # add process time into meta
    stop_time = time.process_time()
    parser.meta['process_time'] = stop_time - start_time

    return parser.meta


def simplify_meta(meta):
    '''
    removes the verbose/debug information from the meta dictionary
    '''
    ret = {}
    for k in meta:
        try:
            ret[k] = meta[k]['best']['value']
        except (TypeError,KeyError) as e:
            pass

    return ret


def get_version_info():
    '''
    returns a dictionary containing the hash and date of the running code

    FIXME:
    if the library is not contained within a git repo, then the returned value will be undefined;
    this should only be a problem if at somepoint in the future I implement the ability to
    pip install this library and forget to modify this code

    NOTE:
    this code contains a minor race condition;
    if the git HEAD is changed after the program starts but before this code is run,
    then the wrong results will be returned;
    this bug is mitigated by immediately calling the function and storing the results in a global,
    but there is still a short window (10ms-ish?) for the bug to appear;
    by simply not committing new code at the same time as running code,
    this bug should not appear in practice
    '''
    import pathlib
    import subprocess

    git_dir = str(pathlib.Path(__file__).parent.parent.absolute() / '.git')

    # get the hash
    p = subprocess.Popen(['git', '--git-dir='+git_dir, 'log' , '-1', '--format=%H'], stdout=subprocess.PIPE)
    commit_hash, err = p.communicate()

    # get the timestamp
    p = subprocess.Popen(['git', '--git-dir='+git_dir, 'log' , '-1', '--format=%cd', '--date=iso'], stdout=subprocess.PIPE)
    commit_timestamp, err = p.communicate()

    # return the version info
    return {
        'hash': commit_hash.decode('utf-8').strip(),
        'timestamp' : commit_timestamp.decode('utf-8').strip()
        }

version = get_version_info()
logging.info("version=",version)
