#!/usr/bin/env python2.5
# encoding: utf-8
"""
cleaneval.py v1.0

Simple and fast evaluation of CleanEval-1 tasks (precision, recall, F-score).
"""

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
import trafilatura
from newspaper import parsers
from bs4 import BeautifulSoup
from glob import glob
from math import *
from difflib import SequenceMatcher
from getopt import getopt, GetoptError
from multiset import Multiset

help_message = '''
This is cleaneval.py version 1.0 -- Copyright (C) 2008 by Stefan Evert

Usage:  cleaneval.py [options] <texts_dir> <gold_dir> [<align_dir>]

Options:
  -t    print total precision/recall for all files (micro-averaged)
        (does not print results for individual files)
  -n    omit table header (e.g. to combine multiple tables)
  -s    calculate summary statistics (mean / s.d.) and print on STDERR
  -a    remove non-ASCII characters before comparison
  -u    calculate unlabelled segmentation accuracy

Evaluates automatically cleaned files in directory <texts_dir> against
gold standard files in directory <gold_dir>.  Correspoding files in the 
two directories must have identical names and there must be no other files
in these directories.

The script prints a TAB-delimited evaluation table on standard output, which
can be redirected to a file and read into R, Excel or a similar application.
Precision, recall and F-score are calculated as percentages of whitespace-
delimited words.  Accuracy of segment identification is measured by precision,
recall and F-score for labelled or unlabelled segment marker tags (if the
option -u is specified, no distinction is made between types <p>, <h> and <l>).

If the third argument is given, full alignments will be written to separate
files in directory <align_dir>.
'''

re_find_URL = re.compile('https?:\\/\\/(www\\.)?[-a-zA-Z0-9@:%._\\+~#=]{1,256}\\.[a-zA-Z0-9()]{1,6}\\b([-a-zA-Z0-9()!@:%_\\+.~#?&\\/\\/=]*)') # regex detecting url

