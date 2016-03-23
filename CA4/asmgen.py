from TAC_serialize import *
from TAC_serialize import _constructCFG
from registerAllocate import registerAllocate
import sys
from deadcode import globalDeadRemove

#maps int result of graph coloring to x64 register name
cRegMap = {
    0 : '%rax',     #return value for function calls
    1 : '%rbx',
    2 : '%rcx',
#    3 : '%rdx',    # Save rdx for multiplication, division, double memory, and bool logic
    3 : '%rsi',
    4 : '%rdi',
    5 : '%r8',      #64 bit mode registers
    6 : '%r9',
    7 : '%r10',
    8 : '%r11',
    9 : '%r12',
    10 : '%r13',
    11 : '%r14',
    12 : '%r15',
}
rsp = '%rsp'
rbp = '%rbp'
retreg = 0

registers = cRegMap.values() + [rsp, rbp]

#static class that turns cmap, imap, and pmap into offset and label mappings
class ASMIndexer:
    #TODO add in internals information
    clsTags = {}        #string class => int class tag
    objSize = {}        #string class => int size of object of class

    attrOffset = {}     #string class => (string attribute => int index of attr)
    methOffset = {}     #string class => (string method => (string formal => int index of formal))
    vtableOffset = {}   #string class => (string method => int index of method in table)

    vtableMap = {}      #string class => list of string labels
    strMap = {}         #string literal => string label where literal stored

    #string runtime error id => string literal
    errstrMap = {
        'casevoid' : 'ERROR: %d: Exception: case on void',
        'casenomatch' : 'ERROR: %d: Exception: case without matching branch',
        'dispatchvoid' : 'ERROR: %d: Exception: dispatch on void',
        'stackoverflow' : 'ERROR: %d: Exception: stack overflow',
        'dividezero' : 'ERROR: %d: Exception: division by zero',
        #substring error handled internally
    }

    #the map definitions are the unboxed definitions provided in annast.py
    @staticmethod
    def load(cmap, imap, pmap):
        #create clsTags
        tagind = 0
        for cname in cmap:
            ASMIndexer.clsTags[cname] = tagind
            tagind += 1

        #create objSize
        for cname in cmap:
            #number of attributes + 3 extra for every class (class tag, vtable pointer, obj size)
            ASMIndexer.objSize[cname] = len(cmap[cname]) + 3

        #create attrOffset
        for cname in cmap:
            attrmap = {}
            #attr index 0 = class tag
            #attr index 1 = vtable pointer
            #attr index 2 = object size
            # other attributes start at index 3
            for i, cattr in enumerate(cmap[cname]):
                attrmap[cattr.name] = i+3
            ASMIndexer.attrOffset[cname] = attrmap

        #create methOffset
        for cname in imap:
            methmap = {}
            for imeth in imap[cname]:
                formmap = {}
                #the implicit first formal is the "self" arg
                formmap['self'] = 0
                #the rest of the arguments start at index 1
                for i, fname in enumerate(imeth.formals):
                    formmap[fname] = i+1
                methmap[imeth.name] = formmap
            ASMIndexer.methOffset[cname] = methmap

        #create vtableOffset
        for cname in imap:
            methmap = {}
            for i, imeth in enumerate(imap[cname]):
                #index 0 of vtable contains type name string
                methmap[imeth.name] = i+1
            ASMIndexer.vtableOffset[cname] = methmap

        #create strMap
        #create type name strings
        strind = 0
        for cname in cmap:
            ASMIndexer.strMap[cname] = '.string' + str(strind)
            strind += 1
        #add runtime error strings
        for literal in ASMIndexer.errstrMap.values():
            ASMIndexer.strMap[literal] = '.string' + str(strind)
            strind += 1
        #add literals found in TAC list
        for ins in TACIndexer.inslst:
            if isinstance(ins, TACConstant) and ins.ptype == 'string' and ins.const not in ASMIndexer.strMap:
                ASMIndexer.strMap[ins.const] = '.string' + str(strind)
                strind += 1
        #TODO cull list after optimization to remove unused strings

        #create vtableMap
        for i, cname in enumerate(imap):
            #entry 0 of vtable is string of class name
            labels = [ASMIndexer.strMap[cname]]
            # methods start at index 1 of table
            for imeth in imap[cname]:
                labels.append(cname + '.' + imeth.name)
            ASMIndexer.vtableMap[cname] = labels

    #returns a list of ASMInstruction corresponding to vtables in vtableMap
    @staticmethod
    def genVtable():
        pass

    #returns a list of ASMInstruction corresponding to literals in strMap
    @staticmethod
    def genStr():
        pass

