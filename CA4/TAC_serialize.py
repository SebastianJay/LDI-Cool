### Class definitions for TAC serialization
#for control flow graph composed of basic blocks
class TACGraph:
    def __init__(self):
        self.blocks = []
    def addBlock(self, block):
        self.blocks.append(block)
    def toList(self):
        ins = []
        for block in self.blocks:
            ins += block.instructions
        return ins
    def __str__(self):
        retval = ''
        for block in self.blocks:
            retval += str(block)
        return retval[:-1] # Remove trailing newline
    def verbosestr(self):
        retval = ''
        for block in self.blocks:
            retval += 'Parents: ' + str([str(parent.first()) for parent in block.parents]) + '\n'
            retval += 'Children: ' + str([str(child.first()) for child in block.children]) + '\n'
            retval += 'Live In: ' + str(block.liveIn) + "\n"
            retval += 'Live Out: ' + str(block.liveOut) + "\n"
            retval += str(block)
            retval += '\n'
        return retval

#for sequence of TAC instructions
class TACBasicBlock:
    def __init__(self):
        self.instructions = []
        self.parents = []
        self.children = []
        self.liveOut = set()
        self.liveIn = set()
    def addInstruction(self, instruction):
        self.instructions.append(instruction)
    def isEmpty(self):
        return len(self.instructions) == 0
    def first(self):
        return self.instructions[0]
    def last(self):
        return self.instructions[-1]
    def addChild(self, block):
        self.children.append(block)
    def addParent(self, block):
        self.parents.append(block)
    # Updates liveness info from children
    # Returns True if liveness changed, false otherwise
    def updateLiveOut(self):
        nLiveOut = set()
        for child in self.children:
            nLiveOut |= child.liveIn

        if not nLiveOut == self.liveOut:
            self.liveOut = nLiveOut
            return True
        return False
    def __str__(self):
        retval = ''
        for ins in self.instructions:
            if isinstance(ins, TACLabel):
                retval += str(ins) + '\n'
            else:
                retval += '\t' + str(ins) + '\n'
        return retval

#"abstract" class for one TAC instruction
class TACInstruction:
    pass
#"abstract" class for TAC instructions which compute an operation
class TACOp(TACInstruction):
    pass

#TAC instructions which compute operation with one operand
class TACOp1(TACOp):
    def __init__(self, assignee, opcode, op1):
        self.assignee = assignee
        self.opcode = opcode
        self.op1 = op1
    def __str__(self):
        return str(self.assignee) + ' <- ' + str(self.opcode) + ' ' + str(self.op1)

#TAC instructions which compute operations with two operands
class TACOp2(TACOp):
    def __init__(self, assignee, opcode, op1, op2):
        self.assignee = assignee
        self.opcode = opcode
        self.op1 = op1
        self.op2 = op2
    def __str__(self):
        return str(self.assignee) + ' <- ' + str(self.opcode) + ' ' + str(self.op1) + ' ' + str(self.op2)

class TACCompare(TACOp2):
    def __init__(self, assignee, opcode, op1, op2, ptype):
        self.assignee = assignee
        self.opcode = opcode
        self.op1 = op1
        self.op2 = op2
        self.ptype = ptype
    def __str__(self):
        return str(self.assignee) + ' <- ' + str(self.opcode) + '(' + self.ptype + ') ' \
            + str(self.op1) + ' ' + str(self.op2)

#TAC instruction which assigns one variable into another
class TACAssign(TACInstruction):
    def __init__(self, assignee, assignor):
        self.assignee = assignee
        self.assignor = assignor
    def __str__(self):
        return str(self.assignee) + ' <- ' + str(self.assignor)

#"abstract" class for TAC instructions which declare variables
class TACDeclare(TACInstruction):
    pass

#for 'new' and 'default' instructions
class TACAllocate(TACDeclare):
    def __init__(self, assignee, allop, ptype):
        self.assignee = assignee
        self.allop = allop  #should be 'default' or 'new'
        self.ptype = ptype
    def __str__(self):
        return str(self.assignee) + ' <- ' + str(self.allop) + ' ' + str(self.ptype)

#for assigning constants to variables
class TACConstant(TACDeclare):
    def __init__(self, assignee, ptype, const):
        self.assignee = assignee
        self.ptype = ptype
        self.const = const
    def __str__(self):
        return str(self.assignee) + ' <- ' + str(self.ptype) + \
            ("\n" if self.ptype=="string" else ' ') + str(self.const)

