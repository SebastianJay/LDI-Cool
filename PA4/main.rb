load 'cltypedef.rb'

if __FILE__ == $0
    intxt = File.read(ARGV[0])
    ast = AST.new.preload.load(intxt.split(/\r?\n/).each)
    maps = TypeMaps.new.load(ast)
    if maps.err.nil?
        adhocErr = checkAdhoc(maps)
        if adhocErr.nil?
            File.open(ARGV[0].sub('cl-ast', 'cl-type'), 'w') { |file| file.write(maps.cmap_to_s) }
        else
            puts adhocErr
        end
    else
        puts maps.err
    end
end
