'''
'''

from metahtml.property.__common__ import BaseExtractor

class Extractor(BaseExtractor):

    def custom_patterns(parser, results):

        # get page translations for websites following html5 standard
        urls = {}
        xpath = '//link[@rel="alternate"]'
        for element in parser.doc.xpath(xpath):
            hreflang = element.attrib.get('hreflang')
            href = element.attrib.get('href')
            if href[:2]=='//':
                href = parser.url_parsed.scheme+':'+href
            if hreflang is not None and href is not None:
                urls[hreflang]=href
        results.append({
            'value'     : urls,
            'pattern'   : xpath
            })

        # custom websites
        if 'english.khan.co.kr' in parser.url_parsed.hostname:
            urls = {}
            xpath = '//div[@class="article_txt"]/a'
            for element in parser.doc.xpath(xpath):
                hreflang = 'ko'
                href = element.attrib.get('href')
                if href[:2]=='//':
                    href = parser.url_parsed.scheme+':'+href
                if hreflang is not None and href is not None:
                    urls[hreflang]=href
            results.append({
                'value'     : urls,
                'pattern'   : xpath
                })

        if 'news.khan.co.kr' in parser.url_parsed.hostname:
            urls = {}
            xpath = '//div[@class="btn_engtrans"]/a'
            for element in parser.doc.xpath(xpath):
                hreflang = 'en'
                href = element.attrib.get('href')
                if href[:2]=='//':
                    href = parser.url_parsed.scheme+':'+href
                if hreflang is not None and href is not None:
                    urls[hreflang]=href
            results.append({
                'value'     : urls,
                'pattern'   : xpath
                })

        # FIXME:
        # add the following non-standard pages
        # https://www.latimes.com/espanol/california/articulo/2020-03-23/la-contaminacion-del-aire-te-hace-mas-susceptible-al-coronavirus-a-los-californianos-no-le-gustara-la-respuesta
        # http://english.khan.co.kr/khan_art_view.html?artid=202005221946377
        # https://www.dailynk.com/english/source-kim-jong-un-recently-cardiovascular-operation/
        # https://mainichi.jp/english/articles/20200523/p2a/00m/0na/023000c
        # https://mondediplo.com/2020/05/03covid-ecology
        # https://carnegie-mec.org/diwan/81781
        # https://www.cdc.gov/flu/pandemic-resources/pandemic-timeline-1930-and-beyond.htm
        # https://www.latimes.com/california/story/2020-03-21/coronavirus-air-pollution-health-risk?fbclid=IwAR1Qks8YXdeoQvRnqNbOt3BRVr6fKtbrA5INXzsHeqHY0Ya95qeB5CDOwrY
        # http://www.danielpipes.org/186/the-ayatollah-the-novelist-and-the-west
        # https://fsfe.org/news/nl/nl-202106.nl.html
        # https://www.washingtoninstitute.org/policy-analysis/curbing-houthi-attacks-civilian-ships-bab-al-mandab

        # direct translations without links:
        # https://bles.com/mundo/rusia-uso-hidroxicloroquina-medicamento-tratar-virus-pcch-sugerido-trump.html
        # https://thebl.com/world-news/russia-supports-hydroxychloroquine-drug-ccp-virus-trump.html
        # https://calmatters.org/environment/2021/02/california-desert-lithium-valley/

        return results


