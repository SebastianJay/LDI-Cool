#helper function for converting child => parent edge map to parent => list of children map
#also calculates node => indegree mapping used for toposort
def _buildTopoMapping(pmaps):
    mapping = {}
    indeg = {}
    for dest in pmaps:
        src = pmaps[dest]
        if src not in mapping:
            mapping[src] = []
        if dest not in mapping:
            mapping[dest] = []
        mapping[src].append(dest)
        if src not in indeg:
            indeg[src] = 0
        if dest not in indeg:
            indeg[dest] = 0
        indeg[dest] += 1
    return mapping, indeg

#takes string root node and string child => string parent map
#returns string[] of all classes, including root, in that parent's hierarchy
def subtreeList(pnode, pmaps):
    mapping = _buildTopoMapping(pmaps)[0]
    nodes = []
    pnodestack = [pnode]
    while len(pnodestack) > 0:
        parent = pnodestack.pop()
        nodes.append(parent)
        for child in mapping[parent]:
            pnodestack.append(child)
    return nodes

#takes mapping of string child => string parent
#returns string[] in toposorted order (starting with Object)
def toposort(pmaps):
    mapping, indeg = _buildTopoMapping(pmaps)

    toposorted = []
    iscycle = False
    while indeg:
        minind = 1
        minname = 'noname'
        for node in indeg:
            if indeg[node] < minind or (indeg[node] == 0 and node < minname):
                minname = node
                minind = indeg[node]
        if minind > 0:
            iscycle = True
            break
        else:
            toposorted.append(minname)
            for dest in mapping[minname]:
                indeg[dest] -= 1
            del indeg[minname]

    if iscycle:
        return False
    else:
        return toposorted
