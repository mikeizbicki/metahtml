#!/usr/bin/python3

import time
import sys
import os
import string
import chardet
import codecs
import re
import requests
sys.path.append('')
import metahtml
import tests.test_golden as test_golden
import tests.test_content as test_content
import trafilatura
from newspaper import parsers
from bs4 import BeautifulSoup
from glob import glob
from math import *
from difflib import SequenceMatcher
from getopt import getopt, GetoptError
from collections import Counter


help_message = '''
This is a modified version of cleaneval.py version 1.0 -- Copyright (C) 2008 by Stefan Evert

Source comes from http://webascorpus.sourceforge.net/PHITE.php?sitesig=FILES&page=FILES_10_Software&subpage=FILES_10_CleanEval 

Usage: tests/test_cleaneval.py
'''

#######################################################################################
# helper functions
#######################################################################################

re_find_URL = re.compile('https?:\\/\\/(www\\.)?[-a-zA-Z0-9@:%._\\+~#=]{1,256}\\.[a-zA-Z0-9()]{1,6}\\b([-a-zA-Z0-9()!@:%_\\+.~#?&\\/\\/=]*)')

def __get_url(raw_html):
    '''
    Extract url from a raw html
    Argument:
        raw_html    String  Raw downloaded html input
    Return:
        url         String  Url found in raw_html. If no url is found, return empty string
    >>> __get_url('')
    None 
    >>> __get_url('<html><body><h1>No URL in this file</h1></body></html>')
    ''
    >>> __get_url('<html><body><div><a href="#">http://www.abc.com</a></div></body></html>')
    'http://www.abc.com'
    '''
    match_obj = re.search(re_find_URL, raw_html)
    if match_obj:
        url = match_obj.group(0)
        return url
    else:
        return None

def slurp_file(filename):
    '''
    Returns a content of the file
    Argument:
        filename    String  The path to the file
    Return:
        body        String  The content of the file
    '''
    encoding = __get_encoding(filename)
    with open(filename, 'r', encoding=encoding) as fh:
        body = fh.read()
        fh.close()
        return body

def __get_encoding(filename):
    '''
    Returns the encoding of the file
    Argument:
        filename    String  The path to the file
    Return:
        encdoing    String  The encoding of the file
    '''
    encoding = 'ascii'
    with open(filename, 'rb') as src_file:
        detection = chardet.detect(src_file.read())
        src_file.close()
    if detection['encoding'] != 'ascii':
        encoding = 'ISO 8859-9'
    elif detection['encoding'] == 'Windows-1254':
        encoding = 'ISO 8859-1'
    else:
        encoding = detection['encoding']
    return encoding

re_URL = re.compile(r'^\s*URL.*$', re.MULTILINE)
re_FRSV_URL = re.compile(r'^\s*##.*$', re.MULTILINE)
re_TAG = re.compile(r'(<[phl]>)', re.IGNORECASE)
re_WS = re.compile(r'\s+')
re_CTRL = re.compile(r'[\x00-\x1F]+')
re_HI = re.compile(r'[\x80-\xFF]+')

def normalize(text, ascii=False, unlabelled=False):
    '''
    This function normalizes text as following:
        -remove URL line at start of gold standard files
        -replace any control characters by spaces (includes newlines)
        -remove URL line for frsv gold standard
        -only break lines before segment markers
        -normalise whitespace (including line breaks) to single spaces
    '''
    text = re_URL.sub("", text)
    text = re_FRSV_URL.sub("", text)
    text = re_CTRL.sub(" ", text)
    text = re_TAG.sub(r'\n\g<1> ', text)
    text = re_WS.sub(" ", text)
    return text

def make_diff(alignment, text_w, gold_w):
    '''
    Return diff as list of tuples ("equal"/"insert"/"delete", [ text words ], [ gold words ])
    '''
    diff = []
    for tag, i1, i2, j1, j2 in alignment.get_opcodes():
        text_region = text_w[i1:i2]
        gold_region = gold_w[j1:j2]
        if tag == "replace":
            diff.append( ("delete", text_region, []) )
            diff.append( ("insert", [], gold_region) )
        else:
            diff.append( (tag, text_region, gold_region) )
    return diff

