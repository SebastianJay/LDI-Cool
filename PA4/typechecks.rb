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

        if n == c
            return true
        end
    end
    return false
end

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
