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
import jsonpath_ng
import lxml
import lxml.html
import re
from urllib.parse import urlparse

# non-standard timestamp parsing libraries
import dateparser
import dateutil
import dateutil.tz

# For timestamps without timezones, we apply these timezones.
# This gives us a worst case estimate for what the actual time represented is.
# The UTC-offsets are represented in seconds.
worst_tz_lo = dateutil.tz.tzoffset('worst_lo',12*60*60)
worst_tz_hi = dateutil.tz.tzoffset('worst_hi',-12*60*60)

from metahtml.common import get_timestamp, compile_jsonpaths, compile_xpaths, compile_regexes

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
        if result['value']['lo'] is None:
            result = parse_timestamp_str(timestamp_str, parser='dateparser')
        return result

    # if the string is only numbers, then it should be a unix epoch;
    # unfortunately, many misconfigured webpages store the date as a number in another format;
    # fortunately, these other formats don't intersect with reasonable ranges of the unix epoch;
    # therefore, we first check the alternative formats for matches,
    # and use the unix epoch format as a default fallback
    if timestamp_str.isdigit() and len(timestamp_str)!=14:

        timestamp_lo = None

        # check non-unix epoch formats
        if timestamp_lo is None:
            try:
                pattern = '%Y%m%d'
                timestamp_lo = datetime.datetime.strptime(timestamp_str, pattern)
                timestamp_hi = datetime.datetime(
                    timestamp_lo.year,
                    timestamp_lo.month,
                    timestamp_lo.day,
                    23,
                    59,
                    59,
                    999999
                    )
            except:
                pass

        if timestamp_lo is None:
            try:
                pattern = '%Y%m%d%H%M%S'
                timestamp_lo = datetime.datetime.strptime(timestamp_str, pattern)
                timestamp_hi = datetime.datetime(
                    timestamp_lo.year,
                    timestamp_lo.month,
                    timestamp_lo.day,
                    timestamp_lo.hour,
                    timestamp_lo.minute,
                    timestamp_lo.second,
                    999999
                    )
                if timestamp_lo.year < 1980 or timestamp_hi.year > datetime.datetime.now().year+1:
                    timestamp_lo = None
                    timestamp_hi = None
            except:
                pass

        # check unix epoch
        if timestamp_lo is None:
            try:
                pattern = 'unix_epoch'
                tz_utc = dateutil.tz.tzoffset('UTC',0)
                timestamp_lo = datetime.datetime.fromtimestamp(float(timestamp_str), tz_utc)
                timestamp_hi = datetime.datetime(
                    timestamp_lo.year,
                    timestamp_lo.month,
                    timestamp_lo.day,
                    timestamp_lo.hour,
                    timestamp_lo.minute,
                    timestamp_lo.second,
                    999999
                    )
            # fromtimestamp throws ValueError wen the year is out of range 
            # of what a unix timestamp is allowed to be;
            # in this case we do nothing and let the next parsers take over
            except ValueError:
                pass

        # if we found a timestamp with one of the patterns above, 
        # then we set the parser variable to the corresponding pattern;
        # this skips the parsing code below
        if timestamp_lo is not None:
            parser='int:'+pattern

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
            tzinfos = {
                'MYT' : 8*60*60,
                'IST' : 5.5*60*60,
                'CEST' : 2*60*60,
                'CET' : 1*60*60,
                'BST' : 1*60*60,
                'ET' : -5*60*60,
                'EST' : -5*60*60,
                'MST' : -7*60*60,
                'EDT' : -4*60*60,
                'KST' : 9*60*60,
                'PST' : -8*60*60,
                'PDT' : -7*60*60,
                'PT' : -7*60*60,   # FIXME: technically, could be -8 or -7 depending on the day
                'UK' : 0*60*60,
                'ZZ' : 0*60*60,
                'JST' : 9*60*60,
                'CDT' : -5*60*60,
                }
            timestamp_lo = dateutil.parser.parse(timestamp_str, fuzzy=True, tzinfos=tzinfos, default=default_lo)
            timestamp_hi = dateutil.parser.parse(timestamp_str, fuzzy=True, tzinfos=tzinfos, default=default_hi)

            # a bug in dateutil.parser.parse causes it to not use the microseconds of default_hi;
            # we correct for that bug here
            if timestamp_hi.microsecond==0:
                timestamp_hi = datetime.datetime(
                    year            = timestamp_hi.year, 
                    month           = timestamp_hi.month,
                    day             = timestamp_hi.day,
                    hour            = timestamp_hi.hour,
                    minute          = timestamp_hi.minute,
                    second          = timestamp_hi.second,
                    microsecond     = 999999,
                    tzinfo          = timestamp_hi.tzinfo
                    )

            # check for common parsing errors that are caused by foreign dates
            # for example, if dateutil.parser.parse finds an hour but not a day,
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
            # there was an error in the dateutil.parser.parse function call;
            # this is often due to URL dates without a day specifier, e.g. /2014/04/
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
        'value': {
            'lo' : timestamp_lo,
            'hi' : timestamp_hi,
            },
        'raw' : timestamp_str,
        'parser' : parser,
        'pattern' : 'unknown',
        }


def timestamp2str(timestamp):
    '''
    Converts a timestamp into a string with the appropriate accuracy.
    '''
    if timestamp is None:
        return
    timestamp_format = ''
    lo = timestamp['value']['lo']
    hi = timestamp['value']['hi']
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
    return str(lo) #lo.strftime(timestamp_format).strip()


