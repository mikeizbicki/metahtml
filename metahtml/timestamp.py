'''
Timestamps are notoriously difficult to work with because they are deceptively complicated.
To better understand the issues of working with timestamps, see:

1. https://infiniteundo.com/post/25326999628/falsehoods-programmers-believe-about-time
1. http://www.creativedeletion.com/2015/01/28/falsehoods-programmers-date-time-zones.html
1. timezones: https://www.youtube.com/watch?v=-5wpm-gesOY
1. internationalization: https://www.youtube.com/watch?v=0j74jcxSunY
1. UNIX time: https://www.youtube.com/watch?v=QJQ691PTKsA

Timestamps that an article was published on are even more difficult to work with,
because there are several domain specific problems:

1. The timestamps can be specified in a local dialect of a language,
   so existing timestamp parsing code may not work.

1. The "accuracy" of a timestamp depends on the publication venue.
   Some magazines only specify the year/month that an article was published in;
   some specify the exact day;
   and some specify the exact second.

1. Many venues do not specify the timezone of the timestamp,
   and so this must be inferred from the venue location.
   But venue locations can change timezones.

1. Articles are sometimes published in multiple locations (e.g. online and in print) at different times;
   which one of these times should be the canonical time?
   Some articles have multiple timestamps listed even for the same location depending on which metadata source you use.
   See for example:
   https://www.breitbart.com/national-security/2019/11/02/north-korea-claims-test-of-super-large-multiple-rocket-launchers/

1. Articles published online often change over time.
   Should the publication date be the date of the original publication or the date of the change?
   Sometimes the changes are clearly documented in the webpage,
   but typically they are not.
   See for example: 
   * https://dailycaller.com/2020/04/13/new-york-times-dean-baquet-joe-biden-tara-reade-sexual-assault-article-edit/
   * http://newsdiffs.org/
   Some websites like time.gov/reddit.com are continuously changing and will be totally different everytime they get loaded.

1. A webpage may contain multiple "articles" inside, each written at different times.
   For example, forum posts and archive pages.

1. The time listed may not reflect the true time that the article was actually written.
   This could be because the server's clock is wrong (non-malicious, probably only by a few minutes),
   or because an editor has maliciously changed the time of posting.
'''

import copy
import datetime
import lxml
import lxml.html
import re
from urllib.parse import urlparse

# non-standard timestamp parsing libraries
import dateparser
import dateutil
import dateutil.tz
from dateutil.parser import parse as date_parser

# For timestamps without timezones, we apply these timezones.
# This gives us a worst case estimate for what the actual time represented is.
# The UTC-offsets are represented in seconds.
worst_tz_lo = dateutil.tz.tzoffset('worst_lo',12*60*60)
worst_tz_hi = dateutil.tz.tzoffset('worst_hi',-12*60*60)

