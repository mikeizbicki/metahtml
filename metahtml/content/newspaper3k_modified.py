import lxml
from urllib.parse import urlparse

def modified_fulltext(parser, language, url):
    '''
    Adapted from https://github.com/codelucas/newspaper/blob/master/newspaper/api.py#L71
    but modified to use an already existing lxml parser
    '''
    url_parsed = urlparse(url)

    from newspaper.cleaners import DocumentCleaner
    from newspaper.configuration import Configuration
    from newspaper.extractors import ContentExtractor
    from newspaper.outputformatters import OutputFormatter

    config = Configuration()
    config.language = language
    config.keep_article_html = True
    extractor = ContentExtractor(config)
    document_cleaner = DocumentCleaner(config)
    output_formatter = OutputFormatter(config)

    doc = parser
    doc = clean(document_cleaner,doc)
    #doc = document_cleaner.clean(doc)
    doc = calculate_best_node(extractor,doc)
    #doc = extractor.calculate_best_node(doc)
    if doc is not None:
        #doc = extractor.add_siblings(doc)
        doc = post_cleanup(doc)
        #doc = extractor.post_cleanup(doc)
        text, html = get_formatted(doc)
        #text, html = output_formatter.get_formatted(doc)
    else:
        text = ''
        html = ''

    return {
        'value' : {
            'text' : text,
            'html' : html,
            },
        'pattern' : 'modified',
        }



################################################################################
# major structural functions

# precompiled xpaths
cxpath_content_nodes = lxml.etree.XPath('(descendant::pre)|(descendant::p)|(descendant::td)')
cxpath_a = lxml.etree.XPath('descendant::a')

def calculate_best_node(self, doc):

    # find nodes that are likely to contain content;
    # this is done by looping through all nodes that match the cxpath_content_nodes xpath,
    # then removing nodes that have too few stop words or too high of a link density
    # (these nodes are likely to be navigation/menu bars
    nodes_with_text = []
    for node in cxpath_content_nodes(doc):
        node_text = text_content(node)
        word_stats = self.stopwords_class(language=self.language).get_stopword_count(node_text)
        if word_stats.get_stopword_count() > 2 and not is_highlink_density(node):
            nodes_with_text.append((node,word_stats))

    # compute the parent and grandparent nodes of the nodes_with_text;
    # for each of these ancestors, compute the total number of children nodes
    # and a "gravityScore" that measures the likelihood that the node is the root of the document
    parent_nodes = []
    starting_boost = 1.0
    bottom_negativescore_nodes = len(nodes_with_text) * 0.25
    for i,(node,word_stats) in enumerate(nodes_with_text):
        
        # calculate the "upscore" for the node 
        boost_score = 0
        # boost
        if is_boostable(self,node):
            boost_score = (1.0 / starting_boost) * 50
            starting_boost += 1
        # nodes_number
        if len(nodes_with_text) > 15:
            if (len(nodes_with_text) - i) <= bottom_negativescore_nodes:
                booster = bottom_negativescore_nodes - (len(nodes_with_text) - i)
                boost_score = -pow(booster, 2)
                negscore = abs(boost_score) 
                if negscore > 40:
                    boost_score = 5

        upscore = int(word_stats.get_stopword_count() + boost_score)

        parent_node = node.getparent()
        parent_node.set('gravityScore',str(float(parent_node.attrib.get('gravityScore',0))+upscore))
        #parent_node.set('gravityNodes',str(float(parent_node.attrib.get('gravityNodes',0))+1))

        if parent_node not in parent_nodes:
            parent_nodes.append(parent_node)

        # Parent of parent node
        parent_parent_node = parent_node.getparent()
        if parent_parent_node is not None:
            parent_parent_node.set('gravityScore',str(float(parent_parent_node.attrib.get('gravityScore',0))+upscore/2))
            #parent_parent_node.set('gravityNodes',str(float(parent_parent_node.attrib.get('gravityNodes',0))+1))
            if parent_parent_node not in parent_nodes:
                parent_nodes.append(parent_parent_node)

    # return the ancestor node with the highest "gravityScore" as the root of the document
    top_node = None
    top_node_score = 0
    for e in parent_nodes:
        score = float(e.attrib.get('gravityScore',0))
        if score > top_node_score or top_node is None:
            top_node = e
            top_node_score = score

    return top_node

#def post_cleanup(self, node):
    #"""Remove any divs that looks like non-content, clusters of links,
    #or paras with no gusto; add adjacent nodes which look contenty
    #"""
    ##node = self.add_siblings(top_node)
    #for e in self.parser.getChildren(node):
        #e_tag = self.parser.getTag(e)
        #if e_tag != 'p':
            #if self.is_highlink_density(e):
                #self.parser.remove(e)
    #return node