def get_best_timestamps(timestamps, require_valid_for_hostname=True):
    '''
    Takes as timestamp a list of timestamp dictionaries,
    and removes redundant timestamps from the list.
    '''
    bests = []

    # NOTE: uncomment these lines to aid debugging
    #import pprint
    #pprint.pprint(timestamps)

    # loop through the timestamps and merge redundant timestamps;
    # a timestamp is redundant if there exists another more accurate timestamp 
    # that represents the same time;
    # for example, given the three timestamps:
    #   1. 2020-01-01
    #   2. 2020-03-02
    #   3. 2020-01-01 12:34:11
    # timestamp 1 will be removed as redundant
    for timestamp in timestamps:
        found_match = False

        # skip timestamps that don't represent a time
        if timestamp is None or timestamp['value']['hi'] is None or timestamp['value']['lo'] is None:
            continue

        # skip timestamps not valid for the hostname
        if require_valid_for_hostname and not timestamp.get('is_valid_for_hostname'):
            continue

        # modified timestamps include worst case timezones if no timezone specified
        timestamp_lo_mod = timestamp['value']['lo']
        if timestamp_lo_mod.tzinfo is None:
            timestamp_lo_mod = copy.copy(timestamp_lo_mod).replace(tzinfo = worst_tz_lo)
        timestamp_hi_mod = timestamp['value']['hi']
        if timestamp_hi_mod.tzinfo is None:
            timestamp_hi_mod = copy.copy(timestamp_hi_mod).replace(tzinfo = worst_tz_hi)
        
        # loop through the currently found timestamps to check for duplicates
        for i,best in enumerate(bests):
            
            # modified timestamps include worst case timezones if no timezone specified
            # FIXME: this is mildly inefficient to recalculate these each iteration
            best_lo_mod = best['value']['lo']
            if best_lo_mod.tzinfo is None:
                best_lo_mod = copy.copy(best_lo_mod).replace(tzinfo = worst_tz_lo)
            best_hi_mod = best['value']['hi']
            if best_hi_mod.tzinfo is None:
                best_hi_mod = copy.copy(best_hi_mod).replace(tzinfo = worst_tz_hi)

            # the input timestamp exactly equals the best timestamp;
            if timestamp_lo_mod == best_lo_mod and timestamp_hi_mod == best_hi_mod:
                found_match = True

                # we select the timestamp with timezone farthest from UTC time for two reasons:
                # 1) a non-UTC timezone is likely to be local time where the article was published,
                #    so we retain more information by preferring the non-UTC timezone;
                #    this information may be useful in inferring timezones of other timestamps 
                #    from the same hostname during subsequent processing
                # 2) we need a deterministic method for selecting equal but not identical timestamps,
                #    and this method seems as good as any other.
                if abs(timestamp_lo_mod.utcoffset().total_seconds()) > abs(best_lo_mod.utcoffset().total_seconds()):
                    bests[i] = timestamp

            # the input timestamp matches the best timestamp, but is more accurate;
            # therefore we replace the best timestamp with the timestamp
            elif timestamp_lo_mod >= best_lo_mod and timestamp_hi_mod <= best_hi_mod:
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

    # NOTE:
    # At this point, we've filtered out all non-unique timestamps from the bests list.
    # Many websites, however, will still contain multiple timestamps at this point.
    # This can be due to a variety of reasons, but a common one is coding errors.
    # The code below attempts to remove "obviously wrong" timestamps due to these errors.
    # It should probably be tested more rigorously, but seems like a good heuristic at this point.

    # sorting the timestamps by date helps ensure deterministic results,
    # since some downstream tasks will depend on the order
    def sort_key(best):
        best_lo_mod = best['value']['lo']
        if best_lo_mod.tzinfo is None:
            best_lo_mod = copy.copy(best_lo_mod).replace(tzinfo = worst_tz_lo)
        return best_lo_mod
    bests.sort(key=sort_key)

    # if best_timestamps contains two ld+json patterns,
    # we should keep only the earliest one;
    # this is a hack; 
    # the ld+json patterns are clearly inserted to specify the date of the article,
    # so there is no ambiguity, and any properly formatted page should have at most 1;
    # but some webpages still have multiple values;
    # the choice of picking the first is entirely arbitrary
    added_ldjson = False
    if len(bests) > 1:
        bests_filtered = []
        for best in bests:
            if best['pattern'] != 'ld+json':
                bests_filtered.append(best)
            elif not added_ldjson:
                bests_filtered.append(best)
                added_ldjson = True
        bests = bests_filtered

    # if best_timestamps contains both url and non-url patterns,
    # we should ignore the url patterns because they are less accurate
    patterns = []
    for best in bests:
        patterns.append(best['pattern'])
    if len(patterns) > 1:
        bests_filtered = []
        for best in bests:
            if best['pattern'] != 'url':
                bests_filtered.append(best)
        bests = bests_filtered

    # if best_timestamps contains both the int parsers and another parser,
    # we should ignore the int parser because website admins frequently use int wrong;
    # (they should be a unix epoch timestamp, but they're not)
    # FIXME:
    # is this really necessary if the 'int' parser contains all the edge cases?
    parsers = []
    for best in bests:
        parsers.append(best['parser'])
    if len(parsers) > 1:
        bests_filtered = []
        for best in bests:
            if best['parser'] != 'int':
                bests_filtered.append(best)
        bests = bests_filtered

    # if best_timestamps contains meta xpaths and body xpaths,
    # then we should ignore the body xpaths and use only the meta xpaths;
    # this is because the html standard guarantees that 
    # meta information will refer to the current page,
    # but information in the body could also be referencing other pages
    patterns = set([])
    for best in bests:
        patterns.add(best['pattern'])
    if any(['meta[' in pattern for pattern in patterns]):
        bests_filtered = []
        for best in bests:
            if 'meta[' in best['pattern']:
                bests_filtered.append(best)
        bests = bests_filtered

    # We've removed all the duplicates and errors from bests, so return
    return bests

################################################################################

published_jsonpaths = compile_jsonpaths([
    ( 'en.antaranews.com', '$.datePublished' ),
    ( 'wusa9.com', '$.datePublished' ),
    ( 'wfaa.com', '$.datePublished' ),
    ( 'news.sky.com', '$.datePublished' ),
    ( 'king5.com', '$.datePublished' ),
    ( 'kens5.com', '$.datePublished' ),
    ( 'fox61.com', '$.datePublished' ),
    ( '13newsnow.com', '$.datePublished' ),
    ( 'onenewspage.us', '$.datePublished' ),
    ( 'onenewspage.us', '$."@graph"[*].datePublished' ),
    #( 'courrierinternational.com', '$.datePublished' ),
    #( 'courrierinternational.com', '$."@graph"[*].datePublished' ),

    ( None, '$.datePublished'),
    ( None, '$.uploadDate'),
    ( None, '$.dateCreated'),
    ( None, '$.temporal'),
    ( None, '$."@graph"[*].datePublished'),
    ( None, '$."@graph"[*].uploadDate'),
    ( None, '$."@graph"[*].dateCreated'),
    ( None, '$."@graph"[*].temporal'),
    ])