def evaluate_F1(diff):
    '''
    return evaluation measures for given diff:
    (f-score, precision, recall, [labelled] segmentation f-score, precision, recall)
    '''
    tp = fp = fn = 0
    tag_tp = tag_fp = tag_fn = 0
    for tag, text, gold in diff:
        text_tags = len(list(filter(re_TAG.match, text)))
        gold_tags = len(list(filter(re_TAG.match, gold)))
        text_l = len(text)
        gold_l = len(gold)
        if tag == "delete":
            fp += text_l
            tag_fp += text_tags
        elif tag == "insert":
            fn += gold_l
            tag_fn += gold_tags
        else:
            tp += text_l
            tag_tp += text_tags
            assert text_l == gold_l
            assert text_tags == gold_tags
    result = __compute_F1(tp, fp, fn, tag_tp, tag_fp, tag_fn)
    return result

def __compute_F1(tp, fp, fn, tag_tp, tag_fp, tag_fn):
    '''
    Computes F1 metrics based on tp, fp, fn, tag_tp, tag_fp, tag_fn
    '''
    n_text = tp + fp if tp + fp > 0 else 1
    n_gold = tp + fn if tp + fn > 0 else 1
    precision = tp / n_text
    recall = tp / n_gold
    precision_plus_recall = precision + recall if precision + recall > 0 else 1
    f_score = 2 * precision * recall / precision_plus_recall
    tags_text = tag_tp + tag_fp if tag_tp + tag_fp > 0 else 1
    tags_gold = tag_tp + tag_fn if tag_tp + tag_fn > 0 else 1
    tag_precision = tag_tp / tags_text
    tag_recall = tag_tp / tags_gold
    precision_plus_recall = tag_precision + tag_recall if tag_precision + tag_recall > 0 else 1
    tag_f_score = 2 * tag_precision * tag_recall / precision_plus_recall
    return (100 * f_score, 100 * precision, 100 * recall, 100 * tag_f_score, 100 * tag_precision, 100 * tag_recall, tp, fp, fn, tag_tp, tag_fp, tag_fn)

#######################################################################################
# evaluation metrics
#######################################################################################

def do_cleaneval(gold_html, cleaned_html):
    '''
    Arguments:
        gold_html       String  the gold standard html
        cleaned_html    String  the cleaned html returned from a library
    Return:
        eval_list       tuple   representing score on cleaned text evaluation comparing with the gold standard

    >>> do_cleaneval(' <h> header <p> content', '<h> header <p> content') 
    (100.0, 100.0, 100.0, 100.0, 100.0, 100.0, 5, 0, 0, 2, 0, 0)
    '''
    cleaned_html = normalize(cleaned_html)
    text_words = re_WS.split(cleaned_html)
    gold_words = re_WS.split(gold_html)
    alignment = SequenceMatcher(None, text_words, gold_words)
    diff = make_diff(alignment, text_words, gold_words)
    eval_list = evaluate_F1(diff)
    return eval_list

def do_jaccard(gold_html, cleaned_html):
    '''
    Evaluate similarity between two documents:
    gold_html       annotated document which contains merely a content of a web page
    cleaned_html    cleaned document performed by a library
    This function returns the jaccard similarity index where the higher index indicates greater agreement between the two documents
    '''
    cleaned_html = normalize(cleaned_html)
    text_words = Counter(re_WS.split(cleaned_html))
    gold_words = Counter(re_WS.split(gold_html))
    
    intersection = list((text_words & gold_words).elements())
    union = list((text_words | gold_words).elements())
    
    false_positive = list((text_words - gold_words).elements())
    false_negative = list((gold_words - text_words).elements())

    tp = len(intersection) / len(union)
    fp = len(false_positive) / len(union)
    fn = len(false_negative) /len(union)
    result = __compute_F1(tp, fp, fn, 0, 0, 0)
    return result


