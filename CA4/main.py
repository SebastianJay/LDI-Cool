from annast import AST, readClType
import tacgen
import TAC_serialize
import deadcode
from registerAllocate import registerAllocate
import asmgen
import sys

debug = True
if __name__=="__main__":
    #load the cl-type file
    cmap, imap, pmap, ast = readClType(sys.argv[1])

    #generate TAC for the user-generated Cool
    tacgen.TACIndexer.setTypeMaps(cmap, imap, pmap)
    tacgen.attrConvert(ast)
    tacgen.implConvert(ast)
    taclist = tacgen.TACIndexer.inslst
    
    # Do dead code elimination to simplify register allocation
    cfg = TAC_serialize._constructCFG(taclist)
    if debug:
        print cfg
        print "-----"
    deadcode.globalDeadRemove(cfg)
    if debug:
        print cfg
        print "-----"

    #create mapping from virtual registers -> real registers/memory
    regMap = registerAllocate(cfg,0)
    if debug:
        print regMap
        print '-----'

    #load type maps into ASM offset/label generator
    asmgen.ASMIndexer.load(cmap, imap, pmap)
    #create list of ASM instructions
    asmlst = asmgen.funcConvert(cfg,regMap)

    #serialize list to string
    outbuf = asmgen.asmStr(asmlst)
    if debug:
        print outbuf[outbuf.index('main:'):]

    #write result buffer to output file
    #with open(sys.argv[1].replace('.cl-type', '.s'),'w') as outfile:
    #    outfile.write(outbuf)