published_xpaths = compile_xpaths([
    # custom xpaths
    ( 'abc57.com',                      '//div[@class="content-date-posted"]/text()'),
    ( 'abcnews.go.com',                 '//meta[@itemprop="uploadDate"]/@content'),
    ( 'abcnews.go.com',                 '//meta[@property="lastPublishedDate"]/@content'),
    ( 'accesswdun.com',                 '//div[@class="article-datetime"]/text()'),
    ( 'actu.fr',                        '//time/@datetime'),
    ( 'actu.orange.fr',                 '//div[@class="player-head"]/meta[@itemprop="uploadDate"]/@content'),
    ( 'actualidad.rt.com',              '//div[@class="ArticleView-timestamp"]/time/@datetime' ),
    ( 'aljazeera.com',                  '//div[@class="article-duration"]/time/@datetime'),
    ( 'alt.expresszeitung.com',         '//time/@datetime'),
    ( 'america.aljazeera.com',          '//div[contains(@class,"dateTime")]' ),
    ( 'amerikawoche.com',               '//div[@style="float:left; margin-top: 10px;"]/i/text()'),
    ( 'amman.diplo.de',                 '//span[@class="heading__meta"]/text()'),
    ( 'angelfalques.blogspot.com',      '//abbr[@itemprop="datePublished"]/@title'),
    ( 'antpedia.com',                   '//div[@class="newsinfo row text-center"]' ),
    ( 'arabic.rt.com',                  '//meta[@name="published_time_telegram"]/@content'),
    ( 'archiv.bundesregierung.de',      '//p[@class="date"]/text()'),
    ( 'archiv2017.die-linke.de',        '//time/@datetime'),
    ( 'armscontrolwonk.com',            '//span[@class="date published time"]' ),
    ( 'article.wn.com',                 '//div[@class="article-source faded"]//span[@class="datestamp"]' ),
    ( 'asia.nikkei.com',                '//meta[@name="date"]/@content' ),
    ( 'asiae.co.kr',                    '(//div[@class="articleInfo"]/div/em)[1]'),
    ( 'asiae.co.kr',                    '//meta[@property="article:published_time"]/@content'),
    ( 'askakorean.blogspot.com',        '//abbr[@itemprop="datePublished"]/@title' ),
    ( 'audit.gov.cn',                   '//meta[@name="publishtime"]/@content'),
    ( 'autonewsproo.blogspot.com',      '//span[@class="published updated"]/@title' ),
    ( 'baobeibaobei.com',               '//div[@class="news-writer"]/span/text()'),
    ( 'baoquocte.vn',                   '//div[@class="dateUp"]/span[@class="format_time"]'),
    ( 'baotintuc.vn',                   '//meta[@itemprop="datePublished"]/@content'),
    ( 'bbc.co.uk',                      '(//div[@class="date date--v2"])[1]' ),
    ( 'bbc.co.uk',                      '(//div[contains(@class,"date--v2")])[1]' ),
    ( 'bbc.co.uk',                      '//meta[@name="dcterms.created"]/@content'),
    ( 'bbc.com',                        '(//div[@class="date date--v2"])[1]' ),
    ( 'bbc.com',                        '(//div[contains(@class,"date--v2")])[1]' ),
    ( 'bbc.com',                        '//div[@class="mini-info-list__date vxp-date date date--v2"]/@data-datetime'),
    ( 'beijingcream.com',               '//p[@class="byline vcard"]//time[@class="updated"]' ),
    ( 'beijingcream.com',               '//p[@class="byline vcard"]//time[@class="updated"]/@datetime' ),
    ( 'beijingcream.com',               '//time/@datetime' ),
    ( 'biodunbbcnews.blogspot.com',     '//abbr[@itemprop="datePublished"]/@title' ),
    ( 'bistum-fulda.de',                '(//span[@style="color: #333333"]/text())[4]'),
    ( 'bles.com',                       '(//span[@class="p-time"]/@data-date)[1]' ),
    ( 'blog.paleo.or.jp',               '//time[@class="entry-date updated"]/@datetime'),
    ( 'blogs.wsj.com',                  '//meta[@name="article.published"]/@content' ),
    ( 'bloomberg.com',                  '//meta[@name="parsely-pub-date"]/@content' ),
    ( 'bnews.vn',                       '//div[@style="color:red"]/span[@class="post-time"]'),
    ( 'brf.be',                         '(//time/text())[1]'),
    ( 'brightside.me',                  '(//meta[@property="article:published_time"]/@content)[1]'),
    ( 'bullcutter.blogspot.com',        '//abbr[@itemprop="datePublished"]/@title'),
    ( 'bushiraqwar.blogspot.com',       '//abbr[@itemprop="datePublished"]/@title'),
    ( 'businessinsider.com',            '//div[@data-e2e-name="byline-timestamp"]'),
    ( 'buzzfeednews.com',               '//p[@class="news-article-header__timestamps-posted"]'),
    ( 'canada-news.org',                '//time[@class="entry-date published updated"]/@datetime'),
    ( 'cas.cn',                         '//meta[@name="PubDate"]/@content'),
    ( 'cbsnews.com',                    '//p[@class="content__meta content__meta-timestamp"]/time/@datetime'),
    ( 'cbsnews.com',                    '//time/@datetime' ),
    ( 'channelb.org',                   '(//time/@datetime)[2]'),
    ( 'chicagotribune.com',             '//meta[@name="date"]/@content'),
    ( 'chinacdc.cn',                    '//span[@class="info-date"]/text()'),
    ( 'cijua.de',                       '//span[@class="updated rich-snippet-hidden"]/text()'),
    ( 'claremont.today',                '//div[@class="field field--name-field-datetime field--type-datetime field--label-hidden field__items"]/div[@class="field__item"]'),
    ( 'clarin.com',                     '//div[@class="breadcrumb col-lg-6 col-md-12 col-sm-12 col-xs-12"]/span' ),
    ( 'cms.bistum-fulda.de',            '(//span[@style="color: #333333"]/text())[4]'),
    ( 'cn.engadget.com',                '//div[@class="Mt(5px) C(engadgetFontLightGray)"]/text()'),
    ( 'cnn.com',                        '(//p[@class="cnnBodyText"])[1]' ),
    ( 'cnn.com',                        '//meta[@*="DATE"]/@content' ),
    ( 'cnn.com',                        '//meta[@*="pubdate"]/@content' ),
    ( 'cnnphilippines.com',             '//div/p[@class="dateString no-icon"]'),
    ( 'conseil-constitutionnel.fr',     '//h1[@class="title"]/span[@class="date"]'),
    ( 'conseil-etat.fr',                '//time/@datetime'),
    ( 'corporate.qiagen.com',           '//div[@class="field-publication-date"]' ),
    ( 'crofsblogs.typepad.com',         '//h2[@class="date-header"]'),
    ( 'cronicaglobal.elespanol.com',    '(//div[@class="news_ext_date"]/time)[1]'),
    ( 'crp-infotec.de',                 '//meta[@name="revised"]/@content'),
    ( 'csis.org',                       '//article[@role="article"]/p' ),
    ( 'cyberctm.com',                   '//div[@class="publish-date"]/text()'),
    ( 'dailyalert.org',                 '//div[@style="margin-left:315px; margin-right:315px;"]/text()'),
    ( 'dailyreadlist.com',              '//time/@datetime' ),
    ( 'dailyreadlist.com',              '//time[@itemprop="datePublished"]/@datetime'),
    ( 'dailyreadlist.com',              '//time[class="entry-date date published updated"]'),
    ( 'dailyusapost.com',               '//div[@class="date"]//a[@title="Why the confusion about Kim Jong Un’s well being truly is sensible"]' ),
    ( 'dakaractu.com',                  '//div[@id="date"]' ),
    ( 'dalloz-actualite.fr',            '//span[@class="field-field-published-at"]' ),
    ( 'dalloz-actualite.fr',            '//span[@class="field-field-published-at"]'),
    ( 'datarepository.wolframcloud.com', '(//ul[@class="source-metadata"]/li/span[@class="property"])[1]'),
    ( 'davidotokiblog.com.ng',          '//div[@class="post-item-inner"]/div[@class="post-meta"]/span[@class="post-date published"]/@datetime'),
    ( 'dcmi.org',                       '(//time/@datetime)[1]'),
    ( 'debate.com.mx',                  '//time[@class="newsfull__time"]/@datetime' ),
    ( 'debate.com.mx',                  '//time[@class="newsfull__time"]/@datetime' ),
    ( 'defamer.gawker.com',             '//time/@datetime' ),
    ( 'defense.gouv.fr',                '//div[@class="mise-a-jour"]'),
    ( 'defense.gouv.fr',                '//div[@class="mise-a-jour"]/text()'),
    ( 'defensemaven.io',                '//div[@class="sk4e2855"]/p[@class="skpzhulc skh9fqbk"]/time/@title' ),
    ( 'deloitte.com',                   '//span[@class="hidden-xs hidden-sm"]/text()'),
    ( 'depositphotos.com',              '//div[@class="info-item"]' ),
    ( 'devdiscourse.com',               '//meta[@itemprop="datePublished"]/@content'),
    ( 'diagnostics.roche.com',          '//meta[@name="publishedDate"]/@content'),
    ( 'digima-news.com',                '//div[@class="tak-category clearfix"]/p/text()'),
    ( 'diploweb.com',                   '//div[@class="article"]/h3/text()'),
    ( 'driverscloud.com',               '//div[@class="auteur"]'),
    ( 'dusiznies.blogspot.com',         '//abbr[@class="published"]/@datetime'),
    ( 'dusiznies.blogspot.com',         '//h2[@class="date-header"]/span' ),
    ( 'dw.com',                         '(//ul[@class="smallList"]/li)[1]'),
    ( 'earthreview.net',                '//time[@class="updated"]/@datetime'),
    ( 'eastcoastdaily.in',              '//div[@class="entry-header"]//span[@class="date meta-item"]' ),
    ( 'elcomercio.com',                 '//meta[@name="cXenseParse:recs:publishtime"]/@content'),
    ( 'eldeber.com.bo',                 '//div[@class="bottom"]/h6/span'),
    ( 'elnacional.com.do',              '(//time[contains(@class,"entry-date")])[1]' ),
    ( 'elperuano.pe',                   '//article[@class="notatexto"]/p/b' ),
    ( 'empirenews.net',                 '//time[@class="entry-date published updated"]/@datetime' ),
    ( 'en.mediamass.net',               '//time/@datetime' ),
    ( 'en.paperblog.com',               '//div[@class="article-title"]/em' ),
    ( 'en.sahos24.com',                 '//div[@class="news_date_time"]/p' ),
    ( 'en.sahos24.com',                 '//div[@class="news_date_time"]/p' ),
    ( 'english.khan.co.kr',             '//div[@class="article_date"]' ),
    ( 'english.kyodonews.net',          '//p[@class="credit"]'),
    ( 'english.sina.com',               '//div[@class="t_attr"]/span' ),
    ( 'es.weforum.org',                 '//div[@class="article-published"]'),
    ( 'euobserver.com',                 '//article[@id="article"]/time/@datetime'),
    ( 'europe1.fr',                     '(//span[@class="publication"]/time/@datetime)[1]'),
    ( 'europe1.fr',                     '(//span[@class="publication"]/time/@datetime)[1]'),
    ( 'eurosurveillance.org',           '//meta[@name="dc.date"]/@content'),
    ( 'extranet.who.int',               '//span[@class="date-display-single"]/@content'),
    ( 'finance.yahoo.com',              '//time[@class="date Fz(11px) Mb(4px)  D(ib)"]'),
    ( 'findingdulcinea.com',            '//div[@id="article_capsule_date"]/text()'),
    ( 'firstpost.com',                  '//span[@class="article-date"]' ),
    ( 'flags.net',                      '//meta[@name="Date-Creation-yyyymmdd"]/@content'),
    ( 'fnad.info',                      '//time[@class="entry-time"]/@datetime' ),
    ( 'fnn.jp',                         '//time[@class="article-header-info__time-wrap"]/@datetime'),
    ( 'forbes.com',                     '//meta[@property="article:published"]/@content'),
    ( 'foreignpolicy.com',              '(//div[@class="meta-data"])/time' ),
    ( 'fortune.com',                    '//p[@class="articleHeader__publishDate--2TN0F"]/time/@datetime' ),
    ( 'foxnews.com',                    '//div[@class="article-date"]/time' ),
    ( 'foxnews.com',                    '//meta[@name="dcterms.created"]/@content' ),
    ( 'foxnews.com',                    '//p[@class="published updated dtstamp"]//span[@class="value-title"]/@title' ),
    ( 'franceculture.fr',               '//time/@datetime', ),
    ( 'freepressjournal.in',            '//div[@class="story-meta-info-m__date-time__1IiJn"]/time/@datetime'),
    ( 'freerepublic.com',               '(//b/span[@class="date"])[1]'),
    ( 'freespeech.org',                 '//div[@class="date"]/p'),
    ( 'freespeechdaily.com',            '//i[@class="fa fa-clock-o"]/a'),
    ( 'funtobebad.blogspot.com',        '//h2[@class="date-header"]/span'),
    ( 'funtobebad.blogspot.com',        '//h2[@class="date-header"]/span'),
    ( 'gamemaz.info',                   '//time[@class="entry-time"]/@datetime' ),
    ( 'gawker.com',                     '//div[@class="meta__text"]/time/@datetime'),
    ( 'globalnews.ca',                  '//div[@class="c-byline__date c-byline__date--pubDate"]/span'),
    ( 'globalnews.ca',                  '//div[@class="date-and-time"]' ),
    ( 'globalnews.ca',                  '//div[contains(@class,"c-byline__date")]' ),
    ( 'globaltimes.cn',                 '//div[@class="span7 text-left"]' ),
    ( 'golden-tamatama.com',            '//time[@class="date gf entry-date updated"]/text()'),
    ( 'goldsea.com',                    '//div[@id="credits"]' ),
    ( 'gooseart.net',                   '//time[@class="entry-time"]/@datetime' ),
    ( 'guernseypress.com',              '//div[@class=" full pb-feature pb-layout-item pb-f-single-title"]/div/p/time/@datetime'),
    ( 'guernseypress.com',              '//div[@class=" full pb-feature pb-layout-item pb-f-single-title"]/div/p/time/@datetime'),
    ( 'gulfnews.com',                   '//time[@itemprop="datePublished"]/@datetime'),
    ( 'gxzf.gov.cn',                    '//div[@class="article-inf-left"]/text()'),
    ( 'headlines.yahoo.co.jp',          '//p[@class="fss ymuiDate"]'),
    ( 'headtopics.com',                 '//meta[@name="date"]/@content' ),
    ( 'heavy.com',                      '//meta[@property="article:published_time"]/@content'),
    ( 'heavy.com',                      '//time[@itemprop="datePublished"]/@datetime'),
    ( 'hindi.moneycontrol.com',         '//div[@class="a_10mgry PT5"]'),
    ( 'hindi.moneycontrol.com',         '//div[@class="a_10mgry PT5"]'),
    ( 'hirhome.com',                    '(//span[@lang="EN-US"])[2]' ),
    ( 'hljxinwen.dbw.cn',               '//div[@align="center"]/text()'),
    ( 'hogueprophecy.com',              '//div[@class="entry-content"]//span[@style="color: #ff0000;"]/strong' ),
    ( 'homelandsecuritynewswire.com',   '//span[@class="published"]' ),
    ( 'hotair.com',                     '(//div[@class="col-xs-12 article-text"]/p)[1]'),
    ( 'hotair.com',                     '(//div[@class="col-xs-12 article-text"]/p)[1]'),
    ( 'hotair.com',                     '//meta[@property="article:published_time"]/@content'),
    ( 'hygienes.net',                   '//span[@class="published"]'),
    ( 'icrc.org',                       '//span[@class="small date seperator-left"]'),
    ( 'ict.org.il',                     '//div[@class="article_sum_details"]/text()'),
    ( 'idahopoliticsdaily.com',         '//dd[@class="published"]/time/@datetime'),
    ( 'imf.org',                        '//meta[@name="Date"]/@content' ),
    ( 'important7.com',                 '//div[@class="post-meta vcard"]//p//span[@class="updated"]' ),
    ( 'in.news.yahoo.com',              '//time[@class="date Fz(11px) Mb(4px)  D(ib)"]/@datetime'),
    ( 'indiadying.blogspot.com',        '//h2[@class="date-header"]/span'),
    ( 'indiadying.blogspot.com',        '//h2[@class="date-header"]/span'),
    ( 'informationclearinghouse.info',  '//div[@class="post-content"]//p/font[@size="5"]' ),
    ( 'informationclearinghouse.info',  '//font[@face="Times New Roman"]/p' ),
    ( 'insta.shared.to',                '//p[@class="fs"]' ),
    ( 'iranchamber.com',                '//td[@class="fontdate"]' ),
    ( 'iris-france.org',                '//div[@class="date"]/text()'),
    ( 'islamsounnah.com',               '//meta[@property="article:published_time"]/@content'),
    ( 'israelnationalnews.com',         '//span[@itemprop="datePublished"]' ),
    ( 'itv.com',                        '//li[@class="labels__item labels__item--time"]/time/@datetime'),
    ( 'ivoox.com',                      '//span[@class="icon-date"]/text()'),
    ( 'japantimes.co.jp',               '//li[@class="post_time"]/time/@datetime'),
    ( 'jawharafm.net',                  '//span[@class="dat_ev"]' ),
    ( 'jawharafm.net',                  '//span[@class="dat_ev"]/text()'),
    ( 'jewishworldreview.com',          '//p[@class="simple"]' ),
    ( 'jpost.com',                      '//meta[@itemprop="datePublished"]/@content'),
    ( 'juventudrebelde.cu',             '//div[@class="col-lg-12 col-md-12 col-sm-12 col-xs-12 col-p0 news-date"]/text()'),
    ( 'kaixo.com',                      '//div[@id="edukiak"]/text()'),
    ( 'kake.com',                       '//span[@class="Timestamp-time"]' ),
    ( 'krcnr.cn',                       '//meta[@name="publishdate"]/@content'),
    ( 'king5.com',                      '//meta[@itemprop="datePublished"]/@content'),
    ( 'kr.lnd.com.cn',                  '//div[@id="news_content_title1"]/span/text()'),
    ( 'lapresse.it',                    '//div[@class="article__main__metadata"]/span[@class="article__main__date"]' ),
    ( 'laregion.es',                    '//meta[@name="date"]/@content' ),
    ( 'latestly.com',                   '//span[@class="article_date"]'),
    ( 'laverdad.com',                   '//div[@id="left-sidebar"]/time[@class="fecha"]/@datetime'),
    ( 'lavozdegalicia.es',              '(//meta[@itemprop="datePublished"]/@content)[1]' ),
    ( 'lci.fr',                         '(//time)[1]'),
    ( 'lci.fr',                         '//div[@class="col-full"]/div[@class="article-date-credit-wrapper"]/time/@datetime'),
    ( 'leaders.com.tn',                 '(//div[@class="infos"])[1]' ),
    ( 'learningenglish.voanews.com',    '//div[@class="published"]/span[@class="date"]/time/@datetime' ),
    ( 'lecourrier.vn',                  '//div[@class="newsDetail_time"]/span'),
    ( 'lecourriercauchois.fr',          '//li[@class="detail date"]/text()'),
    ( 'lecranstdenis.org',              '//time/@datetime' ),
    ( 'ledevoir.com',                   '//time/@datetime' ),
    ( 'ledevoir.com',                   '//time/@datetime'),
    ( 'legalis.net',                    '//div[@class="date_article_actualite fl"]/text()'),
    ( 'legrandsoir.info',               '//div[@class="article-date  print-only"]' ),
    ( 'lematin.ch',                     '//p[@class="publishedDate"]/text()'),
    ( 'lenouvelliste.ch',               '//div[@class="col-xs-22"]/small/text()'),
    ( 'logsoku.com',                    '//div[@id="comments"]/dl[@id="1"]/dt/text()'),
    ( 'lucianne.com',                   '//div/p[@class="post-posted-by"]'),
    ( 'lvcdn.com',                      '//div[@class="article_attribute"]/span/text()'),
    ( 'lxbird.com',                     '//div[@class="jsx-854068075 time"]/text()'),
    ( 'macaudailytimes.com.mo',         '//div[@class="meta-data"]' ),
    ( 'maghress.com',                   '//span[@class="articlenewspaper"]'),
    ( 'malaymail.com',                  '//div/p[@class="meta mb-0"]'),
    ( 'manilastandard.net',             '//div[@class="ts-article-author-container"]' ),
    ( 'masjed.ir',                      '//span[@class="head2"]' ),
    ( 'masjed.ir',                      '//span[@id="ctl00_cphMiddle_Sampa_Web_View_NewsAgencyUI_NANewsDetail00cphMiddle_27244_lblDateTop"]' ),
    ( 'masjed.ir',                      '//span[@id="ctl00_cphMiddle_Sampa_Web_View_NewsAgencyUI_NANewsDetail00cphMiddle_27244_lblDateTop"]'),
    ( 'medworm.com',                    '(//time)[1]'),
    ( 'michelinfo.com',                 '//span[@class="post-date updated"]/text()'),
    ( 'miit.gov.cn',                    '//div[@class="short_r"]/text()'),
    ( 'militarytimes.com',              '//meta[@itemprop="datePublished"]/@content'),
    ( 'minnesota.cbslocal.com',         '//time[@class="timestamp"]/@datetime' ),
    ( 'mixonline.jp',                   '//span[@id="dnn_ctr389_ArticleDetail_lblReleaseDateTime"]/text()'),
    ( 'moneys.mt.co.kr',                '//meta[@property="article:published_time"]/@content'),
    ( 'moneys.mt.co.kr',                '//span[@id="pn_article_date"]'),
    ( 'monitordolar.com',               '//time[@class="entry-date"]/@datetime' ),
    ( 'mothership.sg',                  '//div[@class="publish-info"]/p/span[@class="publish-date"]' ),
    ( 'mumbaimirror.indiatimes.com',    '//div[@class="left"]/span[@class="byline"]' ),
    ( 'mundiario.com',                  '//span[@class="content-time"]' ),
    ( 'mykaraokecafe.com',              '//div[@class="entry-meta"]/h5[@class="entry-date"]/time[@datetime="entry-date"]' ),
    ( 'mykaraokecafe.com',              '//time/@datetime' ),
    ( 'mysingaporenews.blogspot.com',   '//div[@class="columns-inner"]/div[@class="date-outer"]/h2[@class="date-header"]' ),
    ( 'mysingaporenews.blogspot.com',   '//h2[@class="date-header"]' ),
    ( 'naegeleblog.wordpress.com',      '//small[@class="date"]' ), 
    ( 'napolitoday.it',                 '//time[@class="datestamp"]' ),
    ( 'nationalpost.com',               '//span[@class="published-date__since"]'),
    ( 'nationalpost.com',               '//span[@class="published-date__since"]/@date-last-update'),
    ( 'nationalpost.com',               '//time[@itemprop="datePublished"]/@datetime'),
    ( 'nazanin.es',                     '//p[@class="postmetadata"]' ),
    ( 'nbc12.com',                      '//meta[@name="date"]/@content'),
    ( 'nbcnews.com',                    '//meta[@itemprop="datePublished"]/@content'),
    ( 'nbcnews.com',                    '//meta[@property="article:published_time"]/@content' ),
    ( 'nbcnews.com',                    '//span[@class="byline___3V_nz"]'),
    ( 'newindianexpress.com',           '(//p[@class="ArticlePublish margin-bottom-10"]/span)[1]'),
    ( 'news100.gguk.fun',               '//em[id="post-date"]/text()'),
    ( 'news.biglobe.ne.jp',             '//p[@class="date"]' ),
    ( 'news.bioon.com',                 '//div[@class="title5"]/p/text()'),
    ( 'news.com.au',                    '//meta[@itemprop="datePublished"]/@content'),
    ( 'news.goo.ne.jp',                 '//p[contains(@class,"article-date")]' ),
    ( 'news.kakaku.com',                '//p[@class="date"]' ),
    ( 'news.mt.co.kr',                  '//meta[@property="article:published_time"]/@content'),
    ( 'news.mt.co.kr',                  '//span[@id="pn_article_date"]'),
    ( 'news.nicovideo.jp',              '//time[@class="article-created-at"]'),
    ( 'news.un.org',                    '//meta[@property="article:published_time"]/@content' ),
    ( 'news.un.org',                    '//span[@property="dc:date"]/@content' ),
    ( 'newslocker.com',                 '//time[@class="entry-time"]/@datetime'),
    ( 'newsmir.info',                   '//span[@class="meta_date"]/a/text()'),
    ( 'newsoneplace.com',               '//span[@class="textlogoarticle"]/time/@datetime'),
    ( 'niid.go.jp',                     '//time[@itemprop="datePublished"]/@datetime'),
    ( 'nk.jiho.jp',                     '(//span[@class="date-display-single"])[1]' ),
    ( 'noticieros.televisa.com',        '//div[@class="video-post-title"]/div[@class="author"]'),
    ( 'noticieros.televisa.com',        '//meta[@property="article:published_time"]/@content'),
    ( 'noxininfluencer.com',            '//p[@class="publised-date"]/text()'),
    ( 'npr.org',                        '//div[@class="dateblock"]/time/@datetime'),
    ( 'nydailynews.com',                '//meta[@name="date"]/@content'),
    ( 'nytimes.com',                    '//meta[@property="article:published"]/@content' ),
    ( 'nytimes.com',                    '//time[@class="css-129k401 e16638kd0"]/@datetime' ), # FIXME: these won't generalize?
    ( 'nytimes.com',                    '//time[@class="css-1sbuyqj e16638kd3"]/@datetime' ), # FIXME: these won't generalize?
    ( 'nzherald.co.nz',                 '//div[@class="video-date"]' ),
    ( 'nzherald.co.nz',                 '//meta[@name="article:published_time"]/@content' ),
    ( 'oluwagbemigapost.com',           '//time[@class="entry-date published updated"]/@datetime'),
    ( 'oinavi.com',                     '//p[@id="single-header-date"]/text()'),
    ( 'onenewspage.co.uk',              '//span[@class="lhpt"]'),
    ( 'onenewspage.com',                '//meta[@itemprop="uploadDate"]/@content'),
    ( 'ottawacitizen.com',              '//span[@class="published-date__since"]' ),
    ( 'ozap.com',                       '//div[@class="article__author-date"]' ),
    ( 'ozap.com',                       '//div[@class="article__author-date"]/text()'),
    ( 'papers.ssrn.com',                '//meta[@name="citation_online_date"]/@content' ),
    ( 'parismatch.com',                 '//time/@datetime'),
    ( 'parismatch.com',                 '//time/@datetime'),
    ( 'payvand.com',                    '//div[@class="article"]/meta[@content="text/html; charset=utf-8"]' ),
    ( 'people.com',                     '//div[@class="timestamp published-date padding-12-left"]' ),
    ( 'periodicodebate.com',            '//div[@class="itemDateCreated"]' ),
    ( 'periodicodebate.com',            '//span[@class="itemDateCreated"]' ),
    ( 'persee.fr',                      '//meta[@itemprop="datePublished"]/@content'),
    ( 'pmnewsnigera.com',               '//div[@class="col-md-12 post"]/p[@class="time"]'),
    ( 'politico.com',                   '//p[@class="story-meta__timestamp"]/time/@datetime'),
    ( 'politico.com',                   '//span[@class="timestamp"]'),
    ( 'politico.com',                   '//time[@itemprop="datePublished"]/@datetime'),
    ( 'politicususa.com',               '//a/time[@class="entry-date published updated"]/@datetime'),
    ( 'pourquoidocteur.fr',             '//div[@class="date mb10"]'),
    ( 'pressafrik.com',                 '//div[@class="access"]' ),
    ( 'prtimes.jp',                     '//time[@class="time icon-time-release-svn"]/@datetime' ),
    ( 'ptthito.com',                    '//meta[@name="description"]/@content'),
    ( 'public.fr',                      '//time/@datetime'),
    ( 'pulsoslp.com.mx',                '//time[@class="entry-date updated td-module-date"]/@datetime' ),
    ( 'qz.com',                         '//time/@datetime' ),
    ( 'realnewsrightnow.com',           '//meta[@property="article:published_time"]/@content'),
    ( 'renegadetribune.com',            '//span[@class="posted-on"]/time/@datetime' ),
    ( 'researchgate.net',               '//meta[@itemprop="datePublished"]/@content'),
    ( 'resumenlatinoamericano.org',     '//span[@class="post-byline"]' ),
    ( 'resumenmediooriente.org',        '//time[@class="entry-date"]/@datetime'),
    ( 'rtbf.be',                        '//meta[@itemprop="datePublished"]/@content'),
    ( 'rtl.be',                         '//span[@itemprop="datePublished"]/text()'),
    ( 'rtl.fr',                         '//div[@class="article-info"]/time/@datetime'),
    ( 'rts.ch',                         '(//span[@class="sc-141f4yq-6 cksdVr"])[1]'),
    ( 'ruthfullyyours.com',             '//div/p[@id="single-byline"]'),
    ( 'salon.com',                      '//meta[@property="article:published_time"]/@content'),
    ( 'sana.sy',                        '//meta[@property="article:published_time"]/@content' ),
    ( 'santemagazine.fr',               '//time/@datetime'),
    ( 'scholar.harvard.edu',            '//div[@class="node-content"]/i'),
    ( 'sciencedirect.com',              '//div[@class="wrapper"]/p' ),
    ( 'sciencedirect.com',              '//meta[@name="citation_online_date"]/@content'),
    ( 'sciencepress.qc.ca',             '(//font[@size="-1"]/text())[1]'), 
    ( 'scmp.com',                       '//meta[@property="article:published_time"]/@content' ),
    ( 'scmp.com',                       '//time/@datetime' ),
    ( 'scotsman.com',                   '//div[@class="sc-bbkauy cshaXl"]' ),
    ( 'securitepublique.gc.ca',          '//meta[@name="dcterms.issued"]/@content'),
    ( 'sedaily.com',                    '//li[@class="letter"]'),
    ( 'sedaily.com',                    '//meta[@property="dd:published_time"]/@content'),
    ( 'seekhlopakistan',                '(//time[@class="entry-date published updated"]/@datetime)[1]'),
    ( 'senenews.com',                   '//span[@class="date updated"]'),
    ( 'senenews.com',                   '//span[@class="timeT"]' ),
    ( 'sfc.hk',                         '(//small[@style="font-size: 11px; line-height: 18px;"]/text())[1]'),
    ( 'sg.news.yahoo.com',              '//time[@class="date Fz(11px) Mb(4px)  D(ib)"]'),
    ( 'sinpermiso.info',                '//meta[@name="dcterms.date"]/@content' ),
    ( 'siouxcountyradio.com',           '//p[@class="card-text text-muted"]/text()'),
    ( 'slateafrique.com',               '//time/@datetime'),
    ( 'smartprices.org',                '//time[@class="entry-time"]/@datetime' ),
    ( 'smartraveller.gov.au',           '//div[@class="clearfix text-formatted field field—name-field-body field—type-text-long field—label-hidden field__item"]/p' ),
    ( 'smithsonianmag.com',             '//time/@data-pubdate' ),
    ( 'smnyct.org',                     '(//small/text())[1]'),
    ( 'smw.ch',                         '//meta[@name="dc.date"]/@content'),
    ( 'snopes.com',                     '//li/span[@class="date date-published"]'),
    ( 'soakaeofh.egloos.com',           '//abbr[@class="published"]/@title'),
    ( 'sofmag.com',                     '//span[@class="tie-date"]' ),
    ( 'sofmag.com',                     '//span[@class="tie-date"]/i[@class="fa fa-clock-o"]' ),
    ( 'soundcloud.com',                 '//time[@class="relativeTime"]/@datetime'),
    ( 'sp.m.jiji.com',                  '//div[@class="newsArticle__date"]/text()'),
    ( 'spiegel.de',                     '//span[@class="article-function-date"]/b' ),
    ( 'spiegel.de',                     '//time/@datetime' ),
    ( 'stajastur.blogspot.com',         '//h2[@class="date-header"]/span/text()'),
    ( 'state.gov',                      '//p[@class="article-meta__publish-date"]' ),
    ( 'steelorbis.com',                 '//div[@class="col-sm-8 col-md-9"]' ),
    ( 'streetpress.com',                '//span[@class="date has-text-yellow"]'),
    ( 'stripes.com',                    '//span[@class="article_credits small-16 columns"]' ),
    ( 'stripes.com',                    '//span[@class="published_date"]' ),
    ( 'studymode.com',                  '//span[@class="essay-details--grey text-s"]' ),
    ( 'sudouest.fr',                    '//time/@datetime'),
    ( 'sumedico.lasillarota.com',       '//li[@class="far fa-calendar-all"]/text()'),
    ( 'sumedico.lasillarota.com',       '//ul[@class="data-note"]'),
    ( 'tdg.ch',                         '//time/@datetime'),
    ( 'tdg.ch',                         '//time[@class="full-date-time"]/@datetime' ),
    ( 'tdg.ch',                         '//time[@class="last-updated-date-time"]/@datetime' ),
    ( 'techrepublic.com',               '//span[@class="byline-item"]' ),
    ( 'ted.com',                        '//meta[@itemprop="uploadDate"]/@content'),
    ( 'telegraph.co.uk',                '//*[@itemprop="datePublished"]/@content' ),
    ( 'telegraph.co.uk',                '//meta[@itemprop="datePublished"]/@content'),
    ( 'telemazonas.com',                '(//time[@class="updated"]/@datetime)[1]' ),
    ( 'thebigwobble.org',               '//div[@class="date-outer"]//h2[@class="date-header"]/span' ),
    ( 'thecipherbrief.com',             '//time/@datetime' ),
    ( 'thedailybeast.com',              '//time/@datetime' ),
    ( 'thedailygrind.news',             '//meta[@name="date"]/@content'),
    ( 'theday.co.uk',                   '//time[@id="published-at"]/@datetime'),
    ( 'thediplomat.com',                '//span[@itemprop="datePublished"]' ),
    ( 'thefreelibrary.com',             '//table[@style="width:100%;border-spacing:0;border:none"]/tbody/tr[@class="odd"]/td/a'),
    ( 'theinitium.com',                 '//time[@class="posted-time"]/@datetime'),
    ( 'theintercept.com',               '//span[@class="PostByline-date"]' ),
    ( 'thelibertybeacon.com',           '//span[@class="entry-meta-date updated"]/a'),
    ( 'themillenniumreport.com',        '//time/@datetime'),
    ( 'thenational.ae',                 '(//div[@class="desc-box"]/div[@class="hidden-lg"]/p)[1]'),
    ( 'thenewamerican.com',             '//span[@class="itemDateCreated"]' ),
    ( 'thenewscommenter.com',           '//article[@class="story detail-page"]//div[@class="col-xs-12"]/p' ),
    ( 'thepopculturecompany.com',       '(//tbody/tr)[2]' ),
    ( 'thetimes.co.uk',                 '//article[@id="article-main"]//time/@datetime' ),
    ( 'thetrumpet.com',                 '(//p[@class="article-byline"])[1]' ),
    ( 'theunitedwest.org',              '(//time[@class="entry-date updated td-module-date"]/@datetime)[1]'),
    ( 'theworldnews.net',               '//span[@class="news__time"]/text()'),
    ( 'thoughtco.com',                  '//div[@class="comp updated-label article-updated-label"]'),
    ( 'threadreaderapp.com',            '//a[@class="time"]/@data-time'),
    ( 'tiemposllegados.blogspot.com',   '//h2[@class="date-header"]/span/text()'),
    ( 'time.com',                       '//div[contains(@class,"published-date")]' ),
    ( 'timesofindia.indiatimes.com',    '//b/@dateval'),
    ( 'timesofisrael.com',              '//div[@class="wrap-byline"]/span[@class="date"]' ),
    ( 'tmz.com',                        '//h5[@class="article__published-at"]' ),
    ( 'today.it',                       '//time[@class="datestamp"]'),
    ( 'todotexcoco.com',                '//time/text()'),
    ( 'tonibitt.blogia.com',            '//time/@datetime'),
    ( 'topia.ne.jp',                    '//p[@class="publishedAt"]/text()'),
    ( 'touteleurope.eu',                '(//span[@class="date"])[1]' ),
    ( 'touteleurope.eu',                '(//span[@class="date"]/text())[1]'),
    ( 'townhall.com',                   '//div[@class="contributor pull-left"][contains(.,"Posted:")]/text()'),
    ( 'treasury.gov',                   '//div[@class="content-slim"]/br'),
    ( 'treasury.gov',                   '//div[@class="updated"]'),
    ( 'tresor.economic.gouv.fr',        '//time/@datetime'),
    ( 'tribuna.ucm.es',                 '//span[@class="fechaarticulo"]/text()'),
    ( 'trtworld.com',                   '//ul[@class="author"]'),
    ( 'tvanouvelles.ca',                '(//time[@itemprop="datePublished"]/@datetime)[1]' ),
    ( 'txarmyvet.blogspot.com',         '//time[@class="published"]/@datetime'),
    ( 'ultimahora.hn',                  '//span[@property="dc:date dc:created"]/@content'),
    ( 'unadfi.org',                     '//time[@class="entry-date published updated"]/@datetime'),
    ( 'unis.unvienna.org',              '//meta[@name="creation-date"]/@content'),
    ( 'unitypublishing.com',            '//span[@style="font-size:13.5pt"]' ),
    ( 'universalis.fr',                 '//span[@class="rg"]'),
    ( 'urdupoint.com',                  '//span[@class="article-date"]'),
    ( 'usatoday.com',                   '//p[@class="header__pubdate svelte-1t1csty"]/text()'),
    ( 'usatoday.com',                   '//story-timestamp[@id="videoTimestamp"]/text()'),
    ( 'usip.org',                       '//header[@class="page__header"]/p[@class="meta"]'),
    ( 'ut-capitole.fr',                 '//meta[@name="Date-Creation-yyyymmdd"]/@content'),     
    ( 'valeursactuelles.com',           '//span[@class="rdf-meta hidden"]/@content' ),
    ( 'valeursactuelles.com',           '//span[@property="schema:dateCreated"]/@content'),
    ( 'valeursactuelles.com',           '//span[@property="schema:dateCreated"]/@content'),
    ( 'vanityfair.com',                 '//time[@class="content-header__publish-date"]'),
    ( 'verlag-dr.de',                   '//span[@style="color: #000000"]/text()'),
    ( 'videos.telesurtv.net',           '//time/@datetime'),
    ( 'vie-publique.fr',                '(//time/@datetime)[1]'),
    ( 'vie-publique.fr',                '//p[@class="dateBox"]/span[@class="field field--name-field-date-remise field--type-datetime field--label-hidden field__item"]/time/@datetime'),
    ( 'virosin.org',                    '//meta[@name="dc.date"]/@content'),
    ( 'virusncov.com',                  '(//small/text())[1]'),
    ( 'vitaminedz.com',                 '//div[@class="social_link"]/text()'),
    ( 'voaafrique.com',                 '(//span[@class="date"]/time/@datetime)[1]' ),
    ( 'voanews.com',                    '//div[@class="page-header__meta-item"]'),
    ( 'voxeurop.eu',                    '//div[contains(@class,"publish_date_time")]' ),
    ( 'vvvreevvv.info',                 '//time[@class="updated"]/@datetime'),
    ( 'waffenexporte.de',               '//td[@class="obenrechts"]/text()'),
    ( 'wajr.com',                       '//time[@class="published"]/@datetime'),
    ( 'washingtoninstitute.org',        '(//header[@class="tight-paragraphs tertiary-header group"]/p)[5]'),
    ( 'washingtonpost.com',             '//div[@class="display-date"]'),
    ( 'washingtonpost.com',             '//div[@class="metaData margin-bottom"]/span[@class="date"]'),
    ( 'washingtonpost.com',             '//meta[@name="recv_time"]/@content'),
    ( 'wbal.com',                       '//div[@class="disclaimer"]'),
    ( 'whitehouse.gov',                 '//p[@class="meta__date"]/time'),
    ( 'wiete-strafrecht.de',            '//span[@style="font-style: italic;"]/text()'),
    ( 'wiki2.org',                      '//div[@class="last_mod"]/text()'),
    ( 'wilsoncenter.org',               '//span[@class="insight-detail-hero-author-byline-text -date"]'),
    ( 'wionews.com',                    '//div[@class="col-sm-8"]/div[@class="new-loc-date-stamp"]/span'),
    ( 'wired.com',                      '//time[@class="content-header__publish-date content-header__title-block-publish-date"]'),
    ( 'wired.com',                      '//time[@class="date-mdy"]'),
    ( 'wluml.org',                      '/div[@class="meta"]/div[@class="submitted"]' ),
    ( 'works.medical.nikkeibp.co.jp',   '//span[@itemprop="datePublished"]/text()'),
    ( 'wright-house.com',               '//font[@size="+1"]/b' ),
    ( 'wsj.com',                        '//meta[@itemprop="datePublished"]/@content'),
    ( 'wsj.com',                        '//span[@class="published"]/text()'),
    ( 'wuhanupdate.com',                '//time[@class="entry-time"]/@content'),
    ( 'xbuy.info',                      '//time[@class="entry-time"]/@datetime' ),
    ( 'yahoo.com',                      '//time/@datetime' ),
    ( 'youthdaily.co.kr',               '(//ul[@class="art_info"]/li/text())[1]'),
    ( 'youtube.com',                    '//div[@id="date"]/yt-formatted-string[@class="style-scope ytd-video-primary-info-renderer"]'),
    ( 'yunjuu.com',                     '(//span[@class="entry-date"]/text())[1]'),
    ( 'zdnet.com',                      '(//time/@datetime)[1]'),
    ( 'zdnet.fr',                       '//time/@datetime'),
    ( 'zzzzz.de',                       '//small/text()'),

    # universal xpaths
    ( None, '//meta[@*="ArticlePublishDate"]/@content'),
    ( None, '//meta[@*="DATE"]/@content' ),
    ( None, '//meta[@*="DCTERMS.issued"]/@content' ),
    ( None, '//meta[@*="OriginalPublicationDate"]/@content' ),
    ( None, '//meta[@*="PublishDate"]/@content' ),
    ( None, '//meta[@*="all_timestamps"]/@content' ),
    ( None, '//meta[@*="article:post_date"]/@content' ),
    ( None, '//meta[@*="article:published"]/@content'),
    ( None, '//meta[@*="article:published_time"]/@content' ),
    ( None, '//meta[@*="article_date_original"]/@content' ),
    ( None, '//meta[@*="cXenseParse:recs:publishtime"]/@content' ),
    ( None, '//meta[@*="date"]/@content' ),
    ( None, '//meta[@*="dc.Date"]/@content' ),
    ( None, '//meta[@*="dcterms.created"]/@content' ),
    ( None, '//meta[@*="dcterms.date"]/@content' ),
    ( None, '//meta[@*="og:article:published_time"]/@content' ),
    ( None, '//meta[@*="og:published_time"]/@content' ),
    ( None, '//meta[@*="parsely-pub-date"]/@content' ),
    ( None, '//meta[@*="pubdate"]/@content' ),
    ( None, '//meta[@*="pubdate"]/@datetime' ),
    ( None, '//meta[@*="publication_date"]/@content' ),
    ( None, '//meta[@*="publish-date"]/@content'),
    ( None, '//meta[@*="published_time_telegram"]/@content'),
    ( None, '//meta[@*="recv_time"]/@content'),
    ( None, '//meta[@*="rnews:datePublished"]/@content' ),
    ( None, '//meta[@*="sailthru.date"]/@content' ),
    ( None, '//meta[@*="uploadDate"]/@content'),

    # microdata paths
    ( None, '//*[@itemprop="datePublished"]/@content' ),
    ( None, '//*[@itemprop="datePublished"]/@datetime' ),
    ( None, '//*[@property="datePublished"]/@content' ),
    ( None, '//*[@property="datePublished"]/@datetime' ),

    ])