def post_cleanup(node):
    """Remove any divs that looks like non-content, clusters of links,
    or paras with no gusto; add adjacent nodes which look contenty
    """
    #node = flatten_divs(node)
    for e in node.getchildren():
        if e.tag != 'p':
            if is_highlink_density(e):
                remove_node_keep_tail(e)
    return node


##############################
# cleaning

# precompiled xpaths
cxpath_body = lxml.etree.XPath('descendant-or-self::body')
cxpath_article = lxml.etree.XPath('descendant::article')
cxpath_script_style_comments = lxml.etree.XPath('(descendant-or-self::script)|(descendant-or-self::style)|(descendant-or-self::comment())')
cxpath_div = lxml.etree.XPath('(descendant-or-self::div)')

# precompiled regexes
remove_nodes_re = (
    "^side$|combx|retweet|mediaarticlerelated|menucontainer|"
    "navbar|storytopbar-bucket|utility-bar|inline-share-tools"
    "|comment|PopularQuestions|contact|foot|footer|Footer|footnote"
    "|cnn_strycaptiontxt|cnn_html_slideshow|cnn_strylftcntnt"
    "|links|meta$|shoutbox|sponsor"
    "|tags|socialnetworking|socialNetworking|cnnStryHghLght"
    "|cnn_stryspcvbx|^inset$|pagetools|post-attributes"
    "|welcome_form|contentTools2|the_answers"
    "|communitypromo|runaroundLeft|subscribe|vcard|articleheadings"
    "|date|^print$|popup|author-dropdown|tools|socialtools|byline"
    "|konafilter|KonaFilter|breadcrumbs|^fn$|wp-caption-text"
    "|legende|ajoutVideo|timestamp|js_replies"
)
regexp_namespace = "http://exslt.org/regular-expressions"
nauthy_ids_re = ("//*[re:test(@id, '%s', 'i')]" % remove_nodes_re)
nauthy_classes_re = ("//*[re:test(@class, '%s', 'i')]" % remove_nodes_re)
nauthy_names_re = ("//*[re:test(@name, '%s', 'i')]" % remove_nodes_re)
div_to_p_re = r"<(a|blockquote|dl|div|img|ol|p|pre|table|ul)"
caption_re = "^caption$"
google_re = " google "
entries_re = "^[^entry-]more.*$"
facebook_re = "[^-]facebook"
facebook_broadcasting_re = "facebook-broadcasting"
twitter_re = "[^-]twitter"

# FIXME:
# probably better results by merging these two lists
cxpaths_rm = [
    lxml.etree.XPath(
        "//*[re:test(@%s, '%s', 'i')]" % (selector, pattern),
        namespaces={'re': "http://exslt.org/regular-expressions"}
        )
    for selector in ['id','class','name'] for pattern in [
        "^caption$",
        " google ",
        "^[^entry-]more.*$",
        "[^-]facebook",
        "facebook-broadcasting",
        "[^-]twitter",
        remove_nodes_re,
        ]
    ]


#tablines_replacements = ReplaceSequence().create("\n", "\n\n").append("\t").append("^\\s+$")
contains_article = './/article|.//*[@id="article"]|.//*[@itemprop="articleBody"]'

def clean(self, doc):

    # delete nodes that never contain content
    for node in cxpath_script_style_comments(doc):
        remove_node_keep_tail(node)

    # removes the `class` attribute from the <body> tag because
    # if there is a bad match, the entire DOM will be empty!
    import itertools
    #for tag in itertools.chain(cxpath_body(doc), cxpath_body(cxpath_article)):
    for tag in itertools.chain(cxpath_body(doc), cxpath_article(doc)):
        for attrib in ['id', 'name', 'class']:
            try:
                del tag.attrib[attrib]
            except KeyError:
                pass

    # delete nodes based on their id/name/class
    for cxpath_rm in cxpaths_rm:
        for node in cxpath_rm(doc):
            remove_node_keep_tail(node)

    # convert all div tag into p tags
    #doc_to_clean = self.div_to_para(doc, 'div')
    #doc_to_clean = self.div_to_para(doc, 'span')
    #doc_to_clean = self.div_to_para(doc, 'section')
    #divs = cxpath_div(doc)
    #for div in divs:
        #div.tag = 'p'
    #doc = flatten_divs(doc)

    return doc

