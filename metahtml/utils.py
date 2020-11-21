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

