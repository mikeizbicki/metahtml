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

common_urls = [
    "http://pattayapeople.com/2020/03/24/pattaya-expats-club-20-03-20/",
    "http://patterico.com/2019/03/01/clean-hands-president-trump-gives-kim-jong-un-a-pass-in-the-death-of-otto-warmbier/",
    "http://thealtworld.com/elijah_magnier/100-days-after-the-assassination-of-soleimani-did-the-us-achieve-its-objectives-1-2",
    "http://www.danielpipes.org/186/the-ayatollah-the-novelist-and-the-west",
    "http://www.freerepublic.com/focus/f-news/3580417/posts",
    "https://apnews.com/766c1906bf954239988e6fe922e36821",
    "https://au.finance.yahoo.com/news/virus-hit-uk-companies-told-232120374.html",
    "https://au.news.yahoo.com/world/a/35341865/kim-jong-un-accuses-cia-of-biochemical-assassination-plot/",
    "https://biowikis.com/kim-jonghyun/",
    "https://boss.blogs.nytimes.com/2013/11/11/a-business-owners-first-brush-with-healthcare-gov/",
    "https://crofsblogs.typepad.com/h5n1/2012/09/who-hantavirus-pulmonary-syndrome-yosemite-national-park-united-states-of-america-update.html",
    "https://diagnostics.roche.com/ae/en/news-listing/2020/roche-receives-fda-emergency-use-authorization-for-cobas-sars-co.html",
    "https://doralfamilyjournal.com/stores-are-rationing-supplies-to-avoid-more-product-shortage-due-to-coronavirus/",
    "https://drrichswier.com/2020/03/26/what-we-can-expect-after-the-wuhan-flu-virus/",
    "https://dujour.com/culture/dennis-rodman-north-korea-kim-jong-un-interview/",
    "https://edition.cnn.com/2019/12/04/asia/north-korea-christmas-gift-kim-jong-un-intl-hnk/index.html",
    "https://foreignpolicy.com/2020/04/06/boris-johnson-coronavirus-intensive-care-worsen/",
    "https://irfankhawajaphilosopher.com/2020/03/17/coronavirus-journal-3-creeping-death/",
    "https://localnews8.com/news/2020/01/27/kim-jong-uns-aunt-seen-in-public-for-first-time-since-her-husband-was-executed-in-2013/",
    "https://mustsharenews.com/kim-jong-un-assassination/",
    "https://mustsharenews.com/kim-jong-un-facts/",
    "https://mykaraokecafe.com/kim-jong-un-plastic-surgery/",
    "https://news.grabien.com/story-kimmel-trumps-fathers-day-message-i-feel-his-heart-isnt-it-a",
    "https://news.yahoo.com/trump-floats-treating-coronavirus-patients-with-light-and-disinfectants-000002468.html",
    "https://oklahoman.com/article/5658212/coronavirus-in-oklahoma-osu-baseball-coach-josh-holliday-posts-message-from-obrate-stadium",
    "https://sputniknews.com/world/202003191078619990-live-updates-nations-remain-on-lockdown-as-coronavirus-cases-top-191000-globally/",
    "https://trend.konitono.com/2020/03/breaking-coronavirus-update-5-new-cases-confirmed-2-in-fct-2-in-lagos-1-in-edo/",
    "https://uk.news.yahoo.com/little-girl-died-within-48-hours-showing-flu-symptoms-doctors-explain-194529050.html",
    "https://wajr.com/coronavirus-impacts-wvu-staff-students/",
    "https://www.cnn.com/2019/11/18/asia/north-korea-us-meeting-intl/index.html",
    "https://www.daytondailynews.com/nation-world/mcafee-antivirus-software-creator-dead-in-spanish-prison/H4DZHXHZQVDYRAAXXYWDCEZQJY/",
    "https://www.express.co.uk/news/uk/1275274/Coronavirus-news-vaccine-treatment-testing-covid19-virus-antibody-test",
    "https://www.freespeechdaily.com/2020/04/21/no-suspicious-activity-in-north-korea-amid-reports-of-kims-health-south-korea-says/",
    "https://www.imf.org/en/About/senior-officials/Bios/jihad-azour",
    "https://www.itbnews.info/1999/03/email-virus-spreading-rapidly/",
    "https://www.militarytimes.com/news/pentagon-congress/2020/04/21/how-a-kim-jong-un-demise-could-spark-unrest-require-us-south-korean-military-response/",
    "https://www.politico.eu/article/tony-blair-no-chance-of-uk-eu-trade-deal-on-current-brexit-deadline-boris-johnson-single-market-us-transition/",
    "https://www.politicususa.com/2020/04/21/trump-expresses-more-sympathy-for-kim-jong-uns-health-than-he-ever-did-for-john-mccain.html",
    "https://www.projectveritas.com/news/anonymous-2-facebook/",
    "https://www.realclearpolitics.com/lists/top_10_presidential_speeches_to_a_joint_session_of_congress/ronald_reagan.html",
    "https://www.reuters.com/article/us-northkorea-southkorea/north-korea-says-no-interest-in-trump-summit-until-hostile-policy-removed-idUSKBN1XU1Z2",
    "https://www.seattletimes.com/nation-world/irans-new-quds-force-commander-brings-continuity-if-not-charisma-to-post-held-by-slain-predecessor/",
    "https://www.sofmag.com/dod-its-self-defense-killing-qasem-soleimani-the-head-of-the-islamic-revolutionary-guard-corps-quds-force/",
    "https://www.ted.com/talks/ralph_langner_cracking_stuxnet_a_21st_century_cyber_weapon?language=da",
    "https://www.thedailybeast.com/trump-administration-inflated-iran-intelligence-us-officials-say",
    "https://www.theverge.com/2012/4/12/2944329/stuxnet-computer-virus-planted-israeli-agent-iran",
    "https://www.theyeshivaworld.com/news/headlines-breaking-stories/255612/iran-claims-to-be-decoding-israeli-drone-shot-down-over-natanz-nuke-plant.html",
    "https://www.vietnamartnews.com/1999/11/coronaviruses-symptoms-treatments-and-variants/",
    "https://www.washingtonpost.com/wp-srv/aponline/20000904/aponline133327_000.htm",
    "https://www.wsj.com/articles/PR-CO-20200330-906142",
    "https://www.csmonitor.com/2005/1018/p25s02-lign.html",
    "https://www.onenewspage.com/video/20200421/12998480/Kim-Jong-Un-under-treatment-after-surgery-report.htm",
    ]


