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
    mname = ''      #method name for current instructions
    lind = 0        #counter for labels
    rind = 0        #counter for registers
    varRegMap = {}  #symbol table, map string var -> lst of string registers bound to var
    classAttrs = {} #map string class name -> set of strings of attr names
    inslst = []     #list of TACInstruction

    cmap = {}       #class map
    imap = {}       #implementation map
    pmap = {}       #parent map

    returnReg = 't0' # Special register for call return values, helps with register allocation

    @staticmethod
    def setTypeMaps(cmap, imap, pmap):
        TACIndexer.cmap = cmap
        TACIndexer.imap = imap
        TACIndexer.pmap = pmap

    #resets counters and sets the names for labels
    @staticmethod
    def init(cname, mname):
        TACIndexer.lind = 0
        TACIndexer.rind = 0
        TACIndexer.cname = cname
        TACIndexer.mname = mname

    @staticmethod
    def addClassAttr(cname, attrname):
        if cname not in TACIndexer.classAttrs:
            TACIndexer.classAttrs[cname] = set()
        TACIndexer.classAttrs[cname].add(attrname)

    #increments a counter and returns a string label
    @staticmethod
    def label():
        TACIndexer.lind += 1
        return "." + TACIndexer.cname + '.' + TACIndexer.mname + '_' + str(TACIndexer.lind)

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
        if len(TACIndexer.varRegMap[var]) == 0:
            if not forceNew and var in TACIndexer.classAttrs[TACIndexer.cname]:
                return '$' + var    #special TAC annotation referring to class attributes
            else:
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
        TACIndexer.pushIns(TACAssign(regpbar, regp))
        TACIndexer.pushIns(TACOp1(regpbar, 'not', regpbar))
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

    elif node.expr == 'case':
        #generate code for case expression
        #loop: generate labels for branches
        #create join reg
        #generate type evaluation to find least type
        #jump to least type label, OR fail if no type found
        #loop over branches: emit label, generate code, result in join reg + jump to join label
        #join label
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
        op1 = TACIndexer.reg()
        TACIndexer.pushIns(TACAssign(op1, regr))
        TACIndexer.pushIns(TACOp1(op1, astTacMap[node.expr], op1))
        return op1

    elif node.expr in ASTExpression.exp2:
        regr0 = expConvert(node.args[0])
        regr1 = expConvert(node.args[1])
        op1 = TACIndexer.reg()
        op2 = TACIndexer.reg()
        TACIndexer.pushIns(TACAssign(op1, regr0))
        TACIndexer.pushIns(TACAssign(op2, regr1))
        resreg = op1
        if node.expr in ['plus','minus','times','divide']:
            #abuse of notation - for non-commutative operators, having op2 as 1st operand is useful
            TACIndexer.pushIns(TACOp2(op1, astTacMap[node.expr], op2, op1))
            resreg = op1
        else:
            TACIndexer.pushIns(TACOp2(op2, astTacMap[node.expr], op1, op2))
            resreg = op2

        # Hacky solution for conflicts with consecutive divides,
        # Spill result over to another temporary to give result
        # a chance to get out of rax
        if node.expr in ['times', 'divide']:
            spillreg = TACIndexer.reg()
            TACIndexer.pushIns(TACAssign(spillreg, resreg))
            resreg = spillreg

        return resreg

    #all dispatch follows form:
    #   generate the executor of function (regexec)
    #   generate all explicit parameters of function (regs)
    #   prepend exec as the self param to regs
    #   find function to call in vtable if necessary
    #   call function and assign result into new register
    elif node.expr == 'dynamic_dispatch':
        regexec = expConvert(node.args[0])
        regs = [expConvert(e) for e in node.args[2]]
        regs = [regexec] + regs
        reglb = TACIndexer.reg()
        TACIndexer.pushIns(TACVTable(reglb, regexec, node.args[0].type + '.' + node.args[1].name))
        TACIndexer.pushIns(TACCall(TACIndexer.returnReg, reglb, regs))
        regr = TACIndexer.reg()
        TACIndexer.pushIns(TACAssign(regr, TACIndexer.returnReg))
        return regr

    elif node.expr == 'static_dispatch':
        regexec = expConvert(node.args[0])
        regs = [expConvert(e) for e in node.args[3]]
        regs = [regexec] + regs
        calllb = node.args[1].name + '.' + node.args[2].name
        TACIndexer.pushIns(TACCall(TACIndexer.returnReg, calllb, regs))
        regr = TACIndexer.reg()
        TACIndexer.pushIns(TACAssign(regr, TACIndexer.returnReg))
        return regr

    # NOTE: out_* and in_* get treated as self-dispatch because of the inherits IO
    elif node.expr == 'self_dispatch':
        regexec = TACIndexer.map('self')
        regs = [expConvert(e) for e in node.args[1]]
        regs = [regexec] + regs
        reglb = TACIndexer.reg()
        TACIndexer.pushIns(TACVTable(reglb, regexec, TACIndexer.cname + '.' + node.args[0].name))
        TACIndexer.pushIns(TACCall(TACIndexer.returnReg, reglb, regs))
        regr = TACIndexer.reg()
        TACIndexer.pushIns(TACAssign(regr, TACIndexer.returnReg))
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

    print "ERROR: tried to convert unhandled case: " + node.expr
    return None

