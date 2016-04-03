#!/usr/bin/python
from annast import AST, readClType, CMapAttr
import tacgen
import TAC_serialize
import deadcode
from registerAllocate import registerAllocate
import asmgen
import sys    

debug = False
if __name__=="__main__":

    #load the cl-type file
    cmap, imap, pmap, ast = readClType(sys.argv[1])

    cmap['Int'].append(CMapAttr('val', 'unboxInt'))
    cmap['Bool'].append(CMapAttr('val', 'unboxBool'))

    #generate TAC for the user-generated Cool
    tacgen.TACIndexer.setTypeMaps(cmap, imap, pmap)
    tacgen.attrConvert(ast)
    tacgen.implConvert(ast)
    taclist = tacgen.TACIndexer.inslst

    if debug:
        for x in taclist:
            print x
        print '------'
        cfg = TAC_serialize._constructCFG(taclist)
        deadcode.globalDeadRemove(cfg)
        print cfg

    asmgen.ASMIndexer.load(cmap,imap,pmap,taclist)

    # Generate vtables
    vtable = asmgen.ASMIndexer.genVtable()

    # Generate String constants
    strs = asmgen.ASMIndexer.genStr()

    data = [asmgen.ASMInfo('section', '.rodata')] + strs + vtable

    #create list of ASM instructions
    insts = [asmgen.ASMInfo('text')] + asmgen.convert(taclist)


    #serialize list to string
    outbuf = asmgen.readInternals() 
    outbuf += asmgen.asmStr(data)
    outbuf += asmgen.asmStr(insts)
    
    
    # if debug:
    #     print outbuf[outbuf.index('main:'):] 

    #write result buffer to output file
    with open(sys.argv[1].replace('.cl-type', '.s'),'w') as outfile:
        outfile.write(outbuf)