#begin ASM class definitions - adapted from TAC
# these classes do not necessarily correspond to one x86 instruction apiece
# some may require auxiliary instructions like shifting between registers/stack
# use expand() to get a list of total instructions

#"abstract" class for one ASM instruction
class ASMInstruction:
    def expand(self):
        return [self]

#generic class for ASM instruction which computes an operation
#most instructions will destroy an operand, so to preserve it we need to shift between some registers
class ASMOp(ASMInstruction):
    def __init__(self, assignee, opcode, operands=[]):
        self.assignee = assignee
        self.opcode = opcode
        self.operands = operands
    def expand(self):
        asm = []

        # If operating on two memory addresses
        if len(self.operands)==2 and not (
            self.operands[0] in registers or self.operands[0][0] == '$'
            or self.operands[1] in registers or self.operands[1][0] == '$'):
            asm.append(ASMAssign('%rdx',self.operands[0]))
            self.operands[0] = '%rdx'

        # Bool logic expand
        if self.opcode in ['<', '=', '<=']:
            # Can't do cmove on a memory address, so have to push/pop some stuff
            if self.assignee not in registers:
                # Can't use rax as a temp if it's one of the operands
                if '%rax' not in self.operands:
                    asm.append(ASMPush('%rax'))
                    asm.append(ASMAssign('%rax', self.assignee))
                    self.assignee = '%rax'
                # If rax is an operand, rbx isn't because the other is memory
                else:
                    asm.append(ASMPush('%rbx'))
                    asm.append(ASMAssign('%rbx', self.assignee))
                    self.assignee = '%rbx'

            asm.append(ASMCmp(self.operands[1], self.operands[0]))
            asm.append(ASMConstant(self.assignee, 'bool', 'false'))
            asm.append(ASMConstant('%rdx', 'bool', 'true'))
            asm.append(self)

            # Restore the temporary register and put the result in the right place
            if self.operands[1] not in registers:
                asm.append(ASMAssign(self.operands[1], self.assignee))
                asm.append(ASMPop(self.assignee))
            return asm

        if (len(self.operands) == 1 and self.operands[0] != self.assignee)\
           or (len(self.operands) == 2 and self.operands[1] != self.assignee):
            asm.append(ASMAssign(self.assignee, self.operands[0]))

        if self.opcode == '/':
            asm.append(ASMMisc('cltq'))     #sign extend eax to rax
            asm.append(ASMMisc('cqto'))     #sign extend rax to rdx:rax

        asm.append(self)

        if self.opcode in ['+', '-', '*', '/', '~'] and self.assignee not in [rsp, rbp]:
            #sign-extend the upper half of the 64 bit register
            asm.append(ASMOp(self.assignee, '<<', ['$32', self.assignee]))
            asm.append(ASMOp(self.assignee, '>>', ['$32', self.assignee]))

        return asm
    def __str__(self):
        if self.opcode == '+':
            return 'addq ' + self.operands[0] + ', ' + self.assignee
        elif self.opcode == '-':
            return 'subq ' + self.operands[0] + ', ' + self.assignee
        elif self.opcode == '*':
            return 'imulq ' + self.operands[0]
        elif self.opcode == '/':
            return 'idivq ' + self.operands[0]
        elif self.opcode == '<':
            return 'cmovlq ' + '%rdx' + ', ' + self.assignee
        elif self.opcode == '<=':
            return 'cmovleq ' + '%rdx' + ', ' + self.assignee
        elif self.opcode == '=':
            return 'cmoveq ' + '%rdx' + ', ' + self.assignee
        elif self.opcode == 'not':
            return 'xorq $1, ' + self.assignee
        elif self.opcode == 'isvoid':
            pass
        elif self.opcode == '~':
            return 'negq ' + self.operands[0]
        elif self.opcode == '&':
            return 'andq ' + self.operands[0] + ', ' + self.assignee
        elif self.opcode == '|':
            return 'orq ' + self.operands[0] + ', ' + self.assignee
        elif self.opcode == '<<':
            return 'shlq ' + self.operands[0] + ', ' + self.assignee
        elif self.opcode == '>>':
            return 'sarq ' + self.operands[0] + ', ' + self.assignee    #arithmetic, so sign is preserved
        return '\n'

