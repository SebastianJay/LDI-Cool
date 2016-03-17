class Main inherits IO {
    main() : Object {
        let f : Foo <- new Foo in
        {
            out_int(f.x());
            out_int(f.y());
            out_int(f.z());
        }
    };
};

class Foo {
    z : Int;
    x : Int <- x + y + 1;
    y : Int <- x + y + 1;
    x() : Int {
        x
    };
    y() : Int {
        y
    };
    z() : Int {
        z
    };
};
