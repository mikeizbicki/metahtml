
import copy
import re
from urllib.parse import urlparse
import lxml
import lxml.html

from metahtml.property.timestamp.__common__ import worst_tz_lo, worst_tz_hi, timestamp_range
from metahtml.property.__common__ import BaseExtractor


def extract(parser):
    doc = parser.doc
    url = parser.url
    fast = False

    timestamps_filtered = parser.meta['timestamp.published']['filtered']
    url_parsed = urlparse(url)

    article_types = []

    # pages with no timestamps have an unknown article_type
    if timestamps_filtered is None or len(timestamps_filtered)==0:
        if timestamps_filtered is None:
            pattern_details = 'None'
        else:
            pattern_details = 'len(timestamps_filtered)==0'
        article_types.append({
            'value' : 'unknown',
            'valid_for_hostname' : True,
            'pattern' : 'timestamp.published[filtered]',
            'pattern_details' : pattern_details,
            })

    # pages with too many timestamps are probably not an article, 
    # but instead a "catalog" page listing many articles;
    # FIXME: this check is very heuristic and needs more evaluation
    if len(timestamps_filtered) > 5:
        
        # FIXME: 
        # another way to do this check is to use the range of time the timestamps cover;
        # it's not clear if this would lead to a more accurate check
        # bests_range = timestamp_range(timestamps_filtered)
        # or (len(timestamps_filtered) > 3 and abs(bests_range.total_seconds()) > 48*60*60):

        article_types.append({
            'value' : 'catalog',
            'valid_for_hostname' : True,
            'pattern' : 'len(timestamps_filtered)',
            'pattern_details' : str(len(timestamps_filtered)),
            })

    # xpath-based patterns
    # FIXME:
    # extracting the article type from the page itself seems like a good idea,
    # but it's not at all clear how to do this in a consistent way,
    # as almost all websites seem to be misusing the existing semantic tags
    xpaths = [
        #( 'cnbc.com', '//meta[@property="og:type"]/@content' ),
        ]
    for hostname,xpath in xpaths:

        # if in fast mode, then only search for elements that will apply to the hostname
        valid_for_hostname = hostname is None or hostname in url_parsed.hostname
        if fast and not valid_for_hostname:
            continue

        # loop through all elements found by the xpath
        for element in doc.xpath(xpath):

            # element can be one of several different types of lxml objects;
            # depending on the type, we need to extract the text in different ways
            if type(element) is lxml.etree._ElementUnicodeResult:
                text = str(element)
            elif type(element) is lxml.etree._Element:
                text = element.text
            elif type(element) is lxml.html.HtmlElement:
                text = element.text_content()

            # FIXME: this is a hack
            if text=='video':
                text = 'article'

            # generate the article_type from text
            if text=='article':
                article_types.append({
                    'value' : text,
                    'pattern' : 'xpath',
                    'pattern_details' : xpath,
                    'valid_for_hostname' : valid_for_hostname,
                    })

    # url-based patterns
    regexs = [ (hostname,'('+regex+')') for hostname,regex in [
        # these regexs match webpages that contain only dates
        ( None, r'/(19|20)\d{2}/[a-zA-Z]{3}/\d{2}/?$' ),
        ( None, r'/(19|20)\d{2}/\d{2}/\d{2}/?$' ),
        ( None, r'/(19|20)\d{2}/\d{2}/?$' ),
        ( None, r'/(19|20)\d{2}/?$' ),

        ( 'bloomberg.com', r'/(19|20)\d{2}-\d{2}-\d{2}/?$' ),
        ( None, r'^/(19|20)\d{2}-[a-zA-Z]{3}-\d{2}/?$' ),
        ( None, r'^/(19|20)\d{2}-\d{2}-\d{2}/?$' ),
        ( None, r'^/(19|20)\d{2}-\d{2}/?$' ),

        ( None, r'^/?$' ),
        ( None, r'^/article/?$' ),
        ( None, r'^/category/' ),
        ( None, r'^/category$' ),
        ( None, r'^/tag/' ),
        ( None, r'^/tag$' ),

        # NOTE: 
        # this catches all 1 word page-names; is that too strict?
        # it's definitely too strict to catch names that include -_/ etc
        ( None, r'^/[a-zA-Z]*/?$' ), 

        # hostname specific regexs
        ( 'abc3340.com', r'/news/nation-world$' ),
        ( 'bbc.co.uk', r'/asia_pacific$' ),
        ( 'bbc.co.uk', r'/history/historic_figures/?$' ),
        ( 'bbc.com', r'/asia_pacific$' ),
        ( 'be.la7.it', r'/laria-che-tira/?$' ),
        ( 'be.la7.it', r'/parlano-gli-esperti/?$' ),
        ( 'breitbart.com', r'^/national-security/?$' ),
        ( 'cnbc.com', r'^/2020-elections/?$' ),
        ( 'cnn.com', r'^/ASIANOW/time/?$' ),
        ( 'courrierinternational.com', r'^/sujet/etat-islamique/?$' ),
        ( 'courrierinternational.com', r'^/sujet/terrorisme/?$' ),
        ( 'crofsblogs.typepad.com', r'^/h5n1/?$' ),
        ( 'dailymail.co.uk', r'^/video/index.html?$' ),
        ( 'elmundo.es', r'^/internacional.html$' ),
        ( 'en.mediamass.net', r'^/people/kim-jong-un/?$' ),
        ( 'frac.org', r'^/covid-19-updates/?$' ),
        ( 'gcphn.org.au', r'^/practice-support/?$' ),
        ( 'gcphn.org.au', r'^/practice-support/covid-19/?$' ),
        ( 'hannity.com', r'^/media-room/?$' ),
        ( 'imf.org', r'^/external/french/?$' ),
        ( 'lavanguardia.com', r'^/internacional/20200421/48659090331/?$' ),
        ( 'lavanguardia.com', r'^/internacional/20200421/?$' ),
        ( 'lci.fr', r'^/actu-societe/?$' ),
        ( 'lci.fr', r'^/actualite/terrorisme-10020/?$' ),
        ( 'lci.fr', r'^/bien-etre/?$' ),
        ( 'marca.com', r'^/claro-mx/?$' ),
        ( 'mundoplast.com', r'^/tag-chemical-representada-corquimia/?$' ),
        ( 'news.kakaku.com', r'^/prdnews/page=8/?$' ),
        ( 'news.un.org', r'^/es/node?$' ),
        ( 'scvo.org', r'^/coronavirus-covid-19-information-guidance/?$' ),
        ( 'scvo.org', r'^/coronavirus-covid-19-information-guidance/resources/?$' ),
        ( 'scvo.org', r'^/support/running-your-organisation/leaving-lockdown/?$' ),
        ( 'smnyct.org', r'^/informacion-general/?$' ),
        ( 'state.gov', r'^/press-releases/$' ),
        ( 'telegraph.co.uk', r'^/news/world/?$' ),
        ( 'thanhnien.vn', r'^/doi-song/$' ),
        ( 'thethaiger.com', r'^/thai-th/?$' ),
        ( 'treasury.gov', r'^/press-center/?$' ),
        ( 'treasury.gov', r'^/press-center/press-releases/?$' ),
        ( 'treasury.gov', r'^/resource-center/?$' ),
        ( 'viaouest.com', r'^/actualite-daesh.html' ),
        ( 'weather.com', r'^/health/coronavirus/?$' ),
        ( 'whitehouse.gov', r'^/briefings-statements/?$' ),

        ( 'shutterstock.com', r'' ),
        ]]

    if len(url_parsed.query)<5:
        for hostname, regex in regexs:
            # if in fast mode, then only search for elements that will apply to the hostname
            valid_for_hostname = hostname is None or hostname in url_parsed.hostname
            if fast and not valid_for_hostname:
                continue

            # if pattern in url, then add article type
            if re.search(regex, url_parsed.path):
                article_types.append({
                    'value' : 'category',
                    'pattern' : 'regex',
                    'pattern_details' : regex,
                    'valid_for_hostname' : valid_for_hostname,
                    })

    # return results
    article_types.append({
        'value' : 'article',
        'pattern' : 'default',
        'valid_for_hostname' : True,
        })

    for article_type in article_types:
        if article_type['valid_for_hostname']:
            best_article_type = article_type
            break

    return best_article_type