#compare two numbers and set appropriate flags for conditional moves/jumps
class ASMCmp(ASMInstruction):
    def __init__(self, op1, op2):
        self.op1 = op1
        self.op2 = op2
    def __str__(self):
        return 'cmpq ' + self.op1 + ', ' + self.op2

#ASM instruction which assigns one variable into another
class ASMAssign(ASMInstruction):
    def __init__(self, assignee, assignor):
        self.assignee = assignee
        self.assignor = assignor
    def expand(self):
        # Memory-memory move fix
        asm = []
        if not (self.assignor in registers or self.assignor[0] == '$' or self.assignee in registers):
            asm.append(ASMAssign('%rdx', self.assignor))
            self.assignor = '%rdx'
        asm.append(self)
        return asm
    def __str__(self):
        return 'movq ' + self.assignor + ', ' + self.assignee

#"abstract" class for TAC instructions which declare variables
class ASMDeclare(ASMInstruction):
    pass

#for 'new' and 'default' instructions
class ASMAllocate(ASMDeclare):
    def __init__(self, assignee, allop, ptype):
        self.assignee = assignee
        self.allop = allop  #should be 'default' or 'new'
        self.ptype = ptype
    def __str__(self):
        return 'movq $0, ' + self.assignee

#for assigning constants to variables
class ASMConstant(ASMDeclare):
    def __init__(self, assignee, ptype, const):
        self.assignee = assignee
        self.ptype = ptype
        self.const = const
    def __str__(self):
        if self.ptype == 'string':
            print 'Error: string not implemented'
            return ''
        if self.ptype == 'int':
            return 'movq $' + str(self.const) + ', ' + self.assignee
        if self.ptype == 'bool':
            if self.const == 'true':
                return 'movq $1, ' + self.assignee
            else:
                return 'movq $0, ' + self.assignee

#"abstract" class for the control instructions
class ASMControl(ASMInstruction):
    pass

#move data onto the stack
class ASMPush(ASMControl):
    def __init__(self, reg):
        self.reg = reg
    def __str__(self):
        return 'pushq ' + self.reg

#move data off the stack and into a register
class ASMPop(ASMControl):
    def __init__(self, reg):
        self.reg = reg
    def __str__(self):
        return 'popq ' + self.reg

#ASM calls to functions
class ASMCall(ASMControl):
    #for linux calls, "integer" parameters passed in order; rdi, rsi, rdx, rcx, r8, r9, stack
    #paramorder = ['%rdi', '%rsi', '%rdx', '%rcx', '%r8', '%r9']
    def __init__(self, assignee, funcname, args=[]):
        self.assignee = assignee
        self.funcname = funcname
        self.args = args
    def expand(self):
        asm = []
        #push args onto stack
        for arg in self.args:
            asm.append(ASMPush(arg))
        asm.append(self)
        #deallocate args
        if len(self.args) != 0:
            lisize = '$'+str(len(self.args) * 8)
            asm.append(ASMOp(rsp, '+', [lisize, rsp]))
        return asm
    def __str__(self):
        return 'call ' + self.funcname

#Jmp instruction
class ASMJmp(ASMControl):
    def __init__(self, label):
        self.label = label
    def __str__(self):
        return 'jmp ' + self.label

#label instruction
class ASMLabel(ASMControl):
    def __init__(self, name):
        self.name = name
    def __str__(self):
        return self.name + ':'

# Special instructions that pass info to the assembler
class ASMInfo(ASMControl):
    def __init__(self, name, *args):
        self.name = name
        self.args = args
    def __str__(self):
        return "." + self.name + " " + ', '.join(self.args)

#Return instruction
class ASMReturn(ASMControl):
    def __init__(self, retval):
        self.retval = retval
    def expand(self):
        asm = []
        if self.retval != cRegMap[retreg]:
            asm.append(ASMAssign(cRegMap[retreg], self.retval))
        asm.append(ASMAssign(rsp, rbp))
        asm.append(ASMPop(rbp))
        asm.append(self)
        return asm
    def __str__(self):
        return 'ret'

