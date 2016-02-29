from annast import AST
import tacgen
import TAC_serialize
import deadcode
from registerAllocate import registerAllocate
import asmgen


import sys


            
        
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
    print cfg
    print "-----"
    deadcode.globalDeadRemove(cfg)
    print cfg
    print "-----"
        
    regMap = registerAllocate(cfg)

    asmlst = asmgen.funcConvert(cfg,regMap)

    outbuf = ''
    for asmins in asmlst:
        asminslst = asmins.expand()
        for asmsubins in asminslst:
            outbuf = outbuf + str(asmsubins) + '\n'
    print outbuf
    with open('out.s','w') as outfile:
        outfile.write(outbuf)