#######################################################################################
# cleaning methods
#######################################################################################

def clean_none(raw_html):
    '''
    No cleaning method is applied.
    >>> clean_none('<h2>Hello</h2><p> world!</p>')
    '<h2>Hello</h2><p> world!</p>'
    '''
    return raw_html

def clean_metahtml_0(raw_html):
    extractor_config = metahtml.content.ExtractorConfig()
    return clean_metahtml(raw_html, extractor_config)

def clean_metahtml_1(raw_html):
    extractor_config = metahtml.content.ExtractorConfig()
    extractor_config.filter_section = True
    extractor_config.rm_form = True
    return clean_metahtml(raw_html, extractor_config)

def clean_metahtml_2(raw_html):
    extractor_config = metahtml.content.ExtractorConfig()
    extractor_config.filter_main = False
    extractor_config.article = False
    extractor_config.rm_badtags = False
    extractor_config.rm_figure = False
    extractor_config.rm_aside = False
    extractor_config.div_to_p = False
    extractor_config.rm_noncontent_blocks = False
    extractor_config.rm_header_lists = False
    extractor_config.rm_footer_lists = False
    return clean_metahtml(raw_html, extractor_config)

def clean_metahtml_3(raw_html):
    extractor_config = metahtml.content.ExtractorConfig()
    extractor_config.rm_header_lists = False
    extractor_config.rm_footer_lists = False
    return clean_metahtml(raw_html, extractor_config)

def clean_metahtml_4(raw_html):
    extractor_config = metahtml.content.ExtractorConfig()
    extractor_config.rm_footer_lists = False
    return clean_metahtml(raw_html, extractor_config)

def clean_metahtml_5(raw_html):
    extractor_config = metahtml.content.ExtractorConfig()
    extractor_config.rm_header_lists = False
    return clean_metahtml(raw_html, extractor_config)

def clean_metahtml(raw_html, extractor_config=metahtml.content.ExtractorConfig()):
    '''
    Arguments:
        raw_html        String  Raw downloaded html input
    Return:
        cleaned_html    String  Cleaned html by metahtml library
    >>> clean_metahtml('<text id="http://medicine.ucsf.edu/housestaff/handbook/HospH2002_C7.htm" title="HEMATOLOGY / ONCOLOGY" encoding="windows-1252"> <html> <head> <meta name=Generator content="Microsoft Office HTML Filter 2.0"> <meta http-equiv=Content-Type content="text/html; charset=windows-1252"> <meta name=Originator content="Microsoft Word 9"> <title>HEMATOLOGY / ONCOLOGY</title> <style> <!-- p.MsoNormal, li.MsoNormal, div.MsoNormal { margin:0in; margin-bottom:.0001pt; font-size:10.0pt; font-family:"Times New Roman";}')
    ''
    '''
    url = __get_url(raw_html)
    res = metahtml.parse(raw_html, url, None, False, extractor_config, True)
    if res['content'] is not None:
        cleaned_html = res['content']['best']['value']['text']
    else:
        cleaned_html = ''
    return cleaned_html

def clean_trafilatura_no_fallback(raw_html):
    '''                                                          
    Arguments:
        raw_html        String  Raw downloaded html input
    Return:
        cleaned_html    String  Cleaned html by trafilatura library only
    Faster than with fallback option but less content extracted
    >>> clean_trafilatura_no_fallback('<div><h3>Test Header</h3><p>Content 123</p></div>')
    'Content 123'
    '''
    url = __get_url(raw_html)
    cleaned_html = trafilatura.extract(raw_html, url, no_fallback=True)
    if cleaned_html is None:
        cleaned_html = ''
    return cleaned_html

def clean_newspaper3k(raw_html):
    '''
    Arguments:
        raw_html        String  Raw downloaded html input
    Return:
        cleaned_html    String  Cleaned html by newspaper3k library
    '''
    parser = parsers.Parser()
    cleaned_html = parser.fromstring(raw_html)
    return cleaned_html.text_content()