published_regexes = compile_regexes([
    ( 'herodote.net', r'[\./\-_](\d{8})[\./\-_]' ),

    #( None, r'([\./\-_](19|20)\d{2}[\./\-_]?[0-1]?[0-9][\./\-_]?([0-3]?[0-9][\./\-_])?)' ),
    ( None, r'([\./\-_](19|20)\d{2}[\./\-_]?[0-1]?[0-9][\./\-_]([0-3]?[0-9][\./\-_])?)' ),
    ])

def get_timestamp_published(parser, ldjsons, url, **kwargs):
    return get_timestamp(
        parser,
        ldjsons,
        url,
        published_jsonpaths,
        published_xpaths,
        published_regexes,
        parse_timestamp_str,
        get_best_timestamps,
        **kwargs
        )

################################################################################

modified_jsonpaths = compile_jsonpaths([
    ( 'en.antaranews.com', '$.disabled' ),

    ( None, '$.dateModified'),
    ( None, '$."@graph"[*].dateModified'),
    ])

modified_xpaths = compile_xpaths([
    # xpaths
    ( 'airsafe.com',                    '//div[@class="blocked_off"]/text()'),
    ( 'alexandrina.eco-compliance.de',  '//a[@class="last-modified"]/text()'),
    ( 'arabic.rt.com',                  '(//time)[3]'),
    ( 'asiae.co.kr',                    '(//div[@class="articleInfo"]/div/em)[2]'),
    ( 'buzzfeednews.com',               '//p[@class="news-article-header__timestamps-updated"]'),
    ( 'consilium.europa.eu',            '//div[@class="time-wrapper"]/time/@datetime'),
    ( 'cronicaglobal.elespanol.com',    '(//div[@class="news_ext_date"]/time)[2]'),
    ( 'datarepository.wolframcloud.com', '(//ul[@class="source-metadata"]/li/span[@class="property"])[2]'),
    ( 'deagel.com',                     '//div[@id="date"]/text()'),
    ( 'donga.com',                      '(//span[@class="date01"])[2]' ),
    ( 'europe1.fr',                     '(//span[@class="publication"]/time/@datetime)[2]'),
    ( 'europe1.fr',                     '(//span[@class="publication"]/time/@datetime)[2]'),
    ( 'foxnews.com',                    '//div[@class="article-updated"]' ),
    ( 'foxnews.com',                    '//div[@class="article-updated"]' ),
    ( 'globalsecurity.org',             '//div[@id="modified"]' ),
    ( 'islamsounnah.com',               '//meta[@property="article:modified_time"]/@content'),
    ( 'newindianexpress.com',           '(//p[@class="ArticlePublish margin-bottom-10"]/span)[2]'),
    ( 'news.asiantown.net',             '//div[@id="b_by"]/@data-t' ),
    ( 'ottawacitizen.com',              '//span[@class="updated-date__since"]/@date-last-update' ),
    ( 'politico.com',                   '//p[@class="story-meta__updated"]/time/@datetime'),
    ( 'politico.com',                   '//span[@class="updated"]'),
    ( 'renegadetribune.com',            '//span[@class="posted-on"]//time[@class="updated"]/@datetime' ),
    ( 'senenews.com',                   '//span[@class="date updated"]' ),
    ( 'senenews.com',                   '//span[@class="timeT"]'),
    ( 'service-public.fr',              '(//p[@class="date"]/text())[1]'),
    ( 'topia.ne.jp',                    '//p[@class="updatedAt"]/text()'),
    ( 'tvanouvelles.ca',                '//time[@itemprop="dateUpdated"]/@datetime' ),
    ( 'unis.unvienna.org',              '//meta[@name="posting-date"]/@content'),
    ( 'upi.com',                        '//div[@class="article-date"]/span'),
    ( 'vias.org',                       '//td[@align="right"]/text()'),
    ( 'vie-publique.fr',                '//div[@class="dateBox"]/p/time/@datetime'),
    ( 'wiki.arcs.com',                  '//li[@id="lastmod"]/text()'),
    ( 'wiki.islamiccounterterrorism.org', '//li[@id="lastmod"]/text()'),
    ( 'world-nuclear.org',              '(//em/text())[1]'),
    ( 'worldometers.info',              '//div[@style="font-size:13px; color:#999; text-align:center"]/text()'),
    ( 'youthdaily.co.kr',               '(//ul[@class="art_info"]/li/text())[2]'),


    # meta xpaths
    ( None, '//meta[@*="DCTERMS.modified"]/@content'),
    ( None, '//meta[@*="Date-Revision-yyyymmdd"]/@content'),
    ( None, '//meta[@*="article.updated"]/@content'),
    ( None, '//meta[@*="article:modified"]/@content' ),
    ( None, '//meta[@*="article:modified_time"]/@content' ),
    ( None, '//meta[@*="article:post_modified"]/@content' ),
    ( None, '//meta[@*="dcterms.modified"]/@content'),
    ( None, '//meta[@*="dd:modified_time"]/@content' ),
    ( None, '//meta[@*="last_updated_date"]/@content' ),
    ( None, '//meta[@*="lastmod"]/@content' ),
    ( None, '//meta[@*="modified-date"]/@content' ),
    ( None, '//meta[@*="og:article:modified_time"]/@content' ),
    ( None, '//meta[@*="og:modified_time"]/@content' ),
    ( None, '//meta[@*="og:updated_time"]/@content' ),
    ( None, '//meta[@*="revised"]/@content'),
    ( None, '//meta[@*="rnews:dateModified"]/@content' ),

    # microdata paths
    ( None, '//*[@*="dateModified"]/@content' ),
    ( None, '//*[@*="dateModified"]/@datetime' ),
    ( None, '//*[@*="dateModified"]' ),

    ])

