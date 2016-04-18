import itertools

def readClType(path):
    lines = []
    with open(path, 'U') as inFile:
        lines = inFile.read().split('\n')

    cmapind = lines.index("class_map")
    imapind = lines.index("implementation_map")
    pmapind = lines.index("parent_map")
    astind = pmapind + 2*int(lines[pmapind+1]) + 2  #start of AST not explicitly marked

    cmap = CMap()
    cmap.load(iter(lines[cmapind+1:imapind]))
    imap = IMap()
    imap.load(iter(lines[imapind+1:pmapind]))
    pmap = PMap()
    pmap.load(iter(lines[pmapind+1:astind]))
    ast = AST()
    ast.load(iter(lines[astind:]))

    imap.loadFormalTypes(ast)

    return (cmap.classMap, imap.implMap, pmap.parentMap, ast)

#class map
class CMap:
    def __init__(self, *args):
        self.classMap = {}  #string class -> [] of CMapAttr field

    def load(self, l):
        nClasses = int(l.next())
        for i in range(nClasses):
            clsName = l.next()
            self.classMap[clsName] = []
            nAttr = int(l.next())
            for j in range(nAttr):
                cAttr = CMapAttr()
                cAttr.load(l)
                self.classMap[clsName].append(cAttr)
        return l

#wrapper for info about one field of a class
class CMapAttr:
    def __init__(self, name = '', type = ''):
        self.name = name
        self.type = type
        self.init = None

    def load(self, l):
        hasInit = l.next()
        self.name = l.next()
        self.type = l.next()
        self.init = None
        if hasInit == "initializer":
            self.init = ASTExpression()
            self.init.load(l)
        return l

#implementation map
class IMap:
    def __init__(self, *args):
        self.implMap = {}   #string class -> [] of IMapMethod method

    def load(self, l):
        nClasses = int(l.next())
        for i in range(nClasses):
            clsName = l.next()
            self.implMap[clsName] = []
            nMethods = int(l.next())
            for j in range(nMethods):
                iMethod = IMapMethod()
                iMethod.load(l)
                self.implMap[clsName].append(iMethod)
        return l

    def loadFormalTypes(self, ast):
        for c in ast.classes:
            for feat in c.features:
                if isinstance(feat, ASTMethod):
                    for meth in self.implMap[c.name.name]:
                        if meth.name == feat.name.name:
                            meth.formalTypes = map(lambda x: x[1].name, feat.formals)


#wrapper for info about one method of a class
class IMapMethod:
    def __init__(self, *args):
        self.name = ''
        self.formals = []
        self.formalTypes = []
        self.orig = ''  #name of original class where method was defined
        self.body = None

    def load(self, l):
        self.name = l.next()
        nFormals = int(l.next())
        self.formals = []
        for i in range(nFormals):
            self.formals.append(l.next())
        self.orig = l.next()
        self.body = ASTExpression()
        self.body.load(l)
        return l

#parent map
class PMap:
    def __init__(self, *args):
        self.parentMap = {}     #string child class name -> string parent class name

    def load(self, l):
        nRelations = int(l.next())
        for i in range(nRelations):
            childName = l.next()
            parentName = l.next()
            self.parentMap[childName] = parentName
        return l


## Slightly modified from our ast.py to handle types in expressions

#top level AST node - contains a list of ASTClass
class AST:
    def __init__(self, *args):
        if len(args) == 0:
            self.classes = []
        else:
            self.classes = args[0]

    def __str__(self):
        res = str(len(self.classes)) + "\n"
        for c in self.classes:
            res += str(c)
        return res

    # Loads abstract syntax tree from iterator of lines from a .ast file,
    # Returns input iterator
    def load(self, l):
        nClasses = int(l.next())
        for i in range(nClasses):
            tClass = ASTClass()
            l = tClass.load(l)
            self.classes.append(tClass)
        return l

#node representing a class - contains a list of method and field features
class ASTClass:
    def __init__(self, *args):
        if len(args) == 0:
            self.name = ASTIdentifier()
            self.inherit = None
            self.features = []
        else:
            self.name = args[0]
            self.inherit = args[1]
            self.features = args[2]

    def __str__(self):
        res = str(self.name)
        if self.inherit is not None:
            res += "inherits\n"
            res += str(self.inherit)
        else:
            res += "no_inherits\n"
        res += str(len(self.features)) + "\n"
        for f in self.features:
            res += str(f)
        return res

    # Loads class from iterator of lines from a .ast file,
    # Returns input iterator
    def load(self, l):
        l = self.name.load(l)
        if l.next() == "inherits":
            self.inherit = ASTIdentifier()
            l = self.inherit.load(l)
        else:
            self.inherit = None

        nFeatures = int(l.next())
        for i in range(nFeatures):
            # Need to check what the next line is without consuming it
            peek = l.next()
            l = itertools.chain([peek], l)
            feat = None
            if "attribute" in peek:
                feat = ASTAttribute()
            else:
                feat = ASTMethod()
            feat.load(l)
            self.features.append(feat)
        return l

