class TypeMaps
    @@forbid_define = ['Object', 'SELF_TYPE']
    @@forbid_inherit = ['Int', 'String', 'Bool', 'SELF_TYPE']

    def initialize()
        @pmap = {}
        @cmap = {}
        @imap = {}
        @errtext = ''
    end

    #goes through AST class array and builds map from class name -> parent name
    #checks whether any class is redefined or inherits from wrong classes
    def load(ast)
        #add predefined mappings
        @pmap['IO'] = 'Object'
        @pmap['Int'] = 'Object'
        @pmap['String'] = 'Object'
        @pmap['Bool'] = 'Object'
        ast.classes.each do |c|
            if @@forbid_define.include?(c.name.name) || @pmap.has_key?(c.name.name)
                @errtext = "ERROR: #{c.name.line}: Type-Check: Class #{c.name.name} cannot be (re)defined"
                break
            end
            if c.inherit.nil?
                @pmap[c.name.name] = 'Object'
            else
                if @@forbid_inherit.include?(c.inherit.name)
                    @errtext = "ERROR: #{c.name.line}: Type-Check: Class #{c.name.name} cannot inherit from #{c.inherit.name}"
                    break
                end
                @pmap[c.name.name] = c.inherit.name
            end
        end
        self
    end

    def err
        @errtext
    end

    def getMap
        @pmap
    end
end

#begin annotated AST class definitions
#this implementation was artfully translated from our Python implementaton for PA3
#load works assuming that .cl-ast is being loaded
#to_s works assuming that we are outputting .cl-type
class AST
    def initialize()
        @classes = []
    end

    def to_s
        return [@classes.size.to_s + "\n", @classes.join].join
    end

    def classes
        @classes
    end

    def preload()
        mObject = ASTClass.new.preload('Object', nil, [
            ASTMethod.new.preload('abort', [], 'Object', 'Object.abort'),
            ASTMethod.new.preload('copy', [], 'SELF_TYPE', 'Object.copy'),
            ASTMethod.new.preload('type_name', [], 'String', 'Object.type_name'),
            ])
        mIO = ASTClass.new.preload('IO', 'Object', [
            ASTMethod.new.preload('in_int', [], 'Int', 'IO.in_int'),
            ASTMethod.new.preload('in_string', [], 'String', 'IO.in_string'),
            ASTMethod.new.preload('out_int', [
                [ASTIdentifier.new.preload('x'), ASTIdentifier.new.preload('Int')]
                ], 'SELF_TYPE', 'IO.out_int'),
            ASTMethod.new.preload('out_string', [
                [ASTIdentifier.new.preload('x'), ASTIdentifier.new.preload('String')]
                ], 'SELF_TYPE', 'IO.out_string'),
            ])
        mInt = ASTClass.new.preload('Int', 'Object', [])
        mString = ASTClass.new.preload('String', 'Object', [
            ASTMethod.new.preload('concat', [
                [ASTIdentifier.new.preload('s'), ASTIdentifier.new.preload('String')]
                ], 'String', 'String.concat'),
            ASTMethod.new.preload('length', [], 'Int', 'String.length'),
            ASTMethod.new.preload('substr', [
                [ASTIdentifier.new.preload('i'), ASTIdentifier.new.preload('Int')],
                [ASTIdentifier.new.preload('l'), ASTIdentifier.new.preload('Int')]
                ], 'String', 'String.substr')
            ])
        mBool = ASTClass.new.preload('Bool', 'Object', [])
        @classes.concat([mBool, mInt, mIO, mObject, mString])
        return self
    end

    def load(en)
        nClasses = en.next.to_i
        for i in 1..nClasses
            tClass = ASTClass.new.load(en)
            @classes.push(tClass)
        end
        return self
    end
end

class ASTClass
    def initialize()
        @name = ASTIdentifier.new
        @inherit = nil
        @features = []
    end

    def to_s
        inhstr = (@inherit.nil? ? "no_inherits\n" : ["inherits\n", @inherit].join)
        return [@name, inhstr, @features.size.to_s + "\n", @features.join].join
    end

    def inherit
        @inherit
    end

    def name
        @name
    end

    def features
        @features
    end

    def preload(name, inherit, features)
        @name.preload(name)
        if !inherit.nil?
            @inherit = ASTIdentifier.new.preload(inherit)
        end
        @features = features
        return self
    end

    def load(en)
        @name.load(en)
        if en.next == 'inherits'
            @inherit = ASTIdentifier.new.load(en)
        else
            @inherit = nil
        end

        nFeatures = en.next.to_i
        for i in 1..nFeatures
            featType = en.peek
            feat = nil
            if featType.start_with?('attribute')
                feat = ASTBinding.new('attribute').load(en)
            else
                feat = ASTMethod.new.load(en)
            end
            @features.push(feat)
        end
        return self
    end
end

class ASTIdentifier
    def initialize()
        @line = 0
        @name = ''
    end

    def name
        @name
    end

    def line
        @line
    end

    def to_s
        return [@line.to_s + "\n", @name + "\n"].join
    end

    def preload(name)
        @name = name
        return self
    end

    def load(en)
        @line = en.next.to_i
        @name = en.next
        return self
    end
end

