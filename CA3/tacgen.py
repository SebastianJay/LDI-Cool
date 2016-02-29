import sys
from annast import *
from TAC_serialize import *

#const mapping from AST tokens to TAC tokens
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

#manager for all the data global to expression generation function calls
#  using a static class because I have an aversion to many global vars
class TACIndexer:
    cname = ''      #class name for current instructions
    mname = ''      #method name
    mtype = ''      #method type
    lind = -1       #counter for labels
    rind = -1       #counter for registers
    varRegMap = {}  #symbol table
    inslst = []     #list of TACInstruction

    #increments a counter and returns a string label
    @staticmethod
    def label():
        TACIndexer.lind += 1
        return TACIndexer.cname + '_' + TACIndexer.mname + '_' + str(TACIndexer.lind)

    #increments a counter a returns a register label
    @staticmethod
    def reg():
        TACIndexer.rind += 1
        return 't' + str(TACIndexer.rind)

    #looks up the symbol table for var; creates new register if forceNew or not found
    @staticmethod
    def map(var, forceNew = False):
        if var not in TACIndexer.varRegMap:
            TACIndexer.varRegMap[var] = []
        if forceNew or len(TACIndexer.varRegMap[var]) == 0:
            reg = TACIndexer.reg()
            TACIndexer.varRegMap[var].append(reg)
        return TACIndexer.varRegMap[var][-1]

    #unbinds a symbol table entry for var
    @staticmethod
    def pop(var):
        TACIndexer.varRegMap[var].pop()

    #adds a TACInstruction to the list
    @staticmethod
    def pushIns(ins):
        TACIndexer.inslst.append(ins)

