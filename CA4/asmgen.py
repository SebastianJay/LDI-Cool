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
    #string class => int class tag
    #make sure initial mapping is consistent with internals.c constants
    clsTags = {
        'Object' : 0,
        'Int' : 1,
        'String' : 2,
        'IO' : 3,
        'Bool' : 4,
    }

    #string class => int size of object of class (number of named attributes)
    objSize = {
        'Object' : 0,
        'Bool' : 1,     #0 or 1 value
        'Int' : 1,      #int value
        'IO' : 0,
        'String' : 1,   #ptr to string
    }

    #string class => list of string labels
    vtableMap = {
        'Object' : ['name_Object', 'Object.new', 'Object.abort', 'Object.copy', 'Object.type_name'],
        'Bool' : ['name_Bool', 'Bool.new', 'Object.abort', 'Object.copy', 'Object.type_name'],
        'Int' : ['name_Int', 'Int.new', 'Object.abort', 'Object.copy', 'Object.type_name'],
        'IO' : ['name_IO', 'IO.new', 'Object.abort', 'Object.copy', 'Object.type_name', \
            'IO.in_int', 'IO.in_string', 'IO.out_int', 'IO.out_string'],
        'String' : ['name_String', 'String.new', 'Object.abort', 'Object.copy', 'Object.type_name', \
            'String.concat', 'String.length', 'String.substr'],
    }

    #string literal => string label where literal stored
    strMap = {
        'Object' : 'name_Object',
        'Bool' : 'name_Bool',
        'Int' : 'name_Int',
        'IO' : 'name_IO',
        'String' : 'name_String',
        '' : 'empty_string',
        'abort\\\\n' : 'abort_string',
        'ERROR: %lld: Exception: String index out of bounds' : 'substrerr_string',
        '%d' : 'percentd_string',
        '%lld' : 'percentlld_string',
        '%s' : 'percents_string'
    }

    #string runtime error id => string literal
    errstrMap = {
        'casevoid' : 'ERROR: %lld: Exception: case on void\\n',
        'casenomatch' : 'ERROR: %lld: Exception: case without matching branch\\n',
        'dispatchvoid' : 'ERROR: %lld: Exception: dispatch on void\\n',
        'stackoverflow' : 'ERROR: %lld: Exception: stack overflow\\n',
        'dividezero' : 'ERROR: %lld: Exception: division by zero\\n',
        #substring error handled internally
    }

    attrOffset = {}     #string class => (string attribute => int index of attr)
    methOffset = {}     #string class => (string method => (string formal => int index of formal))
    vtableOffset = {}   #string class => (string method => int index of method in table)

    #the map definitions are the unboxed definitions provided in annast.py
    @staticmethod
    def load(cmap, imap, pmap, inslist):
        #create clsTags
        tagind = 10
        for cname in cmap:
            if cname in ASMIndexer.clsTags:
                continue
            ASMIndexer.clsTags[cname] = tagind
            tagind += 1

        #create objSize
        for cname in cmap:
            if cname in ASMIndexer.objSize:
                continue
            #number of attributes, excluding 3 extra for every class (class tag, vtable pointer, obj size)
            ASMIndexer.objSize[cname] = len(cmap[cname])

        #create strMap
        #create type name strings
        strind = 0
        for cname in cmap:
            if cname in ASMIndexer.strMap:
                continue
            ASMIndexer.strMap[cname] = '.string' + str(strind)
            strind += 1
        #add runtime error strings
        for literal in ASMIndexer.errstrMap.values():
            if literal in ASMIndexer.strMap:
                continue
            ASMIndexer.strMap[literal] = '.string' + str(strind)
            strind += 1

        # Have to escape backslashes and quotes for assembler
        for ins in inslist:
            if isinstance(ins, TACConstant) and ins.ptype == 'string' and ins.const not in ASMIndexer.strMap:
                ins.const = ins.const.replace('\\', '\\\\')
                ins.const = ins.const.replace('\"', '\\\"')

        #add literals found in TAC list
        for ins in inslist:
            if isinstance(ins, TACConstant) and ins.ptype == 'string' and ins.const not in ASMIndexer.strMap:
                ASMIndexer.strMap[ins.const] = '.string' + str(strind)
                strind += 1
        #TODO cull list after optimization to remove unused strings

        #create vtableMap
        for i, cname in enumerate(imap):
            if cname in ASMIndexer.vtableMap:
                continue
            #entry 0 of vtable is string of class name
            #entry 1 is new method
            labels = [ASMIndexer.strMap[cname], cname + '.new']
            # methods start at index 2 of table
            for imeth in imap[cname]:
                labels.append(imeth.orig + '.' + imeth.name)
            ASMIndexer.vtableMap[cname] = labels

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
                #index 1 is constructor
                methmap[imeth.name] = i+2
            ASMIndexer.vtableOffset[cname] = methmap

    @staticmethod
    def getvtableind(cname, methname):
        ind = -1
        for i, meth in enumerate(ASMIndexer.vtableMap[cname]):
            # Skip name string and new
            if i < 2:
                continue
            if meth.split('.')[1] == methname:
                ind = i
        return 8*ind

    #returns a list of ASMInstruction corresponding to vtables in vtableMap
    @staticmethod
    def genVtable():
        vlist = []
        for c in ASMIndexer.vtableMap:
            vlist.append(ASMLabel(c + '_vtable'))
            for meth in ASMIndexer.vtableMap[c]:
                vlist.append(ASMInfo('quad', meth))

        return vlist

    #returns a list of ASMInstruction corresponding to literals in strMap
    #TODO escape special chars? (\", \\)
    @staticmethod
    def genStr():
        slist = []
        for s in ASMIndexer.strMap:
            slist += [
                # String literal
                ASMLabel(ASMIndexer.strMap[s]+"_l"),
                ASMInfo('string', '"' + s + '"'),
                # String object
                ASMLabel(ASMIndexer.strMap[s]),
                ASMInfo('quad', '3'),
                ASMInfo('quad', 'String_vtable'),
                ASMInfo('quad', '1'),
                ASMInfo('quad', ASMIndexer.strMap[s]+"_l")
            ]
        return slist

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

        if self.opcode == 'isvoid':
            return ASMOp(self.assignee, '=', [self.operands[0],'$0']).expand()

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
            if self.operands[1] not in registers and self.operands[1] != '$0':
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
    def expand(self):
        if self.allop == 'new' or self.ptype == 'Int' or self.ptype == 'Bool' or self.ptype == 'String':
            if self.assignee != '%rax':
                return [ASMPush('%rax'), ASMCall('%rax', self.ptype + '.new'), ASMAssign(self.assignee, '%rax'), ASMPop('%rax')]
            else:
                return [ASMCall('%rax', self.ptype + '.new')]
        else:
            return [self]
    def __str__(self):
        if self.allop == 'new' or self.ptype == 'Int' or self.ptype == 'Bool' or self.ptype == 'String':
            return 'call ' + self.ptype + '.new'
        else:
            return 'movq $0, ' + self.assignee

