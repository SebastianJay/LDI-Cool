from TAC_serialize import *

#enum for type of object
class DataType:
    Repr = ['Object', 'Int', 'Bool', 'String']
    Object = 0
    Int = 1
    Bool = 2
    String = 3

#enum for position on lattice
class DataLattice:
    Repr = ['Bottom', 'Mid', 'Top']
    Bottom = 0
    Mid = 1
    Top = 2

#struct for information about a virtual register
class DataInfo:
    def __init__(self, dtype, dlat, args):
        self.dtype = dtype
        self.dlat = dlat
        #args member contains different type depending on dtype
        #   for String, it is a string
        #   for Int, it is a two tuple (int lower bound, int upper bound)
        #   for Bool, it is True or False
        #   for Object, it is a two tuple (bool isvoid?, string strictest type)
        #if dlat is Top or Bottom then this member is invalid
        self.args = args
    def copy(self):
        argscpy = self.args
        if isinstance(self.args, list) or isinstance(self.args, tuple):
            argscpy = self.args[:]
        return DataInfo(self.dtype, self.dlat, argscpy)
    def __str__(self):
        ret = '[' + DataType.Repr[self.dtype] + ', ' + DataLattice.Repr[self.dlat]
        if self.dlat == DataLattice.Mid:
            ret += ', '
            if self.dtype == DataType.Object:
                ret += '(' + ('Void' if self.args[0] else 'NonVoid') + ', ' + self.args[1] + ')'
            else:
                ret += str(self.args)
        ret += ']'
        return ret

#continue propagating information between basic blocks until fixed point is reached
def globalFlow(cfg):
    vregs = enumerateReg(cfg)
    initData = {}
    for vreg in vregs:
        initData[vreg] = DataInfo(DataType.Object, DataLattice.Bottom, None)
    for block in cfg.blocks:
        block.dataIn = initData
        block.dataOut = initData
    while True:
        changed = False
        for block in cfg.blocks:
            lstIn = [block.dataIn]
            for parent in block.parents:
                lstIn.append(parent.dataOut)
            block.dataIn = join(lstIn)
            changed = changed or forwardFlow(block)
        if not changed:
            break

#modifies block.dataOut in place and returns true if a change was made
def forwardFlow(block):
    dataIn = block.dataIn
    dataOut = block.dataOut
    mdata = dataIn
    for ins in block.instructions:
        mdata = transfer(ins, mdata)
    block.dataOut = mdata
    return not dataCompare(dataOut, block.dataOut)

