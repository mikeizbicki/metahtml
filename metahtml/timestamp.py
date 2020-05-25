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
        if result is None:
            result = parse_timestamp_str(timestamp_str, parser='dateparser')
        return result

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
                'CEST' : 2*60*60,
                'CET' : 1*60*60,
                'BST' : 1*60*60,
                'ET' : -5*60*60,
                'EST' : -5*60*60,
                'EDT' : -4*60*60,
                }
            timestamp_lo = date_parser(timestamp_str, fuzzy=True, tzinfos=tzinfos, default=default_lo)
            timestamp_hi = date_parser(timestamp_str, fuzzy=True, tzinfos=tzinfos, default=default_hi)
        except (ValueError, OverflowError, AttributeError, TypeError):
            # near all parse failures are due to URL dates without a day
            # specifier, e.g. /2014/04/
            timestamp_lo = None
            timestamp_hi = None

    elif parser=='dateparser':
        date_order = 'YMD'

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
    return lo.strftime(timestamp_format)


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

    # sort and return
    #bests.sort(key=lambda x: x['timestamp_lo'])

    return bests


def get_timestamp_published(html, url, **kwargs):
    '''
    Returns a timestamp dictionary that the input webpage was created on.

    See get_timestamp for details about the timestamp dictionary.
    '''

    xpaths = [

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

        # microdata paths
        ( None, '//*[@itemprop="datePublished"]/@content' ),
        ( None, '//*[@itemprop="datePublished"]/@datetime' ),
        #( None, '//*[@itemprop="datePublished"]' ),
        ( None, '//*[@property="datePublished"]/@content' ),
        ( None, '//*[@property="datePublished"]/@datetime' ),
        #( None, '//*[@property="datePublished"]' ),

        # custom xpaths
        ( 'angrystaffofficer.com',          '//time[contains(@class,"published")]' ),
        ( 'armscontrolwonk.com',            '//span[@class="date published time"]' ),
        ( 'csis.org',                       '//article[@role="article"]/p' ),
        ( 'elperuano.pe',                   '//article[@class="notatexto"]/p/b' ),
        ( 'elnacional.com.do',              '(//time[contains(@class,"entry-date")])[1]' ),
        #( 'foxnews.com',                    '//div[@class="article-date"]/time' ),
        #( 'nytimes.com',                    '//meta[@property="article:published"]/@content' ),
        ( 'spiegel.de',                     '//span[@class="article-function-date"]/b' ),
        ( 'spiegel.de',                     '//time/@datetime' ),
        ( 'thediplomat.com',                '//span[@itemprop="datePublished"]' ),
        ( 'time.com',                       '//div[contains(@class,"published-date")]' ),
        ( 'wsj.com',                        '//time' ),
        ]

    return get_timestamp(html, url, xpaths, use_url_date=True, **kwargs)


def get_timestamp_modified(html, url, **kwargs):
    '''
    Returns a timestamp dictionary that the input webpage was modified/updated on.

    See get_timestamp for details about the timestamp dictionary.
    '''
    xpaths = [
        # meta xpaths
        ( None, '//meta[@property="rnews:dateModified"]/@content' ),
        ( None, '//meta[@property="article:modified_time"]/@content' ),
        ( None, '//meta[@property="og:modified_time"]/@content' ),

        # microdata paths
        ( None, '//*[@itemprop="dateModified"]/@content' ),
        ( None, '//*[@itemprop="dateModified"]/@datetime' ),
        ( None, '//*[@itemprop="dateModified"]' ),
        ( None, '//*[@property="dateModified"]/@content' ),
        ( None, '//*[@property="dateModified"]/@datetime' ),
        ( None, '//*[@property="dateModified"]' ),

        # xpaths
        ( 'angrystaffofficer.com',          '//time[contains(@class,"updated")]' ),
        #( 'nytimes.com',                    '//meta[@property="article:modified"]/@content' ),
        ]
    return get_timestamp(html, url, xpaths, use_url_date=False, **kwargs)


