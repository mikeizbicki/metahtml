'''
'''

import lxml
from urllib.parse import urlparse
import re
import unicodedata

# helper for removing unicode punctuation from latin strings
# https://lexsrv3.nlm.nih.gov/LexSysGroup/Projects/lvg/current/docs/designDoc/UDF/unicode/DefaultTables/symbolTable.html
unicode_punctuation = {
    '\u00AB':'"',
    '\u00AD':'-',
    '\u00B4':'\'',
    '\u00BB':'"',
    '\u00F7':'/',
    '\u01C0':'|',
    '\u01C3':'!',
    '\u02B9':'\'',
    '\u02BA':'"',
    '\u02BC':'\'',
    '\u02C4':'^',
    '\u02C6':'^',
    '\u02C8':'\'',
    '\u02CB':'`',
    '\u02CD':'_',
    '\u02DC':'~',
    '\u0300':'`',
    '\u0301':'\'',
    '\u0302':'^',
    '\u0303':'~',
    '\u030B':'"',
    '\u030E':'"',
    '\u0331':'_',
    '\u0332':'_',
    '\u0338':'/',
    '\u0589':':',
    '\u05C0':'|',
    '\u05C3':':',
    '\u066A':'%',
    '\u066D':'*',
    '\u200B':'',
    '\u2010':'-',
    '\u2011':'-',
    '\u2012':'-',
    '\u2013':'-',
    '\u2014':'-',
    '\u2015':'-',
    '\u2016':'|',
    '\u2017':'_',
    '\u2018':'\'',
    '\u2019':'\'',
    '\u201A':',',
    '\u201B':'\'',
    '\u201C':'"',
    '\u201D':'"',
    '\u201E':'"',
    '\u201F':'"',
    '\u2032':'\'',
    '\u2033':'"',
    '\u2034':'\'',
    '\u2035':'`',
    '\u2036':'"',
    '\u2037':'\'',
    '\u2038':'^',
    '\u2039':'<',
    '\u203A':'>',
    '\u203D':'?',
    '\u2044':'/',
    '\u204E':'*',
    '\u2052':'%',
    '\u2053':'~',
    '\u2060':' ',
    '\u20E5':'\\',
    '\u2212':'-',
    '\u2215':'/',
    '\u2216':'\\',
    '\u2217':'*',
    '\u2223':'|',
    '\u2236':':',
    '\u223C':'~',
    '\u2264':'<',
    '\u2265':'>',
    '\u2266':'<',
    '\u2267':'>',
    '\u2303':'^',
    '\u2329':'<',
    '\u232A':'>',
    '\u266F':'#',
    '\u2731':'*',
    '\u2758':'|',
    '\u2762':'!',
    '\u27E6':'[',
    '\u27E8':'<',
    '\u27E9':'>',
    '\u2983':'{',
    '\u2984':'}',
    '\u3003':'"',
    '\u3008':'<',
    '\u3009':'>',
    '\u301B':']',
    '\u301C':'~',
    '\u301D':'"',
    '\u301E':'"',
    '\uFEFF':'',
    }
def unidecode_punctuation(text):
    return ''.join(map(lambda c: unicode_punctuation.get(c,c), unicodedata.normalize('NFC',text)))


def title2str(title):
    if title is not None:
        return title['title']


_RE_COMBINE_WHITESPACE = re.compile(r"\s+")

def parse_title_str(text):
    return unidecode_punctuation(_RE_COMBINE_WHITESPACE.sub(" ", text).strip())
    #return text.strip().replace('\n', ' ').replace('\r', '')


def get_title(parser, url, fast=False):
    '''
    '''

    url_hostname = urlparse(url).hostname

    title = []

    xpaths = [
        ( None,                     '//title' ),
        ( None,                     '//h1' ),
        ( None,                     '//meta[@property="og:title"]/@content' ),
        ( None,                     '//meta[@name="og:title"]/@content' ),
        ( None,                     '//meta[@property="twitter:title"]/@content' ),
        ( None,                     '//meta[@name="twitter:title"]/@content' ),
        ( None,                     '//meta[@property="twitter:text:title"]/@content' ),
        ( None,                     '//meta[@name="twitter:text:title"]/@content' ),
        ]

    # get title from xpaths
    for hostname,xpath in xpaths:
        for element in parser.xpath(xpath):
            # element can be one of several different types of lxml objects;
            # depending on the type, we need to extract the text in different ways
            if type(element) is lxml.etree._ElementUnicodeResult:
                text = str(element)
            elif type(element) is lxml.etree._Element:
                text = element.text
            elif type(element) is lxml.html.HtmlElement:
                text = element.text_content()

            # register the title
            if text is not None:
                title.append({
                    'title' : parse_title_str(text),
                    'raw' : text,
                    'pattern' : xpath,
                    'is_valid_for_hostname' : hostname is None or hostname in url_hostname
                    })
                if fast:
                    break

    # return
    if len(title)>0:
        best_title = title[0]
    else:
        best_title = None
    return best_title, title