def clean_trafilatura_with_fallback(raw_html):
    '''
    Arguments:
        raw_html        String  Raw downloaded html input
    Return:
        cleaned_html    String  Cleaned html by trafilatura library with fallback by justtext and readability-lxml
    Slower but more content extracted. We opt the doctest for this function as there is a required minimum file size
    '''
    url = __get_url(raw_html)
    cleaned_html = trafilatura.extract(raw_html, url)
    if cleaned_html is None:
        cleaned_html = ''
    return cleaned_html

# Rename function names
# Todo: Remove this... Potentially could be done by creating a function to remove "clean" before processing
clean_none.__name__ = 'cleaneval'
clean_metahtml.__name__ = 'metahtml'
clean_metahtml_0.__name__ = 'metahtml-0'
clean_metahtml_1.__name__ = 'metahtml-1'
clean_metahtml_2.__name__ = 'metahtml-2'
clean_metahtml_3.__name__ = 'metahtml-3'
clean_metahtml_4.__name__ = 'metahtml-4'
clean_metahtml_5.__name__ = 'metahtml-5'
clean_newspaper3k.__name__ = 'newspaper3k'
clean_trafilatura_no_fallback.__name__ = 'trafilatura-no-fallback'
clean_trafilatura_with_fallback.__name__ = 'trafilatura-with-fallback'


#######################################################################################
# main function
#######################################################################################

def cleaneval_from_files(gold_path, raw_path, list_of_libraries = [ lambda x: x ], eval_method=do_cleaneval, opt_latex=True, opt_total=True, opt_noheader=False, opt_summary=True, opt_ascii=False, opt_unlabelled=False):
    '''
    gold_path is the path to the directory containing the gold standard files
    raw_path is the path to the directory containing the raw files
    '''
    n_processed = {} 
    raw_files = os.listdir(raw_path)
    n_files = len(raw_files)
    eval_list = {}
    sum = {}
    ss = {}
    for library in list_of_libraries:
        sum[library.__name__] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        ss[library.__name__] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        n_processed[library.__name__] = 0
    for filename in raw_files:
        raw_file = raw_path + '/' + filename
        gold_standard_file = gold_path + '/' + filename
        if not os.access(gold_standard_file, os.R_OK):
            continue  # original and cleaned files don't always match in CleanEval gold standard
        raw_html = slurp_file(raw_file)
        gold_html = normalize(slurp_file(gold_standard_file), opt_ascii, opt_unlabelled)
        for library in list_of_libraries:
            cleaned_html = library(raw_html)
            eval_list[library.__name__] = eval_method(gold_html, cleaned_html)
            if not opt_total:
                print(raw_file+ " ("+library.__name__+")" + "\t" + ("%.2f\t%.2f\t%.2f\t%.2f\t%.2f\t%.2f\t%d\t%d\t%d\t%d\t%d\t%d" % eval_list[library.__name__]))
            for i, x in enumerate(eval_list[library.__name__]):
                sum[library.__name__][i] += x
                ss[library.__name__][i] += x ** 2
            n_processed[library.__name__] += 1
    for library in list_of_libraries:
        if n_processed[library.__name__] < n_files:
            print("Warning: %d files skipped for %s" % (n_files - n_processed[library.__name__], library.__name__))
    if not opt_latex:
        print("Library\t\t\tF\tP\tR\tF.tag\tP.tag\tR.tag\tTP\tFP\tFN\tTP.tag\tFP.tag\tFN.tag")
    else:
        print(r'\begin{tabular}{ |c|c|c|c|c|c|c|c|c|c|c|c|c| }')
        print(r'\hline')
        print(r'Library & F & P & R & F.tag & P.tag & R.tag & TP & FP & FN & TP.tag & FP.tag & FN.tag \\')
        print(r'\hline')
    for library in list_of_libraries:
        tp = sum[library.__name__][6]
        fp = sum[library.__name__][7]
        fn = sum[library.__name__][8]
        tag_tp = sum[library.__name__][9]
        tag_fp = sum[library.__name__][10]
        tag_fn = sum[library.__name__][11]
        result = __compute_F1(tp, fp, fn, tag_tp, tag_fp, tag_fn)
        if not opt_latex:
            print(library.__name__ + "\t\t" + ("%.2f\t%.2f\t%.2f\t%.2f\t%.2f\t%.2f\t%d\t%d\t%d\t%d\t%d\t%d\n" % result))
        else:
            print(r'%s & ' % library.__name__ + r'%.2f & %.2f & %.2f & %.2f & %.2f & %.2f & %d & %d & %d & %d & %d & %d \\' % result)
            print(r'\hline')

