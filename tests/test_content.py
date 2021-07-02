#!/usr/bin/python3
'''
================================================================================
INSTRUCTIONS:
To label text as not part of a document, hold down the SHIFT key and select the text with the mouse.
This will highlight the selected paragraphs in red to indicate they are not part of the document.
If you select text that has already been highlighted, it will unhighlight it.

Once you have completed the labeling, save the document to your $HOME folder with the default filename.
The filename will look something like "tmpXXXXXXXX.html" and the default save location is your $HOME folder.
Once you've finished, you will have to close firefox manually, but the test case will be recorded.
================================================================================
'''

import glob
import json
import logging
import os
import random
import selenium
import selenium.webdriver
import tempfile
import time

# the sys import is needed so that we can import from the current project
import sys
sys.path.append('.')
import metahtml
import test_golden

################################################################################

def get_unannotated_urls(lang=None, seed=0, force_relabel=False, username=None):
    logging.info('get_unannotated_urls()')
    paths = sorted(glob.glob('tests/.golden/*/*'))
    urls = []
    for path in paths:
        if '.content' not in path:
            if glob.glob(path+'.content.'+username) == [] or force_relabel:
                with open(path) as f:
                    meta = json.load(f)
                    if meta['type'] == 'article':
                        if lang is None or lang in meta['language']:
                            urls.append(meta['url'])
    logging.info('len(urls)='+str(len(urls)))
    random.seed(seed)
    random.shuffle(urls)
    return urls


# this javascript code allows for annotating webpages within firefox
javascript = '''
<script>
function toggleSelectedText(e) {
    if (e.shiftKey) {
        var selection = window.getSelection();
        var range = selection.getRangeAt(0);
        var tags = "p,h1,h2,h3,h4,h5,h6,ul,ol,li,dl,dt,table,tr,td,th,article,main,section,figure,figcaption,aside,section,address,blockquote";
        if (range.commonAncestorContainer.getElementsByTagName) {
            var allWithinRangeParent = range.commonAncestorContainer.querySelectorAll(tags);
        }
        else {
            //var allWithinRangeParent = [range.commonAncestorContainer.closest(tags)];
            var allWithinRangeParent = [range.commonAncestorContainer.parentNode.closest(tags)];
        }

        for (var i=0, el; el = allWithinRangeParent[i]; i++) {
          // The second parameter says to include the element
          // even if it's not fully selected
          if (selection.containsNode(el, true) ) {
              el.classList.toggle('rm-manual');
          }
        }
        window.getSelection().removeAllRanges();
    }
};

//var article = document.body.querySelector('article');
document.onmouseup = toggleSelectedText;
document.captureEvents(Event.MOUSEUP);
</script>

<style>
.rm-manual {
    text-decoration: line-through;
    background-color: #faa;
}
</style>
        '''

def annotate_content(url=None, *, username:str=None, seed=0, force_relabel=False, lang:str=None):
    if not username:
        logging.error('must supply username')
        return

    if not url:
        urls = get_unannotated_urls(lang, seed=seed, force_relabel=force_relabel, username=username)
    else:
        urls = [url]
    for url in urls:
        annotate_content_url(url, username)


def annotate_content_url(url, username):

    # loop over all downloads of that url
    for date, html in test_golden.get_cached_webpages(url):

        # generate the test path
        url_filename = test_golden.url2filename(url)
        url_dir = os.path.join(test_golden.golden_dir,url_filename)
        os.makedirs(url_dir, exist_ok=True)
        test_path = os.path.abspath(os.path.join(url_dir,date))
        logging.debug('test_path='+test_path)
        cache_path = os.path.abspath(os.path.join(os.path.join(test_golden.cache_dir,url_filename),date))

        # output the test case
        with open(test_path) as f:
            logging.info(test_path+'\n'+f.read())

        # the extractor_config below controls how metahtml extracts content;
        # these settings are designed to maximize recall while maintaining decent formatting;
        # the formatting options are likely to cause a small recall penalty for some webpages,
        # but this is unavoidable if we want to be able to annotate within firefox
        extractor_config = metahtml.content.ExtractorConfig()
        extractor_config.filter_main = True
        extractor_config.filter_section = False
        extractor_config.filter_article = False
        extractor_config.rm_badtags = False
        extractor_config.rm_figure = False
        extractor_config.rm_aside = False
        extractor_config.rm_form = False
        extractor_config.div_to_p = True
        extractor_config.div_to_p_length_threshold = 0
        extractor_config.rm_noncontent_blocks = False
        extractor_config.rm_header_lists = False
        extractor_config.rm_footer_lists = False
        extractor_config.rm_empty_tags = True
        extractor_config.flatten_html = True
        extractor_config.clean_html = True

        # generate the test information
        meta = metahtml.parse(html, url, extractor_config=extractor_config)
        if not meta.get('content'):
            raise ValueError('no content extracted from url because it was not an article; did you forget to create a test case?')

        # first write the html content (plus javascript annotation code) to a temporary file;
        # then load it in firefox for user annotation
        with tempfile.NamedTemporaryFile(mode='wt', suffix='.html', delete=True) as f:
            f.write(javascript)
            f.write(meta['content']['best']['value']['html'])
            f.flush()

            # load the firefox
            tmp_path = f.name
            logging.debug('tmp_path='+tmp_path)
            logging.debug('cache_path='+cache_path)
            firefox = selenium.webdriver.Firefox()
            #firefox.get('file://'+cache_path)
            #firefox.execute_script('window.open("file://' + tmp_path + '","_blank");')
            firefox.get('file://'+tmp_path)
            firefox.execute_script('window.open("file://' + cache_path + '","_blank");')
            firefox.switch_to.window(firefox.window_handles[0])

            # wait for the user to save the annotations
            firefox_saved_path = os.path.join(os.path.expanduser('~'), os.path.basename(tmp_path))
            logging.info('waiting for file to be saved to '+firefox_saved_path)
            logging.info('press CTRL+C without saving to prevent test case from being recorded')
            while not os.path.isfile(firefox_saved_path):
                time.sleep(0.1)
                # if the user quits firefox instead of saving the annotations,
                # then return without saving the annotations
                try:
                    _ = firefox.window_handles
                except selenium.common.exceptions.WebDriverException:
                    return

            # done with firefox, so quit
            firefox.quit()

            # move the annotated webpage to the 'tests/.golden' folder
            test_path_content = test_path + '.content.' + username
            os.rename(firefox_saved_path, test_path_content)
            logging.info('content annotations saved to '+test_path_content)


if __name__=='__main__':
    logging.basicConfig(level=logging.INFO)
    from clize import run
    run(annotate_content)
