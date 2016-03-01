from TAC_serialize import *
from main import registerAllocate
import sys

#maps int result of graph coloring to x64 register name
cRegMap = {
    0 : '%rax',     #return value for function calls
    1 : '%rbx',
    2 : '%rcx',
#    3 : '%rdx',    # Save rdx for multiplication, division, and bool logic
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
tmpreg = 13

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
        if self.opcode in ['<', '=', '<=']:
            asm.append('cmp ' + self.operands[0] + ', '+ self.operands[0])
            asm.append(ASMConstant(self.assignee, 'bool', 'false'))
            asm.append(ASMConstant('%rdx', 'bool', 'true'))
        if (len(self.operands) == 1 and self.operands[0] != self.assignee)\
           or (len(self.operands) == 2 and self.operands[1] != self.assignee):
            asm.append(ASMAssign(self.assignee, self.operands[0]))
        asm.append(self)
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
            return 'xorq $1,' + self.assignee
        elif self.opcode == 'isvoid':
            pass
        elif self.opcode == '~':
            return 'negq ' + self.operands[0]
        return '\n'

#ASM instruction which assigns one variable into another
class ASMAssign(ASMInstruction):
    def __init__(self, assignee, assignor):
        self.assignee = assignee
        self.assignor = assignor
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
        return self.assignee + ' <- ' + self.allop + ' ' + self.ptype

#for assigning constants to variables
class ASMConstant(ASMDeclare):
    def __init__(self, assignee, ptype, const):
        self.assignee = assignee
        self.ptype = ptype
        self.const = const
    def __str__(self):
        if self.ptype == 'string':
            raise TypeError('string not implemented')
        if self.ptype == 'int':
            return 'movq $' + str(self.const) + ', ' + self.assignee
        if self.ptype == 'bool':
            if self.const == 'true':
                return 'movq $0, ' + self.assignee
            else:
                return 'movq $1, ' + self.assignee

#ASM calls to functions
class ASMCall(ASMInstruction):
    def __init__(self, assignee, funcname, op1=''):
        self.assignee = assignee
        self.funcname = funcname
        self.op1 = op1
    def expand(self):
        asm = []
        asm.append(self)
        return asm
    def __str__(self):
        if self.op1:
            return self.assignee + ' <- call ' + self.funcname + ' ' + self.op1
        return self.assignee + ' <- call ' + self.funcname

#"abstract" class for the control instructions
class ASMControl(ASMInstruction):
    pass

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
        asm.append(self)
        return asm
    def __str__(self):
        return 'ret'

#Bt instruction
class ASMBT(ASMControl):
    def __init__(self, cond, label):
        self.cond = cond
        self.label = label
    def __str__(self):
        return 'cmp ' + self.cond + ', ' + self.cond + "\n" \
            + '\tjnz ' + self.label
#end ASM class definitions

#returns list of colors of registers that must be used for specified x86 commands
#e.g. imulq needs %rax and %rdx as "result registers"
def getConflicts(tacIns):
    pass

#takes a control flow graph and mapping of virtual registers to colors
#returns list of x64 instructions as ASM* instances
def funcConvert(cfg, regMap):

    def realReg(vreg):
        return cRegMap[regMap[vreg]]

    inslst = cfg.toList()
    asmlst = [
        ASMInfo('globl', 'main'),
        ASMInfo('type', 'main', '@function'),
        ASMLabel('main')
    ]
    #print inslst
    #print regMap
    for ins in inslst:
        if isinstance(ins, TACOp):
            operands = [realReg(ins.op1), realReg(ins.op2)] \
                if isinstance(ins, TACOp2) else [realReg(ins.op1)]
            asmlst.append(ASMOp(realReg(ins.assignee), ins.opcode, operands))
        elif isinstance(ins, TACAssign):
            asmlst.append(ASMAssign(realReg(ins.assignee), realReg(ins.assignor)))
        elif isinstance(ins, TACAllocate):
            pass
        elif isinstance(ins, TACCall):
            pass
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
    rmlist = []
    for i, ins in enumerate(asmlst):
        if isinstance(ins, ASMAssign) and ins.assignee == ins.assignor:
            rmlist.append(i)
    asmlst = [ins for i,ins in enumerate(asmlst) if i not in rmlist]
    return asmlst

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