cache_dir = test_golden.cache_dir 
gold_dir = test_golden.golden_dir
common_urls = test_content.common_urls

def load_metahtml_annotated():
    '''
    Load all annotated web pages of metahtml.
    This function returns a list of dictionary whose keys are:
        raw     raw html of a web page
        gold    annotated version done by humans
    '''
    dataset = []
    gold_paths = glob(gold_dir+'/**/*.content.*')
    for path in gold_paths:
        folder, date, annotator = __extract_metahtml_path(path)
        raw_path = cache_dir + '/' + folder + '/' + date
        raw_html = slurp_file(raw_path)
        gold_html = __cleaning_annotated(slurp_file(path))
        dataset.append({
            'raw': raw_html,
            'gold': gold_html
        })
    return dataset

# Todo: evaluation function between annotators
def evaluation_inner_agreement(common_dataset, latex_file=None):
    '''
    Evaluate agreement in annotated common webpages via Jaccard similarity index
    results = { 'mikeizbicki': { 'mikeizbicki': 100, 'Tonnpo': 98  } }}
    '''
    results = {}
    agreement = []
    for annotator in common_dataset:
        results[annotator] = {} 
        for other_annotator in common_dataset:
            n_files = 0
            total = 0
            for gold_path in common_dataset[annotator]:
                folder, date, annotator = __extract_metahtml_path(gold_path)
                gold_html = __cleaning_annotated(slurp_file(gold_path))
                common_path = gold_dir + '/' + folder + '/' + date
                raw_path = find_matched_raw(common_path, common_dataset[other_annotator])
                if raw_path is not None:
                    raw_html = __cleaning_annotated(slurp_file(raw_path))
                    result = do_jaccard(gold_html, raw_html)
                    # result[6] is tp
                    total += result[6]
                    agreement.append({
                        'similarity': result[6],
                        'file': common_path,
                    })
                n_files += 1
            avg = (total / n_files) * 100
            results[annotator][other_annotator] =  avg
    sorted_agreement = sorted(agreement, key=lambda res: res['similarity'], reverse=True)
    percentile = 90
    rough_pos = (len(sorted_agreement)*percentile) // 100
    print("sorted_agreement[rough_pos]=",sorted_agreement[rough_pos])
    if latex_file:
        with open(latex_file, 'w') as f:
            f.writelines([ r'\begin{tabular}{ |c|'] + [r'c|']*len(common_dataset) + [ r'}\hline', '\n', 'annotators' ])
            for annotator in results:
                f.write('& ' + annotator)
            f.writelines([r'\\', r'\hline', '\n'])
            for annotator in results:
                f.write(annotator)
                for other_annotator in results[annotator]:
                    f.write('& %.2f' % results[annotator][other_annotator])
                f.writelines([ r'\\', r'\hline', '\n'])
            f.write(r'\end{tabular}')
            f.close()


def find_matched_raw(common_path, paths):
    '''
    This function finds the matched file path of the same webpage annotated by the same annotator or other annotators
    '''
    matched = list(filter(lambda path: common_path in path, paths))
    return matched[0] if len(matched) == 1 else None
    
