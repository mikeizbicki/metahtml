#!/usr/bin/python3
'''

'''

import datetime
#import json
import csv
import hashlib
import os
import requests
from urllib.parse import urlparse
import pytest
import pprint
    
# the sys import is needed so that we can import from the current project
import sys
sys.path.append('.')
import metahtml.timestamp

################################################################################
# helper functions

# create global variables that control which test cases get generated
cache_dir='tests/.cache'
os.makedirs(cache_dir, exist_ok=True)
golden_test_file='tests/golden.csv'


def get_html_for(url):
    '''
    If the url does not exit in the cache,
    then this function first downloads the html and stores it in the cache.
    Next, it returns the result of the cache.
    This function is slow to run on the first call for each url,
    but then fast on all subsequent calls.
    '''
    filename=os.path.join(cache_dir,url.replace('/','|'))
    try:
        with open(filename) as f:
            html=f.read()
    except FileNotFoundError:
        print('downloading url=',url,end=' ... ')
        r = requests.get(url,headers={'User-Agent':'NovichenkoBot'})
        if r.status_code != 200:
            print('ERROR: status=',r.status_code,'for url=',url)
            sys.exit(1)
        html = r.text
        with open(filename,'x') as f:
            f.write(html)
        print('done.')
    return html


def insert_golden_tests(urls, overwrite=False, verbose=False, insert_altlang_urls=True):

    new_urls = set([])

    # load the values of the csv file
    with open(golden_test_file, 'rt') as f:
        fieldnames = csv.reader(f).__next__()
    with open(golden_test_file, 'rt') as f:
        rows = list(csv.DictReader(f, dialect='excel', strict=True))

    # generate the csv rows for inserted urls
    for url in urls: 

        # ensure that the root page gets added
        url_parsed = urlparse(url)
        hostname = url_parsed.hostname
        scheme = url_parsed.scheme
        new_urls.add(scheme+'://'+hostname+'/')

        # if the url contains a hostname without a trailing slash, add the trailing slash
        # this ensures that duplicate versions of the hostname's root don't get added
        if url_parsed.path == '':
            url+='/'

        # do not allow duplicates to be added
        add_url = True
        for i,row in enumerate(rows):
            if row['url']==url:
                if not overwrite and row['human_annotator'] != '':
                    print('WARNING: url=',url,'already added; not adding again')
                    add_url = False
                    break
                else:
                    print('WARNING: url=',url,'already added; overwriting')
                    del rows[i]
                    break
        
        # add the row
        if add_url or verbose:

            # calculate meta information;
            # if not verbose, then do it quickly
            html = get_html_for(url)
            if verbose:
                meta, meta_full = metahtml.parse_all(html, url)
                print('--------------------------------------------------------------------------------')
                print('meta_full=')
                pprint.pprint(meta_full)
                print('--------------------------------------------------------------------------------')
                print('meta=')
                pprint.pprint(meta)

            meta = metahtml.parse(html, url)

            if insert_altlang_urls:
                for altlang_url in meta['altlang_urls']:
                    new_urls.add(altlang_url['url'])

            # simplify hostname for sorting purposes
            if hostname[:4]=='www.':
                hostname = hostname[4:]

            # insert row
            if add_url:
                rows.append({
                    'human_annotator' : None ,
                    'hostname' : hostname,
                    'url' : url,
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
        if url not in existing_urls:
            new_urls2.append(url)
    if len(new_urls2)>0:
        insert_golden_tests(new_urls2, overwrite, verbose=False, insert_altlang_urls=False)


def get_golden_tests():
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
            if True or test['human_annotator']:
                tests.append(test)
    return tests

################################################################################
# test cases

@pytest.mark.parametrize('test',get_golden_tests())
def test_golden(test):
    url = test['url']
    html = get_html_for(url)
    meta = metahtml.parse(html, url)

    # test each column
    if meta['timestamp_published'] is None:
        assert test['timestamp_published'] == 'None'

    if meta['timestamp_modified'] is None:
        assert test['timestamp_modified'] is None

    assert meta['lang'] is None and test['lang'] is None or meta['lang']['lang'] == test['lang']
    #assert meta['authors'] == test['authors'] or meta['authors'] is test['authors']
    #assert meta['title'] == test['title'] or meta['title'] is test['title']


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
    args = parser.parse_args()

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

    '''
    #parser.add_argument('--url')
    #parser.add_argument('--urls_file')
    # test url
    if args.url:
        url = args.url
        html = get_html_for(url)
        publish_timestamp = metahtml.timestamp.get_timestamp_published(html, url)
        import pprint
        pprint.pprint(publish_timestamp)

    
    if args.urls_file:

        # get urls
        with open(args.urls_file) as f:
            urls = []
            for line in f:
                line = line.strip()
                #if line[:8]=='https://':
                    #line = line[8:]
                #if line[:7]=='http://':
                    #line = line[7:]
                urls.append(line)
        urls.sort()

        # 
        for url in urls:
            html = get_html_for(url)

            # if there is only 1 proper match of the timestamp,
            # then skip the url
            best_timestamps, all_timestamps = metahtml.timestamp.get_timestamp_published(html, url)
            if len(best_timestamps)==1:
                continue


            # output all matching url timestamp info
            #timestamps, _ = metahtml.timestamp.get_timestamp_published(html, url, require_valid_for_hostname=False)
            print(len(best_timestamps), url)
            for timestamp in all_timestamps:
                #print('  ',timestamp['timestamp_lo'],' -- ',timestamp['timestamp_hi'])
                print('  ',timestamp['timestamp_lo'],' -- ',timestamp['timestamp_hi'],' -- ',timestamp['pattern'])
            print()

            #colsize = 25
            #print(url[:colsize].ljust(colsize), end=' ')
            #print(len(timestamps), end=' ')
            #for test in ['ambiguous_day_month','timestamp_lo', 'timestamp_hi']:
                #if timestamp is None:
                    #print('None', end=' ')
                #else:
                    #print(str(timestamp.get(test))[:colsize].ljust(colsize), end=' ')

        #print('generating golden tests from urls_file',args.urls_file)
        #with open(args.urls_file) as f:
            #urls = []
            #for line in f:
                #line = line.strip()
                ##if line[:8]=='https://':
                    ##line = line[8:]
                ##if line[:7]=='http://':
                    ##line = line[7:]
                #urls.append(line)
        #urls.sort()
        #generate_golden_tests(urls,args.overwrite)
        '''

    '''
    parser.add_argument('--eval_tests', nargs='+')

    parser.add_argument('--urls_file')
    parser.add_argument('--overwrite',action='store_true')
    args = parser.parse_args()

    # evaluate tests
    if args.eval_tests:
        for url, (article, article_details) in get_golden_tests().items():
            colsize = 30
            print(url[:colsize].ljust(colsize), end=' ')
            for test in args.eval_tests:
                print(str(article.get(test))[:colsize].ljust(colsize), end=' ')
            print()

    # generate tests
    if args.urls_file:
        print('generating golden tests from urls_file',args.urls_file)
        with open(args.urls_file) as f:
            urls = []
            for line in f:
                line = line.strip()
                #if line[:8]=='https://':
                    #line = line[8:]
                #if line[:7]=='http://':
                    #line = line[7:]
                urls.append(line)
        urls.sort()
        generate_golden_tests(urls,args.overwrite)
    '''

"""
def get_golden_tests():
    '''
    returns a list of test cases
    '''
    try:
        with open(golden_tests_filename) as f:
            return json.load(f)
    except (FileNotFoundError, json.decoder.JSONDecodeError):
        return {}


def generate_golden_tests(
        urls,
        overwrite = False,
        ):
    '''
    
    '''

    # load the existing golden_tests;
    # if we are overwriting them, then set the 
    golden_tests = {}
    if not overwrite:
        golden_tests = get_golden_tests()

    # generate the test results for each url
    for url in urls:

        # do not waste time generating test results for tests that already exist
        if url in golden_tests.keys():
            continue

        # generate the golden test
        print(f'{datetime.datetime.now()}: {url}')
        html = get_html_for(url)
        article = metahtml.parse(html, url)
        golden_tests[url] = article

    # save the results
    with open(golden_tests_filename,'w') as f:
        f.write(json.dumps(golden_tests,sort_keys=True,default=str))
"""


