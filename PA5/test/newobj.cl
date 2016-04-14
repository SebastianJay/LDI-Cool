class Main inherits IO {
    main() : Object {{
        out_int((new Foo).getX());
        out_int((new Foo).getY());
    }};
};

class Bar {
    x : Int <- 1;
    getX() : Int {x};
};

class Foo inherits Bar {
    y: Int <- 2;
    getY(): Int {y};
};
