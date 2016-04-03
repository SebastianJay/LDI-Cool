class Main inherits IO {
    main() : Object {
        let f : Foo <- new Foo in
        case f of
            x : Int => out_int(0);
        esac
    };
};

class Foo {
};