#Bt instruction
class ASMBT(ASMControl):
    def __init__(self, cond, label):
        self.cond = cond
        self.label = label
    def expand(self):
        return [ASMCmp('$1', self.cond), self]
    def __str__(self):
        return 'je ' + self.label

#initialize instance of class
class ASMMalloc(ASMInstruction):
    def __init__(self, assignee, cname):
        self.assignee = assignee
        self.cname = cname
    def expand(self):
        #TODO do malloc
        # then initialize class tag, vtable pointer, object size
        # when optimizing constructors these ops may have to be separated out
        pass
    def __str__(self):
        pass

#lookup vtable for location of function
class ASMVTable(ASMInstruction):
    def __init__(self, assignee, obj, offset):
        self.assignee = assignee
        self.obj = obj
        self.offset = offset
    def expand(self):
        #TODO if obj is in memory pull it into register
        # then pull vtable pointer into register (constant offset of 8 if 2nd field)
        # then pull function pointer into assignee (use self.offset)
        pass
    def __str__(self):
        pass

#branches if class tag matches - used for case statements
class ASMBTypeEq(ASMInstruction):
    def __init__(self, obj, clstag, label):
        self.obj = obj
        self.clstag = clstag
        self.label = label
    def expand(self):
        #TODO if obj is in memory pull it into register
        # if cmp does not work on memory pull class tag of obj into register (constant off set of 0 if 1st field)
        # do cmp on obj class tag and self.clstag
        # do conditional jump to self.label if cmp yields equal
        pass
    def __str__(self):
        pass

#unconditional error jump
class ASMError(ASMControl):
    def __init__(self, lineno, reason):
        self.lineno = lineno
        self.reason = reason
    def expand(self):
        #TODO have internal method that takes two args
            #arg 0 - string format
            #arg 1 - int line number
        #that method should call printf(arg0, arg1) and then exit()
        #this instruction is a wrapper over call to that method
        pass
    def __str__(self):
        pass

#catchall for instructions that have no strong association with category
class ASMMisc(ASMInstruction):
    def __init__(self, cmd, args=[]):
        self.cmd = cmd
        self.args = args
    def __str__(self):
        retval = self.cmd
        for i, arg in enumerate(self.args):
            retval += arg
            if i < len(self.args) - 1:
                retval += ', '
        return retval
#end ASM class definitions

#returns list of colors of registers that must be used for specified x86 commands
#e.g. imulq needs %rax and %rdx as "result registers"
def getConflicts(tacIns):
    pass

