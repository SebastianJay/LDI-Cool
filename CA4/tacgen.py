import sys
from annast import *
from TAC_serialize import *
from graphsort import *

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
    varRegMap = {}  #symbol table, map string var => lst of string registers bound to var
    classAttrs = {} #string class name => (string attr names => TACClassAttr obj)
    inslst = []     #list of TACInstruction

    cmap = {}       #class map
    imap = {}       #implementation map
    pmap = {}       #parent map

    returnReg = TACRegister('t0')

    @staticmethod
    def setTypeMaps(cmap, imap, pmap):
        TACIndexer.cmap = cmap
        TACIndexer.imap = imap
        TACIndexer.pmap = pmap

    #resets counters and sets the names for labels
    @staticmethod
    def init(cname, mname):
        #TACIndexer.rind = 0
        TACIndexer.lind = 0
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
        return TACRegister('t' + str(TACIndexer.rind))

    #looks up the symbol table for var; creates new register if forceNew or not found
    @staticmethod
    def map(var, forceNew = False):
        if var not in TACIndexer.varRegMap:
            TACIndexer.varRegMap[var] = []
        if len(TACIndexer.varRegMap[var]) == 0 or forceNew:
            if not forceNew and var in TACIndexer.classAttrs[TACIndexer.cname]:
                return TACClassAttr(TACIndexer.map('self'), TACIndexer.cname, var)
            else:
                reg = TACIndexer.reg()
                TACIndexer.varRegMap[var].append(reg)
        return TACIndexer.varRegMap[var][-1]

    #binds a symbol to an existing register, provided as an arg
    @staticmethod
    def bind(var, reg):
        if var not in TACIndexer.varRegMap:
            TACIndexer.varRegMap[var] = []
        TACIndexer.varRegMap[var].append(reg)

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
        if regp.boxed:
            TACIndexer.pushIns(TACAssign(regp, TACClassAttr(regp, 'Bool', 'val')))
        regp.boxed = False
        #emit label for loop breakout -- if predicate is false, we jump there
        lbb = TACIndexer.label()
        regpbar = TACIndexer.reg()
        regpbar.boxed = False
        TACIndexer.pushIns(TACOp1(regpbar, 'not', regp))
        TACIndexer.pushIns(TACBT(regpbar, lbb))
        #recurse on body expression
        regb = expConvert(node.args[1])
        #generate jump back to top
        TACIndexer.pushIns(TACJmp(lbp))
        #generate the breakout label
        TACIndexer.pushIns(TACLabel(lbb))
        #create a default (void) as the return value
        reg = TACIndexer.reg()
        TACIndexer.pushIns(TACAllocate(reg, 'default', 'Object'))
        return reg

    elif node.expr == 'if':
        #recurse on predicate expression
        regp = expConvert(node.args[0])
        if regp.boxed:
            TACIndexer.pushIns(TACAssign(regp, TACClassAttr(regp, 'Bool', 'val')))
        regp.boxed = False
        regpbar = TACIndexer.reg()
        regpbar.boxed = False
        TACIndexer.pushIns(TACAssign(regpbar, regp))
        TACIndexer.pushIns(TACOp1(regpbar, 'not', regpbar))
        #emit label for else and branch there if predicate is false
        #NOTE I generate then first for readability, we can save the not op by doing else first
        lbe = TACIndexer.label()
        TACIndexer.pushIns(TACBT(regpbar, lbe))
        #recurse on then body, emit join label and jump there at end
        #also, place then result into join register
        regt = box(expConvert(node.args[1]), node.args[1].type) # TODO: leave unboxed if both unboxed
        regj = TACIndexer.reg()
        TACIndexer.pushIns(TACAssign(regj, regt))
        lbj = TACIndexer.label()
        TACIndexer.pushIns(TACJmp(lbj))
        #insert label for else
        TACIndexer.pushIns(TACLabel(lbe))
        #recurse on else body
        rege = box(expConvert(node.args[2]), node.args[2].type)
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
                regi = box(expConvert(binding.init), binding.init.type)
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
        regc = box(expConvert(node.args[0]), node.args[0].type)
        #fail if case "caller" is void
        regv = TACIndexer.reg()
        regvbar = TACIndexer.reg()
        lbc = TACIndexer.label()
        TACIndexer.pushIns(TACAssign(regv, regc))
        TACIndexer.pushIns(TACOp1(regv, 'isvoid', regv))
        TACIndexer.pushIns(TACOp1(regv, 'not', regv))
        TACIndexer.pushIns(TACBT(regv, lbc))
        TACIndexer.pushIns(TACError(node.line, 'casevoid'))
        TACIndexer.pushIns(TACLabel(lbc))
        #generate labels for branches, and record branch types
        blabels = [TACIndexer.label() for i in range(len(node.args[1]))]
        btypes = [branch.type.name for branch in node.args[1]]
        #create join reg and label
        regj = TACIndexer.reg()
        lbj = TACIndexer.label()
        #generate type evaluation to find least type and jump to appropriate label
        #   reverse toposort to get least to greatest order
        usedtypes = set()
        for clsname in reversed(toposort(TACIndexer.pmap)):
            if clsname not in btypes:
                continue
            ind = btypes.index(clsname)
            sublst = subtreeList(clsname, TACIndexer.pmap)
            for subclsname in sublst:
                if subclsname in usedtypes:
                    continue
                usedtypes.add(subclsname)
                TACIndexer.pushIns(TACBTypeEq(regc, subclsname, blabels[ind]))
        #fail if no type found
        TACIndexer.pushIns(TACError(node.line, 'casenomatch'))
        #loop over branches: emit label, generate code, result in join reg + jump to join label
        for i in range(len(node.args[1])):
            TACIndexer.pushIns(TACLabel(blabels[i]))
            regci = TACIndexer.map(node.args[1][i].name.name, True)
            TACIndexer.pushIns(TACAssign(regci, regc))
            regb = expConvert(node.args[1][i].body)
            TACIndexer.pop(node.args[1][i].name.name)
            TACIndexer.pushIns(TACAssign(regj, regb))
            TACIndexer.pushIns(TACJmp(lbj))
        #emit join label
        TACIndexer.pushIns(TACLabel(lbj))
        return regj

    elif node.expr == 'block':
        for sexpr in node.args:
            reg = expConvert(sexpr)
        return reg  #last expression evaluated is the return val

    elif node.expr == 'assign':
        regr = box(expConvert(node.args[1]), node.args[1].type)

        reg = TACIndexer.map(node.args[0].name)
        TACIndexer.pushIns(TACAssign(reg, regr))
        return regr

    elif node.expr == 'isvoid':
        regr = expConvert(node.args)
        op1 = TACIndexer.reg()
        op1.boxed = False
        if not regr.boxed or node.args.type == 'String' or node.args.type == 'Int' or node.args.type == 'Bool':
            #isvoid is always false for primitives
            TACIndexer.pushIns(TACConstant(op1, 'bool', 'false'))
        else:
            TACIndexer.pushIns(TACOp1(op1, astTacMap[node.expr], regr))
        return op1

    #for negate and not only
    elif node.expr in ASTExpression.exp1:
        regr = expConvert(node.args)
        op1 = TACIndexer.reg()
        op1.boxed = False
        if regr.boxed:
            TACIndexer.pushIns(TACAssign(op1, TACClassAttr(regr, 'Int', 'val')))
        else:
            TACIndexer.pushIns(TACAssign(op1, regr))

        TACIndexer.pushIns(TACOp1(op1, astTacMap[node.expr], op1))
        return op1

    elif node.expr in ASTExpression.exp2:
        regr0 = expConvert(node.args[0])
        regr1 = expConvert(node.args[1])

        if isinstance(regr0, TACClassAttr):
            attreg = TACIndexer.reg()
            TACIndexer.pushIns(TACAssign(attreg, regr0))
            regr0 = attreg
        if isinstance(regr1, TACClassAttr):
            attreg = TACIndexer.reg()
            TACIndexer.pushIns(TACAssign(attreg, regr1))
            regr1 = attreg

        op1 = TACIndexer.reg()
        op2 = TACIndexer.reg()

        if regr0.boxed and node.args[0].type in ['Bool', 'Int']:
            TACIndexer.pushIns(TACAssign(op1, TACClassAttr(regr0, 'Int', 'val')))
        else:
            TACIndexer.pushIns(TACAssign(op1, regr0))

        if regr1.boxed and node.args[0].type in ['Bool', 'Int']:
            TACIndexer.pushIns(TACAssign(op2, TACClassAttr(regr1, 'Int', 'val')))
        else:
            TACIndexer.pushIns(TACAssign(op2, regr1))

        op1.boxed = False
        op2.boxed = False

        resreg = op1
        #check if divisor is zero, and if so, err and exit
        if node.expr == 'divide':
            regz = TACIndexer.reg()
            rege = TACIndexer.reg()
            regebar = TACIndexer.reg()
            lba = TACIndexer.label()
            TACIndexer.pushIns(TACConstant(regz, 'int', '0'))
            TACIndexer.pushIns(TACOp2(rege, '=', op2, regz))
            TACIndexer.pushIns(TACOp1(regebar, 'not', rege))
            TACIndexer.pushIns(TACBT(regebar, lba))
            TACIndexer.pushIns(TACError(node.line, 'dividezero'))
            TACIndexer.pushIns(TACLabel(lba))
        if node.expr in ['plus','minus','times','divide']:
            #abuse of notation - for non-commutative operators, having op2 as 1st operand is useful
            TACIndexer.pushIns(TACOp2(op1, astTacMap[node.expr], op2, op1))
            resreg = op1
        else:
            #must be comparison operator, so use a subclass that captures the static type
            ptype = ''
            if node.args[0].type == 'Int' or node.args[0].type == 'Bool':
                ptype = 'Int'   #ordinary binary compare
            elif node.args[0].type == 'String':
                ptype = 'String'    #lexographical compare
            else:
                ptype = 'Object'    #pointer compare
            TACIndexer.pushIns(TACCompare(op2, astTacMap[node.expr], op1, op2, ptype))
            resreg = op2

        # Hacky solution for conflicts with consecutive divides,
        # Spill result over to another temporary to give result
        # a chance to get out of rax
        if node.expr in ['times', 'divide']:
            spillreg = TACIndexer.reg()
            spillreg.boxed = False
            TACIndexer.pushIns(TACAssign(spillreg, resreg))
            resreg = spillreg

        return resreg

    #all dispatch follows form:
    #   generate all explicit parameters of function (regs)
    #   generate the caller of function (regc)
    #   check if caller is void, and if so, err and exit
    #   prepend exec as the self param to regs
    #   find function to call in vtable if necessary
    #   call function and assign result into new register
    elif node.expr == 'dynamic_dispatch':
        regs = [box(expConvert(e), e.type) for e in node.args[2]]
        regc = box(expConvert(node.args[0]), node.args[0].type)
        regv = TACIndexer.reg()
        regvbar = TACIndexer.reg()
        lbd = TACIndexer.label()
        TACIndexer.pushIns(TACOp1(regv, 'isvoid', regc))
        TACIndexer.pushIns(TACOp1(regvbar, 'not', regv))
        TACIndexer.pushIns(TACBT(regvbar, lbd))
        TACIndexer.pushIns(TACError(node.line, 'dispatchvoid'))
        TACIndexer.pushIns(TACLabel(lbd))
        regs = [regc] + regs
        reglb = TACIndexer.reg()
        cname = node.args[0].type if node.args[0].type != "SELF_TYPE" else TACIndexer.cname
        TACIndexer.pushIns(TACVTable(reglb, regc, cname, node.args[1].name))
        TACIndexer.pushIns(TACCall(TACIndexer.returnReg, reglb, regs))
        regr = TACIndexer.reg()
        TACIndexer.pushIns(TACAssign(regr, TACIndexer.returnReg))
        return regr

    elif node.expr == 'static_dispatch':
        regs = [box(expConvert(e), e.type) for e in node.args[3]]
        regc = box(expConvert(node.args[0]), node.args[0].type)
        regv = TACIndexer.reg()
        regvbar = TACIndexer.reg()
        lbd = TACIndexer.label()
        TACIndexer.pushIns(TACOp1(regv, 'isvoid', regc))
        TACIndexer.pushIns(TACOp1(regvbar, 'not', regv))
        TACIndexer.pushIns(TACBT(regvbar, lbd))
        TACIndexer.pushIns(TACError(node.line, 'dispatchvoid'))
        TACIndexer.pushIns(TACLabel(lbd))
        regs = [regc] + regs
        # Find base class for given method
        basec = node.args[1].name
        for meth in TACIndexer.imap[node.args[1].name]:
            if meth.name == node.args[2].name:
                basec = meth.orig
                break

        calllb = basec + '.' + node.args[2].name
        TACIndexer.pushIns(TACCall(TACIndexer.returnReg, calllb, regs))
        regr = TACIndexer.reg()
        TACIndexer.pushIns(TACAssign(regr, TACIndexer.returnReg))
        return regr

    #note: no dispatch on void check needed here since "self" is always valid
    elif node.expr == 'self_dispatch':
        regs = [box(expConvert(e), e.type) for e in node.args[1]]
        regc = TACIndexer.map('self')
        regs = [regc] + regs
        reglb = TACIndexer.reg()
        TACIndexer.pushIns(TACVTable(reglb, regc, TACIndexer.cname, node.args[0].name))
        TACIndexer.pushIns(TACCall(TACIndexer.returnReg, reglb, regs))
        regr = TACIndexer.reg()
        TACIndexer.pushIns(TACAssign(regr, TACIndexer.returnReg))
        return regr

    elif node.expr == 'new':
        reg = TACIndexer.reg()
        typename = node.args.name
        if node.args.name == 'SELF_TYPE':
            typename = TACIndexer.cname     #TODO: Should be vtable lookup on self
        TACIndexer.pushIns(TACAllocate(reg, node.expr, typename))
        return reg

    elif node.expr == 'identifier':
        reg = TACIndexer.map(node.args.name)
        return reg

    elif node.expr == 'integer' or node.expr == 'string'    \
    or node.expr == 'true' or node.expr == 'false':
        reg = TACIndexer.reg()
        reg.boxed =not (node.expr == 'integer' or node.expr == 'true' or node.expr == 'false')
        constval = node.expr if node.expr in ['true','false'] else str(node.args)
        TACIndexer.pushIns(TACConstant(reg, astTacMap[node.expr], constval))
        return reg

    print "ERROR: tried to convert unhandled case: " + node.expr
    return None

