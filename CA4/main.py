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
    
    #write result buffer to output file
    with open(sys.argv[1].replace('.cl-type', '.s'),'w') as outfile:
        outfile.write(outbuf)
