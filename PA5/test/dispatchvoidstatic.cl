class Main {
    main() : Object {
        let f : Bar in
            f@Foo.foo()
    };
};

class Foo inherits IO {
    foo() : Object {
        out_int(11)
    };
};

class Bar inherits Foo {
    foo() : Object {
        out_int(13)
    };
};