#returns a data corresponding to addition of information by TAC ins
def transfer(ins, data):
    dataOut = dataCopy(data)
    if isinstance(ins, TACOp2):
        if ins.op1 not in data or ins.op2 not in data or data[ins.op1].dlat != DataLattice.Mid or data[ins.op2].dlat != DataLattice.Mid:
            dataOut[ins.assignee] = DataInfo(DataType.Object, DataLattice.Bottom, None)
            return dataOut
        if ins.opcode == '+':
            dataOut[ins.assignee] = DataInfo(DataType.Int, DataLattice.Mid, \
                (data[ins.op1].args[0] + data[ins.op2].args[0], data[ins.op1].args[1] + data[ins.op2].args[1]))
        elif ins.opcode == '-':
            dataOut[ins.assignee] = DataInfo(DataType.Int, DataLattice.Mid, \
                (data[ins.op1].args[0] - data[ins.op2].args[0], data[ins.op1].args[1] - data[ins.op2].args[1]))
        elif ins.opcode == '*':
            dataOut[ins.assignee] = DataInfo(DataType.Int, DataLattice.Mid, \
                (data[ins.op1].args[0] * data[ins.op2].args[0], data[ins.op1].args[1] * data[ins.op2].args[1]))
        elif ins.opcode == '/':
            #TODO handle divide by zero
            dataOut[ins.assignee] = DataInfo(DataType.Int, DataLattice.Mid, \
                (data[ins.op1].args[0] / data[ins.op2].args[0], data[ins.op1].args[1] / data[ins.op2].args[1]))
        elif ins.opcode == '<':
            if data[ins.op1].dtype == DataType.Int and data[ins.op2].dtype == DataType.Int:
                #if upper bound of op1 is less than lower bound of op2 then certainly true
                if data[ins.op1].args[1] < data[ins.op2].args[0]:
                    dataOut[ins.assignee] = DataInfo(DataType.Bool, DataLattice.Mid, True)
                #if lower bound of op1 is greater than upper bound of op2 then certainly false
                elif data[ins.op1].args[0] > data[ins.op2].args[1]:
                    dataOut[ins.assignee] = DataInfo(DataType.Bool, DataLattice.Mid, False)
                #otherwise we do not know
                else:
                    dataOut[ins.assignee] = DataInfo(DataType.Bool, DataLattice.Top, None)
            elif data[ins.op1].dtype == DataType.Bool and data[ins.op2].dtype == DataType.Bool:
                if data[ins.op1].args == False and data[ins.op2].args == True:
                    dataOut[ins.assignee] = DataInfo(DataType.Bool, DataLattice.Mid, True)
                else:
                    dataOut[ins.assignee] = DataInfo(DataType.Bool, DataLattice.Mid, False)
            elif data[ins.op1].dtype == DataType.String and data[ins.op2].dtype == DataType.String:
                dataOut[ins.assignee] = DataInfo(DataType.Bool, DataLattice.Mid, data[ins.op1].args < data[ins.op2].args)
            else:
                #better Object lattice might be able to do compare
                dataOut[ins.assignee] = DataInfo(DataType.Bool, DataLattice.Top, None)
        elif ins.opcode == '<=':
            if data[ins.op1].dtype == DataType.Int and data[ins.op2].dtype == DataType.Int:
                if data[ins.op1].args[1] <= data[ins.op2].args[0]:
                    dataOut[ins.assignee] = DataInfo(DataType.Bool, DataLattice.Mid, True)
                elif data[ins.op1].args[0] > data[ins.op2].args[1]:
                    dataOut[ins.assignee] = DataInfo(DataType.Bool, DataLattice.Mid, False)
                else:
                    dataOut[ins.assignee] = DataInfo(DataType.Bool, DataLattice.Top, False)
            elif data[ins.op1].dtype == DataType.Bool and data[ins.op2].dtype == DataType.Bool:
                if (data[ins.op1].args == False and data[ins.op2].args == True) or data[ins.op1].args == data[ins.op2].args:
                    dataOut[ins.assignee] = DataInfo(DataType.Bool, DataLattice.Mid, True)
                else:
                    dataOut[ins.assignee] = DataInfo(DataType.Bool, DataLattice.Mid, False)
            elif data[ins.op1].dtype == DataType.String and data[ins.op2].dtype == DataType.String:
                dataOut[ins.assignee] = DataInfo(DataType.Bool, DataLattice.Mid, data[ins.op1].args <= data[ins.op2].args)
            else:
                dataOut[ins.assignee] = DataInfo(DataType.Bool, DataLattice.Top, None)
        elif ins.opcode == '=':
            if data[ins.op1].dtype == DataType.Int and data[ins.op2].dtype == DataType.Int:
                if data[ins.op1].args == data[ins.op2].args:
                    dataOut[ins.assignee] = DataInfo(DataType.Bool, DataLattice.Mid, True)
                #if both ops have a definite number and they are not the same then certainly false
                elif data[ins.op1].args[0] == data[ins.op1].args[1] and data[ins.op2].args[0] == data[ins.op2].args[1] \
                    and data[ins.op1].args != data[ins.op2].args:
                    dataOut[ins.assignee] = DataInfo(DataType.Bool, DataLattice.Mid, False)
                else:
                    dataOut[ins.assignee] = DataInfo(DataType.Bool, DataLattice.Top, False)
            elif data[ins.op1].dtype == DataType.Bool and data[ins.op2].dtype == DataType.Bool:
                if data[ins.op1].args == data[ins.op2].args:
                    dataOut[ins.assignee] = DataInfo(DataType.Bool, DataLattice.Mid, True)
                else:
                    dataOut[ins.assignee] = DataInfo(DataType.Bool, DataLattice.Mid, False)
            elif data[ins.op1].dtype == DataType.String and data[ins.op2].dtype == DataType.String:
                dataOut[ins.assignee] = DataInfo(DataType.Bool, DataLattice.Mid, data[ins.op1].args == data[ins.op2].args)
            else:
                dataOut[ins.assignee] = DataInfo(DataType.Bool, DataLattice.Top, False)
        #correct the bounds if the lower bound is greater than the upper
        if dataOut[ins.assignee].dtype == DataType.Int and dataOut[ins.assignee].args[0] > dataOut[ins.assignee].args[1]:
            dataOut[ins.assignee].args = (dataOut[ins.assignee].args[1], dataOut[ins.assignee].args[0])
    elif isinstance(ins, TACOp1):
        if ins.op1 not in data or data[ins.op1].dlat != DataLattice.Mid:
            dataOut[ins.assignee] = DataInfo(DataType.Object, DataLattice.Bottom, None)
            return dataOut
        if ins.opcode == 'not':
            dataOut[ins.assignee] = DataInfo(DataType.Bool, DataLattice.Mid, not data[ins.op1].args)
        if ins.opcode == '~':
            dataOut[ins.assignee] = DataInfo(DataType.Int, DataLattice.Mid, (-data[ins.op1].args[1], -data[ins.op1].args[0]))
        if ins.opcode == 'isvoid':
            if data[ins.op1].dtype in [DataType.Int, DataType.Bool, DataType.String]:
                dataOut[ins.assignee] = DataInfo(DataType.Bool, DataLattice.Mid, False)
            else:
                dataOut[ins.assignee] = DataInfo(DataType.Bool, DataLattice.Mid, data[ins.op1].args[0])
    elif isinstance(ins, TACAllocate):
        if ins.ptype == 'Int':
            dataOut[ins.assignee] = DataInfo(DataType.Int, DataLattice.Mid, (0, 0))
        elif ins.ptype == 'Bool':
            dataOut[ins.assignee] = DataInfo(DataType.Bool, DataLattice.Mid, False)
        elif ins.ptype == 'String':
            dataOut[ins.assignee] = DataInfo(DataType.String, DataLattice.Mid, '')
        elif ins.allop == 'default':
            dataOut[ins.assignee] = DataInfo(DataType.Object, DataLattice.Mid, (True, ins.ptype))
        else:   #new
            dataOut[ins.assignee] = DataInfo(DataType.Object, DataLattice.Mid, (False, ins.ptype))
    elif isinstance(ins, TACCall):
        dataOut[ins.assignee] = DataInfo(DataType.Object, DataLattice.Top, None)
    elif isinstance(ins, TACConstant):
        if ins.ptype == 'int':
            dataOut[ins.assignee] = DataInfo(DataType.Int, DataLattice.Mid, (int(ins.const), int(ins.const)))
        elif ins.ptype == 'bool':
            dataOut[ins.assignee] = DataInfo(DataType.Bool, DataLattice.Mid, str(ins.const) == 'true')
        elif ins.ptype == 'string':
            dataOut[ins.assignee] = DataInfo(DataType.String, DataLattice.Mid, ins.const)
    elif isinstance(ins, TACAssign):
        if ins.assignor not in data:
            dataOut[ins.assignee] = DataInfo(DataType.Object, DataLattice.Bottom, None)
        else:
            dataOut[ins.assignee] = data[ins.assignor].copy()
    return dataOut

