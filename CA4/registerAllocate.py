import deadcode
import TAC_serialize

# Takes a control flow graph, returns a register conflict graph
# with some precolored nodes on function returns
# of form temp => [set of conflicts, color(default to -1)]
def genRegGraph(cfg):
    regGraph = {"t0":[set(),0]} # __dead__ for dead function calls
    deadcode.globalLiveCheck(cfg)
    for block in cfg.blocks:
        live = set(block.liveOut)

        # Update graph connections
        for t in live:
            if t not in regGraph:
                regGraph[t] = [set(),-1]
            regGraph[t][0] |= {r for r in live if r != t}

        for inst in reversed(block.instructions):
            # Killed when assigned
            killed = deadcode.getWritten(inst)
            if killed is not None and killed in live:
                live.remove(killed)

            # Live when used
            used = deadcode.getRead(inst)
            if used is not None:
                for r in used:
                    live.add(r)

            # Update graph connections
            for t in live:
                if t not in regGraph:
                    regGraph[t] = [set(), -1]
                if t == '':
                    print inst
                regGraph[t][0] |= {r for r in live if r != t}
                if isinstance(inst, TAC_serialize.TACCall):
                    regGraph[t][0].add('t0')

            # Allocate accumulator to return val of a function
            #TODO review TACClassAttr - probably change tacgen so that it never shows up here
            if isinstance(inst,TAC_serialize.TACCall):
                if isinstance(inst.assignee, TAC_serialize.TACRegister):
                    regGraph[inst.assignee.name][1] = 0
                elif isinstance(inst.assignee, TAC_serialize.TACClassAttr):
                    regGraph[inst.assignee.reg.name][1] = 0

            elif isinstance(inst,TAC_serialize.TACReturn):
                if isinstance(inst.retval, TAC_serialize.TACRegister):
                    regGraph[inst.retval.name][1] = 0
                elif isinstance(inst.retval, TAC_serialize.TACClassAttr):
                    regGraph[inst.retval.reg.name][1] = 0

            # Have to force multiplication and division result to rax
            elif isinstance(inst,TAC_serialize.TACOp2) and inst.opcode in ['*','/']:
                if isinstance(inst.assignee, TAC_serialize.TACRegister):
                    regGraph[inst.assignee.name][1] = 0
                elif isinstance(inst.assignee, TAC_serialize.TACClassAttr):
                    regGraph[inst.assignee.reg.name][1] = 0

    return regGraph

def degree(regGraph):
    degrees = {}
    for x in regGraph:
        degrees[x] = len(regGraph[x][0])
    return degrees

# Takes a control flow graph and returns register allocations for each
# temporary value, any register index higher than the allowed should go to memory
# if nregs=0, then perform "dumb spilling", i.e. don't mitigate use of temporaries
def registerAllocate(cfg, nregs):
    regGraph = genRegGraph(cfg)
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
                availableColors -= {graph[adj][1]}

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
                if k in spillMap:
                    regGraph[k][1] = spillMap[k]
                else:
                    regGraph[k][1] = -1
                
            # Spill a temp
            nspill = max([x for x in regGraph if x not in spillMap], key = lambda x: deg[x])
            availableSpills = set(range(nregs+1,nregs+maxSpill+2))

            for adj in regGraph[nspill][0]:
                availableSpills -= {regGraph[adj][1]}

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