def parse_timestamp_str(timestamp_str, parser=None):
    '''
    Given a string representing a timestamp

    python date libraries:
    1. dateparser: https://blog.scrapinghub.com/2015/11/09/parse-natural-language-dates-with-dateparser
    1. natty: https://github.com/eadmundo/python-natty
    '''

    # don't waste our time parsing if no timestamp_str was passed in
    if timestamp_str is None or len(timestamp_str)==0:
        return None

    # if no parser specified, then try them all
    if parser is None:
        result = parse_timestamp_str(timestamp_str, parser='dateutil')
        if result['timestamp_lo'] is None:
            result = parse_timestamp_str(timestamp_str, parser='dateparser')
        return result

    # if the string is only numbers, interpret as a unix timestamp
    # FIXME: what should the correct and condition be?
    if timestamp_str.isdigit() and len(timestamp_str)!=14:
        print("len(timestamp_str)=",len(timestamp_str))
        print("timestamp_str=",timestamp_str)
        tz_utc = dateutil.tz.tzoffset('UTC',0)
        timestamp = datetime.datetime.fromtimestamp(float(timestamp_str), tz_utc)
        return {
            'timestamp_lo' : timestamp,
            'timestamp_hi' : timestamp,
            'raw' : timestamp_str,
            'parser' : 'unix_epoch',
            }

    # parse the date
    if parser=='dateutil':
        default_lo = datetime.datetime(
            year            = 1,
            month           = 1,
            day             = 1,
            hour            = 0,
            minute          = 0,
            second          = 0,
            microsecond     = 0,
            tzinfo          = None
            )
        default_hi = datetime.datetime(
            year            = 9999, 
            month           = 12,
            day             = 31,
            hour            = 23,
            minute          = 59,
            second          = 59,
            microsecond     = 999999,
            tzinfo          = None
            )
        try:
            from dateutil.parser import parse as date_parser
            tzinfos = {
                'MYT' : 8*60*60,
                'IST' : 5.5*60*60,
                'CEST' : 2*60*60,
                'CET' : 1*60*60,
                'BST' : 1*60*60,
                'ET' : -5*60*60,
                'EST' : -5*60*60,
                'EDT' : -4*60*60,
                'KST' : 9*60*60,
                'PST' : -8*60*60,
                'PDT' : -7*60*60,
                'UK' : 0*60*60,
                }
            timestamp_lo = date_parser(timestamp_str, fuzzy=True, tzinfos=tzinfos, default=default_lo)
            timestamp_hi = date_parser(timestamp_str, fuzzy=True, tzinfos=tzinfos, default=default_hi)

            # check for common parsing errors that are caused by foreign dates
            # for example, if date_parser finds an hour but not a day,
            # then this is almost certainly an error
            if ((timestamp_lo.year != timestamp_hi.year) or
                (timestamp_lo.month != timestamp_hi.month and timestamp_lo.day == timestamp_hi.day) or
                (timestamp_lo.day != timestamp_hi.day and timestamp_lo.hour == timestamp_hi.hour) or
                (timestamp_lo.hour != timestamp_hi.hour and timestamp_lo.minute == timestamp_hi.minute) or
                (timestamp_lo.minute != timestamp_hi.minute and timestamp_lo.second == timestamp_hi.second) or
                (timestamp_lo.second != timestamp_hi.second and timestamp_lo.microsecond == timestamp_hi.microsecond)
               ):
                timestamp_lo = None
                timestamp_hi = None

        except (ValueError, OverflowError, AttributeError, TypeError):
            # near all parse failures are due to URL dates without a day
            # specifier, e.g. /2014/04/
            timestamp_lo = None
            timestamp_hi = None

    elif parser=='dateparser':
        date_order = 'YMD'

        def remove_prefix(s, prefix):
            return s[len(prefix):] if s.startswith(prefix) else s

        # cs
        timestamp_str = re.sub('Zveřejněno dne ', '', timestamp_str)
        timestamp_str = re.sub(' v ', ' ', timestamp_str)
        # de
        timestamp_str = re.sub('Veröffentlicht auf ', '', timestamp_str)
        timestamp_str = re.sub(' um ', ' ', timestamp_str)
        # es 
        timestamp_str = re.sub('Publicado en ', '', timestamp_str)
        timestamp_str = re.sub(' a las ', ' ', timestamp_str)
        # it 
        timestamp_str = re.sub('Pubblicato su', '', timestamp_str)
        timestamp_str = re.sub(' alle ', ' ', timestamp_str)
        # fr
        timestamp_str = re.sub('Publié', '', timestamp_str)
        timestamp_str = re.sub(' à ', ' ', timestamp_str)
        # nl
        timestamp_str = re.sub('Gepubliceerd op', '', timestamp_str)
        timestamp_str = re.sub(' om ', ' ', timestamp_str)
        # pl
        timestamp_str = re.sub('Opublikowano w dniu ', '', timestamp_str)
        timestamp_str = re.sub(' o ', ' ', timestamp_str)
        # pt
        timestamp_str = re.sub('Publicado em', '', timestamp_str)
        timestamp_str = re.sub(' às ', ' ', timestamp_str)
        # ro
        timestamp_str = re.sub('Publicat pe ', '', timestamp_str)
        timestamp_str = re.sub(' la ', ' ', timestamp_str)

        timestamp_str = timestamp_str.strip()
        #print("timestamp_str=",timestamp_str)

        # see https://dateparser.readthedocs.io/en/latest/#dateparser.parse
        # for details on how to parse dates
        timestamp_lo = dateparser.parse(
            timestamp_str,
            settings = {
                'PARSERS' : ['timestamp','base-formats','absolute-time'],
                'DATE_ORDER' : date_order,
                'PREFER_DAY_OF_MONTH' : 'first',
                }
            )

        # NOTE: 
        # To get the upper range, 
        # we assume that if all time components equal 0,
        # then the time was not set.
        # This is not guaranteed to be the case, however.
        # If the timestamp_str is exactly midnight,
        # then this code will be excessively conservative in its range estimation,
        # placing the range anywhere in the following day.
        timestamp_hi = dateparser.parse(
            timestamp_str,
            settings = {
                'PARSERS' : ['timestamp','base-formats','absolute-time'],
                'DATE_ORDER' : date_order,
                'PREFER_DAY_OF_MONTH' : 'last',
                }
            )

        if timestamp_hi and timestamp_hi.microsecond==0 and timestamp_hi.second==0 and timestamp_hi.minute==0 and timestamp_hi.hour==0:
            timestamp_hi = datetime.datetime(
                year            = timestamp_hi.year,
                month           = timestamp_hi.month,
                day             = timestamp_hi.day,
                hour            = 23,
                minute          = 59,
                second          = 59,
                microsecond     = 999999,
                tzinfo          = timestamp_hi.tzinfo
                )

    # return dictionary
    return {
        'timestamp_lo' : timestamp_lo,
        'timestamp_hi' : timestamp_hi,
        'raw' : timestamp_str,
        'parser' : parser,
        }


