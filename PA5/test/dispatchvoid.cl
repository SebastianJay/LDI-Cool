class Main {
    main() : Object {
        let f : Foo in
            f.foo()
    };
};

class Foo inherits IO {
    foo() : Object {
        out_int(11)
    };
};