#node for identifier - contains name and line number
class ASTIdentifier:
    def __init__(self, *args):
        if len(args) == 0:
            self.line = 0
            self.name = ""
        else:
            self.line = args[0]
            self.name = args[1]

    def __str__(self):
        return str(self.line) + "\n" + self.name + "\n"

    def load(self, l):
        self.line = int(l.next())
        self.name = l.next()
        return l

#node for field of a class - contains var name and type
class ASTAttribute:
    def __init__(self, *args):
        if len(args) == 0:
            self.name = ASTIdentifier()
            self.type = ASTIdentifier()
            self.init = None
        else:
            self.name = args[0]
            self.type = args[1]
            if len(args) >= 3:
                self.init = args[2]
            else:
                self.init = None

    def __str__(self):
        return ("attribute_no_init\n" if self.init is None else "attribute_init\n") + \
        str(self.name) + str(self.type) + \
        (str(self.init) if self.init is not None else "")

    def load(self,l):
        hasInit = (l.next() == "attribute_init")
        l = self.name.load(l)
        l = self.type.load(l)
        if hasInit:
            self.init = ASTExpression()
            l = self.init.load(l)
        return l

#node for method of class - contains name, arguments, return type, and body
class ASTMethod:
    def __init__(self, *args):
        if len(args) == 0:
            self.name = ASTIdentifier()
            self.formals = [] # List of (name, type) ASTIdentifier tuples
            self.type = ASTIdentifier()
            self.body = ASTExpression()
        else:
            self.name = args[0]
            self.formals = args[1]
            self.type = args[2]
            self.body = args[3]

    def __str__(self):
        res = "method\n"
        res += str(self.name)
        res += str(len(self.formals)) + "\n"
        for f in self.formals:
            res += str(f[0]) + str(f[1])
        res += str(self.type)
        res += str(self.body)
        return res

    def load(self, l):
        l.next() # Consume "method" line
        l = self.name.load(l)
        nFormals = int(l.next())
        for i in range(nFormals):
            name = ASTIdentifier()
            l = name.load(l)
            type = ASTIdentifier()
            l = type.load(l)
            self.formals.append((name,type))
        l = self.type.load(l)
        l = self.body.load(l)
        return l