def timestamp2str(timestamp):
    '''
    Converts a timestamp into a string with the appropriate accuracy.
    '''
    if timestamp is None:
        return
    timestamp_format = ''
    lo = timestamp['timestamp_lo']
    hi = timestamp['timestamp_hi']
    if lo.year == hi.year:
        timestamp_format += '%Y'
    if lo.month == hi.month:
        timestamp_format += '-%m'
    if lo.day == hi.day:
        timestamp_format += '-%d'
    if lo.hour == hi.hour:
        timestamp_format += ' %H'
    if lo.minute == hi.minute:
        timestamp_format += ':%M'
    if lo.second == hi.second:
        timestamp_format += ':%S'
    if lo.microsecond == hi.microsecond:
        timestamp_format += '.%f'
    timestamp_format += ' %Z'
    #print("lo=",lo)
    return str(lo) #lo.strftime(timestamp_format).strip()


def get_best_timestamps(timestamps, require_valid_for_hostname=True):
    '''
    Takes as timestamp a list of timestamp dictionaries,
    and removes redundant timestamps from the list.
    '''
    bests = []

    for timestamp in timestamps:
        found_match = False

        # skip timestamps that don't represent a time
        if timestamp is None or timestamp['timestamp_hi'] is None or timestamp['timestamp_lo'] is None:
            continue

        # skip timestamps not valid for the hostname
        if require_valid_for_hostname and not timestamp.get('is_valid_for_hostname'):
            continue

        # modified timestamps include worst case timezones if no timezone specified
        timestamp_lo_mod = timestamp['timestamp_lo']
        if timestamp_lo_mod.tzinfo is None:
            timestamp_lo_mod = copy.copy(timestamp_lo_mod).replace(tzinfo = worst_tz_lo)
        timestamp_hi_mod = timestamp['timestamp_hi']
        if timestamp_hi_mod.tzinfo is None:
            timestamp_hi_mod = copy.copy(timestamp_hi_mod).replace(tzinfo = worst_tz_hi)
        
        # loop through the currently found timestamps to check for duplicates
        for i,best in enumerate(bests):
            
            # modified timestamps include worst case timezones if no timezone specified
            best_lo_mod = best['timestamp_lo']
            if best_lo_mod.tzinfo is None:
                best_lo_mod = copy.copy(best_lo_mod).replace(tzinfo = worst_tz_lo)
            best_hi_mod = best['timestamp_hi']
            if best_hi_mod.tzinfo is None:
                best_hi_mod = copy.copy(best_hi_mod).replace(tzinfo = worst_tz_hi)

            # the input timestamp matches the best timestamp, but is more accurate;
            # therefore we replace the best timestamp with the timestamp
            if timestamp_lo_mod >= best_lo_mod and timestamp_hi_mod <= best_hi_mod:
                bests[i] = timestamp
                found_match = True

            # the input timestamp matches the best timestamp, but is less accurate;
            # therefore we do nothing
            elif timestamp_lo_mod <= best_lo_mod and timestamp_hi_mod >= best_hi_mod:
                found_match = True

            # else, the timestamp timestamp represents an entirely new date,
            # and so it should be added to the bests list

        if not found_match:
            bests.append(timestamp)


    # if best_timestamps contains both url and xpaths patterns,
    # we should ignore the url patterns because they are less accurate
    patterns = []
    for best in bests:
        try:
            patterns.append(best['pattern'])
        except:
            pass

    if len(patterns) > 1:
        bests_filtered = []
        for best in bests:
            try:
                if best['pattern'] != 'url':
                    bests_filtered.append(best)
            except:
                pass
    else:
        bests_filtered = bests

    print("patterns=",patterns)
    print("bests=",bests)

    #bests = list(filter(lambda x: x['pattern'] != 'url', bests))

    # sort and return
    #bests.sort(key=lambda x: x['timestamp_lo'])

    return bests_filtered


