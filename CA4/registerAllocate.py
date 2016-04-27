import deadcode
import TAC_serialize


# Takes a control flow graph, returns a register conflict graph
# with some precolored nodes on function returns
# of form temp => [set of conflicts, color(default to -1)]
def genRegGraph(cfg):
    regGraph = {"t0":[set(),0]}
    preColor = {"t0":0}
    deadcode.globalLiveCheck(cfg)
    for block in cfg.blocks:
        live = set(block.liveOut)
        debugOut = []
        # Update graph connections
        for t in live:
            if t not in regGraph:
                regGraph[t] = [set(),-1]
            for r in live:
                if r != t:
                    regGraph[t][0].add(r)

        for inst in reversed(block.instructions):
            # Killed when assigned
            killed = deadcode.getWritten(inst)
            if killed is not None and killed in live:
                live.remove(killed)
                if killed not in regGraph:
                    regGraph[killed] = [set(), -1]

            # Live when used
            used = deadcode.getRead(inst)
            if used is not None:
                for r in used:
                    live.add(r)

            # Update graph connections
            for t in live:
                if t not in regGraph:
                    regGraph[t] = [set(), -1]
                for r in live:
                    if r != t:
                        regGraph[t][0].add(r)
                if killed is not None and t != killed:
                    regGraph[t][0].add(killed)
                    regGraph[killed][0].add(t)

            # Allocate accumulator to return val of a function
            #TODO review TACClassAttr - probably change tacgen so that it never shows up here
            if isinstance(inst,TAC_serialize.TACCall):
                if isinstance(inst.assignee, TAC_serialize.TACRegister):
                    regGraph[inst.assignee.name][1] = 0
                    preColor[inst.assignee.name] = 0
                elif isinstance(inst.assignee, TAC_serialize.TACClassAttr):
                    regGraph[inst.assignee.reg.name][1] = 0
                    preColor[inst.assignee.reg.name] = 0
            elif isinstance(inst,TAC_serialize.TACReturn):
                if isinstance(inst.retval, TAC_serialize.TACRegister):
                    regGraph[inst.retval.name][1] = 0
                    preColor[inst.retval.name] = 0
                elif isinstance(inst.retval, TAC_serialize.TACClassAttr):
                    regGraph[inst.retval.reg.name][1] = 0
                    preColor[inst.retval.reg.name] = 0

            # Have to force multiplication and division result to rax
            elif isinstance(inst,TAC_serialize.TACOp2) and inst.opcode in ['*','/']:
                if isinstance(inst.assignee, TAC_serialize.TACRegister):
                    regGraph[inst.assignee.name][1] = 0
                    preColor[inst.assignee.name] = 0
                elif isinstance(inst.assignee, TAC_serialize.TACClassAttr):
                    regGraph[inst.assignee.reg.name][1] = 0
                    preColor[inst.assignee.reg.name] = 0
            # Malloc is a call, returns in rax
            elif isinstance(inst,TAC_serialize.TACMalloc):
                if isinstance(inst.assignee, TAC_serialize.TACRegister):
                    regGraph[inst.assignee.name][1] = 0
                    preColor[inst.assignee.name] = 0
                elif isinstance(inst.assignee, TAC_serialize.TACClassAttr):
                    regGraph[inst.assignee.reg.name][1] = 0
                    preColor[inst.assignee.reg.name] = 0
            # Allocate is somtimes a call, returns in rax in those cases
            elif isinstance(inst,TAC_serialize.TACAllocate):
                if inst.allop == 'new' or inst.ptype == 'Int' or inst.ptype == 'Bool' or inst.ptype == 'String':
                    if isinstance(inst.assignee, TAC_serialize.TACRegister):
                        regGraph[inst.assignee.name][1] = 0
                        preColor[inst.assignee.name] = 0
                    elif isinstance(inst.assignee, TAC_serialize.TACClassAttr):
                        regGraph[inst.assignee.reg.name][1] = 0
                        preColor[inst.assignee.reg.name] = 0
            
            # Force second argument/result into a register to avoid double memory errors
            elif isinstance(inst,TAC_serialize.TACOp2):
                if isinstance(inst.assignee, TAC_serialize.TACRegister):
                    preColor[inst.op2.name] = -1
                elif isinstance(inst.assignee, TAC_serialize.TACClassAttr):
                    preColor[inst.op2.reg.name] = -1
    return regGraph, preColor

def degree(regGraph):
    degrees = {}
    for x in regGraph:
        degrees[x] = len(regGraph[x][0])
    return degrees

# Takes a control flow graph and returns register allocations for each
# temporary value, any register index higher than the allowed should go to memory
# if nregs=0, then perform "dumb spilling", i.e. don't mitigate use of temporaries
def registerAllocate(cfg, nregs):
    regGraph, preColor = genRegGraph(cfg)
    deg = degree(regGraph)

    # Heuristic based coloring, colors nodes in decreasing degree order with no conflicts
    def colorGraph(graph):

        # Use degree order as heuristic for coloring order
        degreeOrder = sorted(graph, key=lambda x: -deg[x])

        maxColor = 0
        for node in degreeOrder:
            # Handle conflicts with pre-colored nodes
            if graph[node][1] != -1:
                continue

            # Eliminate colors of adjacent nodes
            availableColors = set(range(maxColor+2)) # [0,..,maxColor+1]
            for adj in graph[node][0]:
                availableColors -= set([graph[adj][1]])

            # When all registers used and something has already been spilled,
            # the maxColor+1 is blocked and availableColors will be empty
            if len(availableColors) == 0:
                return False

            # Set color to lowest available
            graph[node][1] = min(availableColors)

            # Increment maxColor if we need a new color
            if graph[node][1] == maxColor+1:
                maxColor += 1
                if maxColor > nregs and nregs != 0:
                    return False
        return True

    if nregs != 0:
        maxSpill = 1
        spillMap = {}

        while not colorGraph(regGraph):
            # Reinitialize graph coloring
            for k in regGraph:
                if k in preColor:
                    regGraph[k][1] = preColor[k]
                elif k in spillMap:
                    regGraph[k][1] = spillMap[k]
                else:
                    regGraph[k][1] = -1

            # Spill a temp
            nspill = max([x for x in regGraph if  regGraph[x][1] == -1], key = lambda x: deg[x])
            availableSpills = set(range(nregs+1,nregs+maxSpill+2))

            for adj in regGraph[nspill][0]:
                availableSpills -= set([regGraph[adj][1]])

            spillMap[nspill] = min(availableSpills)

            if spillMap[nspill] == nregs+maxSpill+1:
                maxSpill+=1

            regGraph[nspill][1] = spillMap[nspill]
    else:
        colorGraph(regGraph)

    regMap = {}
    for node in regGraph:
        regMap[node] = regGraph[node][1]

    return regMap