class ASTBinding
    def initialize(bindtype)
        @name = ASTIdentifier.new
        @type = ASTIdentifier.new
        @bindtype = bindtype    #in {'let', 'case', 'attribute'}
        @init = nil         #used in let and attribute
        @body = nil         #used in case
    end

    def to_s
        if @bindtype == 'case'
            return [@name, @type, @body].join
        elsif @bindtype == 'let'
            lethead = @init.nil? ? "let_binding_no_init\n" : "let_binding_init\n"
            return [lethead, @name, @type, @init].join
        elsif @bindtype == 'attribute'
            attrhead = @init.nil? ? "attribute_no_init\n" : "attribute_init\n"
            return [attrhead, @name, @type, @init].join
        end
    end

    def load(en)
        hasInit = (@bindtype == 'attribute' && en.next == 'attribute_init') ||
            (@bindtype == 'let' && en.next == 'let_binding_init')
        @name.load(en)
        @type.load(en)
        if @bindtype == 'case'
            @body = ASTExpression.new.load(en)
        elsif hasInit
            @init = ASTExpression.new.load(en)
        end
        return self
    end
end

class ASTMethod
    def initialize()
        @name = ASTIdentifier.new
        @formals = []
        @type = ASTIdentifier.new   #type of return value
        @body = ASTExpression.new
    end

    def preload(name, formals, type, expr)
        @name.preload(name)
        @formals = formals
        @type.preload(type)
        @body.preload(expr)
        return self
    end

    def to_s
        return ["method\n", @name, @formals.size.to_s + "\n", @formals, @type, @body].join
    end

    def load(en)
        en.next #consume "method"
        @name.load(en)
        nFormals = en.next.to_i
        for i in 1..nFormals
            fName = ASTIdentifier.new.load(en)
            fType = ASTIdentifier.new.load(en)
            @formals.push([fName, fType])
        end
        @type.load(en)
        @body.load(en)
        return self
    end
end

class ASTExpression
    @@cltype = true
    @@exp1 = ['not','negate','isvoid']
    @@exp2 = ['while','plus','minus','times','divide','lt','le','eq']
    @@id1 = ['new', 'identifier']
    def initialize()
        @line = 0
        @type = nil         #static type of the expression e.g. "Int"
        @internal = nil     #if internal expr, has string e.g. "Object.abort"
        @expr = ''          #node type e.g. "dynamic_dispatch"
        @args = nil         #data specific to the node type
    end

    def preload(expr)
        @internal = expr
        return self
    end

    def to_s
        argsstr = ''
        if @args.is_a? Array
            if @args[-1].is_a? Array
                argsstr = [@args.slice(0,@args.size-1).join, @args[-1].size.to_s + "\n", @args[-1]].join
            elsif @args[0].is_a? Array
                argsstr = [@args[0].size.to_s + "\n", @args[0], @args.slice(1,@args.size-1).join].join
            elsif @expr == 'block'
                argsstr = [@args.size.to_s + "\n", @args].join
            else
                argsstr = @args.join
            end
        elsif @expr == 'integer' || @expr == 'string'
            argsstr = @args.to_s + "\n"
        else
            argsstr = @args.to_s
        end
        if @@cltype
            if @internal.nil?
                return [@line.to_s + "\n", @type.to_s + "\n", @expr + "\n", argsstr].join
            else
                return [@line.to_s + "\n", @type.to_s + "\n", "internal\n", @internal + "\n"].join
            end
        else
            return [@line.to_s + "\n", @expr + "\n", argsstr].join
        end
    end

    def loadExpList(en)
        nExp = en.next.to_i
        mExpL = []
        for i in 1..nExp
            exp = ASTExpression.new.load(en)
            mExpL.push(exp)
        end
        return mExpL
    end

    def load(en)
        @line = en.next.to_i
        @expr = en.next

        if @@exp1.include?(@expr)
            @args = ASTExpression.new.load(en)

        elsif @@exp2.include?(@expr)
            @args = [ASTExpression.new.load(en), ASTExpression.new.load(en)]

        elsif @@id1.include?(@expr)
            @args = ASTIdentifier.new.load(en)

        elsif @expr == 'assign'
            @args = [ASTIdentifier.new.load(en), ASTExpression.new.load(en)]

        elsif @expr == 'dynamic_dispatch'
            mExp = ASTExpression.new.load(en)
            mId = ASTIdentifier.new.load(en)
            mExpL = loadExpList(en)
            @args = [mExp, mId, mExpL]

        elsif @expr == 'static_dispatch'
            mExp = ASTExpression.new.load(en)
            mType = ASTIdentifier.new.load(en)
            mId = ASTIdentifier.new.load(en)
            mExpL = loadExpList(en)
            @args = [mExp, mType, mId, mExpL]

        elsif @expr == 'self_dispatch'
            mId = ASTIdentifier.new.load(en)
            mExpL = loadExpList(en)
            @args = [mId, mExpL]

        elsif @expr == 'if'
            @args = [ASTExpression.new.load(en),
                ASTExpression.new.load(en),
                ASTExpression.new.load(en)]

        elsif @expr == 'block'
            @args = loadExpList(en)

        elsif @expr == 'integer'
            @args = en.next.to_i

        elsif @expr == 'string'
            @args = en.next

        elsif @expr == 'true' || @expr == 'false'
            @args = ''

        elsif @expr == 'let'
            nBind = en.next.to_i
            bindList = []
            for i in 1..nBind
                bind = ASTBinding.new('let').load(en)
                bindList.push(bind)
            end
            exp = ASTExpression.new.load(en)
            @args = [bindList, exp]

        elsif @expr == 'case'
            exp = ASTExpression.new.load(en)
            nCase = en.next.to_i
            caseList = []
            for i in 1..nCase
                mCase = ASTBinding.new('case').load(en)
                caseList.push(mCase)
            end
            @args = [exp, caseList]

        else
            raise Exception.new("Invalid Expression Type #{@expr}")
        end
        return self
    end
end

if __FILE__ == $0
    lines = File.read(ARGV[0]).split("\n")
    ast = AST.new.preload.load(lines.each)
    File.write(ARGV[0]+"-echo", "#{ast}")
    #puts ast.classes.to_s
end
