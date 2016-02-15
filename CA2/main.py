import sys
from ast import *
from TAC_serialize import *

astTacMap = {
    'not' :     'not',
    'negate' :  '~',
    'isvoid' :  'isvoid',
    'plus' :    '+',
    'minus' :   '-',
    'times' :   '*',
    'divide' :  '/',
    'lt' :      '<',
    'le' :      '<=',
    'eq' :      '=',
    'integer' : 'int',
    'string' :  'string',
    'true' :    'bool',
    'false' :   'bool',
}

class TACIndexer:
    cname = ''
    mname = ''
    mtype = ''
    lind = 0
    rind = 0
    varRegMap = {}

    @staticmethod
    def label():
        TACIndexer.lind += 1
        return TACIndexer.cname + '_' + TACIndexer.mname + '_' + str(TACIndexer.lind-1)

    @staticmethod
    def reg():
        TACIndexer.rind += 1
        return 't' + str(TACIndexer.rind-1)

    @staticmethod
    def map(var, forceNew = False):
        if var not in TACIndexer.varRegMap:
            TACIndexer.varRegMap[var] = []
        if forceNew or len(TACIndexer.varRegMap[var]) == 0:
            reg = TACIndexer.reg()
            TACIndexer.varRegMap[var].append(reg)
        return TACIndexer.varRegMap[var][-1]

    @staticmethod
    def pop(var):
        pass

def expConvert(node, inslst, args=[]):
    if node.expr == 'while':
        #emit label for loop start (computing predicate)
        lbp = TACIndexer.label()
        ins = TACLabel(lbp)
        inslst.append(ins)
        #recurse on predicate expression
        regp = expConvert(node.args[0], inslst)
        #emit label for loop breakout -- if predicate is false, we jump there
        lbb = TACIndexer.label()
        regpbar = TACIndexer.reg()
        ins = TACOp1(regpbar, 'not', regp)
        inslst.append(ins)
        ins = TACBT(regpbar, lbb)
        inslst.append(ins)
        #recurse on body expression
        regb = expConvert(node.args[1], inslst)
        #generate jump back to top
        ins = TACJmp(lbp)
        inslst.append(ins)
        #generate the breakout label
        ins = TACLabel(lbb)
        inslst.append(lbb)
        #create a default as the return value
        reg = TACIndexer.reg()
        ins = TACAllocate(reg, 'default', TACIndexer.mtype)
        inslst.append(ins)
        return reg
    elif node.expr == 'if':
        #recurse on predicate expression
        regp = expConvert(node.args[0], inslst)
        regpbar = TACIndexer.reg()
        ins = TACOp1(regpbar, 'not', regp)
        inslst.append(ins)
        #emit label for else and branch there if predicate is false
        #NOTE I generate then first for readability, we can save the not op by doing else first
        lbe = TACIndexer.label()
        ins = TACBT(regpbar, lbe)
        inslst.append(ins)
        #recurse on then body, emit join label and jump there at end
        #also, place then result into join register
        regt = expConvert(node.args[1], inslst)
        regj = TACIndexer.reg()
        ins = TACAssign(regj, regt)
        inslst.append(ins)
        lbj = TACIndexer.label()
        ins = TACJmp(lbj)
        inslst.append(ins)
        #insert label for else
        ins = TACLabel(lbe)
        inslst.append(ins)
        #recurse on else body
        rege = expConvert(node.args[2], inslst)
        #place result into join register
        ins = TACAssign(regj, rege)
        inslst.append(ins)
        #insert join label
        ins = TACLabel(lbj)
        inslst.append(ins)
        return regj
    elif node.expr == 'let':
        pass
    elif node.expr == 'case':
        pass
    elif node.expr == 'block':
        for sexpr in node.args:
            reg = expConvert(sexpr, inslst)
        return reg  #last expression evaluated is the return val
    elif node.expr == 'assign':
        regr = expConvert(node.args[1], inslst)
        reg = TACIndexer.map(node.args[0].name)
        ins = TACAssign(reg, regr)
        inslst.append(ins)
        return reg
    elif node.expr in ASTExpression.exp1:
        regr = expConvert(node.args, inslst)
        regl = TACIndexer.reg()
        ins = TACOp1(regl, astTacMap[node.expr], regr)
        inslst.append(ins)
        return regl
    elif node.expr in ASTExpression.exp2:
        regr0 = expConvert(node.args[0], inslst)
        regr1 = expConvert(node.args[1], inslst)
        regl = TACIndexer.reg()
        ins = TACOp2(regl, astTacMap[node.expr], regr0, regr1)
        inslst.append(ins)
        return regl
    elif node.expr == 'dynamic_dispatch':
        pass
    elif node.expr == 'static_dispatch':
        pass
    elif node.expr == 'self_dispatch':
        pass
    elif node.expr == 'new':
        reg = TACIndexer.reg()
        ins = TACAllocate(reg, node.expr, node.args.name)
        inslst.append(ins)
        return reg
    elif node.expr == 'identifier':
        reg = TACIndexer.map(node.args.name)
        return reg
    elif node.expr == 'integer' or node.expr == 'string'    \
    or node.expr == 'true' or node.expr == 'false':
        reg = TACIndexer.reg()
        constval = str(node.args)
        if isinstance(node.args, bool):
            constval = constval.lower()
        ins = TACConstant(reg, astTacMap[node.expr], constval)    #TODO double check
        inslst.append(ins)
        return reg
    print "ERROR: tried to convert unhandled case"
    return None

def methodConvert(node, inslst):
    #set prefix for future labels
    TACIndexer.mname = node.name.name
    #store return type (while expression uses this)
    TACIndexer.mtype = node.type.name
    #assign method args to registers
    for formal in node.formals:
        reg = TACIndexer.map(formal.name, True)
        ins = TACAssign(reg, formal.name)
        inslst.append(ins)
    #remove identifier -> register mappings
    for formal in node.formals:
        TACIndexer.pop(formal.name)
    reg = expConvert(node.body, inslst)
    ins = TACReturn(reg)
    inslst.append(ins)

def mainConvert():
    with open(sys.argv[1]) as infile:
        lines = infile.read()
    lines = lines.split("\n")
    ast = AST()
    ast.load(iter(lines))
    print ast

    #only convert the first method of the first class
    inslst = []
    if ast.classes:
        mclass = ast.classes[0]
        #set prefix for future labels
        TACIndexer.cname = mclass.name.name
        for feature in mclass.features:
            if isinstance(feature, ASTMethod):
                methodConvert(feature, inslst)
                break
    else:
        print 'ERROR: could not find any classes in AST'

    #buffer up stored instructions and print
    outbuf = ''
    for ins in inslst:
        outbuf += str(ins) + '\n'
    print outbuf

if __name__ == '__main__':
    mainConvert()
