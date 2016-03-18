require 'set'
#takes string => string mapping (child => parent)
#returns true if cycle is found, false otherwise
def checkInheritCycle(pmaps)
    visited = Set.new
    pmaps.each do |c,_|
        # Skip this class if we've already seen it
        if visited.include?(c)
            next
        end
        visited.add(c)

        # Done if no parent class
        if pmaps[c] == 'Object'
            next
        end
        n = pmaps[c]

        # Follow super class chain to end, loop, or already visited class
        while n != 'Object' && n != c && !visited.include?(n) do
            visited.add(n)
            n = pmaps[n]
        end

        #if we are back at the start
        if n == c
            return true
        end
    end
    return false
end

#perform type-checks on all things except expressions
#i.e. verifies that attributes and method signatures look OK, Main.main is present, etc
#if error is found, an info string is returned; if all checks pass nil is returned
def checkAdhoc(maps)
    #check for Main class with 0-param main method
    if maps.imap.has_key?('Main')
        found = false
        maps.imap['Main'].each do |_,method|
            if method.name.name == 'main'
                if method.formals.size != 0
                    return "ERROR: 0: Type-Check: Method main should not take arguments"
                end
                found = true
            end
        end
        if !found
            return "ERROR: 0: Type-Check: No main method found in Main class"
        end
    else
        return "ERROR: 0: Type-Check: No Main class found"
    end

    #do checks on fields and formals
    maps.imap.each do |cls, lsttuples|
        lsttuples.each do |_, method|
            fnames = []
            method.formals.each do |fname, ftype|
                #check formal named self
                if fname.name == 'self'
                    return "ERROR: #{fname.line}: Type-Check: Cannot name formal self"
                end
                #check formal with self type
                if ftype.name == 'SELF_TYPE'
                    return "ERROR: #{ftype.line}: Type-Check: Cannot give formal type SELF_TYPE"
                end
                #check formal with unknown type
                if !maps.imap.keys.include?(ftype.name)
                    return "ERROR: #{ftype.line}: Type-Check: "\
                    "Formal #{fname.name} has unknown type name #{ftype.name}"
                end
                #check formals with same name
                if fnames.include?(fname.name)
                    return "ERROR: #{fname.line}: Type-Check: Formal #{fname.name} cannot be redefined"
                end
                fnames.push(fname.name)
            end
            #check return with unknown type
            if !maps.imap.keys.include?(method.type.name) && method.type.name != 'SELF_TYPE'
                return "ERROR: #{method.type.line}: Type-Check: "\
                "Return type of #{method.name.name} has unknown name #{method.type.name}"
            end
        end
    end

    maps.cmap.each do |cls, lstfields|
        lstfields.each do |field|
            #check fields named self
            if field.name.name == 'self'
                return "ERROR: #{field.name.line}: Type-Check: Attribute cannot be named self"
            end
            #check fields with unknown type
            if !maps.cmap.keys.include?(field.type.name) && field.type.name != 'SELF_TYPE'
                return "ERROR: #{field.type.line}: Type-Check: Attribute #{field.name.name} has unknown type"
            end
        end
    end
    return nil
end

#Type check the expression bodies of attribute initializers and method bodies
# can terminate if error occurs (calls to checkExp can also terminate on error)
# maps - TypeMaps object
def checkAttrImpl(maps)
    maps.pmap.keys.each do |c|
        cname = c.name.name
        symbs = {}
        # Bind attributes
        maps.cmap[cname].each do |cattr|
            symbs[cattr.name.name] = cattr.type.name
        end
        symbs['self'] = 'SELF_TYPE'

        # Type check attributes
        maps.cmap[cname].each do |cattr|
            if not cattr.init.nil?
                checkExp(cattr.init, symbs, maps, cname)
                if not maps.isChild(cattr.init.type, cattr.type.name, cname)
                    puts "ERROR: #{cattr.name.line}: Type-Check: #{cattr.init.type} does not conform to #{cattr.type.name} in attribute initializer"
                    exit
                end
            end
        end

        maps.imap[cname].each do |imp, meth|
            # Skip superclass methods, avoid double checking
            if imp != cname
                next
            end

            mSymbs = symbs.clone()
            # Bind parameters
            meth.formals.each do |name, type|
                mSymbs[name.name] = type.name
            end

            # Type check method
            checkExp(meth.body, mSymbs, maps, cname)
            if not maps.isChild(meth.body.type, meth.type.name, cname)
                puts "ERROR: #{meth.name.line}: Type-Check: Method body does not conform to return type"
                exit
            end
        end
    end
end

