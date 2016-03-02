import deadcode
import TAC_serialize

# Takes a control flow graph, returns a register conflict graph
# with some precolored nodes on function returns
# of form temp => [set of conflicts, color(default to -1)]
def genRegGraph(cfg):
    regGraph = {"__dead__":[set(),0]} # __dead__ for dead function calls
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
                regGraph[t][0] |= {r for r in live if r != t}

            # Allocate accumulator to return val of a function
            if isinstance(inst,TAC_serialize.TACCall):
                regGraph[inst.assignee][1] = 0
            elif isinstance(inst,TAC_serialize.TACReturn):
                regGraph[inst.retval][1] = 0
            # Have to force multiplication and division result to rax
            elif isinstance(inst,TAC_serialize.TACOp2) and inst.opcode in ['*','/']:
                regGraph[inst.assignee][1] = 0

    return regGraph

def degree(regGraph):
    degrees = {}
    for x in regGraph:
        degrees[x] = len(regGraph[x][0])
    return degrees

# Takes a control flow graph and returns register allocations for each
# temporary value, any register index higher than the allowed should go to memory
def registerAllocate(cfg, nregs):
    
    regGraph = genRegGraph(cfg)
    deg = degree(regGraph)

    # Heuristic based coloring, colors nodes in decreasing degree order with no conflicts
    def colorGraph(graph):

        # Use degree order as heuristic for coloring order
        degreeOrder = sorted(graph, key=lambda x: -deg[x])

        maxColor = 0
        for node in degreeOrder:
            
            # Skip precolored nodes
            if graph[node][1] != -1:
                continue

            # Eliminate colors of adjacent nodes
            availableColors = set(range(maxColor+2)) # [0,..,maxColor+1]
            for adj in graph[node][0]:
                availableColors -= {graph[adj][1]}
            
            # When something has been spilled and current
            # node is adjacent to all colors in [0,...,nregs+1],
            # availableColors will be empty, so return false because
            # we can't color the graph
            if len(availableColors) == 0:
                return False

            # Set color to lowest available
            graph[node][1] = min(availableColors)

            # Increment maxColor if we need a new color
            if graph[node][1] == maxColor+1:
                maxColor += 1
                if maxColor > nregs:
                    return False
        return True

    # maxSpill = 1
    # spillMap = {}

    # while not colorGraph(regGraph):
    #     # Reinitialize graph coloring
    #     regGraph = genRegGraph(cfg)
    #     for s in spillMap:
    #         regGraph[s][1] = spillMap[s]

    #     # Spill a temp
    #     nspill = max([x for x in regGraph if x not in spillMap], key = lambda x: deg[x])
    #     availableSpills = set(range(nregs+1,nregs+maxSpill+2))

    #     for adj in regGraph[nspill][0]:
    #         availableSpills -= {regGraph[adj][1]}

    #     spillMap[nspill] = min(availableSpills)

    #     if spillMap[nspill] == nregs+maxSpill+1:
    #         maxSpill+=1

    #     regGraph[nspill][1] = spillMap[nspill]
    
    colorGraph(regGraph)
    regMap = {}
    for node in regGraph:
        regMap[node] = regGraph[node][1]

    return regMap
