class Main inherits IO {
    main() : Object {
        let f : Foo in
        case f of
            x : Foo => out_int(0);
        esac
    };
};

class Foo {
};
