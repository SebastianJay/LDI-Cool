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

    puts maps

    maps.pmap.keys.each do |c|
        symbs = {}
        # Bind attributes
        maps.cmap[c].each do |attr|
            symbs[attr.name.name] = attr.type.name
        end
        maps.imap[c].each do |imp, meth|
            # Skip superclass methods, avoid double checking
            if imp != c
                next
            end
            
            mSymbs = symbs.clone()
            # Bind parameters
            meth.formals.each do |name, type|
                mSymbs[name.name] = type.name
            end
            
            # Type check method
            checkExp(meth.body, mSymbs, maps, c)
        
            if not maps.isChild(meth.body.type, meth.type.name)
                puts 'Error: #{meth.name.name}: Type-Check: Method body does not conform to return type'
                exit
            end
        end
    end

    File.open(ARGV[0].sub('cl-ast', 'cl-type'), 'w') { |file| file.write(maps.cmap_to_s) }
end
