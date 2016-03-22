from annast import readClType
import tacgen
import TAC_serialize
import deadcode
from registerAllocate import registerAllocate
import asmgen
import sys    

debug = True
if __name__=="__main__":

    cmap, imap, pmap, ast = readClType(sys.argv[1])

    # Generate TAC
    tacgen.TACIndexer.setTypeMaps(cmap,imap,pmap)
    tacgen.attrConvert(ast)
    tacgen.implConvert(ast)
    taclist = tacgen.TACIndexer.inslst

    methlist = []
    lastInd = 0
    for i in range(len(taclist)):
        # Split taclist on method labels
        if isinstance(taclist[i], TAC_serialize.TACLabel) and taclist[i].name[0] != '.':
            if i != 0:
                methlist.append(taclist[lastInd:i])
            lastInd = i
    methlist.append(taclist[lastInd:])

    if debug:
        for meth in methlist:
            for ins in meth:
                print str(ins)
            print '===='
        print '----'

    # Do dead code elimination to simplify register allocation
    cfg = TAC_serialize._constructCFG(taclist)
    if debug:
        print cfg
        print "-----"
    deadcode.globalDeadRemove(cfg)
    if debug:
        print cfg
        print "-----"

    #create list of ASM instructions
    asmlst = asmgen.convert(cfg)

    #serialize list to string
    outbuf = asmgen.asmStr(asmlst)
    if debug:
        print outbuf[outbuf.index('main:'):]

    #write result buffer to output file
    with open(sys.argv[1].replace('.cl-type', '.s'),'w') as outfile:
        outfile.write(outbuf)