def get_unannotated_common_urls(username):
    '''
    All usernames are required to annotate the urls in the common_urls global variable.
    This function returns the sublist of those urls that username has not already annotated.
    '''
    logging.info('get_unannotated_common_urls()')
    unannotated_urls = []
    for url in common_urls:
        filename = test_golden.url2filename(url)
        annotation_files = glob.glob('tests/.golden/'+filename+'/*.content.*')
        has_annotated = False
        for annotation_file in annotation_files:
            if '.content.'+username in annotation_file:
                has_annotated = True
                break
        if not has_annotated:
            unannotated_urls.append(url)
    logging.info('len(unannotated_urls)='+str(len(unannotated_urls)))
    return unannotated_urls


def get_unannotated_urls(lang=None, seed=0, force_relabel=False, username=None):
    '''
    Returns the list of all currently unannotated in a random order.
    '''
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


def annotate_content(url=None, *, username:str=None, seed=0, force_relabel=False, lang:str=None):
    '''
    Main function called when this file is executed as a script.

    url: (optional) if specified, only this url will be labeled; if unspecified, the program will continue until all urls are labeled
    username: (required) the github username of the person labeling the content; no checks are currently performed to prevent typos
    seed: changing this value will result in urls appearing in a different order for labeling
    lang: label only urls written in this language
    '''

    if not username:
        logging.error('must supply username')
        return

    if not url:
        urls = get_unannotated_common_urls(username=username)
        if len(urls) == 0:
            logging.info('finished annotating common urls')
            urls = get_unannotated_urls(lang, seed=seed, force_relabel=force_relabel, username=username)
    else:
        urls = [url]
    for url in urls:
        annotate_content_url(url, username)


# this javascript code allows for annotating webpages within firefox;
# it will be added to a webpage in the annotate_content_url function
javascript = '''
<script>
function toggleSelectedText(e) {
    if (e.shiftKey) {
        var selection = window.getSelection();
        var range = selection.getRangeAt(0);
        var tags = "p,h1,h2,h3,h4,h5,h6,ul,ol,li,dl,dt,table,tr,td,th,article,main,section,figure,figcaption,aside,section,address,blockquote,code";
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

def annotate_content_url(url, username):
    '''
    Launch firefox with custom annotation scripts in order to label the given url.
    '''

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