class Extractor(BaseExtractor):
    regexes = [ (hostname,'('+regex+')') for hostname,regex in [
        # these regexs match webpages that contain only dates
        ( None, r'/(19|20)\d{2}/[a-zA-Z]{3}/\d{2}/?$' ),
        ( None, r'/(19|20)\d{2}/\d{2}/\d{2}/?$' ),
        ( None, r'/(19|20)\d{2}/\d{2}/?$' ),
        ( None, r'/(19|20)\d{2}/?$' ),

        ( 'conexionmigrante.com', r'/(19|20)\d{2}-/\d{2}-/\d{2}/?$' ),
        ( 'conexionmigrante.com', r'/(19|20)\d{2}-/\d{2}-/?$' ),
        ( 'bloomberg.com', r'/(19|20)\d{2}-\d{2}-\d{2}/?$' ),
        ( None, r'^/(19|20)\d{2}-[a-zA-Z]{3}-\d{2}/?$' ),
        ( None, r'^/(19|20)\d{2}-\d{2}-\d{2}/?$' ),
        ( None, r'^/(19|20)\d{2}-\d{2}/?$' ),

        ( None, r'^/?$' ),
        ( None, r'^/article/?$' ),
        ( None, r'^/category/' ),
        ( None, r'^/category$' ),
        ( None, r'^/tag/' ),
        ( None, r'^/tag$' ),

        # NOTE: 
        # this catches all 1 word page-names; is that too strict?
        # it's definitely too strict to catch names that include -_/ etc
        # FIXME: false positive
        # https://benjamineidam.com/atomwaffe
        # https://aktuellesenergiejournal.wordpress.com/kernenergie/
        ( None, r'^/[a-zA-Z]*/?$' ), 

        # hostname specific regexs
        ( 'abc3340.com', r'/news/nation-world$' ),
        ( 'bbc.co.uk', r'/asia_pacific$' ),
        ( 'bbc.co.uk', r'/history/historic_figures/?$' ),
        ( 'bbc.com', r'/asia_pacific$' ),
        ( 'be.la7.it', r'/laria-che-tira/?$' ),
        ( 'be.la7.it', r'/parlano-gli-esperti/?$' ),
        ( 'breitbart.com', r'^/national-security/?$' ),
        ( 'channelb.org', r'^/sc/photo/?$' ),
        ( 'cnbc.com', r'^/2020-elections/?$' ),
        ( 'cnn.com', r'^/ASIANOW/time/?$' ),
        ( 'coronadotimes.com', r'^/ASIANOW/time/?$' ),
        ( 'coronadotimes.com', r'^/homepage-newsmag/?$' ),
        ( 'coronadotimes.com', r'^/homepage-newsmag/news/?$' ),
        ( 'courrierinternational.com', r'^/sujet/etat-islamique/?$' ),
        ( 'courrierinternational.com', r'^/sujet/terrorisme/?$' ),
        ( 'crofsblogs.typepad.com', r'^/h5n1/?$' ),
        ( 'dailymail.co.uk', r'^/video/index.html?$' ),
        ( 'dcmi.org', r'^/ko/%EB%89%B4%EC%8A%A4%EB%A0%88%ED%84%B0/?$' ),
        ( 'dcmi.org', r'^/ko/%eb%89%b4%ec%8a%a4%eb%a0%88%ed%84%b0/?$' ),
        ( 'elmundo.es', r'^/internacional.html$' ),
        ( 'en.mediamass.net', r'^/people/kim-jong-un/?$' ),
        ( 'frac.org', r'^/covid-19-updates/?$' ),
        ( 'gcphn.org.au', r'^/practice-support/?$' ),
        ( 'gcphn.org.au', r'^/practice-support/covid-19/?$' ),
        ( 'hannity.com', r'^/media-room/?$' ),
        ( 'innnews.co.th', r'^/e-sport/$'),
        ( 'imf.org', r'^/external/french/?$' ),
        ( 'klima.tagesschau.de', r'^/thema/un-sicherheitsrat/?$' ),
        ( 'klima.tagesschau.de', r'^/thema/un-sicherheitsrat/index.html' ),
        ( 'lavanguardia.com', r'^/internacional/20200421/48659090331/?$' ),
        ( 'lavanguardia.com', r'^/internacional/20200421/?$' ),
        ( 'lci.fr', r'^/actu-societe/?$' ),
        ( 'lci.fr', r'^/actualite/terrorisme-10020/?$' ),
        ( 'lci.fr', r'^/bien-etre/?$' ),
        ( 'marca.com', r'^/claro-mx/?$' ),
        ( 'money.udn.com', r'^/money/story//0' ),
        ( 'mundoplast.com', r'^/tag-chemical-representada-corquimia/?$' ),
        ( 'news.kakaku.com', r'^/prdnews/page=8/?$' ),
        ( 'news.un.org', r'^/es/node?$' ),
        ( 'pattayaone.news', r'^/learning-365/$' ),
        ( 'plaza.rakuten.co.jp', r'^/[a-zA-Z0-9]*/$' ),
        ( 'program.thaipbs.or.th', r'^/30SecondSomething' ),
        ( 'program.thaipbs.or.th', r'^/MyanmarPolitics/stories$' ),
        ( 'scvo.org', r'^/coronavirus-covid-19-information-guidance/?$' ),
        ( 'scvo.org', r'^/coronavirus-covid-19-information-guidance/resources/?$' ),
        ( 'scvo.org', r'^/support/running-your-organisation/leaving-lockdown/?$' ),
        ( 'smnyct.org', r'^/informacion-general/?$' ),
        ( 'state.gov', r'^/press-releases/$' ),
        ( 'telegraph.co.uk', r'^/news/world/?$' ),
        ( 'thaienquirer.com', r'^/current-affair/$'),
        ( 'thanhnien.vn', r'^/doi-song/$' ),
        ( 'thethaiger.com', r'^/thai-th/?$' ),
        ( 'treasury.gov', r'^/press-center/?$' ),
        ( 'treasury.gov', r'^/press-center/press-releases/?$' ),
        ( 'treasury.gov', r'^/resource-center/?$' ),
        ( 'viaouest.com', r'^/actualite-daesh.html' ),
        ( 'weather.com', r'^/health/coronavirus/?$' ),
        ( 'whitehouse.gov', r'^/briefings-statements/?$' ),

        ( 'shutterstock.com', r'' ),
        ]]


    @staticmethod
    def custom_patterns(parser, results):

        timestamps_filtered = parser.meta['timestamp.published']['filtered']

        # pages with no timestamps have an unknown article_type
        if timestamps_filtered is None or len(timestamps_filtered)==0:
            if timestamps_filtered is None:
                pattern_details = 'None'
            else:
                pattern_details = 'len(timestamps_filtered)==0'
            results.append({
                'value' : 'unknown',
                'pattern' : 'timestamp.published[filtered]',
                'pattern_details' : pattern_details,
                })

        # pages with too many timestamps are probably not an article, 
        # but instead a "catalog" page listing many articles;
        # FIXME: this check is very heuristic and needs more evaluation
        if len(timestamps_filtered) > 5:
            
            # FIXME: 
            # another way to do this check is to use the range of time the timestamps cover;
            # it's not clear if this would lead to a more accurate check
            # bests_range = timestamp_range(timestamps_filtered)
            # or (len(timestamps_filtered) > 3 and abs(bests_range.total_seconds()) > 48*60*60):
            results.append({
                'value' : 'catalog',
                'pattern' : 'len(timestamps_filtered)',
                'pattern_details' : str(len(timestamps_filtered)),
                })

        # if the article is not declared to have any type at this point,
        # then it must be an article
        if len(results)==0:
            results.append({
                'value' : 'article',
                'pattern' : 'default',
                'valid_for_hostname' : True,
                })
