load 'ast.rb'
load 'typemaps.rb'
load 'typechecks.rb'

if __FILE__ == $0
    intxt = File.read(ARGV[0])
    en = ASTEnumerator.new.load(intxt.split(/\r?\n/))
    ast = AST.new.preload.load(en)
    maps = TypeMaps.new.load(ast)

    if not maps.err.nil?
        puts maps.err
        exit
    end

    adhocErr = checkAdhoc(maps)

    if not adhocErr.nil?
        puts adhocErr
        exit
    end

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

    File.open(ARGV[0].sub('cl-ast', 'cl-type'), 'w') { |file|
        file.write(maps.to_s)
        file.write(ast.to_s)
    }
end
