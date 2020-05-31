#!/usr/bin/python3
'''

'''

import datetime
#import json
import copy
import csv
import glob
import hashlib
import os
import re
import requests
from urllib.parse import urlparse, urlunparse
import pytest
import pprint
    
# the sys import is needed so that we can import from the current project
import sys
sys.path.append('.')
import metahtml.timestamp

################################################################################
# helper functions

golden_test_file = 'tests/golden.csv'

cache_dir = 'tests/.cache'
invalid_path = os.path.join(cache_dir,'invalid')
invalid_urls = set([])

def load_invalid_urls():
    with open(invalid_path,'r') as f:
        for line in f:
            invalid_urls.add(line.strip())
load_invalid_urls()

def save_invalid_urls():
    with open(invalid_path,'w') as f:
        for url in sorted(list(invalid_urls)):
            f.write(url+'\n')


def get_cached_webpages(url, dates=None):
    '''
    If the url does not exit in the cache,
    then this function first downloads the html and stores it in the cache.
    Next, it returns the result of the cache.
    This function is slow to run on the first call for each url,
    but then fast on all subsequent calls.
    '''

    if url in invalid_urls:
        raise ValueError('url=',url,'in invalid_urls')

    # not all characters are allowed in filenames, 
    # and so the url_filename variable replaces potentially invalid characters with underscores;
    # an md5 hash is added at the end to prevent name collisions due to the substitution;
    # we don't rely on just the md5 hash because we want the filename to be human readable
    url_filename = re.sub(r'[/:><"|*]','_',url) + hashlib.md5(url.encode()).hexdigest()[:8]

    # create the cache folder for the url if it doesn't exist
    url_dir = os.path.join(cache_dir,url_filename)
    os.makedirs(url_dir, exist_ok=True)

    # get the filenames that correspond to the input url/dates combo
    if dates is None:
        globpath = os.path.join(url_dir,'*')
        paths = glob.glob(globpath)
    else:
        paths = [ os.path.join(url_dir, date) for date in dates ]

    # if no filenames found, then add the url to the cache with the current date
    def download_url():
        print('downloading url=',url,end=' ... ')
        date = datetime.datetime.now().strftime('%Y-%m-%d')
        path = os.path.join(url_dir,date)
        paths = [ path ]
        r = requests.get(url,headers={'User-Agent':'NovichenkoBot'})
        if r.status_code != 200:
            print('error: status_code=',r.status_code)
            invalid_urls.add(url)
            save_invalid_urls()
            raise ValueError('status=',r.status_code,'for url=',url)
        html = r.text
        with open(path,'x') as f:
            f.write(html)
        print('done.')
    if len(paths)==0:
        download_url()
        return get_cached_webpages(url, dates)

    # return the contents of the cache
    ret = []
    for path in paths:
        with open(path) as f:
            ret.append((os.path.basename(path),f.read()))
    return ret


