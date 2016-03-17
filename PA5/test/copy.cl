class Main inherits IO {
    foo : Foo <- new Foo;
    getFoo() : Foo {
        foo
    };

    main() : Object {
        {
        foo.getBar().setJ(4);
        let m : Main <- copy() in
            out_int(m.getFoo().getBar().getJ());
        }
    };
};

class Foo {
    i : Int <- 2;
    bar : Bar <- new Bar;

    getBar() : Bar {
        bar
    };
};

class Bar {
    j : Int <- 3;

    getJ() : Int {
        j
    };
    setJ(newj : Int) : Object {
        j <- newj
    };
};