#"abstract" class for the control instructions
class TACControl(TACInstruction):
    pass

#generic calls - used for self, static, and dynamic dispatch
class TACCall(TACControl):
    def __init__(self, assignee, funcname, args):
        self.assignee = assignee
        self.funcname = funcname
        if args:
            self.args = args
        else:
            self.args = []
    def __str__(self):
        argstr = ' '.join([str(arg) for arg in self.args])
        return str(self.assignee) + ' <- call ' + str(self.funcname) + ' ' + argstr

#Jmp instruction
class TACJmp(TACControl):
    def __init__(self, label):
        self.label = label
    def __str__(self):
        return 'jmp ' + str(self.label)

#label instruction
class TACLabel(TACControl):
    def __init__(self, name):
        self.name = name
    def __str__(self):
        return 'label ' + str(self.name)

#Return instruction
class TACReturn(TACControl):
    def __init__(self, retval):
        self.retval = retval
    def __str__(self):
        return 'return ' + str(self.retval)

#Bt instruction
class TACBT(TACControl):
    def __init__(self, cond, label):
        self.cond = cond
        self.label = label
    def __str__(self):
        return 'bt ' + str(self.cond) + ' ' + str(self.label)

#abstract class for meta-instructions related to ASM gen
class TACAux(TACInstruction):
    pass

#create space on heap for a class
#overload to handle initializing the class tag, vtable, and obj size fields
class TACMalloc(TACAux):
    def __init__(self, assignee, cname):
        self.assignee = assignee
        self.cname = cname
    def __str__(self):
        return str(self.assignee) + ' <- ' + 'malloc ' + str(self.cname)

#represents a lookup in a virtual method table for a function
class TACVTable(TACAux):
    def __init__(self, assignee, obj, cname, mname):
        self.assignee = assignee
        self.obj = obj
        self.cname = cname
        self.mname = mname
    def __str__(self):
        return str(self.assignee) + ' <- ' + 'vtable ' + str(self.obj) + ' ' + str(self.cname) + '.' + str(self.mname)

#represents an unconditional runtime error - contains line number and error code
class TACError(TACAux):
    def __init__(self, lineno, reason):
        self.lineno = lineno
        self.reason = reason
    def __str__(self):
        return 'error ' + str(self.lineno) + ' ' + str(self.reason)

#represents a check on the object's dynamic type - used for case statements
#if equal a branch is performed to specified label
class TACBTypeEq(TACAux):
    def __init__(self, obj, dtype, label):
        self.obj = obj
        self.dtype = dtype
        self.label = label
    def __str__(self):
        return 'btypeeq ' + str(self.obj) + ' ' + str(self.dtype) + ' ' + str(self.label)

#abstract class representing something TAC can compute on
# register, attr (from memory), method arg
class TACOperand:
    def getName():
        pass

class TACRegister(TACOperand):
    def __init__(self, name, boxed = True):
        self.name = name
        self.boxed = boxed
    def __str__(self):
        return self.name + ('' if self.boxed else '[x]')

    def getName(self):
        return self.name


class TACClassAttr(TACOperand):
    def __init__(self, reg, cname, aname):
        self.reg = reg
        self.cname = cname
        self.aname = aname
        self.boxed = True
    def __str__(self):
        return str(self.reg)+'@'+self.cname+':'+self.aname+ ('' if self.boxed else '[x]')
    def getName(self):
        return self.reg.name

class TACMethodArg(TACOperand):
    def __init__(self, cname, mname, fname):
        self.cname = cname
        self.mname = mname
        self.fname = fname
    def __str__(self):
        return '#'+self.fname+'@'+self.cname+':'+self.mname

### Functions for converting input stream to TACGraph
def serializeTAC(streamptr):
    return _constructCFG(_readToTACInstructions(streamptr))

