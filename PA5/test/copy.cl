class Main inherits IO {
    foo : Foo <- new Foo;
    getFoo() : Foo {
        foo
    };
    setFoo(newfoo : Foo) : Object {
        foo <- newfoo
    };

    main() : Object {
        let a : Main <- new Main, b : Foo <- new Foo, c : Bar <- new Bar, d : Main in {
            c.setJ(10);
            b.getBar().setJ(11);
            a.getFoo().getBar().setJ(12);
            a.setFoo(b);

            d <- a.copy();

            b.getBar().setJ(13);
            out_int(d.getFoo().getBar().getJ());
            out_int(a.getFoo().getBar().getJ());
        }
    };
};

class Foo {
    bar : Bar <- new Bar;
    setBar(newbar : Bar) : Object {
        bar <- newbar
    };

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
