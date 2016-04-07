class Main inherits IO {
    main() : Object {
        out_int((new Bar).getX())
    };
};

class Foo {
    x : Int <- 3;
    getX() : Int {x};
};

class Bar {
    f: Foo <- new Foo;
    getX() : Int {f.getX()};
};