#recursive routine for generating TAC for expressions
def expConvert(node):

    if node.expr == 'while':
        #emit label for loop start (computing predicate)
        lbp = TACIndexer.label()
        TACIndexer.pushIns(TACLabel(lbp))
        #recurse on predicate expression
        regp = expConvert(node.args[0])
        #emit label for loop breakout -- if predicate is false, we jump there
        lbb = TACIndexer.label()
        regpbar = TACIndexer.reg()
        TACIndexer.pushIns(TACOp1(regpbar, 'not', regp))
        TACIndexer.pushIns(TACBT(regpbar, lbb))
        #recurse on body expression
        regb = expConvert(node.args[1])
        #generate jump back to top
        TACIndexer.pushIns(TACJmp(lbp))
        #generate the breakout label
        TACIndexer.pushIns(TACLabel(lbb))
        #create a default as the return value
        reg = TACIndexer.reg()
        TACIndexer.pushIns(TACAllocate(reg, 'default', 'Object'))
        return reg

    elif node.expr == 'if':
        #recurse on predicate expression
        regp = expConvert(node.args[0])
        regpbar = TACIndexer.reg()
        TACIndexer.pushIns(TACOp1(regpbar, 'not', regp))
        #emit label for else and branch there if predicate is false
        #NOTE I generate then first for readability, we can save the not op by doing else first
        lbe = TACIndexer.label()
        TACIndexer.pushIns(TACBT(regpbar, lbe))
        #recurse on then body, emit join label and jump there at end
        #also, place then result into join register
        regt = expConvert(node.args[1])
        regj = TACIndexer.reg()
        TACIndexer.pushIns(TACAssign(regj, regt))
        lbj = TACIndexer.label()
        TACIndexer.pushIns(TACJmp(lbj))
        #insert label for else
        TACIndexer.pushIns(TACLabel(lbe))
        #recurse on else body
        rege = expConvert(node.args[2])
        #place result into join register
        TACIndexer.pushIns(TACAssign(regj, rege))
        #insert join label
        TACIndexer.pushIns(TACLabel(lbj))
        return regj

    elif node.expr == 'let':
        # Bind the let vars
        for binding in node.args[0]:
            if binding.init is not None:
                # if there is an init, generate the init code
                regi = expConvert(binding.init)
                reg = TACIndexer.map(binding.name.name,True)    #create reg here so previous binding holds in init expr
                TACIndexer.pushIns(TACAssign(reg,regi))
            else:
                #otherwise generate default init
                reg = TACIndexer.map(binding.name.name,True)
                TACIndexer.pushIns(TACAllocate(reg,'default',binding.type.name))
        # Generate the body code
        regr = expConvert(node.args[1])
        # Unbind the let vars
        for binding in node.args[0]:
            TACIndexer.pop(binding.name.name)
        return regr

    # NOTE: Case not required for this assignment,
    #       see: https://piazza.com/class/ijen7n8b3bi1tc?cid=172
    elif node.expr == 'case':
        pass

    elif node.expr == 'block':
        for sexpr in node.args:
            reg = expConvert(sexpr)
        return reg  #last expression evaluated is the return val

    elif node.expr == 'assign':
        regr = expConvert(node.args[1])
        reg = TACIndexer.map(node.args[0].name)
        TACIndexer.pushIns(TACAssign(reg, regr))
        return reg

    elif node.expr in ASTExpression.exp1:
        regr = expConvert(node.args)
        regl = TACIndexer.reg()
        TACIndexer.pushIns(TACOp1(regr, astTacMap[node.expr], regr))
        return regr

    elif node.expr in ASTExpression.exp2:
        regr0 = expConvert(node.args[0])
        regr1 = expConvert(node.args[1])
        regl = TACIndexer.reg()
        TACIndexer.pushIns(TACOp2(regr1, astTacMap[node.expr], regr0, regr1))
        return regr1

    # NOTE: Don't think static or dynamic needed for this
    elif node.expr == 'dynamic_dispatch':
        pass
    elif node.expr == 'static_dispatch':
        pass

    # NOTE: out_* and in_* get treated as self-dispatch because of the inherits IO
    elif node.expr == 'self_dispatch':
        # Generate all the arguments for the function call
        regs = [expConvert(e) for e in node.args[1]]
        regr = TACIndexer.reg()
        #TODO if generalizing to all functions, allow TACCall to take multiple args
        ins = TACCall(regr, node.args[0].name, regs[0] if len(regs) > 0 else '')
        TACIndexer.pushIns(ins)
        return regr

    elif node.expr == 'new':
        reg = TACIndexer.reg()
        TACIndexer.pushIns(TACAllocate(reg, node.expr, node.args.name))
        return reg

    elif node.expr == 'identifier':
        reg = TACIndexer.map(node.args.name)
        return reg

    elif node.expr == 'integer' or node.expr == 'string'    \
    or node.expr == 'true' or node.expr == 'false':
        reg = TACIndexer.reg()
        constval = node.expr if node.expr in ['true','false'] else str(node.args)
        TACIndexer.pushIns(TACConstant(reg, astTacMap[node.expr], constval))
        return reg

    print "ERROR: tried to convert unhandled case"
    return None

#routine for generating TAC for methods
def methodConvert(node):
    #set prefix for future labels
    TACIndexer.mname = node.name.name
    #store return type (while expression uses this)
    TACIndexer.mtype = node.type.name
    #assign method args to registers
    for formal in node.formals:
        reg = TACIndexer.map(formal[0].name, True)
        TACIndexer.pushIns(TACAssign(reg, formal[0].name))
    reg = expConvert(node.body)
    #remove identifier -> register mappings
    for formal in node.formals:
        TACIndexer.pop(formal[0].name)
    TACIndexer.pushIns(TACReturn(reg))

#for CA2, looks for the first method of first class and generates its TAC code
def mainConvert(ast):
    
    #only convert the first method of the first class
    if ast.classes:
        mclass = ast.classes[0]
        #set prefix for future labels
        TACIndexer.cname = mclass.name.name
        for feature in mclass.features:
            if isinstance(feature, ASTMethod):
                methodConvert(feature)
                break
    else:
        print 'ERROR: could not find any classes in AST'

    
if __name__ == '__main__':
    with open(sys.argv[1], 'U') as infile:
        lines = infile.read()
    lines = lines.split("\n")
    ast = AST()
    ast.load(iter(lines))

    mainConvert(ast)
    
    #buffer up stored instructions and print
    outbuf = ''
    for ins in TACIndexer.inslst:
        outbuf += str(ins) + '\n'
    print outbuf