#routine for generating TAC for methods
#special annotations are added to method args so offset is easy to find in ASM gen
def methodConvert(node):
    #emit start label of func
    TACIndexer.pushIns(TACLabel(TACIndexer.cname + '.' + TACIndexer.mname))

    #add the implicit "self" parameter
    reg = TACIndexer.map('self', True)
    TACIndexer.pushIns(TACAssign(reg, TACMethodArg(TACIndexer.cname, TACIndexer.mname, 'self')))
    #assign method args to registers
    for formal in node.formals:
        reg = TACIndexer.map(formal[0].name, True)
        TACIndexer.pushIns(TACAssign(reg, TACMethodArg(TACIndexer.cname, TACIndexer.mname, formal[0].name)))
    reg = expConvert(node.body)

    #remove formal -> register mappings
    TACIndexer.pop('self')
    for formal in node.formals:
        TACIndexer.pop(formal[0].name)

    reg = box(reg, node.body.type)
    retreg = TACIndexer.returnReg
    TACIndexer.pushIns(TACAssign(retreg, reg))
    TACIndexer.pushIns(TACReturn(retreg))

def box(reg, type):
    if isinstance(reg, TACRegister) and not reg.boxed:
        breg = TACIndexer.reg()
        TACIndexer.pushIns(TACAllocate(breg, 'new', type))
        TACIndexer.pushIns(TACAssign(TACClassAttr(breg, type, 'val'), reg))
        reg = breg
    return reg

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
    # Prepend entry point function
    meth=ASTMethod('main', [], 'Object',
                   ASTExpression(0, 'Object', 'dynamic_dispatch',
                                 [ASTExpression(0, 'Main', 'new', ASTIdentifier(0, 'Main')),
                                  ASTIdentifier(0, 'main'),
                                  []])
                   )
    TACIndexer.pushIns(TACLabel('main'))
    TACIndexer.init('', 'main')
    methodConvert(meth)

    for mclass in ast.classes:
        for feature in mclass.features:
            if isinstance(feature, ASTMethod):
                TACIndexer.init(mclass.name.name, feature.name.name)
                methodConvert(feature)

