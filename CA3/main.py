from annast import AST
import tacgen
import TAC_serialize
import deadcode

import sys

def genRegGraph(cfg):
    regGraph = {}
    deadcode.globalLiveCheck(cfg)
    for block in cfg.blocks:
        live = set(block.liveOut)
        
        # Update graph connections
        for t in live:
            if t not in regGraph:
                regGraph[t] = set()
            regGraph[t] |= {r for r in live if r != t}

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
            
            print inst, "\t\t\t", live
            
            # Update graph connections
            for t in live:
                if t not in regGraph:
                    regGraph[t] = set()

                regGraph[t] |= {r for r in live if r != t}
        
    return regGraph

        

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
    
    print genRegGraph(cfg)
        
        
