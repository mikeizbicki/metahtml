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

from metahtml.property.__common__ import BaseExtractor #get_timestamp, compile_jsonpaths, compile_xpaths, compile_regexes

class TimestampExtractor(BaseExtractor):
    @staticmethod
    def str_to_result(timestamp_str, parse_method=None):
        '''
        Given a string representing a timestamp

        python date libraries:
        1. dateparser: https://blog.scrapinghub.com/2015/11/09/parse-natural-language-dates-with-dateparser
        1. natty: https://github.com/eadmundo/python-natty
        '''

        # don't waste our time parsing if no timestamp_str was passed in
        if timestamp_str is None or len(timestamp_str)==0:
            return None

        parse_method = None
        # if no parse_method specified, then try them all
        #if parse_method is None:
            #parse_method = 'dateutil'
            #result = str_to_result(timestamp_str, parse_method='dateutil')
            #if result['value']['lo'] is None:
                #result = str_to_result(timestamp_str, parse_method='dateparser')
            #return result

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
                # in this case we do nothing and let the next parse_method take over
                except ValueError:
                    pass

            # if we found a timestamp with one of the patterns above, 
            # then we set the parse_method variable to the corresponding pattern;
            # this skips the parsing code below
            if timestamp_lo is not None:
                parse_method='int:'+pattern

        # parse the date
        if parse_method is None:
            parse_method = 'dateutil'
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
                    'AEST' : 9*60*60,
                    'BST' : 1*60*60,
                    'CDT' : -5*60*60,
                    'CEST' : 2*60*60,
                    'CET' : 1*60*60,
                    'CST' : -6*60*60,
                    'CT' : -5*60*60, # FIXME: technically, could be -5 or -6 depending on the day
                    'EDT' : -4*60*60,
                    'EST' : -5*60*60,
                    'ET' : -5*60*60,
                    'IDT' : 3*60*60,
                    'IST' : 5.5*60*60,
                    'JST' : 9*60*60,
                    'KST' : 9*60*60,
                    'MST' : -7*60*60,
                    'MYT' : 8*60*60,
                    'PDT' : -7*60*60,
                    'PST' : -8*60*60,
                    'PT' : -7*60*60, # FIXME: technically, could be -8 or -7 depending on the day
                    'UK' : 0*60*60,
                    'ZULU' : 0*60*60,
                    'ZZ' : 0*60*60,
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
                    parse_method = None

            except (ValueError, OverflowError, AttributeError, TypeError):
                # there was an error in the dateutil.parser.parse function call;
                # this is often due to URL dates without a day specifier, e.g. /2014/04/
                timestamp_lo = None
                timestamp_hi = None
                parse_method = None

        if parse_method is None:
            parse_method='dateparser'
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
            if timestamp_hi:
                if timestamp_hi.microsecond==0:
                    microsecond = 999999
                    if timestamp_hi.second==0:
                        second = 59
                        if timestamp_hi.minute==0:
                            minute  =59
                            if timestamp_hi.hour==0:
                                hour = 23
                            else:
                                hour = timestamp_hi.hour
                        else:
                            minute = timestamp_hi.minute
                            hour = timestamp_hi.hour
                    else:
                        second = timestamp_hi.second
                        minute = timestamp_hi.minute
                        hour = timestamp_hi.hour
                    timestamp_hi = datetime.datetime(
                        year            = timestamp_hi.year,
                        month           = timestamp_hi.month,
                        day             = timestamp_hi.day,
                        hour            = hour,
                        minute          = minute,
                        second          = second,
                        microsecond     = microsecond,
                        tzinfo          = timestamp_hi.tzinfo
                        )

        # return dictionary
        return {
            'value': {
                'lo' : timestamp_lo,
                'hi' : timestamp_hi,
                },
            'raw' : timestamp_str,
            'parse_method' : parse_method,
            'pattern' : 'unknown',
            }


    @staticmethod
    def result_to_str(timestamp):
        '''
        Converts a timestamp into a string with the appropriate accuracy.
        '''
        if timestamp is None or timestamp['best'] is None:
            return
        timestamp_format = ''
        lo = timestamp['best']['value']['lo']
        hi = timestamp['best']['value']['hi']
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


    @staticmethod
    def filter_results(timestamps, require_valid_for_hostname=True):
        '''
        Takes as input a list of timestamp dictionaries,
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

            # skip timestamps that have obviously invalid dates
            if timestamp['value']['hi'].year < 1600 or timestamp['value']['lo'].year > 2030:
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

        # if best_timestamps contains both the int parse_method and another parse_method,
        # we should ignore the int parse_method because website admins frequently use int wrong;
        # (they should be a unix epoch timestamp, but they're not)
        # FIXME:
        # is this really necessary if the 'int' parse_method contains all the edge cases?
        parse_methods = []
        for best in bests:
            parse_methods.append(best['parse_method'])
        if len(parse_methods) > 1:
            bests_filtered = []
            for best in bests:
                if best['parse_method'] != 'int':
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