modified_regexes = compile_regexes([])

def get_timestamp_modified(parser, ldjsons, url, **kwargs):
    return get_timestamp(
        parser,
        ldjsons,
        url,
        modified_jsonpaths,
        modified_xpaths,
        modified_regexes,
        parse_timestamp_str,
        get_best_timestamps,
        **kwargs
        )

def timestamp_range(timestamps):
    # Some articles have several timestamps close together, however,
    # possibly due to misconfigured publishing platforms;
    # therefore we have to calculate the range of the timestamps appearing on the page first
    min_lo = None
    max_hi = None
    for timestamp in timestamps:
        # modified timestamps include worst case timezones if no timezone specified
        timestamp_lo_mod = timestamp['value']['lo']
        if timestamp_lo_mod.tzinfo is None:
            timestamp_lo_mod = copy.copy(timestamp_lo_mod).replace(tzinfo = worst_tz_lo)
        timestamp_hi_mod = timestamp['value']['hi']
        if timestamp_hi_mod.tzinfo is None:
            timestamp_hi_mod = copy.copy(timestamp_hi_mod).replace(tzinfo = worst_tz_hi)

        # update min/max
        if min_lo is None or timestamp_lo_mod < min_lo:
            min_lo = timestamp_lo_mod
        if max_hi is None or timestamp_hi_mod > max_hi:
            max_hi = timestamp_hi_mod

    if min_lo is not None and max_hi is not None:
        return max_hi - min_lo
    else:
        import datetime
        return datetime.timedelta.max
