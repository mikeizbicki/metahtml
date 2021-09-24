#!/usr/bin/python3

import sys
import chardet
import re
sys.path.append('')
import metahtml
import tests.test_golden as test_golden
import tests.test_content as test_content
from bs4 import BeautifulSoup
from glob import glob
from collections import Counter

help_message = '''
This is an evaluation of inner annotator agreement

Reference source comes from http://webascorpus.sourceforge.net/PHITE.php?sitesig=FILES&page=FILES_10_Software&subpage=FILES_10_CleanEval 

Usage: tests/eval_inner.py
'''

#######################################################################################
# helper function
#######################################################################################

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
    text = re_CTRL.sub(" ", text)
    text = re_TAG.sub(r'\n\g<1> ', text)
    text = re_WS.sub(" ", text)
    return text

#######################################################################################
# evaluation metric
#######################################################################################

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
    return tp, fp, fn 

#######################################################################################
# load dataset
#######################################################################################

cache_dir = test_golden.cache_dir 
gold_dir = test_golden.golden_dir
common_urls = test_content.common_urls

def load_metahtml_common():
    '''
    Get common annotated webpages for metahtml dataset
    Returns a dictionary whose keys are the usernames of the annotators
    '''
    dataset = {}
    common_paths = []
    for url in common_urls:
        filename = test_golden.url2filename(url)
        common = glob(gold_dir+'/'+filename+'/*.content.*')
        for path in common:
            common_paths.append(path)
    for path in common_paths:
        folder, date, annotator = __extract_metahtml_path(path)
        if annotator in dataset:
            dataset[annotator].append(path)
        else:
            dataset[annotator] = [ path ]
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

def find_matched_raw(common_path, paths):
    '''
    This function finds the matched file path of the same webpage annotated by the same annotator or other annotators
    '''
    matched = list(filter(lambda path: common_path in path, paths))
    return matched[0] if len(matched) == 1 else None

#######################################################################################
# annotation evaluation
#######################################################################################

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
                    tp, fp, fn = do_jaccard(gold_html, raw_html)
                    total += tp 
                    agreement.append({
                        'similarity': tp,
                        'file': common_path,
                    })
                n_files += 1
            avg = (total / n_files) * 100
            results[annotator][other_annotator] =  avg
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

if __name__ == '__main__':
    from clize import run
    common_dataset = load_metahtml_common()
    evaluation_inner_agreement(common_dataset, 'paper/fig/inner_annotator.tex')