#for assigning constants to variables
class ASMConstant(ASMDeclare):
    def __init__(self, assignee, ptype, const):
        self.assignee = assignee
        self.ptype = ptype
        self.const = const
    def __str__(self):
        if self.ptype == 'string':
            return 'movq $' + ASMIndexer.strMap[self.const] + ', ' + self.assignee
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
        #push args onto stack in reverse order
        for arg in reversed(self.args):
            asm.append(ASMPush(arg))
        asm.append(self)
        #deallocate args
        if len(self.args) != 0:
            lisize = '$'+str(len(self.args) * 8)
            asm.append(ASMOp(rsp, '+', [lisize, rsp]))
        return asm
    def __str__(self):
        #if function is in register or memory, use *
        if self.funcname in registers or ('(' in self.funcname and ')' in self.funcname):
            return 'call *' + self.funcname
        else:
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
        asm.append(ASMMisc('leave'))
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

class ASMBTypeEq(ASMInstruction):
    def __init__(self, obj, clstag, label):
        self.obj = obj
        self.clstag = clstag
        self.label = label
    def expand(self):
        asm = []
        # if obj is in memory pull it into register
        if self.obj not in registers:
            asm.append(ASMAssign('%rdx', self.obj))
            self.obj = '%rdx'
        # if cmp does not work on memory pull class tag of obj into register (constant off set of 0 if 1st field)
        # do cmp on obj class tag and self.clstag
        #   TODO see if compare between memory and immediate value is valid
        asm.append(ASMCmp('$'+str(self.clstag), '0('+self.obj+')'))
        # do conditional jump to self.label if cmp yields equal
        asm.append(ASMMisc('je', [self.label]))
        return asm
    def __str__(self):
        return ''