def flatten_divs(doc):
    '''
    <div>
        a
        <div>
        b
        </div>
        c
        <div>
            d
            <div>
            e
            </div>
            f
        </div>
        g
        <div>
        h
        </div>
        i
    </div>

    <p>a</p>
    <p>b</p>
    <p>c</p>
    <p>d</p>
    <p>e</p>
    <p>f</p>
    <p>g</p>
    <p>h</p>
    <p>i</p>
    '''

    # taken from https://www.w3schools.com/html/html_blocks.asp
    blockelements = [
        "address",
        "article",
        "aside",
        "blockquote",
        "canvas",
        "dd",
        "div",
        "dl",
        "dt",
        "fieldset",
        "figcaption",
        "figure",
        "footer",
        "form",
        "h1",
        "h2",
        "h3",
        "h4",
        "h5",
        "h6",
        "header",
        "hr",
        "li",
        "main",
        "nav",
        "noscript",
        "ol",
        "p",
        "pre",
        "section",
        "table",
        "tfoot",
        "ul",
        "video",
        ]

    allowable_containers = [
        "address",
        "aside",
        "article",
        "section",
        "figure",
        "form",
        "fieldset",
        "footer",
        "header",
        "main",
        "noscript",
        "nav",
        "table",
        "tbody",
        "thead",
        "tfoot",
        "ol",
        "ul",
        "li",
        "dl",
        "dt",
        "dd",
        "video",
        'div',
        ]

    inline_tags = [
        'a',
        'abbr',
        'acronym',
        'audio',
        'b',
        'bdi',
        'bdo',
        'big',
        'br',
        'button',
        'canvas',
        'cite',
        'code',
        'data',
        'datalist',
        'del',
        'dfn',
        'em',
        'embed',
        'i',
        'iframe',
        'img',
        'input',
        'ins',
        'kbd',
        'label',
        'map',
        'mark',
        'meter',
        'noscript',
        'object',
        'output',
        'picture',
        'progress',
        'q',
        'ruby',
        's',
        'samp',
        'script',
        'select',
        'slot',
        'small',
        'span',
        'strong',
        'sub',
        'sup',
        'svg',
        'template',
        'textarea',
        'time',
        'u',
        'tt',
        'var',
        'wbr',
        ]

    tags_to_remove = [
        'svg',
        'iframe',
        'label',
        'form',
        'button',
        'submit',
        'textarea',
        'input',
        ]


    blockelements_to_p = [
        "div",
        ]


    def go(doc, move_nodes=True):
        nodes_to_remove = []
        for child in doc.getchildren():
            if child.tag in tags_to_remove:
                nodes_to_remove.append(child)
            else:
                child = go(child)
        for node in nodes_to_remove:
            remove_node_keep_tail(node)

        if move_nodes:
            nodes_to_move = []
            for child in doc.getchildren():
                if child.tag in blockelements and child.tag not in allowable_containers:
                    nodes_to_move.append(child)
            for node in nodes_to_move:
                doc.remove(node)
                doc.addnext(node)

        has_text = doc.text is not None and doc.text.strip() != ''
        if not has_text and len(doc)==0:
            remove_node_keep_tail(doc)

        return doc

    doc = go(doc, move_nodes=False)
    return doc

    '''
    def update_children(doc, new_children):
        #doc2 = copy.deepcopy(doc)
        #text = doc2.text
        #tail = doc2.tail
        #attrib = doc2.attrib
        #doc.clear()
        for child in new_children:
            print("doc.tag=",doc.tag, 'child.tag=',child.tag)
            doc.append(copy.deepcopy(child))
        #for k,v in attrib.items():
            #doc.set(k,v)
        return doc

    def go(doc):
        #if doc.tag in tags_to_remove:
            #return []
        #else:
        new_children = []
        for child in doc.getchildren():
            child_children = go(child)
            child = update_children(child,child_children)
            new_children.append(child)
        return new_children
            
    
    new_children = go(doc)
    doc = update_children(doc,new_children)
    return doc
    '''

    '''
    def go(doc):
        print('go doc.tag=',doc.tag)
        new_children = []
        #if doc.tag in allowable_containers:
            #new_doc = flatten_divs(doc)
            #new_children.append(new_doc)

        if doc.tag in tags_to_remove:
            #new_children.append(doc)
            pass
        else:
            if True: #doc.tag in allowable_containers:
                #if doc.text:
                if doc.text:
                    text_stripped = doc.text #.strip()
                else:
                    text_stripped = ''
                if len(text_stripped)>0:
                    if doc.tag in blockelements_to_p:
                        newtag = 'p'
                    else:
                        newtag = doc.tag
                    node = lxml.etree.Element(newtag)
                    node.text = text_stripped
                    new_children.append(node)

                for child in doc.getchildren():
                    if child.tag in inline_tags and child.tag not in tags_to_remove:
                        if len(new_children)==0:
                            node = lxml.etree.Element('p')
                            node.text = ''
                            new_children.append(node)
                        tmp_num = len(new_children[-1])
                        new_children[-1].insert(tmp_num,child)
                    else:
                        new_children += go(child)

            if doc.tail:
                node = lxml.etree.Element('p')
                node.text = doc.tail
                new_children.append(node)

        return new_children

    new_doc = lxml.etree.Element(doc.tag)
    for i,child in enumerate(new_children):
        new_doc.insert(i,child)
    for k,v in doc.attrib.items():
        new_doc.set(k,v)
    return new_doc
    '''


