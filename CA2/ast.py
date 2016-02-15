import itertools

class AST:
    def __init__(self):
        self.classes = []

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

class ASTClass:
    def __init__(self):
        self.name = ASTIdentifier()
        self.inherit = None
        self.features = []

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


class ASTIdentifier:
    def __init__(self):
        self.line = 0
        self.name = ""
    def __str__(self):
        return str(self.line) + "\n" + self.name + "\n"
    def load(self, l):
        self.line = int(l.next())
        self.name = l.next()
        return l

class ASTAttribute:
    def __init__(self):
        self.name = ASTIdentifier()
        self.type = ASTIdentifier()
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

class ASTMethod:
    def __init__(self):
        self.name = ASTIdentifier()
        self.formals = [] # List of (name, type) ASTIdentifier tuples
        self.type = ASTIdentifier()
        self.body = ASTExpression()
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


class ASTExpression:
    # Classes of expressions, expressions in same class have same subparts,
    # so treated the same
    exp1 = set(['not','negate','isvoid']) # One expression subpart
    exp2 = set(['while','plus','minus','times','divide','lt','le','eq']) # Two expression subparts
    id1 =  set(['new', 'identifier']) # One identifier subpart
    def __init__(self):
        self.line = 0
        self.expr = "" # Actual expression type, as a string
        self.args = None # Expression sub-parts, single element if one subpart, tuple if multiple
    # Utility method for turning an expression list into a string
    def expListStr(self, l):
        res = str(len(l)) + "\n"
        for x in l:
            res += str(x)
        return res
    def __str__(self):
        res = str(self.line) + "\n"
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
        if not res[-1] == "\n":
            res += "\n"
        return res

    def loadExpList(self, l):
        nExp = int(l.next())
        mExpL = []
        for i in range(nExp):
            exp = ASTExpression()
            l = exp.load(l)
            mExpL.append(exp)
        return (mExpL, l)

    def load(self,l):
        self.line = int(l.next())
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

        elif self.expr == "assign":
            self.args = (ASTIdentifier(), ASTExpression())
            l = self.args[0].load(l)
            l = self.args[1].load(l)

        elif self.expr == "dynamic_dispatch":
            mExp = ASTExpression()
            mId = ASTIdentifier()

            l = mExp.load(l)
            l = mId.load(l)
            mExpl, l = self.loadExpList(l)


            self.args = (mExp,mId,mExpL)

        elif self.expr == "static_dispatch":
            mExp = ASTExpression()
            mType = ASTIdentifier()
            mId = ASTIdentifier()

            l = mExp.load(l)
            l = mType.load(l)
            l = mId.load(l)
            mExpl, l = self.loadExpList(l)

            self.args = (mExp,mType,mId,mExpl)

        elif self.expr == "self_dispatch":
            mId = ASTIdentifier()

            l = mId.load(l)
            mExpl, l = self.loadExpList(l)

            self.args = (mId,mExpl)

        elif self.expr == "if":
            self.args = (ASTExpression(),ASTExpression(),ASTExpression())
            l=self.args[0].load(l)
            l=self.args[1].load(l)
            l=self.args[2].load(l)

        elif self.expr == "block":
            self.args, l = self.loadExpList(l)

        elif self.expr == "integer":
            self.args = int(l.next())

        elif self.expr == "string":
            self.args = l.next()

        # No actual arguments for true and false, but values might be useful
        elif self.expr == "true":
            self.args = True

        elif self.expr == "false":
            self.args = False

        elif self.expr == "let":
            # TODO: Something horrible
            pass

        elif self.expr == "case":
            # TODO: Also something horrible
            pass
        else:
            raise TypeError("Invalid Expression Type: " + self.expr)

        return l


import sys

if __name__ == "__main__":
    lines = sys.stdin.read()
    lines = lines.split("\n")
    ast = AST()
    ast.load(iter(lines))
    print ast
