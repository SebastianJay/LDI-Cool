class Main inherits IO {
    main() : Object {
        {
        let f : Foo <- new Foo in
        let g : Foo <- f in {
            f.setX(2);
            out_int(g.getX());
            out_int(f.getX());
        };
        }
    };
};

class Foo {
    x : Int <- 1;
    setX(newx : Int) : Object {
        x <- newx
    };
    getX() : Int {
        x
    };
};
