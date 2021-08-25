
import copy
import re
from urllib.parse import urlparse
import lxml
import lxml.html

from metahtml.property.timestamp.__common__ import worst_tz_lo, worst_tz_hi, timestamp_range
from metahtml.property.__common__ import BaseExtractor


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
        # https://opensource.org/welcomeTeckids
        # https://research.swtch.com/hwmm
        ( None, r'^/[a-zA-Z]*/?$' ), 

        # hostname specific regexs
        ( '38north.org', r'^/topics?/?' ),
        ( 'abc3340.com', r'/news/nation-world$' ),
        ( 'agroberichtenbuitenland.nl', r'/actueel/nieuws/?$' ),
        ( 'bbc.co.uk', r'/asia_pacific$' ),
        ( 'bbc.co.uk', r'/history/historic_figures/?$' ),
        ( 'bbc.com', r'/asia_pacific$' ),
        ( 'be.la7.it', r'/laria-che-tira/?$' ),
        ( 'be.la7.it', r'/parlano-gli-esperti/?$' ),
        ( 'bnr.de', r'^/aktuell/aktiv-gegen-rechts/zivilgesellschaft/?$'),
        ( 'bnr.de', r'^/aktiv/initiativen-gegen-rechts/?$'),
        ( 'boilingsteam.com', r'^/tutorial-and-guides/?$' ),
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
        ( 'dailywire.com', r'^/show/the-ben-shapiro-show$' ),
        ( 'dcmi.org', r'^/ko/%EB%89%B4%EC%8A%A4%EB%A0%88%ED%84%B0/?$' ),
        ( 'dcmi.org', r'^/ko/%eb%89%b4%ec%8a%a4%eb%a0%88%ed%84%b0/?$' ),
        ( 'diagnostics.roche.com', r'^/hk/en/home.html' ),
        ( 'elmundo.es', r'^/internacional.html$' ),
        ( 'en.mediamass.net', r'^/people/kim-jong-un/?$' ),
        ( 'frac.org', r'^/covid-19-updates/?$' ),
        ( 'fair.org', r'^/extra-newsletter/?$' ),
        ( 'focus.de', r'^/kultur/musik/?$'),
        ( 'foreignaffairs.com', r'^/issues/'),
        ( 'gcphn.org.au', r'^/practice-support/?$' ),
        ( 'gcphn.org.au', r'^/practice-support/covid-19/?$' ),
        ( 'hannity.com', r'^/media-room/?$' ),
        ( 'innnews.co.th', r'^/e-sport/$'),
        ( 'imf.org', r'^/external/french/?$' ),
        ( 'jungefreiheit.de', r'^/debatte-politik-meinungsfreiheit-unabhangigkeit/?$'),
        ( 'jungefreiheit.de', r'^/nachrichten-meldungen-aus-der-politik/deutschland/?$'),
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
        ( 'merkur.de', r'^/welt/coronavirus-sti164091/?$' ),
        ( 'nature.com', r'/nature/articles' ),
        ( 'news.kakaku.com', r'^/prdnews/page=8/?$' ),
        ( 'news.un.org', r'^/es/node?$' ),
        ( 'noz.de', r'^/deutschland-welt/?$'),
        ( 'onekoreanetwork.com', r'^/north-korea/?$' ),
        ( 'pattayaone.news', r'^/learning-365/$' ),
        ( 'plaza.rakuten.co.jp', r'^/[a-zA-Z0-9]*/$' ),
        ( 'pnas.org', r'^/content/118/27/eiti2721118/?$'),
        ( 'poynter.org', r'^/media-news/ethics-trust/$' ),
        ( 'poynter.org', r'^/mediawise-for-gen-z' ),
        ( 'propublica.org', r'^/topics/' ),
        ( 'program.thaipbs.or.th', r'^/30SecondSomething' ),
        ( 'program.thaipbs.or.th', r'^/MyanmarPolitics/stories$' ),
        ( 'diagnostics.roche.com', r'^/global/en/home.html'),
        ( 'ruhrnachrichten.de', r'^/nachrichten/coronavirus-krise/?$'),
        ( 'schwarzwaelder-bote.de', r'^/kreis-rottweil/schramberg/?$'),
        ( 'schwarzwaelder-bote.de', r'/sport/fc-08-villingen/?$'),
        ( 'scvo.org', r'^/coronavirus-covid-19-information-guidance/?$' ),
        ( 'scvo.org', r'^/coronavirus-covid-19-information-guidance/resources/?$' ),
        ( 'scvo.org', r'^/support/running-your-organisation/leaving-lockdown/?$' ),
        ( 'sec.gov', r'^/page/news' ),
        ( 'smnyct.org', r'^/informacion-general/?$' ),
        ( 'state.gov', r'^/press-releases/$' ),
        ( 'syrianews.cc', r'^/syria-news-editors-twitter-timeline-get-inspired/?$' ),
        ( 'telegraph.co.uk', r'^/news/world/?$' ),
        ( 'thaienquirer.com', r'^/current-affair/$'),
        ( 'thanhnien.vn', r'^/doi-song/$' ),
        ( 'thethaiger.com', r'^/thai-th/?$' ),
        ( 'treasury.gov', r'^/press-center/?$' ),
        ( 'treasury.gov', r'^/press-center/press-releases/?$' ),
        ( 'treasury.gov', r'^/resource-center/?$' ),
        ( 'ukdefencejournal.org.uk', r'^/the-osint-bunker/?$'),
        ( 'viaouest.com', r'^/actualite-daesh.html' ),
        ( 'waffen-online.de', r'^/topics?/?' ),
        ( 'weather.com', r'^/health/coronavirus/?$' ),
        ( 'welt.de', r'^/wirtschaft/deutscher-ki-preis/?$'),
        ( 'weser-kurier.de', r'^/werder/profis/?$'),
        ( 'weser-kurier.de', r'^/landkreis-verden/?$'),
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