# Does type checking on an expression
# exp: ASTExpression object, type information modified in place,
# symbs: dictionary of form: string identifier => string type
# tmap: a TypeMaps object
# c: Current containing type (used for SELF_TYPE)
# Prints error string and exits on error
def checkExp(exp, symbs, tmap, c)
    case exp.expr
    when 'identifier'
        #if symbol is not in table the identifier is undeclared
        if not symbs.include?(exp.args.name)
            puts "ERROR: #{exp.args.line}: Type-Check: Undeclared identifier #{exp.args.name}"
            exit
        else
            exp.type = symbs[exp.args.name]
        end

    when 'assign'
        checkExp(exp.args[1], symbs, tmap, c)
        #cannot assign to self
        if exp.args[0].name == 'self'
            puts "ERROR: #{exp.line}: Type-Check: Cannot assign to self"
            exit
        #if assignor not subclass of identifier
        elsif not tmap.isChild(exp.args[1].type, symbs[exp.args[0].name], c)
            puts "ERROR: #{exp.line}: Type-Check: Bad assignment, #{exp.args[1].type} does not conform to #{symbs[exp.args[0].name]}"
            exit
        else
            exp.type = exp.args[1].type
        end

    when 'true', 'false'
        exp.type = 'Bool'

    when 'integer'
        exp.type = 'Int'

    when 'string'
        exp.type = 'String'

    when 'new'
        #all types, including SELF_TYPE, are allowed here
        exp.type = exp.args.name

    when 'self_dispatch'
        checkDispatch(exp, symbs, tmap, c, nil, nil, exp.args[0], exp.args[1])

    when 'dynamic_dispatch'
        checkDispatch(exp, symbs, tmap, c, exp.args[0], nil, exp.args[1], exp.args[2])

    when 'static_dispatch'
        checkDispatch(exp, symbs, tmap, c, exp.args[0], exp.args[1], exp.args[2], exp.args[3])

    when 'if'
        checkExp(exp.args[0], symbs, tmap, c)
        # ERROR on non-Bool condition
        if exp.args[0].type != 'Bool'
            puts "ERROR: #{exp.line}: Type-Check: Non-boolean condition"
            exit
        end
        checkExp(exp.args[1], symbs, tmap, c)
        checkExp(exp.args[2], symbs, tmap, c)
        exp.type = tmap.lub(exp.args[1].type, exp.args[2].type, c)

    when 'block'
        exp.args.each do |e|
            checkExp(e, symbs, tmap, c)
        end
        exp.type = exp.args[exp.args.size-1].type

    when 'let'
        nsymbs = symbs.clone()
        # Bind each let binding
        exp.args[0].each do |bind|
            # can't bind self
            if bind.name.name == 'self'
                puts "ERROR: #{exp.line}: Type-Check: Can't bind self in a let"
                exit
            end
            # If there is an initializer, type check it
            if not bind.init.nil?
                checkExp(bind.init, nsymbs, tmap, c)
                if not tmap.isChild(bind.init.type, bind.type.name, c)
                    puts "ERROR: #{exp.line}: Type-Check: Initializer does not conform to declared type"
                    exit
                end
            end
            nsymbs[bind.name.name] = bind.type.name
        end
        checkExp(exp.args[1], nsymbs, tmap, c)
        exp.type = exp.args[1].type

    when 'case'
        checkExp(exp.args[0], symbs, tmap, c)
        nsymbs = symbs.clone()
        mtype = nil
        usedTypes = []
        #iterate over all case branches
        exp.args[1].each do |bind|
            #prevent self binding
            if bind.name.name == 'self'
                puts "ERROR: #{bind.name.line}: Type-Check: Can't bind self in case expression"
                exit
            end
            #prevent case checking for SELF_TYPE
            if bind.type.name == 'SELF_TYPE'
                puts "ERROR: #{bind.type.line}: Type-Check: Can't use SELF_TYPE as case branch type"
                exit
            end
            #prevent multiple branches checking same type
            if usedTypes.include? bind.type.name
                puts "ERROR: #{bind.type.line}: Type-Check: #{bind.type.name} used twice as case branch type"
                exit
            end
            usedTypes.push(bind.type.name)
            #bind case var and type check the branch
            nsymbs[bind.name.name] = bind.type.name
            checkExp(bind.body, nsymbs, tmap, c)
            #remove binding so it's not visible to other branches
            nsymbs[bind.name.name] = symbs[bind.name.name]
            #final type of case is least upper bound of all branch expressions
            if mtype.nil?
                mtype = bind.body.type
            else
                mtype = tmap.lub(mtype, bind.body.type, c)
            end
        end
        exp.type = mtype

    when 'while'
        checkExp(exp.args[0], symbs, tmap, c)
        #predicate of while must be Bool
        if exp.args[0].type != 'Bool'
            puts "ERROR: #{exp.line}: Type-Check: Non-boolean loop condition"
            exit
        end
        checkExp(exp.args[1], symbs, tmap, c)
        exp.type = 'Object'

    when 'isvoid'
        checkExp(exp.args, symbs, tmap, c)
        exp.type = 'Bool'

    when 'not'
        checkExp(exp.args, symbs, tmap, c)
        #not only operates on Bool
        if exp.args.type != 'Bool'
            puts "ERROR: #{exp.line}: Type-Check: Can't perform not on #{exp.type}, expected Bool"
        end
        exp.type = 'Bool'

    when 'negate'
        checkExp(exp.args, symbs, tmap, c)
        #negate only operates on Int
        if exp.args.type != 'Int'
            puts "ERROR: #{exp.line}: Type-Check: Can't negate #{exp.type}, expected Int"
        end
        exp.type = 'Int'

    when 'plus', 'minus', 'times', 'divide'
        checkExp(exp.args[0], symbs, tmap, c)
        checkExp(exp.args[1], symbs, tmap, c)
        #args must be Int for arithmetic
        if not (exp.args[0].type == "Int" and exp.args[1].type == "Int")
            puts "ERROR: #{exp.line}: Type-Check: Non-integer arithmetic"
            exit
        end
        exp.type = "Int"

    when 'eq', 'lt', 'le'
        checkExp(exp.args[0], symbs, tmap, c)
        checkExp(exp.args[1], symbs, tmap, c)
        #if one arg is Int, String, or Bool, the other must be same type
        #otherwise, the two args can be of any type
        sameComp = ['Int', 'String', 'Bool']
        if not ((sameComp.include?(exp.args[0].type) \
                and sameComp.include?(exp.args[1].type) \
                and exp.args[0].type == exp.args[1].type) \
                or (not sameComp.include?(exp.args[0].type) \
                and not sameComp.include?(exp.args[1].type)))
            puts "ERROR: #{exp.line}: Type-Check: Can't compare #{exp.args[0].type} and #{exp.args[1].type}"
            exit
        end
        exp.type = 'Bool'

    when 'internal'
        # do nothing

    else
        puts "Unhandled expression: #{exp.expr}"

    end