def get_timestamp(html, url, xpaths, use_url_date=False, require_valid_for_hostname=True, fast=True):
    '''
    '''
    parser = lxml.html.fromstring(html)
    url_parsed = urlparse(url)
    url_hostname = url_parsed.hostname

    timestamps = []

    # get timestamp from url
    if use_url_date:
        _STRICT_DATE_REGEX_PREFIX = r'(?<=\W)'
        DATE_REGEX = r'([\./\-_]{0,1}(19|20)\d{2})[\./\-_]{0,1}(([0-3]{0,1}[0-9][\./\-_])|(\w{3,5}[\./\-_]))([0-3]{0,1}[0-9][\./\-]{0,1})?'
        STRICT_DATE_REGEX = _STRICT_DATE_REGEX_PREFIX + DATE_REGEX
        date_match = re.search(STRICT_DATE_REGEX, url)
        if date_match:
            timestamp_str = date_match.group(0)
            timestamp = parse_timestamp_str(timestamp_str)
            timestamp['is_valid_for_hostname'] = True
            timestamp['pattern'] = ['url']
            timestamps.append(timestamp)

    # get timestamps from xpaths
    for hostname,xpath in xpaths:
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
                timestamp['is_valid_for_hostname'] = hostname is None or hostname in url_hostname
                timestamp['pattern'] = xpath
                timestamps.append(timestamp)

    # extract the best timestamp from the list of available timestamps
    best_timestamps = get_best_timestamps(timestamps)

    # calculate the range of timestamps appearing on the page
    min_lo = None
    max_hi = None
    for best in best_timestamps:
        # modified timestamps include worst case timezones if no timezone specified
        best_lo_mod = best['timestamp_lo']
        if best_lo_mod.tzinfo is None:
            best_lo_mod = copy.copy(best_lo_mod).replace(tzinfo = worst_tz_lo)
        best_hi_mod = best['timestamp_hi']
        if best_hi_mod.tzinfo is None:
            best_hi_mod = copy.copy(best_hi_mod).replace(tzinfo = worst_tz_hi)

        # update min/max
        if min_lo is None or best_lo_mod < min_lo:
            min_lo = best_lo_mod
        if max_hi is None or best_hi_mod > max_hi:
            max_hi = best_hi_mod

    if min_lo is not None and max_hi is not None:
        timestamp_range =  max_hi - min_lo

    # If the number of best_timestamps is too big,
    # then we are *probably* not looking at an article page,
    # but a "category" page that contains multiple articles within it.
    # In this case, we should return that there is no timestamp.
    # FIXME: This needs a lot more testing to understand if it works.
    if len(best_timestamps) == 1 or (
       0 < len(best_timestamps) <= 3 and abs(timestamp_range.total_seconds()) < 24*60*60):
        best_timestamp = best_timestamps[0]
    else:
        best_timestamp = None

    # filter special cases based on hostname
    if url_hostname=='www.cnbc.com':
        xpath = '//meta[@property="og:type"]/@content'
        for element in parser.xpath(xpath):
            if str(element) == 'website':
                best_timestamp = None
    if url_hostname=='elnacional.com.do':
        if url_parsed.path == '' or url_parsed.path == '/' or '/category/' in url_parsed.path:
            best_timestamp = None

    return best_timestamp, timestamps


def parse_timestamp_str_old(timestamp_str):
    '''
    Given a string representing a timestamp

    python date libraries:
    1. dateparser: https://blog.scrapinghub.com/2015/11/09/parse-natural-language-dates-with-dateparser
    1. natty: https://github.com/eadmundo/python-natty
    '''
    try:
        timestamp = date_parser(timestamp_str, fuzzy=True, tzinfos=None)
    except (ValueError, OverflowError, AttributeError, TypeError):
        # near all parse failures are due to URL dates without a day
        # specifier, e.g. /2014/04/
        timestamp = None

    # if the there is a string that could be in either MM-DD-YY or DD-MM-YY format
    # then we need to mark the day_month_format as ambiguous
    ambiguous_day_month = False
    match = re.search('[0-9][0-9].?[0-9][0-9].?[0-9][0-9]', timestamp_str)
    if match:
        ambiguous_day_month = True

    # return dictionary
    return {
        'timestamp' : timestamp,
        'raw' : timestamp_str,
        'accuracy' : None,
        'ambiguous_day_month' : ambiguous_day_month,
        }



    return get_timestamp(html, url, xpaths, use_url_date=True)
    xpaths = [
        # meta xpaths
        '//meta[@property="rnews:datePublished"]/@content',
        '//meta[@property="article:published_time"]/@content',
        '//meta[@property="og:published_time"]/@content',
        '//meta[@itemprop="datePublished"]/@datetime',
        '//meta[@pubdate="pubdate"]/@datetime',
        '//meta[@name="OriginalPublicationDate"]/@content',
        '//meta[@name="article_date_original"]/@content',
        '//meta[@name="publication_date"]/@content',
        '//meta[@name="sailthru.date"]/@content',
        '//meta[@name="PublishDate"]/@content',
        '//meta[@name="all_timestamps"]/@content',
        '//meta[@name="dc.Date"]/@content',

        # content xpaths
        '//span[@class="date published time"]' ,                    # armscontrolwonk.com
        '//div[@class="date date--v2"]',                            # bbc.com
        '//article[@role="article"]/p' ,                            # csis.org
        '//div[@class="td-post-author-name"]/a' ,                   # dailynk.com
        '//article[@class="notatexto"]/p/b' ,                       # elperuano.pe
        '//time[contains(@class,"entry-date")]',           # elnacional.com.do
        #'//article//div[class="tdb-block-inner td-fix-index"]/time[contains(@class,"entry-date")]',           # elnacional.com.do
        '//div[@class="article-date"]/time',                        # foxnews.com
        #'//p[@class="timestamp"]/time',                             # politico.eu
        '//span[@class="article-function-date"]/b',                 # speigel.de
        #'//time[contains(@class,"published")]/@datetime',                                         # speigel.de
        '//time/@datetime',                                         # speigel.de
        '//span[@class="published_date"]',                          # stripes.com
        '//span[@itemprop="datePublished"]',                        # thediplomat.com
        '//span[@itemprop="dateModified"]/@content',                # thediplomat.com
        '//span[@class="PostByline-date"]',                         # theintercept.com
        '//div[contains(@class,"published-date")]',                 # time.com
        ]
    return get_timestamp(html, url, xpaths, use_url_date=True)