# Will potentially be a replacement of cleaneval_from_files function
def evaluation(dataset, list_of_libraries = [ lambda x: x ], eval_method=do_cleaneval, latex_file=None):
    eval_list = {}
    total = {}
    ss = {}
    for library in list_of_libraries:
        total[library.__name__] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        ss[library.__name__] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    for webpage in dataset:
        raw_html = webpage['raw']
        gold_html = webpage['gold']
        for library in list_of_libraries:
            cleaned_html = library(raw_html)
            eval_list[library.__name__] = eval_method(gold_html, cleaned_html)
            for i, x in enumerate(eval_list[library.__name__]):
                total[library.__name__][i] += x
                ss[library.__name__][i] += x ** 2
        if latex_file:
            with open(latex_file, 'w') as f:
                f.writelines([ r'\begin{tabular}{ |c|c|c|c|c|c|c|c|c|c|c|c|c| }', r'\hline', '\n', r'Library & F & P & R & F.tag & P.tag & R.tag & TP & FP & FN & TP.tag & FP.tag & FN.tag \\', r'\hline', '\n' ])
                for library in list_of_libraries:
                    tp = total[library.__name__][6]
                    fp = total[library.__name__][7]
                    fn = total[library.__name__][8]
                    tag_tp = total[library.__name__][9]
                    tag_fp = total[library.__name__][10]
                    tag_fn = total[library.__name__][11]
                    result = __compute_F1(tp, fp, fn, tag_tp, tag_fp, tag_fn)
                    f.writelines([ r'%s & ' % library.__name__ + r'%.2f & %.2f & %.2f & %.2f & %.2f & %.2f & %d & %d & %d & %d & %d & %d \\' % result, r'\hline', '\n' ])
                f.write(r'\end{tabular}')
                f.close()

def get_metahtml_common():
    '''
    Get common webpages for metahtml dataset
    Returns a dictionary whose keys are the usernames of the annotators
    '''
    dataset = {}
    common_paths = []
    for url in common_urls:
        filename = test_golden.url2filename(url)
        common = glob(gold_dir+'/'+filename+'/*.content.*')
        for path in common:
            common_paths.append(path)
    for common_path in common_paths:
        folder, date, annotator = __extract_metahtml_path(common_path)
        if annotator in dataset:
            dataset[annotator].append(common_path)
        else:
            dataset[annotator] = [ common_path ]
    return dataset 

def __extract_metahtml_path(path):
    '''
    This function takes exactly one argument:
        path    A string representation of annotated file path
    
    This function returns three variables consecutively:
        folder      A human readable name of folder storing the web page
        date        The date when the web page was saved
        annotator   Name of the annotator
    '''
    split_paths = path.split('/')
    folder = split_paths[2]
    split_annotated = split_paths[3].split('.')
    date = split_annotated[0]
    annotator = split_annotated[2]
    return folder, date, annotator

def __cleaning_annotated(annotated_html):
    '''
    Cleaning annotated html:
        -Remove Style and Script tags
        -Discard tags with class "rm-manual"
    '''
    annotated_soup = BeautifulSoup(annotated_html, features='lxml')
    body = annotated_soup.body
    if body is None:
        style_tag = annotated_soup.find('style')
        if style_tag is not None:
            style_tag.decompose()
        script_tags = annotated_soup.find_all('script')
        if len(script_tags) > 0:
            for script_tag in script_tags:
                script_tag.decompose()
        body = annotated_soup
    rm_lines = body.find_all(class_='rm-manual')
    if len(rm_lines) > 0:
        for line in rm_lines:
            line.decompose()
    cleaned_annotated = normalize(body.__str__())
    return cleaned_annotated

if __name__ == '__main__':
    from clize import run
    common_dataset = get_metahtml_common()
    evaluation_inner_agreement(common_dataset)
    #dataset = load_metahtml_annotated()
    #evaluation_inner_agreement(common_dataset, 'paper/fig/annotator.tex')
    #evaluation(dataset, [ clean_none, clean_metahtml, clean_trafilatura_no_fallback, clean_trafilatura_with_fallback, clean_newspaper3k ], do_cleaneval, latex_file='paper/fig/results.tex')