def get_timestamp_published(html, url, **kwargs):
    '''
    Returns a timestamp dictionary that the input webpage was created on.

    See get_timestamp for details about the timestamp dictionary.
    '''

    xpaths = [
        # custom xpaths
        ( 'abc3340.com',                    '//meta[@name="article:published_time"]/@content'),
        ( 'abc57.com',                      '//div[@class="content-date-posted"]/text()'),
        ( 'abc.net.au',                     '//meta[@name="DCTERMS.issued"]/@content'),
        ( 'abc.net.au',                     '//meta[@property="article:published_time"]/@content'),
        ( 'abcnews.go.com',                 '//meta[@itemprop="uploadDate"]/@content'),
        ( 'abcnews.go.com',                 '//meta[@property="lastPublishedDate"]/@content'),
        ( 'accesswdun.com',                 '//div[@class="article-datetime"]'),
        ( 'actu.fr',                        '//time/@datetime'),
        ( 'actualidad.rt.com',              '//div[@class="ArticleView-timestamp"]/time/@datetime' ),
        ( 'actu.orange.fr',                 '//div[@class="player-head"]/meta[@itemprop="uploadDate"]/@content'),
        ( 'aljazeera.com',                  '//div[@class="article-duration"]/time/@datetime'),
        ( 'america.aljazeera.com',          '//div[contains(@class,"dateTime")]' ),
        ( 'angelfalques.blogspot.com',      '//abbr[@itemprop="datePublished"]/@title'),
        ( 'armscontrolwonk.com',            '//span[@class="date published time"]' ),
        ( 'asia.nikkei.com',                '//meta[@name="date"]/@content' ),
        ( 'asiae.co.kr',                    '(//div[@class="articleInfo"]/div/em)[1]'),
        ( 'asiae.co.kr',                    '//meta[@property="article:published_time"]/@content'),
        ( 'askakorean.blogspot.com',        '//abbr[@itemprop="datePublished"]/@title' ),
        ( 'autonewsproo.blogspot.com',      '//span[@class="published updated"]/@title' ),
        ( 'baoquocte.vn',                   '//div[@class="dateUp"]/span[@class="format_time"]'),
        ( 'baotintuc.vn',                   '//meta[@itemprop="datePublished"]/@content'),
        #( 'bbc.co.uk',                      '(//div[@class="date date--v2"])[1]' ),
        #( 'bbc.com',                        '(//div[@class="date date--v2"])[1]' ),
        ( 'bbc.co.uk',                      '(//div[contains(@class,"date--v2")])[1]' ),
        ( 'bbc.com',                        '(//div[contains(@class,"date--v2")])[1]' ),
        ( 'bbc.com',                        '//div[@class="mini-info-list__date vxp-date date date--v2"]/@data-datetime'),
        ( 'beijingcream.com',               '//time/@datetime' ),
        ( 'biodunbbcnews.blogspot.com',     '//abbr[@itemprop="datePublished"]/@title' ),
        ( 'bles.com',                       '(//span[@class="p-time"]/@data-date)[1]' ),
        ( 'blogs.wsj.com',                  '//meta[@name="article.published"]/@content' ),
        ( 'bloomberg.com',                  '//meta[@name="parsely-pub-date"]/@content' ),
        ( 'buzzfeednews.com',               '//p[@class="news-article-header__timestamps-posted"]'),
        ( 'bnews.vn',                       '//div[@style="color:red"]/span[@class="post-time"]'),
        ( 'brightside.me',                  '(//meta[@property="article:published_time"]/@content)[1]'),
        ( 'bullcutter.blogspot.com',        '//abbr[@itemprop="datePublished"]/@title'),
        ( 'bushiraqwar.blogspot.com',       '//abbr[@itemprop="datePublished"]/@title'),
        ( 'businessinsider.com',            '//div[@data-e2e-name="byline-timestamp"]'),
        ( 'canada-news.org',                '//time[@class="entry-date published updated"]/@datetime'),
        ( 'cbsnews.com',                    '//p[@class="content__meta content__meta-timestamp"]/time/@datetime'),
        ( 'cbsnews.com',                    '//time/@datetime' ),
        ( 'chicagotribune.com',             '//meta[@name="date"]/@content'),
        ( 'claremont.today',                '//div[@class="field field--name-field-datetime field--type-datetime field--label-hidden field__items"]/div[@class="field__item"]'),
        ( 'cnbc.com',                       '//meta[@property="article:published_time"]/@content'),
        ( 'cnnphilippines.com',             '//div/p[@class="dateString no-icon"]'),
        ( 'coronavirus-realtime.com',       '//meta[@property="article:published_time"]/@content'),
        ( 'crofsblogs.typepad.com',         '//h2[@class="date-header"]'),
        ( 'csis.org',                       '//article[@role="article"]/p' ),
        ( 'dw.com',                         '(//ul[@class="smallList"]/li)[1]'),
        ( 'ctvnews.ca',                     '//meta[@property="article:published_time"]/@content'),
        ( 'deal.konitono.com',              '//meta[@property="article:published_time"]/@content'),
        ( 'devdiscourse.com',               '//meta[@itemprop="datePublished"]/@content'),
        ( 'eastcoastdaily.in',              '//div[@class="entry-header"]//span[@class="date meta-item"]' ),
        ( 'elcomercio.com',                 '//meta[@name="cXenseParse:recs:publishtime"]/@content'),
        ( 'elnacional.com.do',              '(//time[contains(@class,"entry-date")])[1]' ),
        ( 'elperuano.pe',                   '//article[@class="notatexto"]/p/b' ),
        ( 'english.khan.co.kr',             '//div[@class="article_date"]' ),
        ( 'finance.yahoo.com',              '//time[@class="date Fz(11px) Mb(4px)  D(ib)"]'),
        ( 'forbes.com',                     '//meta[@property="article:published"]/@content'),
        ( 'foreignpolicy.com',              '(//div[@class="meta-data"])/time' ),
        ( 'foxnews.com',                    '//div[@class="article-date"]/time' ),
        ( 'freepressjournal.in',            '//div[@class="story-meta-info-m__date-time__1IiJn"]/time/@datetime'),
        ( 'freerepublic.com',               '(//b/span[@class="date"])[1]'),
        ( 'freespeechdaily.com',            '//i[@class="fa fa-clock-o"]/a'),
        ( 'headlines.yahoo.co.jp',          '//p[@class="fss ymuiDate"]'),
        ( 'headtopics.com',                 '//meta[@name="date"]/@content' ),
        ( 'heavy.com',                      '//meta[@property="article:published_time"]/@content'),
        ( 'heavy.com',                      '//time[@itemprop="datePublished"]/@datetime'),
        ( 'huffpost.com',                   '//meta[@property="article:published_time"]/@content'),
        ( 'ibtimes.com',                    '//meta[@property="article:published_time"]/@content'),
        ( 'itv.com',                        '//li[@class="labels__item labels__item--time"]/time/@datetime'),
        ( 'japantimes.co.jp',               '//li[@class="post_time"]/time/@datetime'),
        ( 'jpost.com',                      '//meta[@itemprop="datePublished"]/@content'),
        ( 'king5.com',                      '//meta[@itemprop="datePublished"]/@content'),
        ( 'laregion.es',                    '//meta[@name="date"]/@content' ),
        ( 'latestly.com',                   '//span[@class="article_date"]'),
        ( 'lavozdegalicia.es',              '(//meta[@itemprop="datePublished"]/@content)[1]' ),
        ( 'lci.fr',                         '(//time)[1]'),
        ( 'leparisien.fr',                  '//meta[@property="article:published_time"]/@content'),
        ( 'lucianne.com',                   '//div/p[@class="post-posted-by"]'),
        ( 'maghress.com',                   '//span[@class="articlenewspaper"]'),
        ( 'malaymail.com',                  '//div/p[@class="meta mb-0"]'),
        ( 'mercurynews.com',                '//meta[@property="article:published_time"]/@content'),
        ( 'militarytimes.com',              '//meta[@itemprop="datePublished"]/@content'),
        ( 'moneys.mt.co.kr',                '//meta[@property="article:published_time"]/@content'),
        ( 'moneys.mt.co.kr',                '//span[@id="pn_article_date"]'),
        ( 'mundiario.com',                  '//span[@class="content-time"]' ),
        ( 'nbc12.com',                      '//meta[@name="date"]/@content'),
        ( 'nbcnews.com',                    '//span[@class="byline___3V_nz"]'),
        ( 'nbcnews.com',                    '//meta[@itemprop="datePublished"]/@content'),
        ( 'newindianexpress.com',           '(//p[@class="ArticlePublish margin-bottom-10"]/span)[1]'),
        ( 'news.com.au',                    '//meta[@itemprop="datePublished"]/@content'),
        ( 'news.immitate.com',              '//meta[@property="article:published_time"]/@content'),
        ( 'news.mt.co.kr',                  '//meta[@property="article:published_time"]/@content'),
        ( 'news.mt.co.kr',                  '//span[@id="pn_article_date"]'),
        ( 'news.nicovideo.jp',              '//time[@class="article-created-at"]'),
        ( 'news.sky.com',                   '//p[@class="sdc-article-date__date-time"]'),
        ( 'newsinfo.inquirer.net',          '//meta[@property="article:published_time"]/@content'),
        ( 'newslocker.com',                 '//time[@class="entry-time"]/@datetime'),
        ( 'newsoneplace.com',               '//span[@class="textlogoarticle"]/time/@datetime'),
        ( 'noticieros.televisa.com',        '//meta[@property="article:published_time"]/@content'),
        ( 'noticieros.televisa.com',        '//div[@class="video-post-title"]/div[@class="author"]'),
        ( 'npr.org',                        '//div[@class="dateblock"]/time/@datetime'),
        ( 'nydailynews.com',                '//meta[@name="date"]/@content'),
        ( 'nypost.com',                     '//meta[@property="article:published_time"]/@content'),
        ( 'nytimes.com',                    '//meta[@property="article:published"]/@content' ),
        ( 'oklahoman.com',                  '//meta[@property="article:published_time"]/@content'),
        ( 'oluwagbemigapost.com',           '//time[@class="entry-date published updated"]/@datetime'),
        ( 'onenewspage.com',                '//meta[@itemprop="uploadDate"]/@content'),
        ( 'onenewspage.co.uk',              '//span[@class="lhpt"]'),
        ( 'pmnewsnigera.com',               '//div[@class="col-md-12 post"]/p[@class="time"]'),
        ( 'politico.com',                   '//time[@itemprop="datePublished"]/@datetime'),
        ( 'politico.com',                   '//p[@class="story-meta__timestamp"]/time/@datetime'),
        ( 'politico.com',                   '//span[@class="timestamp"]'),
        ( 'politico.eu',                    '//meta[@property="article:published_time"]/@content'),
        ( 'politicususa.com',               '//a/time[@class="entry-date published updated"]/@datetime'),
        ( 'rt.com',                         '//meta[@name="published_time_telegram"]/@content'),
        ( 'ruthfullyyours.com',             '//div/p[@id="single-byline"]'),
        ( 'salon.com',                      '//meta[@property="article:published_time"]/@content'),
        ( 'sbs.com.au',                     '//meta[@itemprop="datePublished"]/@content'),
        ( 'sedaily.com',                    '//li[@class="letter"]'),
        ( 'sedaily.com',                    '//meta[@property="dd:published_time"]/@content'),
        ( 'sg.news.yahoo.com',              '//time[@class="date Fz(11px) Mb(4px)  D(ib)"]'),
        ( 'smithsonianmag.com',             '//time/@data-pubdate' ),
        ( 'shine.cn',                       '//meta[@name="ArticlePublishDate"]/@content'),
        ( 'snopes.com',                     '//li/span[@class="date date-published"]'),
        ( 'spiegel.de',                     '//span[@class="article-function-date"]/b' ),
        ( 'spiegel.de',                     '//time/@datetime' ),
        ( 'stripes.com',                    '//span[@class="published_date"]' ),
        ( 'telegraph.co.uk',                '//meta[@itemprop="datePublished"]/@content'),
        ( 'thediplomat.com',                '//span[@itemprop="datePublished"]' ),
        ( 'theepochtimes.com',              '//meta[@property="article:published_time"]/@content'),
        ( 'theglobeandmail.com',            '//meta[@property="article:published_time"]/@content'),
        ( 'thegoldwater.com',               '//meta[@name="pubdate"]/@content'),
        ( 'theintercept.com',               '//span[@class="PostByline-date"]' ),
        ( 'time.com',                       '//div[contains(@class,"published-date")]' ),
        ( 'timesofindia.indiatimes.com',    '//b/@dateval'),
        ( 'thanhnien.vn',                   '//meta[@itemprop="datePublished"]/@content'),
        ( 'today.it',                       '//time[@class="datestamp"]'),
        ( 'townhall.com',                   '//div[@class="contributor pull-left"][contains(.,"Posted:")]/text()'),
        ( 'vetogate.com',                   '//meta[@property="article:published_time"]/@content'),
        ( 'voxeurop.eu',                    '//div[contains(@class,"publish_date_time")]' ),
        ( 'washingtonpost.com',             '//div[@class="display-date"]'),
        ( 'washingtonpost.com',             '//div[@class="metaData margin-bottom"]/span[@class="date"]'),
        ( 'washingtonpost.com',             '//meta[@name="recv_time"]/@content'),
        ( 'youtube.com',                    '//div[@id="date"]/yt-formatted-string[@class="style-scope ytd-video-primary-info-renderer"]'),

        # universal xpaths
        ( None, '//meta[@property="rnews:datePublished"]/@content' ),
        ( None, '//meta[@property="article:published_time"]/@content' ),
        ( None, '//meta[@property="og:published_time"]/@content' ),
        ( None, '//meta[@itemprop="datePublished"]/@datetime' ),
        ( None, '//meta[@pubdate="pubdate"]/@datetime' ),
        ( None, '//meta[@name="OriginalPublicationDate"]/@content' ),
        ( None, '//meta[@name="article_date_original"]/@content' ),
        ( None, '//meta[@name="publication_date"]/@content' ),
        ( None, '//meta[@name="sailthru.date"]/@content' ),
        ( None, '//meta[@name="PublishDate"]/@content' ),
        ( None, '//meta[@name="all_timestamps"]/@content' ),
        ( None, '//meta[@name="dc.Date"]/@content' ),
        ( None, '//meta[@name="cXenseParse:recs:publishtime"]/@content' ),

        # microdata paths
        ( None, '//*[@itemprop="datePublished"]/@content' ),
        ( None, '//*[@itemprop="datePublished"]/@datetime' ),
        ( None, '//*[@property="datePublished"]/@content' ),
        ( None, '//*[@property="datePublished"]/@datetime' ),

        ]

    return get_timestamp(html, url, xpaths, use_url_date=True, **kwargs)


