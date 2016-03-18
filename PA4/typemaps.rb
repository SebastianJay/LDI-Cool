load 'typechecks.rb'
#wrapper around Hashes that define class, implementation, and parent maps
#takes AST as input to load() and builds maps, performing checks on the way
#any ERRORs are captured in errtext
class TypeMaps
    @@forbid_define = ['SELF_TYPE']
    @@forbid_inherit = ['Int', 'String', 'Bool', 'SELF_TYPE']

    def initialize()
        @errtext = []
        @pmap = {}          #ASTClass child => ASTClass parent
        @cmap = {}          #string classname => list of ASTBinding attributes
        @imap = {}          #string classname => list of [string, ASTMethod] tuples
                            # => element 0 is class name where element 1 is implemented
    end

    def pmap
        @pmap
    end
    def imap
        @imap
    end
    def cmap
        @cmap
    end
    def err
        @errtext.first
    end

    #goes through AST class array and builds map from class name -> parent name
    #checks whether any class is redefined or inherits from wrong classes
    def load(ast)
        #build parent map
        pmaps = {}
        ast.classes.each do |c|
            #prevent SELF_TYPE class and multiple classes with same name
            if @@forbid_define.include?(c.name.name) || pmaps.has_key?(c.name.name)
                @errtext.push("ERROR: #{c.name.line}: Type-Check: Class #{c.name.name} cannot be (re)defined")
                return self
            end
            #classes that do not have explicit inheritance inherit from Object by default
            if c.inherit.nil?
                pmaps[c.name.name] = 'Object'
            else
                #prevent classes that inherit from certain built-in types
                if @@forbid_inherit.include?(c.inherit.name)
                    @errtext.push("ERROR: #{c.inherit.line}: Type-Check: Class #{c.name.name} cannot inherit from #{c.inherit.name}")
                    return self
                end
                #prevent inheritance from undefined classes
                unknown = true
                ast.classes.each do |cu|
                    if cu.name.name == c.inherit.name
                        unknown = false
                        break
                    end
                end
                if unknown
                    @errtext.push("ERROR: #{c.inherit.line}: Type-Check: Class #{c.inherit.name} does not exist")
                    return self
                end
                #insert the mapping
                pmaps[c.name.name] = c.inherit.name
            end
        end
        #remove Object -> Object from pmaps
        pmaps.delete('Object')

        #check for inheritance cycle to prevent infinite loops later
        if checkInheritCycle(pmaps)
            @errtext.push("ERROR: 0: Type-Check: Detected inheritance cycle")
            return self
        end

        #construct pmap with objects from string map
        pmaps.each do |key, val|
            kobj = nil
            vobj = nil
            ast.classes.each do |c|
                if c.name.name == key
                    kobj = c
                end
                if c.name.name == val
                    vobj = c
                end
            end
            @pmap[kobj] = vobj
        end
        #build class/implementation maps
        ast.classes.each do |c|
            @cmap[c.name.name] = []
            @imap[c.name.name] = []
            #recursively add attributes and methods
            if addFeatureMaps(c, c.name.name).nil?
                return self
            end
        end
        return self
    end

    #recursive method for filling out the implementation and attribute tables
    #takes cls as current ASTClass to fill out, basename as key to imap/cmap entry
    def addFeatureMaps(cls, basename)
        if cls.name.name != 'Object'
            retval = addFeatureMaps(@pmap[cls], basename)
            if retval.nil?
                return retval
            end
        end
        clsmethods = []
        cls.features.each do |feat|
            if feat.is_a? ASTMethod
                if !@imap.has_key?(basename)
                    @imap[basename] = []
                end
                #check if method is redefined within same class
                if clsmethods.include?(feat.name.name)
                    @errtext.push("ERROR: #{feat.name.line}: Type-Check: "\
                    "Method #{feat.name.name} cannot be redefined in same class")
                    return nil
                end
                clsmethods.push(feat.name.name)
                #check previous entries of vtable for possible overriding
                overridden = nil
                @imap[basename].each_with_index do |mtuple, ind|
                    method = mtuple[1]
                    if method.name.name == feat.name.name
                        #check return type
                        if method.type.name != feat.type.name
                            @errtext.push("ERROR: #{feat.type.line}: Type-Check: "\
                            "Method #{feat.name.name} is overridden with different return type")
                            return nil
                        end
                        #check if number of formals is same
                        if method.formals.size != feat.formals.size
                            @errtext.push("ERROR: #{feat.name.line}: Type-Check: "\
                            "Method #{feat.name.name} is overridden with different number of formals")
                            return nil
                        end
                        #check if types of formals match
                        method.formals.each_index do |find|
                            if method.formals[find][1].name != feat.formals[find][1].name
                                @errtext.push("ERROR: #{feat.formals[find][1].line}: Type-Check: "\
                                "Method #{feat.name.name} is overridden with different formal type at index #{find}")
                                return nil
                            end
                        end
                        overridden = ind
                        break
                    end
                end
                if overridden.nil?
                    #append new implementation to end
                    @imap[basename].push([cls.name.name, feat])
                else
                    #insert new implementation where old one existed
                    @imap[basename][overridden] = [cls.name.name, feat]
                end
            else
                if !@cmap.has_key?(basename)
                    @cmap[basename] = []
                end
                #check if the attribute is already defined
                fielddef = false
                @cmap[basename].each do |field|
                    if field.name.name == feat.name.name
                        fielddef = true
                        break
                    end
                end
                if fielddef
                    @errtext.push("ERROR: #{feat.name.line}: Type-Check: "\
                    "Attribute #{feat.name.name} cannot be redefined")
                    return nil
                end
                #append new attribute to end
                @cmap[basename].push(feat)
            end
        end
        return self
    end

    def cmap_to_s
        clslst = []
        @cmap.sort.map do |cls, lstfields|
            fieldlst = []
            lstfields.each do |field|
                if field.init.nil?
                    fieldlst.push(["no_initializer\n",field.name.name,"\n",field.type.name,"\n"].join)
                else
                    fieldlst.push(["initializer\n",field.name.name,"\n",field.type.name,"\n",field.init].join)
                end
            end
            clslst.push([cls,"\n",lstfields.size,"\n",fieldlst.join].join)
        end
        return ["class_map\n",@cmap.size,"\n",clslst.join].join
    end

    def imap_to_s
        clslst = []
        @imap.sort.map do |cls, lsttuples|
            methodlst = []
            lsttuples.each do |orig, method|
                formallst = []
                method.formals.each do |fname, _|
                    formallst.push([fname.name,"\n"].join)
                end
                methodlst.push([method.name.name,"\n",method.formals.size,"\n",formallst.join,orig,"\n",method.body].join)
            end
            clslst.push([cls,"\n",lsttuples.size,"\n",methodlst.join].join)
        end
        return ["implementation_map\n",@imap.size,"\n",clslst.join].join
    end

    def pmap_to_s
        #make string -> string mapping first so sort is easier after
        pmaps = {}
        @pmap.each do |k, v|
            pmaps[k.name.name] = v.name.name
        end
        #do actual serialization
        clslst = []
        pmaps.sort.map do |k, v|
            clslst.push([k,"\n",v,"\n"])
        end
        return ["parent_map\n",@pmap.size,"\n",clslst.join].join
    end

    def to_s
        return [cmap_to_s, imap_to_s, pmap_to_s].join
    end

    # Returns the name of the parent class to the given class name (as a string)
    def getParent(child)
        @pmap.keys.each do |c|
            if c.name.name == child
                return @pmap[c].name.name
            end
        end
        return 'Object'
    end

    # Checks if child is a subclass of parent
    # child, parent, selftype are all strings
    def isChild(child, parent, selftype)
        if child == 'SELF_TYPE'
            # SELF_TYPE_c <= T if c <= T
            if parent != 'SELF_TYPE'
                return isChild(selftype, parent, selftype)
            else
                return true # Supposedly never happens
            end
        # SELF_TYPE not <= SELF_TYPE
        elsif parent == 'SELF_TYPE'
            return false
        end

        # Every class is a subclass of itself
        if child == parent
            return true
        # If we get to the root of the tree without finding parent, not a subclass
        elsif child == 'Object'
            return false
        # Otherwise walk up the tree
        else
            return isChild(getParent(child), parent, selftype)
        end
    end

    #least upper bound
    #finds the name of the least class that is a common ancestor to a and b
    # all args are strings
    def lub(a, b, selftype)
        if a == 'SELF_TYPE' and b == 'SELF_TYPE'
            return 'SELF_TYPE'
        elsif a == 'SELF_TYPE'
            return lub(selftype, b, selftype)
        elsif b == 'SELF_TYPE'
            return lub(a, selftype, selftype)
        else
            # Enumerate a's parents
            apars = [a]
            n = a
            while n != 'Object'
                n = getParent(n)
                apars.push(n)
            end

            # Walk up b's parents until we find one in a's parents
            n = b
            while not apars.include? n and n != 'Object'
                n = getParent(n)
            end

            if apars.include? n
                return n
            else
                return 'Object'
            end
        end
    end
end