def insert_golden_tests(urls, overwrite=False, verbose=False, insert_altlang_urls=True):

    urls.sort()
    new_urls = set([])

    # load the values of the csv file
    with open(golden_test_file, 'rt') as f:
        fieldnames = csv.reader(f).__next__()
    with open(golden_test_file, 'rt') as f:
        rows = list(csv.DictReader(f, dialect='excel', strict=True))

    # generate the csv rows for inserted urls
    for url in urls: 

        url_parsed = urlparse(url)

        # if the url contains a hostname without a trailing slash, add the trailing slash
        # this ensures that duplicate versions of the hostname's root don't get added
        if url_parsed.path == '':
            url = urlunparse([
                url_parsed.scheme,
                url_parsed.netloc,
                '/',
                url_parsed.params,
                url_parsed.query,
                url_parsed.fragment,
                ])
            url_parsed = urlparse(url)

        # ensure that all category pages get added
        path_split = url_parsed.path.split('/')
        for i in range(10,len(url)-1):
            if url[i] == '/' or (url[i-1] != '/' and url[i] == '?'):
                # if status_code != 200, then don't panic
                try:
                    new_url = url[:i+1]
                    get_cached_webpages(new_url,None)
                    new_urls.add(new_url)
                except ValueError:
                    pass

        # do not allow duplicates to be added
        add_url = True
        for i,row in enumerate(rows):
            if row['url']==url or row['url']==url+'/' or row['url']+'/'==url:
                if not overwrite and row['human_annotator'] != '':
                    #print('WARNING: url=',url,'already added; not adding again')
                    add_url = False
                    break
                else:
                    print('WARNING: url=',url,'already added; overwriting')
                    del rows[i]
                    break
        
        # process the cached webpages
        if add_url or verbose:

            # if the url fails to download,
            # then print a warning and skip it
            try:
                cache = get_cached_webpages(url,None)
            except ValueError:
                print('WARNING: no html found for url=',url)
                cache = []

            # loop through each version of the url in the cache
            for (date,html) in cache:

                # calculate meta information;
                # we spend extra time computing the full metainformation if verbose
                if verbose:
                    meta, meta_full = metahtml.parse_all(html, url)
                    print('--------------------------------------------------------------------------------')
                    print('date=',date,'url=',url)
                    print('meta_full=')
                    pprint.pprint(meta_full)
                    print('meta=')
                    pprint.pprint(meta)

                # FIXME:
                # sometimes, the meta returned by parse can be different 
                # than the meta returned by parse_all;
                # therefore, we must repeat this work if verbose
                meta = metahtml.parse(html, url)

                # add all alternate language urls as test cases
                if insert_altlang_urls:
                    for altlang_url in meta['altlang_urls']:
                        new_urls.add(altlang_url['url'])

                # if the url is not the canonical url,
                # then we need to add the canonical url as a test case instead of this url
                if meta['url_canonical']['url'] != url:
                    new_urls.add(meta['url_canonical']['url'])
                    add_url = False

                # simplify hostname for sorting purposes
                hostname = url_parsed.hostname
                if hostname[:4]=='www.':
                    hostname = hostname[4:]

                # insert row
                if add_url:
                    if meta['article_type']['article_type'] == 'article':
                        is_article = 'TRUE'
                    else:
                        is_article = 'FALSE'

                    rows.append({
                        'human_annotator' : None ,
                        'hostname' : hostname,
                        'url' : url,
                        'download_date': date,
                        'is_article' : is_article,
                        'timestamp_published' : metahtml.timestamp.timestamp2str(meta['timestamp_published']),
                        'timestamp_modified' : metahtml.timestamp.timestamp2str(meta['timestamp_modified']),
                        'lang' : metahtml.language.lang2str(meta['lang']),
                        'title' : metahtml.title.title2str(meta['title']),
                        #'authors' : '',
                        #'authors_raw' : metahtml.authors.authors2str(meta['authors']),
                        #'text' : metahtml.language.lang2str(meta['text']),
                        })

    # sort and remove duplicates
    rows.sort(key = lambda x: (x['hostname'], x['url']))

    # write the values to the csv in sorted order
    with open(golden_test_file, 'wt') as f:
        writer = csv.DictWriter(f, fieldnames=fieldnames)
        writer.writeheader()
        for row in rows:
            writer.writerow(row)

    # add new_urls that don't already exist
    existing_urls = set([ row['url'] for row in rows ])
    new_urls2 = []
    for url in new_urls:
        if url not in existing_urls and url+'/' not in existing_urls:
            new_urls2.append(url)
    if len(new_urls2)>0:
        insert_golden_tests(new_urls2, overwrite, verbose=False, insert_altlang_urls=insert_altlang_urls)