#general purpose expression node - may contain expression children in "args"
class ASTExpression:
    # Classes of expressions, expressions in same class have same subparts,
    # so treated the same
    exp1 = set(['not','negate','isvoid']) # One expression subpart
    exp2 = set(['while','plus','minus','times','divide','lt','le','eq']) # Two expression subparts
    id1 =  set(['new', 'identifier']) # One identifier subpart
    def __init__(self, *args):
        if len(args) == 0:
            self.line = 0
            self.type = None
            self.expr = "" # Actual expression type, as a string
            self.args = None # Expression sub-parts, single element if one subpart, tuple if multiple
        else:
            self.line = args[0]
            self.type = args[1]
            self.expr = args[2]
            self.args = args[3]

    # Utility method for turning an expression list into a string
    def expListStr(self, l):
        res = str(len(l)) + "\n"
        for x in l:
            res += str(x)
        return res

    # Utility method for loading an expression list
    def loadExpList(self, l):
        nExp = int(l.next())
        mExpL = []
        for i in range(nExp):
            exp = ASTExpression()
            l = exp.load(l)
            mExpL.append(exp)
        return (mExpL, l)

    def __str__(self):
        res = str(self.line) + "\n"
        res += self.type + "\n"
        res += self.expr + "\n"
        if isinstance(self.args, tuple):
            for p in self.args:
                # p might be an expression list
                if isinstance(p, list):
                    res += self.expListStr(p)
                else:
                    res += str(p)
        else:
            # args might be an expression list
            if isinstance(self.args, list):
                res += self.expListStr(self.args)
            else:
                res += str(self.args)
        if self.expr in ["string", "integer"]:
            res += "\n"
        return res

    def load(self,l):
        self.line = int(l.next())
        self.type = l.next()
        self.expr = l.next()

        if self.expr in ASTExpression.exp1:
            self.args = ASTExpression()
            l = self.args.load(l)

        elif self.expr in ASTExpression.exp2:
            self.args = (ASTExpression(), ASTExpression())
            l = self.args[0].load(l)
            l = self.args[1].load(l)

        elif self.expr in ASTExpression.id1:
            self.args = ASTIdentifier()
            l = self.args.load(l)

        # Assign args is tuple of (identifier, expression)
        elif self.expr == "assign":
            self.args = (ASTIdentifier(), ASTExpression())
            l = self.args[0].load(l)
            l = self.args[1].load(l)

        # dynamic dispatch args is tuple of (expression, identifier, expression list)
        elif self.expr == "dynamic_dispatch":
            mExp = ASTExpression()
            mId = ASTIdentifier()
            l = mExp.load(l)
            l = mId.load(l)
            mExpl, l = self.loadExpList(l)
            self.args = (mExp,mId,mExpl)

        # Static dispatch args is tuple of (expression, type, identifier, expression list)
        elif self.expr == "static_dispatch":
            mExp = ASTExpression()
            mType = ASTIdentifier()
            mId = ASTIdentifier()
            l = mExp.load(l)
            l = mType.load(l)
            l = mId.load(l)
            mExpl, l = self.loadExpList(l)
            self.args = (mExp,mType,mId,mExpl)

        # Self dispatch is a tuple of (identifier, expression list)
        elif self.expr == "self_dispatch":
            mId = ASTIdentifier()
            l = mId.load(l)
            mExpl, l = self.loadExpList(l)
            self.args = (mId,mExpl)

        #Internal expressions are a set of functions defined for Object, String, IO
        elif self.expr == "internal":
            self.args = l.next()    #extra detail, e.g. "Object.copy"

        # If args is a tuple of three expressions
        elif self.expr == "if":
            self.args = (ASTExpression(),ASTExpression(),ASTExpression())
            l=self.args[0].load(l)
            l=self.args[1].load(l)
            l=self.args[2].load(l)

        # Block args is an expression list
        elif self.expr == "block":
            self.args, l = self.loadExpList(l)

        # Integer args is an integer constant
        elif self.expr == "integer":
            self.args = int(l.next())

        # String args is a string constant
        elif self.expr == "string":
            self.args = l.next()

        # true and false have empty string argument to make printing logic work
        elif self.expr == "true":
            self.args = ""

        elif self.expr == "false":
            self.args = ""

        # Let args are a list of ASTLetBindings and an expression body
        elif self.expr == "let":
            nbind = int(l.next())
            bindList = []
            for i in range(nbind):
                bind = ASTLetBinding()
                l=bind.load(l)
                bindList.append(bind)
            exp = ASTExpression()
            l=exp.load(l)
            self.args=(bindList,exp)

        # Case args are the case expression, and a list of ASTCase
        elif self.expr == "case":
            exp = ASTExpression()
            l=exp.load(l)
            ncase = int(l.next())
            caseList = []
            for i in range(ncase):
                c = ASTCase()
                l=c.load(l)
                caseList.append(c)
            self.args = (exp, caseList)

        else:
            raise TypeError("Invalid Expression Type: " + self.expr)

        return l

#node for let expressions - contains var name and optional initialization expression
class ASTLetBinding:
    def __init__(self, *args):
        if len(args) == 0:
            self.name = ASTIdentifier()
            self.type = ASTIdentifier()
            self.init = None
        else:
            self.name = args[0]
            self.type = args[1]
            if len(args) >= 3:
                self.init = args[2]
            else:
                self.init = None

    def __str__(self):
        res = "let_binding_no_init\n" \
              if self.init is None else "let_binding_init\n"
        res += str(self.name)
        res += str(self.type)
        res += "" if self.init is None else str(self.init)
        return res

    def load(self, l):
        hasInit = l.next() == "let_binding_init"
        l=self.name.load(l)
        l=self.type.load(l)
        if hasInit:
            self.init = ASTExpression()
            l=self.init.load(l)
        return l

#node for one part of a case statement - contains var name, type and expression to execute
class ASTCase:
    def __init__(self, *args):
        if len(args) == 0:
            self.name = ASTIdentifier()
            self.type = ASTIdentifier()
            self.body = ASTExpression()
        else:
            self.name = args[0]
            self.type = args[1]
            self.body = args[2]

    def __str__(self):
        return str(self.name) + str(self.type) + str(self.body)

    def load(self,l):
        l=self.name.load(l)
        l=self.type.load(l)
        l=self.body.load(l)
        return l

import sys
if __name__ == "__main__":
    cmap, imap, pmap, ast = readClType(sys.argv[1])
    print cmap
    print imap
    print pmap
    #print ast
