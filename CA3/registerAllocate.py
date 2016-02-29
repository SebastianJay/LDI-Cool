import deadcode


NUM_REGISTERS = 8

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

    return regGraph

def degree(regGraph):
    degrees = {}
    for x in regGraph:
        degrees[x] = len(regGraph[x][0])
    return degrees

# Takes a control flow graph and returns register allocations for each
# temporary value and **TODO** modifies cfg code in place to include spills to memory 
def registerAllocate(cfg):
    regGraph = genRegGraph(cfg)
    

    # Heuristic based coloring, colors nodes in decreasing degree order with no conflicts
    def colorGraph(graph, clim):
        
        # Use degree order as heuristic for coloring order
        deg = degree(graph)
        degreeOrder = sorted(graph, key=lambda x: -deg[x])
        
        maxColor = 0
        for node in degreeOrder:
            # Skip pre-colored nodes
            if graph[node][1] != -1:
                continue
            
            # Eliminate colors of adjacent nodes
            availableColors = set(range(maxColor+2)) # [0,..,maxColor+1]
            for adj in graph[node][0]:
                availableColors -= {graph[adj][1]}

            # Set color to lowest available
            graph[node][1] = min(availableColors)
            
            # Increment maxColor if we need a new color
            if graph[node][1] == maxColor+1:
                maxColor += 1
                
            # Quit if we've gone past the color limit
            if maxColor > clim:
                return False

        return True

    colorGraph(regGraph, NUM_REGISTERS)
    for x in sorted(regGraph):
        print x, ":\t", regGraph[x][1], ",\t", regGraph[x][0] 
    regMap = {}
    for node in regGraph:
        regMap[node] = regGraph[node][1]
    
    return regMap
