load 'ast.rb'
load 'typemaps.rb'
load 'typechecks.rb'

if __FILE__ == $0
    #deserialize the AST from the cl-ast format
    intxt = File.read(ARGV[0])
    en = ASTEnumerator.new.load(intxt.split(/\r?\n/))
    ast = AST.new.preload.load(en)
    #create the class, implementation, and parent maps from AST
    maps = TypeMaps.new.load(ast)

    #exit if error found while creating maps
    if not maps.err.nil?
        puts maps.err
        exit
    end

    #perform checks unrelated to expression type checks
    adhocErr = checkAdhoc(maps)

    #exit if error found
    if not adhocErr.nil?
        puts adhocErr
        exit
    end

    #perform type checks on attribute initializers and method bodies
    #the nodes of ast will be annotated since they share memory with maps
    #if an error is found the program will terminate from within method
    checkAttrImpl(maps)

    #write the maps and annotated AST to file
    File.open(ARGV[0].sub('cl-ast', 'cl-type'), 'w') { |file|
        file.write(maps.to_s)
        file.write(ast.to_s)
    }
end