#joins multiple data dicts from multiple incoming edges of cfg
def join(lstdata):
    vregs = set()
    for data in lstdata:
        for key in data:
            vregs.add(key)
    joined = {}
    for vreg in vregs:
        joined[vreg] = DataInfo(DataType.Object, DataLattice.Bottom, None)
        for data in lstdata:
            if vreg in data:
                joined[vreg] = dataLub(joined[vreg], data[vreg])
    return joined

#least upper bound function for DataInfo
def dataLub(a, b):
    #if one is bottom return the other
    if a.dlat == DataLattice.Bottom:
        return b
    if b.dlat == DataLattice.Bottom:
        return a
    #if one is top then return it
    if a.dlat == DataLattice.Top:
        return a
    if b.dlat == DataLattice.Top:
        return b
    #must be Mid
    #if the two are of incompatible types return Top
    if a.dtype != b.dtype:
        return DataInfo(DataType.Object, DataLattice.Top, None)
    #if Int then widen the range of args
    if a.dtype == DataType.Int:
        return DataInfo(DataType.Int, DataLattice.Mid, \
            (a.args[0] if a.args[0] < b.args[0] else b.args[0], a.args[1] if a.args[1] > b.args[1] else b.args[1]))
    #if Bool they must be the same to avoid Top
    if a.dtype == DataType.Bool:
        if a.args == b.args:
            return a
        else:
            return DataInfo(DataType.Bool, DataLattice.Top, None)
    #if String they must be the same to avoid Top
    if a.dtype == DataType.String:
        if a.args == b.args:
            return a
        else:
            return DataInfo(DataType.String, DataLattice.Top, None)
    #must be Object
    #compare void/nonvoid and type
    if a.args == b.args:
        return a
    else:
        return DataInfo(DataType.Object, DataLattice.Top, None)

#returns a copy of data dict - keys are same, but data is duplicate
def dataCopy(dataIn):
    dataOut = {}
    for d in dataIn:
        dataOut[d] = dataIn[d].copy()
    return dataOut

#return true if data dicts a and b are equivalent
def dataCompare(a, b):
    for key in a:
        if key not in b:
            return False
        if a[key].dlat != b[key].dlat:
            return False
        if a[key].dlat == DataLattice.Mid:
            if a[key].args != b[key].args or a[key].dtype != b[key].dtype:
                return False
    for key in b:
        if key not in a:
            return False
    return True

def enumerateReg(cfg):
    vregs = set()
    for block in cfg.blocks:
        for ins in block.instructions:
            if isinstance(ins, TACOp):
                vregs.add(ins.op1)
                if isinstance(ins, TACOp2):
                    vregs.add(ins.op2)
            if isinstance(ins, TACAssign):
                vregs.add(ins.assignor)
            if hasattr(ins, 'assignee'):
                vregs.add(ins.assignee)
    return vregs

import sys
import tacgen
from TAC_serialize import _constructCFG
from tacgen import TACIndexer
if __name__ == '__main__':
    cmap, imap, pmap, ast = tacgen.readClType(sys.argv[1])
    TACIndexer.setTypeMaps(cmap, imap, pmap)
    tacgen.attrConvert(ast)
    tacgen.implConvert(ast)
    taclist = TACIndexer.inslst

    methlist = []
    lastInd = 0
    for i in range(len(taclist)):
        # Split taclist on method labels
        if isinstance(taclist[i], TACLabel) and taclist[i].name[0] != '.':
            if i != 0:
                methlist.append(taclist[lastInd:i])
                lastInd = i
    methlist.append(taclist[lastInd:])

    for meth in methlist:
        cfg = _constructCFG(meth)
        globalFlow(cfg)
        print cfg
        print cfg.verbosestr()
