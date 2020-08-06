#!/usr/bin/python3
'''
'''

import os
import glob
import lxml
import lxml.etree
from lxml.html.diff import htmldiff
import pytest

# the sys import is needed so that we can import from the current project
import sys
sys.path.append('.')
import metahtml

################################################################################

cache_dir = 'tests/.cache'

def generate_content_test(filename):
    filename_output_html = filename+'.metahtml.html'
    filename_output_text = filename+'.metahtml.text'

    #if os.path.isfile(filename_output_text):
        #return

    urlish = os.path.dirname(filename).split('/')[-1]
    urlish = urlish.replace('___','://').replace('_','/')

    with open(filename) as f:
        html = f.read()
        meta = metahtml.parse_all(html,urlish,fast=False)
        with open(filename_output_html,'w') as fout:
            html_metahtml = meta['content']['value']['html']
            fout.write(html_metahtml)
        with open(filename_output_text,'w') as fout:
            fout.write(meta['content']['value']['text'])

    # generate the diff
    with open(filename+'.newspaper3k.html') as f:
        html_newspaper = f.read()

    with open(filename+'.diff.html', 'w') as f:
        html_diff = '<style> ins { background-color: #00ff00; }\ndel {background-color: #ff0000} </style>'
        html_diff += htmldiff(html_newspaper,html_metahtml)
        f.write(html_diff)


@pytest.mark.parametrize('filename', glob.glob(cache_dir+'/*/*[0-9]'), ids=lambda x:x)
def FIXME_test_content(filename):
    filename_output_html = filename+'.newspaper3k.html'
    filename_output_text = filename+'.newspaper3k.text'

    if not os.path.isfile(filename_output_text):
        return

    urlish = os.path.dirname(filename).split('/')[-1]
    urlish = urlish.replace('___','://').replace('_','/')

    with open(filename) as f:
        html = f.read()
        meta,meta_full = metahtml.parse_all(html,urlish,fast=False)

        def normalize(s):
            return "".join(s.split())
        #with open(filename_output_html) as fout:
            #assert normalize(meta['content']['value']['html']) == normalize(fout.read())
        with open(filename_output_text) as fout:
            assert normalize(meta['content']['value']['text']) == normalize(fout.read())


################################################################################
# initialize the test cases

if __name__=='__main__':

    # process command line args
    import argparse
    parser = argparse.ArgumentParser()
    parser.add_argument('--generate',action='store_true')
    args = parser.parse_args()

    if args.generate:
        #filenames = glob.glob(cache_dir+'/*washingtonpost*/*[0-9]')
        #filenames = glob.glob(cache_dir+'/*112.international*/*[0-9]')
        #filenames = glob.glob(cache_dir+'/*21stcenturywire*/*[0-9]')
        #filenames = glob.glob(cache_dir+'/*libero.it*/*[0-9]')
        #filenames = glob.glob(cache_dir+'/*accesswdun.com*/*[0-9]')
        #filenames = glob.glob(cache_dir+'/*playadelcarmennoticias.com*/*[0-9]')
        #filenames = glob.glob(cache_dir+'/*actualidad.rt.com*/*[0-9]')
        #filenames = glob.glob(cache_dir+'/*americantruthtoday.com*/*[0-9]')
        #filenames = glob.glob(cache_dir+'/*apnews.com*/*[0-9]')
        #filenames = glob.glob(cache_dir+'/*sputniknews.com*/*[0-9]')
        #filenames = glob.glob(cache_dir+'/*diariolaregion.net*/*[0-9]')
        #filenames = glob.glob(cache_dir+'/*dnyuz.com*/*[0-9]')
        #filenames = glob.glob(cache_dir+'/*dujour.com*/*[0-9]')
        #filenames = glob.glob(cache_dir+'/*eblnews.com*/*[0-9]')
        #filenames = glob.glob(cache_dir+'/*khabarhub.com*/*[0-9]')
        #filenames = glob.glob(cache_dir+'/*passeportsante*/*[0-9]')
        #filenames = glob.glob(cache_dir+'/*prpchannel*/*[0-9]')
        #filenames = glob.glob(cache_dir+'/*public.fr*/*[0-9]')
        #filenames = glob.glob(cache_dir+'/*publico.es*/*[0-9]')
        #filenames = glob.glob(cache_dir+'/*rcinet.ca*/*[0-9]')
        #filenames = glob.glob(cache_dir+'/*sunsigns*/*[0-9]')
        #filenames = glob.glob(cache_dir+'/*spicee.com*/*[0-9]')
        #filenames = glob.glob(cache_dir+'/*steelorbis.com*/*[0-9]')
        #filenames = glob.glob(cache_dir+'/*abc*/*[0-9]')
        #filenames = glob.glob(cache_dir+'/*dzuturum*/*[0-9]')
        #filenames = glob.glob(cache_dir+'/*economictimes.indiatimes*panache*/*[0-9]')
        #filenames = glob.glob(cache_dir+'/*antaranews*/*[0-9]')
        #filenames = glob.glob(cache_dir+'/*angelfalques*/*[0-9]')
        #filenames = glob.glob(cache_dir+'/*cnn*/*[0-9]')
        #filenames = glob.glob(cache_dir+'/*scientificamerican*/*[0-9]')
        #filenames = glob.glob(cache_dir+'/*uppersia*/*[0-9]')
        #filenames = glob.glob(cache_dir+'/*upi.com*/*[0-9]')
        #filenames = glob.glob(cache_dir+'/*tishineh.com*/*[0-9]')
        filenames = glob.glob(cache_dir+'/*/*[0-9]')
        for i,filename in enumerate(sorted(filenames, key=len, reverse=True)):
            print("i=",i,"filename=",filename)
            try:
                generate_content_test(filename)
            except (FileNotFoundError,ValueError,RecursionError) as e:
                with open('errors.txt','a+') as f:
                    msg = filename+' '+repr(e)
                    print(msg)
                    f.write(msg+'\n')
