'''
'''

import copy
import lxml.etree


def newspaper_fulltext(parser, language):
    '''
    Adapted from https://github.com/codelucas/newspaper/blob/master/newspaper/api.py#L71
    but modified to use an already existing lxml parser
    '''
    from newspaper.cleaners import DocumentCleaner
    from newspaper.configuration import Configuration
    from newspaper.extractors import ContentExtractor
    from newspaper.outputformatters import OutputFormatter

    config = Configuration()
    config.language = language
    extractor = ContentExtractor(config)
    document_cleaner = DocumentCleaner(config)
    output_formatter = OutputFormatter(config)
    doc = parser
    doc = document_cleaner.clean(doc)
    top_node = extractor.calculate_best_node(doc)
    if top_node is not None:
        top_node = extractor.post_cleanup(top_node)
        text, html = output_formatter.get_formatted(top_node)
    else:
        text = None
        html = None

    return {
        'value' : {
            'text' : text,
            'html' : html,
            },
        'pattern' : 'newspaper3k',
        }

def modified_fulltext(parser, language):
    '''
    Adapted from https://github.com/codelucas/newspaper/blob/master/newspaper/api.py#L71
    but modified to use an already existing lxml parser
    '''
    from newspaper.cleaners import DocumentCleaner
    from newspaper.configuration import Configuration
    from newspaper.extractors import ContentExtractor
    from newspaper.outputformatters import OutputFormatter

    def calculate_best_node(self, doc):
        top_node = None
        cxpath_body_nodes = lxml.etree.XPath('(//pre)|(//p)|(//td)')
        #nodes_to_check = self.nodes_to_check(doc)
        starting_boost = float(1.0)
        #cnt = 0
        #i = 0
        parent_nodes = []
        nodes_with_text = []

        #for node in nodes_to_check:
        for node in cxpath_body_nodes(doc):
            text_node = self.parser.getText(node)
            word_stats = self.stopwords_class(language=self.language). \
                get_stopword_count(text_node)
            high_link_density = self.is_highlink_density(node)
            if word_stats.get_stopword_count() > 2 and not high_link_density:
                nodes_with_text.append(node)

        nodes_number = len(nodes_with_text)
        negative_scoring = 0
        bottom_negativescore_nodes = float(nodes_number) * 0.25

        #for node in nodes_with_text:
        for i,node in enumerate(nodes_with_text):
            boost_score = float(0)
            # boost
            if self.is_boostable(node):
                #if cnt >= 0:
                if i >= 0:
                    boost_score = float((1.0 / starting_boost) * 50)
                    starting_boost += 1
            # nodes_number
            if nodes_number > 15:
                if (nodes_number - i) <= bottom_negativescore_nodes:
                    booster = float(
                        bottom_negativescore_nodes - (nodes_number - i))
                    boost_score = float(-pow(booster, float(2)))
                    negscore = abs(boost_score) + negative_scoring
                    if negscore > 40:
                        boost_score = float(5)

            text_node = self.parser.getText(node)
            word_stats = self.stopwords_class(language=self.language). \
                get_stopword_count(text_node)
            upscore = int(word_stats.get_stopword_count() + boost_score)

            parent_node = self.parser.getParent(node)
            self.update_score(parent_node, upscore)
            self.update_node_count(parent_node, 1)

            if parent_node not in parent_nodes:
                parent_nodes.append(parent_node)

            # Parent of parent node
            parent_parent_node = self.parser.getParent(parent_node)
            if parent_parent_node is not None:
                self.update_node_count(parent_parent_node, 1)
                self.update_score(parent_parent_node, upscore / 2)
                if parent_parent_node not in parent_nodes:
                    parent_nodes.append(parent_parent_node)
            #cnt += 1
            #i += 1

        top_node_score = 0
        for e in parent_nodes:
            score = self.get_score(e)

            if score > top_node_score:
                top_node = e
                top_node_score = score

            if top_node is None:
                top_node = e
        return top_node

    config = Configuration()
    config.language = language
    extractor = ContentExtractor(config)
    document_cleaner = DocumentCleaner(config)
    output_formatter = OutputFormatter(config)
    doc = parser
    #doc = document_cleaner.clean(doc)
    top_node = calculate_best_node(extractor,doc)
    if top_node is not None:
        top_node = extractor.post_cleanup(top_node)
        text, html = output_formatter.get_formatted(top_node)
    else:
        text = None
        html = None

    return {
        'value' : {
            'text' : text,
            'html' : html,
            },
        'pattern' : 'modified',
        }

# FIXME: Implement this function from scratch using the spacy or polyglot library for NLP support
def get_content(parser, url, html, meta_best, fast=False):

    contents = []

    try:
        val = modified_fulltext(parser, meta_best['lang']['lang'][:2])
    except:
        val = modified_fulltext(parser, 'en')

    contents.append(val)
    return contents[0],contents
