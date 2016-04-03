class Main inherits IO {
    foo : Foo;
    getFoo() : Foo {
        foo
    };
    main() : Object {
        {
        foo <- new Foo;
        let x : SELF_TYPE <- self.copy() in
            out_int(x.getFoo().getX());
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