end

# helper function for type checking the three dispatch expr nodes
#  exp - from checkExp - modified in place
#  symbs - from checkExp
#  tmap - from checkExp
#  c - from checkExp
#  callobj - if self dispatch, nil; otherwise an ASTExpression object for caller
#  statid - if static dispatch, ASTIdentifier class whose method is being called; otherwise nil
#  methid - ASTIdentifier method being called
#  args - list of ASTExpression for actual arguments
def checkDispatch(exp, symbs, tmap, c, callobj, statid, methid, args)
    #get type of the caller
    calltype = nil
    if callobj.nil?
        calltype = 'SELF_TYPE'
    else
        # Type check caller expression
        checkExp(callobj, symbs, tmap, c)
        calltype = callobj.type
    end

    #get class name to look up in implementation map
    methtype = calltype
    #if caller is SELF_TYPE, we look up enclosing class
    if calltype == 'SELF_TYPE'
        methtype = c
    end
    #if doing static dispatch, we look up the specified class
    if not statid.nil?
        # ERROR if caller expression does not conform to static type specified
        if not tmap.isChild(calltype, statid.name, c)
            puts "ERROR: #{exp.line}: Type-Check: Caller type #{calltype} does not conform to static type #{statid.name}"
            exit
        end
        methtype = statid.name
    end

    # Find method in imap
    meth=nil
    if not tmap.imap[methtype].nil?
        tmap.imap[methtype].each do |_,m|
            if m.name.name == methid.name
                meth = m
                break
            end
        end
    end

    # Method not found
    if meth.nil?
        puts "ERROR: #{methid.line}: Type-Check: Unknown method \"#{methtype}@#{methid.name}\""
        exit
    end

    # Check number of arguments
    if meth.formals.size != args.size
        puts "ERROR: #{exp.line}: Type-Check: Invalid number of arguments, got #{args.size} expected #{meth.formals.size}"
        exit
    end

    # Type check each argument
    args.each do |subexp|
        checkExp(subexp, symbs, tmap, c)
    end

    # Check actuals against formals
    meth.formals.zip(args) do |formal, actual|
        if not tmap.isChild(actual.type, formal[1].name, c)
            puts "ERROR: #{exp.line}: Type-Check: Invalid actual parameter type, got #{actual.type} expected #{formal[1].name}"
            exit
        end
    end

    #if return type of method is SELF_TYPE, dispatch expression's type is type of the caller
    if meth.type.name == 'SELF_TYPE'
        exp.type = calltype
    else
        exp.type = meth.type.name
    end
end