import lxml.html.clean
article_cleaner = lxml.html.clean.Cleaner()
article_cleaner.javascript = True
article_cleaner.style = True
article_cleaner.remove_unknown_tags = False
article_cleaner.allow_tags = [
    'p', 'blockquote',
    'tt', 'pre', 'code',
    'h1', 'h2', 'h3', 'h4', 'h5', 'h6',
    'ul', 'ol', 'li', 'dl', 'dt', 'dd',
    'a',
    # 'span', 'br', 'strong', 'b', 'em', 'i', 'img', 'div'
    ]

def get_formatted(node):
    """Returns the body text of an article, and also the body article
    html if specified. Returns in (text, html) form
    """

    # clear the html
    cleaned = article_cleaner.clean_html(node)
    #cleaned = node
    html = lxml.etree.tostring(cleaned,method='html').decode('utf-8')

    text = ''
    #self.links_to_text()
    #self.add_newline_to_br()
    #self.add_newline_to_li()
    #self.replace_with_text()
    #self.remove_empty_tags()
    #self.remove_trailing_media_div()
    #text = self.convert_to_text()
    # print(self.parser.nodeToString(self.get_top_node()))
    return (text, html)

################################################################################
# utility helper functions

# FIXME: remove all calls to this function?
def text_content(node):
    try:
        return node.text_content()
    except ValueError:
        return ''
    txts = [i for i in node.itertext()]
    return innerTrim(' '.join(txts).strip())

import re
TABSSPACE = re.compile(r'[\s\t]+')
def innerTrim(value):
    if isinstance(value, str):
        # remove tab and white space
        value = re.sub(TABSSPACE, ' ', value)
        value = ''.join(value.splitlines())
        return value.strip()
    return ''


def remove_node_keep_tail(node):
    '''
    The simplest way to remove a node from the lxml parse tree is to directly remove it from the parent with the code:

    > node.getparent().remove(node)

    This can have unexpected behavior when tags have tail text,
    as the tail text will also be removed.
    This function removes the html tag without removing the tail text.

    For details on tail text, see: https://docs.python.org/3/library/xml.etree.elementtree.html#xml.etree.ElementTree.Element.tail
    '''
    parent = node.getparent()
    if parent is not None:
        if node.tail:
            prev = node.getprevious()
            if prev is None:
                if not parent.text:
                    parent.text = ''
                parent.text += ' ' + node.tail
            else:
                if not prev.tail:
                    prev.tail = ''
                prev.tail += ' ' + node.tail
        node.clear()
        parent.remove(node)


def is_boostable(self, node):
    """A lot of times the first paragraph might be the caption under an image
    so we'll want to make sure if we're going to boost a parent node that
    it should be connected to other paragraphs, at least for the first n
    paragraphs so we'll want to make sure that the next sibling is a
    paragraph and has at least some substantial weight to it.
    """
    minimum_stopword_count = 5
    max_stepsaway_from_node = 3

    nodes = node.itersiblings(preceding=True)
    for i,current_node in enumerate(nodes):
        if current_node.tag == 'p':
            if i >= max_stepsaway_from_node:
                return False
            paragraph_text = text_content(current_node)
            word_stats = self.stopwords_class(language=self.language).get_stopword_count(paragraph_text)
            if word_stats.get_stopword_count() > minimum_stopword_count:
                return True
    return False


# FIXME: use this instead?
def link_density_score(node):
    def count_alnum(s):
        return sum([1 for c in s if c.isalnum()])
    text_alnum = count_alnum(text_content(node))
    links = cxpath_a(node)
    links_alnum = sum([count_alnum(text_content(link)) for link in links ])
    return links_alnum*len(links)/text_alnum


def is_highlink_density(e):
    """Checks the density of links within a node, if there is a high
    link to text ratio, then the text is less likely to be relevant
    """
    #links = self.parser.getElementsByTag(e, tag='a')
    links = cxpath_a(e)
    if not links:
        return False

    text = text_content(e)
    words = [word for word in text.split() if word.isalnum()]
    if not words:
        return True
    words_number = float(len(words))
    sb = []
    for link in links:
        sb.append(text_content(link))

    link_text = ''.join(sb)
    link_words = link_text.split()
    num_link_words = float(len(link_words))
    num_links = float(len(links))
    link_divisor = float(num_link_words / words_number)
    score = float(link_divisor * num_links)
    if score >= 1.0:
        return True
    return False
    # return True if score > 1.0 else False

