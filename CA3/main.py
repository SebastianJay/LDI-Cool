from annast import AST
import tacgen
import TAC_serialize
import deadcode

import sys


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
    
    def colorGraph(graph, clim):
        
        # Use degree order as heuristic for coloring
        deg = degree(graph)
        degreeOrder = sorted(graph, key=lambda x: deg[x])
        
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
    regMap = {}
    for node in regGraph:
        regMap[node] = regGraph[node][1]
    
    return regMap
            
        
if __name__=="__main__":
    lines = []
    with open(sys.argv[1], 'U') as inFile:
        lines = inFile.read().split('\n')[:-1] # Cuts off empty line at the end
    
    # AST isn't marked, so have to find it after the parent map
    lines = lines[lines.index("parent_map"):]

    # Get the number of classes in parent map, skip 2n+2 lines ahead
    # for 2n lines of class inheritance and 2 lines of parent_map and length
    lines = lines[2*int(lines[1])+2:]
    
    # Deserialize the ast
    ast = AST()
    ast.load(iter(lines))
    
    # Generate TAC
    tacgen.mainConvert(ast)
    taclist = tacgen.TACIndexer.inslst
    
    # Do dead code elimination to simplify register allocation
    cfg = TAC_serialize._constructCFG(taclist)
    deadcode.globalDeadRemove(cfg)
    print cfg
    
    regGraph = registerAllocate(cfg)

    for x in sorted(regGraph):
        print x, ":\t", regGraph[x]
        