def get_timestamp_modified(html, url, **kwargs):
    '''
    Returns a timestamp dictionary that the input webpage was modified/updated on.

    See get_timestamp for details about the timestamp dictionary.
    '''
    xpaths = [
        # xpaths
        ( 'abc.net.au',                     '//meta[@name="DCTERMS.modified"]/@content'),
        ( 'abc.net.au',                     '//meta[@property="article:modified_time"]/@content'),
        ( 'actu.orange.fr',                 '//meta[@property="dateModified"]/@content'),
        ( 'asiae.co.kr',                    '(//div[@class="articleInfo"]/div/em)[2]'),
        ( 'blogs.wsj.com',                  '//meta[@name="article.updated"]/@content'),
        ( 'brightside.me',                  '//meta[@property="og:updated_time"]/@content'),
        ( 'buzzfeednews.com',               '//p[@class="news-article-header__timestamps-updated"]'),
        ( 'cnbc.com',                       '//meta[@property="article:modified_time"]/@content'),
        ( 'ctvnews.ca',                     '//meta[@property="article:modified_time"]/@content'),
        ( 'devdiscourse.com',               '//meta[@itemprop="dateModified"]'),
        ( 'foxnews.com',                    '//div[@class="article-updated"]' ),
        ( 'huffpost.com',                   '//meta[@property="article:modified_time"]/@content'),
        ( 'ibtimes.com',                    '//meta[@property="article:modified_time"]/@content'),
        ( 'jpost.com',                      '//meta[@itemprop="dateModified"]/@content'),
        ( 'leparisien.fr',                  '//meta[@property="article:modified_time"]/@content'),
        ( 'mercurynews.com',                '//meta[@property="article:modified_time"]/@content'),
        ( 'nbcnews.com',                    '//meta[@itemprop="dateModified"]/@content'),
        ( 'newindianexpress.com',           '(//p[@class="ArticlePublish margin-bottom-10"]/span)[2]'),
        ( 'news.com.au',                    '//meta[@itemprop="datePublished"]/@content'),
        ( 'noticieros.televisa.com',        '//meta[@property="article:modified_time"]/@content'),
        ( 'nypost.com',                     '//meta[@property="article:modified_time"]/@content'),
        ( 'nytimes.com',                    '//meta[@property="article:modified"]/@content'),
        ( 'oklahoman.com',                  '//meta[@property="article:modified_time"]/@content'),
        ( 'politico.com',                   '//p[@class="story-meta__updated"]/time/@datetime'),
        ( 'politico.com',                   '//span[@class="updated"]'),
        ( 'politico.eu',                    '//meta[@property="article:modified_time"]/@content'),
        ( 'sedaily.com',                    '//meta[@property="dd:modified_time"]/@content'),
        ( 'theepochtimes.com',              '//meta[@property="article:modified_time"]/@content'),
        ( 'theglobeandmail.com',            '//meta[@property="article:modified_time"]/@content'),
        ( 'thegoldwater.com',               '//meta[@name="lastmod"]/@content'),
        ( 'vetogate.com',                   '//meta[@property="article:modified_time"]/@content'),
        ( 'washingtonpost.com',             '//meta[@name="last_updated_date"]/@content'),

        # meta xpaths
        ( None, '//meta[@property="rnews:dateModified"]/@content' ),
        ( None, '//meta[@property="article:modified_time"]/@content' ),
        ( None, '//meta[@property="og:modified_time"]/@content' ),
        ( None, '//meta[@property="og:updated_time"]/@content' ),

        # microdata paths
        ( None, '//*[@itemprop="dateModified"]/@content' ),
        ( None, '//*[@itemprop="dateModified"]/@datetime' ),
        ( None, '//*[@itemprop="dateModified"]' ),
        ( None, '//*[@property="dateModified"]/@content' ),
        ( None, '//*[@property="dateModified"]/@datetime' ),
        ( None, '//*[@property="dateModified"]' ),

        ]
    return get_timestamp(html, url, xpaths, use_url_date=False, **kwargs)