def _constructCFG(lstins):
    cnt = 0
    currbb = TACBasicBlock()
    lbbmap = {}
    blocks = []
    #group together instructions forming blocks
    while cnt < len(lstins):
        ins = lstins[cnt]
        if isinstance(ins, TACLabel):
            if not currbb.isEmpty():
                blocks.append(currbb)
                currbb = TACBasicBlock()
            currbb.addInstruction(ins)
            lbbmap[ins.name] = currbb
        elif isinstance(ins, TACJmp) or isinstance(ins, TACBT) or \
        isinstance(ins, TACReturn) or isinstance(ins, TACBTypeEq) or \
        isinstance(ins, TACError):
            currbb.addInstruction(ins)
            blocks.append(currbb)
            currbb = TACBasicBlock()
        else:
            currbb.addInstruction(ins)
        cnt += 1
    if not currbb.isEmpty():
        blocks.append(currbb)

    cnt = 0
    while cnt < len(blocks):
        block = blocks[cnt]
        #connect labels to previous blocks if fall through possible
        if isinstance(block.first(), TACLabel) and cnt > 0:
            prevblock = blocks[cnt-1]
            #jmp and bt cases are taken care of further down
            if not isinstance(prevblock.last(), TACReturn)  \
            and not isinstance(prevblock.last(), TACError)  \
            and not isinstance(prevblock.last(), TACJmp)    \
            and not isinstance(prevblock.last(), TACBT)     \
            and not isinstance(prevblock.last(), TACBTypeEq):
                block.addParent(prevblock)
                prevblock.addChild(block)
        #connect jmp
        if isinstance(block.last(), TACJmp):
            block.addChild(lbbmap[block.last().label])
            lbbmap[block.last().label].addParent(block)
        #connect branches to possible jmp and next sequential block
        if isinstance(block.last(), TACBT) \
        or isinstance(block.last(), TACBTypeEq):
            block.addChild(lbbmap[block.last().label])
            lbbmap[block.last().label].addParent(block)
            if cnt + 1 < len(blocks):
                nextblock = blocks[cnt + 1]
                block.addChild(nextblock)
                nextblock.addParent(block)

        cnt += 1

    graph = TACGraph()
    graph.blocks = blocks
    return graph

def _readToTACInstructions(streamptr):
    lines = streamptr.readlines()
    lines = [line.strip() for line in lines]
    cnt = 0
    instructions = []
    while cnt < len(lines):
        if lines[cnt] == '':
            cnt += 1
            continue
        if lines[cnt][0:7] == 'comment':
            cnt += 1
            continue

        lineargs = lines[cnt].split()   #by default splits by whitespace
        if len(lineargs) <= 1:
            print 'ERROR: unexpected input: ' + lines[cnt]
            return []

        if lineargs[1] == '<-':
            if lineargs[2] == '+' or lineargs[2] == '-' or lineargs[2] == '*'   \
            or lineargs[2] == '/' or lineargs[2] == '<' or lineargs[2] == '<='  \
            or lineargs[2] == '=':
                ins = TACOp2(lineargs[0], lineargs[2], lineargs[3], lineargs[4])
            elif lineargs[2] == 'not' or lineargs[2] == '~' or lineargs[2] == 'isvoid':
                ins = TACOp1(lineargs[0], lineargs[2], lineargs[3])
            elif lineargs[2] == 'new' or lineargs[2] == 'default':
                ins = TACAllocate(lineargs[0], lineargs[2], lineargs[3])
            elif lineargs[2] == 'call':
                if len(lineargs) >= 5:
                    ins = TACCall(lineargs[0], lineargs[3], [lineargs[4]])
                else:
                    ins = TACCall(lineargs[0], lineargs[3])
            elif lineargs[2] == 'int' or lineargs[2] == 'bool':
                ins = TACConstant(lineargs[0], lineargs[2], lineargs[3])
            elif lineargs[2] == 'string':
                cnt += 1
                ins = TACConstant(lineargs[0], lineargs[2], lines[cnt])
            else:   #assume rest are assignments
                ins = TACAssign(lineargs[0], lineargs[2])
        elif lineargs[0] == 'jmp':
            ins = TACJmp(lineargs[1])
        elif lineargs[0] == 'label':
            ins = TACLabel(lineargs[1])
        elif lineargs[0] == 'return':
            ins = TACReturn(lineargs[1])
        elif lineargs[0] == 'bt':
            ins = TACBT(lineargs[1], lineargs[2])
        else:
            print 'ERROR: unexpected input: ' + lines[cnt]
            return []

        instructions.append(ins)
        cnt += 1
    return instructions

import sys
if __name__ == '__main__':
    graph = serializeTAC(sys.stdin)
    print graph.verbosestr()
