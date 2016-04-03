class Main inherits IO {
    main() : Object {
        let f : Foo <- new Foo in
        {
        case f of
            y : Int => y <- 2;
            y : Foo => y.set(3);
        esac;
        out_int(f.get());
        }
    };
};

class Foo {
    z : Int <- 1;
    set(zz : Int) : Object {
        z <- zz
    };
    get() : Int {
        z
    };
};
