### Class definitions for TAC serialization
#for control flow graph composed of basic blocks
class TACGraph:
    def __init__(self):
        self.blocks = []
    def addBlock(self, block):
        self.blocks.append(block)
    #program entry should always be the first basic block
    def entry(self):
        return blocks[0]
    def __str__(self):
        retval = ''
        for block in self.blocks:
            retval += str(block)
        return retval
    def verbosestr(self):
        retval = ''
        for block in self.blocks:
            retval += 'Parents: ' + str([str(parent.first()) for parent in block.parents]) + '\n'
            retval += 'Children: ' + str([str(child.first()) for child in block.children]) + '\n'
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
    def __str__(self):
        retval = ''
        for ins in self.instructions:
            retval += str(ins) + '\n'
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
        return self.assignee + ' <- ' + self.opcode + ' ' + self.op1

#TAC instructions which compute operations with two operands
class TACOp2(TACOp):
    def __init__(self, assignee, opcode, op1, op2):
        self.assignee = assignee
        self.opcode = opcode
        self.op1 = op1
        self.op2 = op2
    def __str__(self):
        return self.assignee + ' <- ' + self.opcode + ' ' + self.op1 + ' ' + self.op2

#TAC instruction which assigns one variable into another
class TACAssign(TACInstruction):
    def __init__(self, assignee, assignor):
        self.assignee = assignee
        self.assignor = assignor
    def __str__(self):
        return self.assignee + ' <- ' + self.assignor

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
        return self.assignee + ' <- ' + self.allop + ' ' + self.ptype

#for assigning constants to variables
class TACConstant(TACDeclare):
    def __init__(self, assignee, ptype, const):
        self.assignee = assignee
        self.ptype = ptype
        self.const = const
    def __str__(self):
        return self.assignee + ' <- ' + self.ptype + ' ' + self.const

#TAC calls to in/out string/int
class TACCall(TACInstruction):
    def __init__(self, assignee, funcname, op1=''):
        self.assignee = assignee
        self.funcname = funcname
        self.op1 = op1
    def __str__(self):
        if self.op1:
            return self.assignee + ' <- call ' + self.funcname + ' ' + self.op1
        return self.assignee + ' <- call ' + self.funcname

#"abstract" class for the control instructions
class TACControl(TACInstruction):
    pass

#Jmp instruction
class TACJmp(TACControl):
    def __init__(self, label):
        self.label = label
    def __str__(self):
        return 'jmp ' + self.label

#label instruction
class TACLabel(TACControl):
    def __init__(self, name):
        self.name = name
    def __str__(self):
        return 'label ' + self.name

#Return instruction
class TACReturn(TACControl):
    def __init__(self, retval):
        self.retval = retval
    def __str__(self):
        return 'return ' + self.retval

#Bt instruction
class TACBT(TACControl):
    def __init__(self, cond, label):
        self.cond = cond
        self.label = label
    def __str__(self):
        return 'bt ' + self.cond + ' ' + self.label


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
        isinstance(ins, TACReturn):
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
            and not isinstance(prevblock.last(), TACJmp)    \
            and not isinstance(prevblock.last(), TACBT):
                block.addParent(prevblock)
                prevblock.addChild(block)
        #connect jmp
        if isinstance(block.last(), TACJmp):
            block.addChild(lbbmap[block.last().label])
            lbbmap[block.last().label].addParent(block)
        #connect bt to possible jmp and next block
        if isinstance(block.last(), TACBT):
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
                    ins = TACCall(lineargs[0], lineargs[3], lineargs[4])
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