#routine for generating TAC for methods
def methodConvert(node):
    #emit start label of func
    TACIndexer.pushIns(TACLabel(TACIndexer.cname + '.' + TACIndexer.mname))

    #add the implicit "self" parameter
    reg = TACIndexer.map('self', True)
    TACIndexer.pushIns(TACAssign(reg, 'self'))

    #assign method args to registers
    for formal in node.formals:
        reg = TACIndexer.map(formal[0].name, True)
        TACIndexer.pushIns(TACAssign(reg, formal[0].name))
    reg = expConvert(node.body)

    #remove formal -> register mappings
    TACIndexer.pop('self')
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
                #set prefix for future labels
                TACIndexer.mname = feature.name.name
                methodConvert(feature)
                break
    else:
        print 'ERROR: could not find any classes in AST'


#for CA4, go through all methods of user-defined classes and generate TAC for bodies
def implConvert(ast):
    for mclass in ast.classes:
        for feature in mclass.features:
            if isinstance(feature, ASTMethod):
                TACIndexer.init(mclass.name.name, feature.name.name)
                methodConvert(feature)

#define constructors for user-defined classes
def attrConvert(ast):
    #add mappings of attributes so TACIndexer can find them if not in symbol table
    for mclass in TACIndexer.cmap:
        TACIndexer.classAttrs[mclass] = set()   #TODO review
        for mattr in TACIndexer.cmap[mclass]:
            TACIndexer.addClassAttr(mclass, mattr.name)
    #go through user-defined attributes
    for mclass in ast.classes:
        attrlst = [feat for feat in mclass.features if isinstance(feat, ASTAttribute)]

        TACIndexer.init(mclass.name.name, 'new')
        TACIndexer.pushIns(TACLabel(mclass.name.name + '.new'))

        #start of constructor = mem alloc
        TACIndexer.pushIns(TACMalloc(TACIndexer.map('self', True), mclass.name.name))

        #next step = init fields
        TACIndexer.pushIns(TACLabel(TACIndexer.label())) 

        #make call to initializer portion of parent constructor
        TACIndexer.pushIns(TACCall(TACIndexer.map('self'), TACIndexer.pmap[mclass.name.name]+'.new_2', [TACIndexer.map('self')]))
        
        #TODO review parent call - maybe split into two different functions
        #make first pass to default initialize fields
        for mattr in attrlst:
            TACIndexer.pushIns(TACAllocate(TACIndexer.map(mattr.name.name), 'default', mattr.type.name))

        #make second pass for those with initializer expressions
        for mattr in attrlst:
            if mattr.init is not None:
                reg = expConvert(mattr.init)
                TACIndexer.pushIns(TACAssign(TACIndexer.map(mattr.name.name), reg))
        TACIndexer.pushIns(TACReturn(TACIndexer.map('self')))
        TACIndexer.pop('self')

if __name__ == '__main__':
    cmap, imap, pmap, ast = readClType(sys.argv[1])
    TACIndexer.setTypeMaps(cmap, imap, pmap)
    attrConvert(ast)
    implConvert(ast)

    #buffer up stored instructions and print
    outbuf = ''
    for ins in TACIndexer.inslst:
        outbuf += str(ins) + '\n'
    print outbuf