def __get_url(raw_html):
    '''
    Extract url from a raw html
    Argument:
        raw_html    String  Raw downloaded html input
    Return:
        url         String  Url found in raw_html. If no url is found, return empty string
    >>> __get_url('')
    ''
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
        return ''

def slurp_file(filename):
    encoding = __get_encoding(filename)
    with open(filename, 'r', encoding=encoding) as fh:
        body = fh.read()
        fh.close()
        return body

def __get_encoding(filename):
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

def __check_encoding(path):
    files = os.listdir(path)
    for filename in files:
        file_path = path+'/'+filename
        encoding = __get_encoding(file_path)
        if encoding != 'utf-8':
            print(encoding)

re_URL = re.compile(r'^\s*URL.*$', re.MULTILINE)
re_TAG = re.compile(r'(<[phl]>)', re.IGNORECASE)
re_WS = re.compile(r'\s+')
re_CTRL = re.compile(r'[\x00-\x1F]+')
re_HI = re.compile(r'[\x80-\xFF]+')
re_CLEAN_URL = re.compile(r'^\s*##.*$', re.MULTILINE) #For frsv gold dataset

def normalize(text, ascii=False, unlabelled=False):
    text = re_URL.sub("", text)           # remove URL line at start of gold standard files
    text = re_CLEAN_URL.sub("", text)
    text = re_CTRL.sub(" ", text)         # replace any control characters by spaces (includes newlines)
    if unlabelled:
        text = re_TAG.sub(r'\n<p> ', text) # start each segment on new line, normalise tags
    else:
        text = re_TAG.sub(r'\n\g<1> ', text)  # only break lines before segment markers
        text = re_WS.sub(" ", text)           # normalise whitespace (including line breaks) to single spaces
        if ascii:
            text = re_HI.sub("", text)        # delete non-ASCII characters (to avoid charset problems)
        return text

## return diff as list of tuples ("equal"/"insert"/"delete", [text words], [gold words])
def make_diff(alignment, text_w, gold_w):
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

## return evaluation measures for given diff:
##   (f-score, precision, recall, [labelled] segmentation f-score, precision, recall)
def evaluate(diff):
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
    result = __evaluate(tp, fp, fn, tag_tp, tag_fp, tag_fn)
    return result

def __evaluate(tp, fp, fn, tag_tp, tag_fp, tag_fn):
    n_text = tp + fp if tp + fp > 0 else 1                                                                                                              
    n_gold = tp + fn if tp + fn > 0 else 1
    precision = float(tp) / n_text
    recall = float(tp) / n_gold
    precision_plus_recall = precision + recall if precision + recall > 0 else 1
    f_score = 2 * precision * recall / precision_plus_recall
                                                                                                                                                        
    tags_text = tag_tp + tag_fp if tag_tp + tag_fp > 0 else 1
    tags_gold = tag_tp + tag_fn if tag_tp + tag_fn > 0 else 1
    tag_precision = float(tag_tp) / tags_text
    tag_recall = float(tag_tp) / tags_gold
    precision_plus_recall = tag_precision + tag_recall if tag_precision + tag_recall > 0 else 1
    tag_f_score = 2 * tag_precision * tag_recall / precision_plus_recall
                                                                                                                                                        
    return (100 * f_score, 100 * precision, 100 * recall, 100 * tag_f_score, 100 * tag_precision, 100 * tag_recall, tp, fp, fn, tag_tp, tag_fp, tag_fn)

def write_alignment(diff, filename):
	fh = file(filename, "w")
	for tag, text_seg, gold_seg in diff:
		if tag == "delete":
			print("<" * 40, "(false positive)", file=fh)
			print(" ".join(text_seg), file=fh)
		if tag == "insert":
			print(">" * 40, "(false negative)", file=fh)
			print(" ".join(gold_seg), file=fh)
		if tag == "equal":
			print("=" * 40, file=fh)
			print(" ".join(gold_seg), file=fh)
	fh.close()

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
    eval_list = evaluate(diff)
    return eval_list

def do_jaccard(gold_html, cleaned_html):
    cleaned_html = normalize(cleaned_html)
    text_words = set(re_WS.split(cleaned_html))
    gold_words = set(re_WS.split(gold_html))

    intersection = gold_words.intersection(text_words)
    union = gold_words.union(text_words)
    
    tp = len(intersection) / len(union)
    fp = len(text_words.difference(gold_words)) / len(union)
    fn = len(gold_words.difference(text_words)) / len(union)
    result = __evaluate(tp, fp, fn, 0, 0, 0)
    return result

def do_jaccard_multiset(gold_html, cleaned_html):
    cleaned_html = normalize(cleaned_html)
    text_words = Multiset(re_WS.split(cleaned_html))
    gold_words = Multiset(re_WS.split(gold_html))
    intersection = gold_words.intersection(text_words)
    union = gold_words.union(text_words)
    
    tp = len(intersection) / len(union)
    fp = len(text_words.difference(gold_words)) / len(union)
    fn = len(gold_words.difference(text_words)) / len(union)
    result = __evaluate(tp, fp, fn, 0, 0, 0)
    return result                                               

def clean_cleaneval(raw_html):
    '''
    Traditional Cleaneval does not clean any html, just return the raw html
    >>> clean_cleaneval('<h2>Hello</h2><p> world!</p>')
    '<h2>Hello</h2><p> world!</p>'
    '''
    return raw_html

# List of function for different configuration of clean_metahtml
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
clean_cleaneval.__name__ = 'cleaneval'
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
        result = __evaluate(tp, fp, fn, tag_tp, tag_fp, tag_fn)
        if not opt_latex:
            print(library.__name__ + "\t\t" + ("%.2f\t%.2f\t%.2f\t%.2f\t%.2f\t%.2f\t%d\t%d\t%d\t%d\t%d\t%d\n" % result))
        else:
            print(r'%s & ' % library.__name__ + r'%.2f & %.2f & %.2f & %.2f & %.2f & %.2f & %d & %d & %d & %d & %d & %d \\' % result)
            print(r'\hline')


cache_dir = "tests/.cache/"
gold_dir = "tests/.golden/"

def load_data():
    dataset = []
    gold_paths = glob(gold_dir+"**/*.content.*")
    for path in gold_paths:
        split_paths = path.split('/')
        # [ 'tests', '.golden', 'webpage', 'date.content.username' ]
        webpage = split_paths[2]
        date = split_paths[3].split('.')[0]
        raw_path = cache_dir + webpage + "/" + date
        raw_html = slurp_file(raw_path)
        gold_html = slurp_file(path)
        gold_soup = BeautifulSoup(gold_html, features="lxml")
        body = gold_soup.body
        if body is None:
            style_tag = gold_soup.find('style')
            if style_tag is not None:
                style_tag.decompose()
            script_tags = gold_soup.find_all('script')
            if len(script_tags) > 0:
                for script_tag in script_tags:
                    script_tag.decompose()
            body = gold_soup
        rm_lines = body.find_all(class_="rm-manual")
        if len(rm_lines) > 0:
            for line in rm_lines:
                line.decompose()
        gold_html = normalize(body.__str__())
        dataset.append({
            'raw': raw_html,
            'gold': gold_html
        })
    return dataset

def evaluation(dataset, list_of_libraries = [ lambda x: x ], eval_method=do_cleaneval, output='output.tex'):
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
    with open(output, 'w') as f:
        # Document setup
        f.writelines([ r'\documentclass{article}', r'\usepackage[utf8]{inputenc}', r'\begin{document}', r'\title{Result}', r'\title{Result}', r'\maketitle' ])
        # Table setup 
        f.writelines([ r'\begin{tabular}{ |c|c|c|c|c|c|c|c|c|c|c|c|c| }', r'\hline', '\n', r'Library & F & P & R & F.tag & P.tag & R.tag & TP & FP & FN & TP.tag & FP.tag & FN.tag \\', r'\hline', '\n' ])
        for library in list_of_libraries:
            tp = total[library.__name__][6]
            fp = total[library.__name__][7]
            fn = total[library.__name__][8]
            tag_tp = total[library.__name__][9]
            tag_fp = total[library.__name__][10]
            tag_fn = total[library.__name__][11]
            result = __evaluate(tp, fp, fn, tag_tp, tag_fp, tag_fn)
            f.writelines([ r'%s & ' % library.__name__ + r'%.2f & %.2f & %.2f & %.2f & %.2f & %.2f & %d & %d & %d & %d & %d & %d \\' % result, r'\hline', '\n' ])
        f.write(r'\end{tabular}')
        f.write(r'\end{document}')
        f.close()