#takes a control flow graph and mapping of virtual registers to colors
#returns list of x64 instructions as ASM* instances
def funcConvert(cfg, regMap):

    #if virtual register, return either register name or place in memory (if index too high)
    #if class attr or method arg, return memory location with appropriate offset
    #TODO review indexing of temporaries relative to rbp
    def realReg(operand):
        if isinstance(operand, TACRegister):
            vreg = operand.name
            if regMap[vreg] not in cRegMap:
                return '-' + str(8*(regMap[vreg]-len(cRegMap)+1)) + '('+rbp+')'
            return cRegMap[regMap[vreg]]
        elif isinstance(operand, TACClassAttr):
            vreg = operand.reg.name
            #TODO handle class attr reg (i.e. "self" var) being in memory (i.e. need double memory lookup)
            #  possible solution: in registerAllocate, force #self method arg to be in real register
            return str(8 * ASMIndexer.attrOffset[operand.cname][operand.aname])+'('+ cRegMap[regMap[vreg]] +')'
        elif isinstance(operand, TACMethodArg):
            return str(8 * (ASMIndexer.methOffset[operand.cname][operand.mname][operand.fname] + 1))+'('+rbp+')'

    inslst = cfg.toList()

    preamble = []

    #function prologue
    # TODO prepend this to start of every function
    preamble += [
        ASMPush(rbp),
        ASMAssign(rbp, rsp),
    ]

    # Allocate stack space for temporaries
    # TODO review number of spaces allocated
    stackmem = 8*(max(regMap.values()) - len(cRegMap) + 1)
    if stackmem > 0:
        preamble+=[
            ASMOp(rsp, '-', ['$'+str(stackmem), rsp])
        ]

    asmlst = []
    #make list of ASM instructions from TAC instructions
    for ins in inslst:
        if isinstance(ins, TACOp):
            operands = [realReg(ins.op1), realReg(ins.op2)] \
                if isinstance(ins, TACOp2) else [realReg(ins.op1)]
            asmlst.append(ASMOp(realReg(ins.assignee), ins.opcode, operands))
        elif isinstance(ins, TACAssign):
            asmlst.append(ASMAssign(realReg(ins.assignee), realReg(ins.assignor)))
        elif isinstance(ins, TACAllocate):
            asmlst.append(ASMAllocate(realReg(ins.assignee), ins.allop, ins.ptype))
        elif isinstance(ins, TACCall):
            funcname = ins.funcname
            if isinstance(ins.funcname, TACRegister):
                funcname = realReg(ins.funcname)    #TODO other chars to indicate function call?
            asmlst.append(ASMCall(realReg(ins.assignee), funcname, [realReg(arg) for arg in ins.args]))
        elif isinstance(ins, TACLabel):
            asmlst.append(ASMLabel(ins.name))
        elif isinstance(ins, TACReturn):
            asmlst.append(ASMReturn(realReg(ins.retval)))
        elif isinstance(ins, TACJmp):
            asmlst.append(ASMJmp(ins.label))
        elif isinstance(ins, TACBT):
            asmlst.append(ASMBT(realReg(ins.cond), ins.label))
        elif isinstance(ins, TACConstant):
            asmlst.append(ASMConstant(realReg(ins.assignee), ins.ptype, ins.const))
        elif isinstance(ins, TACVTable):
            asmlst.append(ASMVTable(realReg(ins.assignee), realReg(ins.obj), ASMIndexer.vtableOffset[ins.cname][ins.mname]))
        elif isinstance(ins, TACMalloc):
            asmlst.append(ASMMalloc(realReg(ins.assignee), ins.cname))
        elif isinstance(ins, TACBTypeEq):
            asmlst.append(ASMBTypeEq(realReg(ins.obj), ASMIndexer.clsTags[ins.dtype], ins.label))
        elif isinstance(ins, TACError):
            asmlst.append(ASMError(ins.lineno, ins.reason))
        else:
            asmlst.append("UNHANDLED: "+ str(ins))

    asmlst = asmlst[:1] + preamble + asmlst[1:]

    # Remove useless mov instructions
    rmlist = []
    for i, ins in enumerate(asmlst):
        if isinstance(ins, ASMAssign) and ins.assignee == ins.assignor:
            rmlist.append(i)
    asmlst = [ins for i,ins in enumerate(asmlst) if i not in rmlist]

    explst = []
    for ins in asmlst:
        if hasattr(ins, 'expand'):
            explst += ins.expand()
        else:
            explst += [ins]

    return explst

def asmStr(asmlst):
    outbuf = ''
    for ins in asmlst:
        if not isinstance(ins, ASMLabel):
            outbuf += '\t'
        outbuf += str(ins) + '\n'
    return outbuf

def convert(taclist):
    methlist = []
    lastInd = 0
    for i in range(len(taclist)):
        # Split taclist on method labels
        if isinstance(taclist[i], TACLabel) and taclist[i].name[0] != '.':
            if i != 0:
                methlist.append(taclist[lastInd:i])
            lastInd = i
    methlist.append(taclist[lastInd:])

    asmlist = []
    for meth in methlist:
        cfg = _constructCFG(meth)
        print cfg
        print '-----'
        globalDeadRemove(cfg)
        print cfg
        print '-----'
        regmap = registerAllocate(cfg,13)
        asmlist += funcConvert(cfg, regmap)
        print asmStr(asmlist)

    return asmlist

def readInternals():
    with open('internals.s.txt', 'rU') as inFile:
        return inFile.read()

if __name__ == '__main__':
    with open(sys.argv[1], 'U') as inFile:
        cfg = serializeTAC(inFile)
    #allocate 14 virtual registers - need coloring for more
    #regMap = registerAllocate(cfg)
    regMap = {}
    for i in range(14):
        regMap['t$'+str(i)] = i
    asmlst = funcConvert(cfg, regMap)
    outbuf = ''
    for asmins in asmlst:
        asminslst = asmins.expand()
        for asmsubins in asminslst:
            outbuf = outbuf + str(asmsubins) + '\n'
    print outbuf
