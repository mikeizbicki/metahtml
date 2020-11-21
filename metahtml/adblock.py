
# The following code uses adblockplus formatted filters for removing content from webpages
# For details on the fileformat, see 
# https://help.eyeo.com/en/adblockplus/how-to-write-filters#content-filters
#
# FIXME: 
# Currently, only simple filters containing a single class/id to be filtered are supported.
# This is because the lxml parser is super slow when handling tens of thousands of unioned xpaths,
# and so we must manually create our own parser.
from collections import defaultdict
filter_xpaths = defaultdict(lambda: [])
filter_xpaths_compiled = {}

global_filter_class = set()
global_filter_id = set()

def load_adblocks():
    # load the raw rules from the files
    import glob
    for filename in glob.glob('rules/ad/*.txt'):
        with open(filename) as f:
            print('loading ',filename,'...',end='')
            for line in f:
                if '##' in line and '#?#' not in line:
                    try:
                        hostnames,pattern = line.split('##',maxsplit=1)
                    except:
                        print("line=",line)
                        assert(False)

                    try:
                        cssselector = lxml.cssselect.CSSSelector(pattern)
                        for hostname in hostnames.split(','):
                            if hostname=='':
                                if not any(x in pattern for x in [' ',',','>','*','[',']','=','~','^']):
                                    if pattern[0] == '#':
                                        global_filter_id.add(pattern[1:].strip())
                                    if pattern[0] == '.':
                                        global_filter_class.add(pattern[1:].strip())
                                else:
                                    filter_xpaths[''].append(cssselector.path.strip())
                                    pass
                            else:
                                filter_xpaths[hostname].append(cssselector.path)
                    except:
                        pass

            print('done.')

    # compile the rules
    for hostname,rules in filter_xpaths.items():
        rule = '|'.join(list(set(rules)))
        try:
            filter_xpaths_compiled[hostname] = lxml.etree.XPath(rule)
        except:
            print("hostname=",hostname)
            print("rule=",rule)
            assert(False)

#load_adblocks()

# FIXME:
# this is all temporary debugging output and should be removed
if False:
    print("len(filter_xpaths[''])=",len(set(filter_xpaths[''])))
    print("len(set(filter( lambda x: ' ' in x, filter_xpaths[''])))=",len(set(filter( lambda x: ' ' in x, filter_xpaths['']))))
    print("len(global_filter_class)=",len(global_filter_class))
    print("len(global_filter_id)=",len(global_filter_id))

    print("'absolute' in global_filter_class=",'absolute' in global_filter_class)
    print("len(filter_xpaths[''])=",len(filter_xpaths['']))


def rm_ads(parser):
    doc = parser.doc
    hostname = parser.url_parsed.hostname

    # FIXME: ad filtering breaks
    # file:///home/user/proj/metahtml/tests/.cache/https___www.upi.com_Top_News_World-News_2020_04_21_South-Korean-presidents-office-No-signs-Kim-Jong-Un-in-dire-health_194158744128039450f97/2020-06-02.diff.html
    if hostname in ['www.upi.com']:
        return

    # remove the simple global filters first with just a single pass through the tree
    nodes_to_remove = []
    for node in doc.iter():
        _classes = node.attrib.get('class','').split()
        for _class in _classes:
            if _class in global_filter_class:
                #print("_class=",_class)
                nodes_to_remove.append(node)
        _ids = node.attrib.get('id','').split()
        for _id in _ids:
            if _id in global_filter_id:
                #print("_id=",_id)
                nodes_to_remove.append(node)
    for node in nodes_to_remove:
        remove_node_keep_tail(node)

    # remove hostname-specific xpaths;
    # this requires one pass through the doc tree for each xpath
    from itertools import chain
    cssselectors = []
    #cssselectors = [filter_xpaths_compiled['']]
    if hostname in filter_xpaths_compiled.keys():
        cssselectors.append(filter_xpaths_compiled[hostname])
    for cssselector in cssselectors:
        nodes = cssselector(doc)
        for node in nodes:
            #print("node=",node)
            remove_node_keep_tail(node)
    return doc