def get_title2(self, doc):
    """Fetch the article title and analyze it

    Assumptions:
    - title tag is the most reliable (inherited from Goose)
    - h1, if properly detected, is the best (visible to users)
    - og:title and h1 can help improve the title extraction
    - python == is too strict, often we need to compare filtered
      versions, i.e. lowercase and ignoring special chars

    Explicit rules:
    1. title == h1, no need to split
    2. h1 similar to og:title, use h1
    3. title contains h1, title contains og:title, len(h1) > len(og:title), use h1
    4. title starts with og:title, use og:title
    5. use title, after splitting
    """
    title = ''
    title_element = self.parser.getElementsByTag(doc, tag='title')
    # no title found
    if title_element is None or len(title_element) == 0:
        return title

    # title elem found
    title_text = self.parser.getText(title_element[0])
    used_delimeter = False

    # title from h1
    # - extract the longest text from all h1 elements
    # - too short texts (fewer than 2 words) are discarded
    # - clean double spaces
    title_text_h1 = ''
    title_element_h1_list = self.parser.getElementsByTag(doc,
                                                         tag='h1') or []
    title_text_h1_list = [self.parser.getText(tag) for tag in
                          title_element_h1_list]
    if title_text_h1_list:
        # sort by len and set the longest
        title_text_h1_list.sort(key=len, reverse=True)
        title_text_h1 = title_text_h1_list[0]
        # discard too short texts
        if len(title_text_h1.split(' ')) <= 2:
            title_text_h1 = ''
        # clean double spaces
        title_text_h1 = ' '.join([x for x in title_text_h1.split() if x])

    # title from og:title
    title_text_fb = (
    self.get_meta_content(doc, 'meta[property="og:title"]') or
    self.get_meta_content(doc, 'meta[name="og:title"]') or '')

    # create filtered versions of title_text, title_text_h1, title_text_fb
    # for finer comparison
    filter_regex = re.compile(r'[^\u4e00-\u9fa5a-zA-Z0-9\ ]')
    filter_title_text = filter_regex.sub('', title_text).lower()
    filter_title_text_h1 = filter_regex.sub('', title_text_h1).lower()
    filter_title_text_fb = filter_regex.sub('', title_text_fb).lower()

    # check for better alternatives for title_text and possibly skip splitting
    if title_text_h1 == title_text:
        used_delimeter = True
    elif filter_title_text_h1 and filter_title_text_h1 == filter_title_text_fb:
        title_text = title_text_h1
        used_delimeter = True
    elif filter_title_text_h1 and filter_title_text_h1 in filter_title_text \
            and filter_title_text_fb and filter_title_text_fb in filter_title_text \
            and len(title_text_h1) > len(title_text_fb):
        title_text = title_text_h1
        used_delimeter = True
    elif filter_title_text_fb and filter_title_text_fb != filter_title_text \
            and filter_title_text.startswith(filter_title_text_fb):
        title_text = title_text_fb
        used_delimeter = True

    # split title with |
    if not used_delimeter and '|' in title_text:
        title_text = self.split_title(title_text, PIPE_SPLITTER,
                                      title_text_h1)
        used_delimeter = True

    # split title with -
    if not used_delimeter and '-' in title_text:
        title_text = self.split_title(title_text, DASH_SPLITTER,
                                      title_text_h1)
        used_delimeter = True

    # split title with _
    if not used_delimeter and '_' in title_text:
        title_text = self.split_title(title_text, UNDERSCORE_SPLITTER,
                                      title_text_h1)
        used_delimeter = True

    # split title with /
    if not used_delimeter and '/' in title_text:
        title_text = self.split_title(title_text, SLASH_SPLITTER,
                                      title_text_h1)
        used_delimeter = True

    # split title with »
    if not used_delimeter and ' » ' in title_text:
        title_text = self.split_title(title_text, ARROWS_SPLITTER,
                                      title_text_h1)
        used_delimeter = True

    title = MOTLEY_REPLACEMENT.replaceAll(title_text)

    # in some cases the final title is quite similar to title_text_h1
    # (either it differs for case, for special chars, or it's truncated)
    # in these cases, we prefer the title_text_h1
    filter_title = filter_regex.sub('', title).lower()
    if filter_title_text_h1 == filter_title:
        title = title_text_h1

    return title

def split_title(self, title, splitter, hint=None):
    """Split the title to best part possible
    """
    large_text_length = 0
    large_text_index = 0
    title_pieces = splitter.split(title)

    if hint:
        filter_regex = re.compile(r'[^a-zA-Z0-9\ ]')
        hint = filter_regex.sub('', hint).lower()

    # find the largest title piece
    for i, title_piece in enumerate(title_pieces):
        current = title_piece.strip()
        if hint and hint in filter_regex.sub('', current).lower():
            large_text_index = i
            break
        if len(current) > large_text_length:
            large_text_length = len(current)
            large_text_index = i

    # replace content
    title = title_pieces[large_text_index]
    return TITLE_REPLACEMENTS.replaceAll(title).strip()
