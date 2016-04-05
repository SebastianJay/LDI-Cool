class Main inherits IO {
    main() : Object {
	{
            out_int((new Bar).func().func2());
        }
    };
};

class Foo {
    x : Int;
    setX(i : Int) : SELF_TYPE {{x <- i; self;}};
    getX(): Int {x};
    func() : SELF_TYPE {
        (new SELF_TYPE ).setX(3)
    
    };
};

class Bar inherits Foo {func2(): Int { x*x};};