#define constructors for user-defined classes
def attrConvert(ast):
    #add mappings of attributes so TACIndexer can find them if not in symbol table
    for mclass in TACIndexer.cmap:
        TACIndexer.classAttrs[mclass] = set()
        for mattr in TACIndexer.cmap[mclass]:
            TACIndexer.addClassAttr(mclass, mattr.name)
    #go through user-defined attributes
    for mclass in ast.classes:
        attrlst = TACIndexer.cmap[mclass.name.name]
        TACIndexer.init(mclass.name.name, 'new')
        #emit label for start of constructor
        TACIndexer.pushIns(TACLabel(TACIndexer.cname + '.' + TACIndexer.mname))
        #allocate memory on heap for object
        TACIndexer.pushIns(TACMalloc(TACIndexer.map('self', True), mclass.name.name))
        #make first pass to default initialize fields
        for mattr in attrlst:
            reg = TACIndexer.reg()
            TACIndexer.pushIns(TACAllocate(reg, 'default', mattr.type))
            TACIndexer.pushIns(TACAssign(TACIndexer.map(mattr.name), reg))
        #make second pass for those with initializer expressions
        for mattr in attrlst:
            if mattr.init is not None:
                reg = expConvert(mattr.init)
                TACIndexer.pushIns(TACAssign(TACIndexer.map(mattr.name),
                                             box(reg, mattr.init.type)))
        #return pointer to new object
        TACIndexer.pushIns(TACReturn(TACIndexer.map('self')))
        TACIndexer.pop('self')

import TAC_serialize
import deadcode
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

    cfg = TAC_serialize._constructCFG(TACIndexer.inslst)
    print "-----"
    deadcode.globalDeadRemove(cfg)
    print cfg
    print "-----"
    print cfg.verbosestr()