#catchall for instructions that have no strong association with category
class ASMMisc(ASMInstruction):
    def __init__(self, cmd, args=[]):
        self.cmd = cmd
        self.args = args
    def __str__(self):
        retval = self.cmd
        argstr = ', '.join(self.args)
        if argstr:
            retval += ' ' + argstr
        return retval
#end ASM class definitions


def offsetStr(off, reg):
    return str(off) + '(' + reg + ')'

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
                return offsetStr(-8*(regMap[vreg]-len(cRegMap)+1), rbp)
            return cRegMap[regMap[vreg]]
        elif isinstance(operand, TACClassAttr):
            vreg = operand.reg.name
            #NOTE to handle class attr reg (i.e. "self", or Int/Bool "val") being in memory (i.e. needing double memory lookup)
            # this helper method directly modifies asmlst! Need to review correctness
            if regMap[vreg] not in cRegMap:
                asmlst.append(ASMAssign('%rdx', offsetStr(-8*(regMap[vreg]-len(cRegMap)+1), rbp)))
                rreg = '%rdx'
            else:
                rreg = cRegMap[regMap[vreg]]
            return offsetStr(8 * ASMIndexer.attrOffset[operand.cname][operand.aname], rreg)
        elif isinstance(operand, TACMethodArg):
            return offsetStr(8 * (ASMIndexer.methOffset[operand.cname][operand.mname][operand.fname] + 2), rbp)

    inslst = cfg.toList()

    preamble = []
    epilogue = []

    #function prologue
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

    # Save rbx-highest used register, everything is callee save
    maxreg = min(max(regMap.values()), 12)
    if maxreg > 0:
        for i in range(1, maxreg+1):
            preamble.append(ASMPush(cRegMap[i]))
            epilogue = [ASMPop(cRegMap[i])] + epilogue

    asmlst = []
    #make list of ASM instructions from TAC instructions
    for ins in inslst:
        if isinstance(ins, TACOp):
            if isinstance(ins, TACCompare):
                if ins.ptype == 'String':
                    if realReg(ins.assignee) != '%rax':
                        asmlst += [
                            ASMPush('%rax'),
                            ASMCall('%rax', 'String.cmp', [realReg(ins.op1), realReg(ins.op2)]),
                            ASMAssign(realReg(ins.assignee), '%rax'),
                            ASMPop('%rax'),
                            ASMOp(realReg(ins.assignee), ins.opcode, [realReg(ins.assignee), '$0'])
                        ]
                    else:
                        asmlst += [
                            ASMCall('%rax', 'String.cmp', [realReg(ins.op1), realReg(ins.op2)]),
                            ASMOp(realReg(ins.assignee), ins.opcode, [realReg(ins.assignee), '$0'])
                        ]
                elif ins.ptype == 'Object':
                    if realReg(ins.assignee) != '%rax':
                        asmlst += [
                            ASMPush('%rax'),
                            ASMCall('%rax', 'Object.cmp', [realReg(ins.op1), realReg(ins.op2)]),
                            ASMAssign(realReg(ins.assignee), '%rax'),
                            ASMPop('%rax'),
                            ASMOp(realReg(ins.assignee), ins.opcode, [realReg(ins.assignee), '$0'])
                        ]
                    else:
                        asmlst += [
                            ASMCall('%rax', 'Object.cmp', [realReg(ins.op1), realReg(ins.op2)]),
                            ASMOp(realReg(ins.assignee), ins.opcode, [realReg(ins.assignee), '$0'])
                        ]
                else: # Int/Bool
                    asmlst.append(ASMOp(realReg(ins.assignee), ins.opcode,
                                        [realReg(ins.op1), realReg(ins.op2)]))

            else:
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
                funcname = realReg(ins.funcname)
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
            insreg = ins.obj
            if insreg not in registers:
                asmlst += [ASMAssign('%rdx', realReg(ins.obj))]
                insreg = '%rdx'
            asmlst += [
                # vtable addr -> rdx
                ASMAssign('%rdx', offsetStr(8, insreg)),
                # method addr -> assignee
                ASMAssign(realReg(ins.assignee), offsetStr(ASMIndexer.getvtableind(ins.cname, ins.mname), '%rdx'))
            ]
        elif isinstance(ins, TACMalloc):
            nattrs = len(ASMIndexer.attrOffset[ins.cname])
            asmlst += [
                # Have to push all c caller save registers for calloc
                ASMPush('%rsi'),
                ASMPush('%rdi'),
                ASMPush('%rcx'),
                ASMPush('%r8'),
                ASMPush('%r9'),
                ASMPush('%r10'),
                ASMPush('%r11'),
                # Allocate blocks of size 8 bytes
                ASMAssign('%rsi', '$8'),

                # Allocate tag, vtable pointer, size, attributes
                ASMAssign('%rdi', '$' + str(3+nattrs)),
                ASMCall('%rax', 'calloc'),
                ASMPop('%r11'),
                ASMPop('%r10'),
                ASMPop('%r9'),
                ASMPop('%r8'),
                ASMPop('%rcx'),
                ASMPop('%rdi'),
                ASMPop('%rsi'),
                ASMAssign('(%rax)', '$' + str(ASMIndexer.clsTags[ins.cname])),
                ASMAssign('8(%rax)', '$' + ins.cname + "_vtable"),
                ASMAssign('16(%rax)', '$' + str(nattrs))
            ]
        elif isinstance(ins, TACBTypeEq):
            asmlst.append(ASMBTypeEq(realReg(ins.obj), ASMIndexer.clsTags[ins.dtype], ins.label))
        elif isinstance(ins, TACError):
            asmlst += [
                ASMAssign('%rsi', '$' + str(ins.lineno)),
                ASMAssign('%rdi', '$'+ASMIndexer.strMap[ASMIndexer.errstrMap[ins.reason]]+'_l'),
                ASMMisc('call out_error')
            ]
        else:
            asmlst.append("UNHANDLED: "+ str(ins))

    #put preamble after start label, epilogue before return
    asmlst = [ASMInfo('globl', asmlst[0].name), ASMInfo('type',asmlst[0].name,  '@function')] + \
             asmlst[:1] + preamble + asmlst[1:-1] \
             + epilogue + asmlst[-1:] + [ASMInfo('size', asmlst[0].name, '.-'+asmlst[0].name)]

    #expand out instructions to full ASM
    explst = []
    for ins in asmlst:
        if hasattr(ins, 'expand'):
            explst += ins.expand()
        else:
            explst += [ins]

    # Remove useless mov instructions
    rmlist = []
    for i, ins in enumerate(explst):
        if isinstance(ins, ASMAssign) and ins.assignee == ins.assignor:
            rmlist.append(i)
    explst = [ins for i,ins in enumerate(explst) if i not in rmlist]

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

    # for m in methlist:
    #     for x in m:
    #         print x
    #     print '---'

    asmlist = []
    for meth in methlist:
        cfg = _constructCFG(meth)
        # print cfg
        # print '-----'
        globalDeadRemove(cfg)
        # print cfg
        # print '-----'

        #regmap = registerAllocate(cfg,13)
        regmap = registerAllocate(cfg,13)        #stopgap until registerAllocate is fixed

        asmlist += funcConvert(cfg, regmap)

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