def get_timestamp(parser, url, xpaths, use_url_date=False, require_valid_for_hostname=True, fast=True):
    '''
    FIXME: make the xpath code faster using
    https://www.ibm.com/developerworks/xml/library/x-hiperfparse/
    '''
    url_parsed = urlparse(url)
    url_hostname = url_parsed.hostname

    timestamps = []

    # get timestamp from url
    if use_url_date:
        _STRICT_DATE_REGEX_PREFIX = r'(?<=\W)'
        #FIXME: DATE_REGEX = r'(([\./\-_]{0,1}(19|20)\d{2})[\./\-_]{0,1}(([0-3]{0,1}[0-9][\./\-_])|(\w{3,5}[\./\-_]))([0-3]{0,1}[0-9][\./\-]{0,1})?)...'
        DATE_REGEX = r'(([\./\-_]{0,1}(19|20)\d{2})[\./\-_]{0,1}(([0-3]{0,1}[0-9][\./\-_])|(\w{3,5}[\./\-_]))([0-3]{0,1}[0-9][\./\-]{0,1})?)...'
        #DATE_REGEX = r'(([\./\-_]{0,1}(19|20)\d{2})[\./\-_](([0-3]{0,1}[0-9][\./\-_])|(\w{3,5}[\./\-_]))([0-3]{0,1}[0-9][\./\-])?)...'
        STRICT_DATE_REGEX = _STRICT_DATE_REGEX_PREFIX + DATE_REGEX
        date_match = re.search(STRICT_DATE_REGEX, url)
        if date_match:
            timestamp_str = date_match.group(1)
            timestamp = parse_timestamp_str(timestamp_str)
            timestamp['is_valid_for_hostname'] = True
            timestamp['pattern'] = 'url'
            timestamps.append(timestamp)

    # get timestamps from xpaths
    disable_universal_xpaths = False
    for hostname,xpath in xpaths:

        # determine whether the xpath applies to this hostname
        if hostname is not None:
            disable_universal_xpaths = disable_universal_xpaths or (hostname == url_hostname or 'www.'+hostname == url_hostname)
            valid_for_hostname = hostname in url_hostname
        else:
            valid_for_hostname = not disable_universal_xpaths

        # if in fast mode, then only search for elements that will apply to the hostname
        if fast and not valid_for_hostname:
            continue

        # loop through all elements found by the xpath
        for element in parser.xpath(xpath):

            # element can be one of several different types of lxml objects;
            # depending on the type, we need to extract the text in different ways
            if type(element) is lxml.etree._ElementUnicodeResult:
                timestamp_str = str(element)
            elif type(element) is lxml.etree._Element:
                timestamp_str = element.text
            elif type(element) is lxml.html.HtmlElement:
                timestamp_str = element.text_content()

            # generate the timestamp from text
            timestamp = parse_timestamp_str(timestamp_str)
            if timestamp is not None:
                timestamp['is_valid_for_hostname'] = valid_for_hostname
                timestamp['pattern'] = xpath
                timestamps.append(timestamp)

                # NOTE:
                # the following check is tempting but wrong;
                # we need to ensure that pages with many urls 
                # get treated as categories and not articles
                #if valid_for_hostname and fast:
                    #break

    # extract the best timestamp from the list of available timestamps
    best_timestamps = get_best_timestamps(timestamps)

    return best_timestamps, timestamps
