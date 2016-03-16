require 'set'
#takes string => string mapping
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
#i.e. class, method, attribute
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

# Does type checking on an expressino
# exp: ASTExpression object, type information modified in place,
# symbs: dictionary of form: string identifier => string type
# tmap: a TypeMaps object
# c: Current containing type (used for SELF_TYPE)
# Prints error string and exits on error
def checkExp(exp, symbs, tmap, c)
    case exp.expr
        when 'identifier'
        if not symbs.include?(exp.args.name)
            puts "Error: #{exp.args.line}: Type-Check: Undeclared identifier #{exp.args.name}"
            exit
        else
            exp.type = symbs[exp.args.name]
        end

        when 'assign'
        checkExp(exp.args[1], symbs, tmap, c)
        # If assignor not subclass of identifier
        if not tmap.isChild(exp.args[1].type, symbs[exp.args[0].name], c)
            puts "Error: #{exp.line}: Type-Check: Bad assignment, #{exp.args[1].type} does not conform to #{symbs[exp.args[0].name]}"
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
        if exp.args.name == 'SELF_TYPE'
            exp.type = 'SELF_TYPE'
        else
            exp.type = exp.args.name
        end
        
        when 'self_dispatch'
        # Find method in imap
        meth=nil
        tmap.imap[c].each do |_,m|
            if m.name.name == exp.args[0].name
                meth = m
                break
            end
        end
        
        # Method not found
        if meth.nil?
            puts "Error: #{exp.args[0].line}: Type-Checker: Unknown method \"#{c}@#{exp.args[0].name}\""
            exit
        end
        
        # Check number of arguments
        if meth.formals.size != exp.args[1].size
            puts "Error: #{exp.line}: Type-Checker: Invalid number of arguments, got #{exp.args[1].size} expected #{meth.formals.size}"
            exit
        end
        
        # Type each argument
        exp.args[1].each do |subexp|
            checkExp(subexp, symbs, tmap, c)
        end

        # Check actuals against formals
        meth.formals.zip(exp.args[1]) do |formal, actual|
            if not tmap.isChild(actual.type, formal[1].name,c)
                puts "Error: #{exp.line}: Type-Checker: Invalid actual parameter type, got #{actual.type} expected #{formal[1].name}"
                exit
            end
        end
        
        if meth.type.name == 'SELF_TYPE'
            exp.type = c
        else
            exp.type = meth.type.name
        end

        ### END self_dispatch


        when 'dynamic_dispatch'
        # Type check caller expression
        checkExp(exp.args[0], symbs, tmap, c)
        
        
        # Find method in imap
        meth=nil
        tmap.imap[exp.args[0].type].each do |_,m|
            if m.name.name == exp.args[1].name
                meth = m
                break
            end
        end
        
        # Method not found
        if meth.nil?
            puts "Error: #{exp.args[1].line}: Type-Checker: Unknown method \"#{exp.args[0].type}@#{exp.args[1].name}\""
            exit
        end
        
        # Check number of arguments
        if meth.formals.size != exp.args[2].size
            puts "Error: #{exp.line}: Type-Checker: Invalid number of arguments, got #{exp.args[2].size} expected #{meth.formals.size}"
            exit
        end
        
        # Type each argument
        exp.args[2].each do |subexp|
            checkExp(subexp, symbs, tmap, c)
        end

        # Check actuals against formals
        meth.formals.zip(exp.args[2]) do |formal, actual|
            if not tmap.isChild(actual.type, formal[1].name, c)
                puts "Error: #{exp.line}: Type-Checker: Invalid actual parameter type, got #{actual.type} expected #{formal[1].name}"
                exit
            end
        end
        
        if meth.type.name == 'SELF_TYPE'
            exp.type = exp.args[0].type
        else
            exp.type = meth.type.name
        end
        
        ### END dynamic_dispatch
        
        when 'static_dispatch'
        # Type check caller expression
        checkExp(exp.args[0], symbs, tmap, c)
        
        # Error if caller expression does not conform to static type
        # TODO: Verify line number
        if not tmap.isChild(exp.args[0].type, exp.args[1].name, c)
            puts "Error: #{exp.line}: Type-Check: Caller type #{exp.args[0].type} does not conform to static type #{exp.args[1].name}"
            exit
        end
        
        # Find method in imap
        meth=nil
        tmap.imap[exp.args[1].name].each do |_,m|
            if m.name.name == exp.args[2].name
                meth = m
                break
            end
        end
        
        # Method not found
        if meth.nil?
            puts "Error: #{exp.args[2].line}: Type-Checker: Unknown method \"#{exp.args[1].name}@#{exp.args[2].name}\""
            exit
        end
        
        # Check number of arguments
        if meth.formals.size != exp.args[3].size
            puts "Error: #{exp.line}: Type-Checker: Invalid number of arguments, got #{exp.args[3].size} expected #{meth.formals.size}"
            exit
        end
        
        # Type each argument
        exp.args[3].each do |subexp|
            checkExp(subexp, symbs, tmap, c)
        end

        # Check actuals against formals
        meth.formals.zip(exp.args[3]) do |formal, actual|
            if not tmap.isChild(actual.type, formal[1].name, c)
                puts "Error: #{exp.line}: Type-Checker: Invalid actual parameter type, got #{actual.type} expected #{formal[1].name}"
                exit
            end
        end
        
        if meth.type.name == 'SELF_TYPE'
            exp.type = exp.args[0].type
        else
            exp.type = meth.type.name
        end
        
        ### END static_dispatch

        when 'plus', 'minus', 'times', 'divide'
        checkExp(exp.args[0], symbs, tmap, c)
        checkExp(exp.args[1], symbs, tmap, c)
        if not (exp.args[0].type == "Int" and exp.args[1].type == "Int")
            puts "Error: #{exp.line}: Type-Checker: Non-integer arithmetic"
            exit
        end
        exp.type = "Int"
        
        when 'block'
        exp.args.each do |e|
            checkExp(e, symbs, tmap, c)
        end
        exp.type = exp.args[exp.args.size-1]
        

        when 'internal'
        # do nothing

        else
        puts "Unhandled expression: #{exp.expr}"
        
            
        
    end
end