def get_golden_tests(verified_only=True):
    '''
    returns a list of test cases that have the human_verified column set to True
    '''
    tests = []
    with open(golden_test_file, 'rt') as f:
        for test in csv.DictReader(f, dialect='excel', strict=True):
            # csv files store both the None and '' values in the same format;
            # we assume that we never store '' values, 
            # and therefore they should always be None instead 
            for k,v in test.items():
                if v=='':
                    test[k] = None

            # filter based on human_verified
            valid_annotator = test['human_annotator'] is not None and test['human_annotator'] != 'skip'
            if not verified_only or valid_annotator:
                tests.append(test)
    return tests

################################################################################
# test cases

@pytest.mark.parametrize('test',get_golden_tests())
def test_golden(test):
    url = test['url']
    date = test['download_date']
    [(date, html)] = get_cached_webpages(url, [date])

    # printing the url makes debugging easier
    print('date=',date,'url=',url)

    # optionally print verbose debugging information for test cases;
    # this significantly slows down the runtime, 
    # so it is recommended to only enable it when evaluating on a small number of test cases
    if False:
        meta, meta_full = metahtml.parse_all(html, url)
        print('meta_full=')
        pprint.pprint(meta_full)
        print('meta=')
        pprint.pprint(meta)
    else:
        meta = metahtml.parse(html, url)
        print('meta=')
        pprint.pprint(meta)

    print("test['is_article']=",test['is_article'])
    is_article = meta['article_type']['article_type'] == 'article'
    if test['is_article'] == 'TRUE':
        assert is_article
    elif test['is_article'] == 'FALSE':
        assert not is_article
    else:
        raise ValueError('invalid is_article column; must be TRUE or FALSE')

    print("test['timestamp_published']=",test['timestamp_published'],']')
    print("metahtml.timestamp.timestamp2str(meta['timestamp_published'])=",metahtml.timestamp.timestamp2str(meta['timestamp_published']),']')
    assert ( test['timestamp_published'] is meta['timestamp_published'] or
             test['timestamp_published'] == metahtml.timestamp.timestamp2str(meta['timestamp_published'])
             )

    print("test['timestamp_modified']=",test['timestamp_modified'],']')
    print("metahtml.timestamp.timestamp2str(meta['timestamp_modified'])=",metahtml.timestamp.timestamp2str(meta['timestamp_modified']),']')
    assert ( test['timestamp_modified'] is meta['timestamp_modified'] or
             test['timestamp_modified'] == metahtml.timestamp.timestamp2str(meta['timestamp_modified'])
             )

    print("meta['lang']=",meta['lang'])
    print("test['lang']=",test['lang'])
    assert ( meta['lang'] is test['lang'] or 
             meta['lang']['lang'] == test['lang']
             )


################################################################################
# initialize the test cases

if __name__=='__main__':

    # process command line args
    import argparse
    parser = argparse.ArgumentParser()
    parser.add_argument('--insert_urls',nargs='+', default=[])
    parser.add_argument('--verbose',action='store_true')
    parser.add_argument('--overwrite',action='store_true')
    parser.add_argument('--rebuild_all_tests',action='store_true')
    parser.add_argument('--strip_whitespace',action='store_true')
    args = parser.parse_args()

    # strip whitespace from all fields
    if args.strip_whitespace:
        with open(golden_test_file, 'rt') as f:
            fieldnames = csv.reader(f).__next__()
        with open(golden_test_file, 'rt') as f:
            rows = list(csv.DictReader(f, dialect='excel', strict=True))
        for row in rows:
            for k in row:
                row[k] = row[k].strip()
        with open(golden_test_file, 'wt') as f:
            writer = csv.DictWriter(f, fieldnames=fieldnames)
            writer.writeheader()
            for row in rows:
                writer.writerow(row)

    # add existing urls if rebuilding tests
    urls = args.insert_urls
    if args.rebuild_all_tests:
        with open(golden_test_file, 'rt') as f:
            rows = list(csv.DictReader(f, dialect='excel', strict=True))
        for row in rows:
            urls.append(row['url'])
    urls = list(set(urls))

    # insert urls
    insert_golden_tests(urls, args.overwrite, args.verbose)
