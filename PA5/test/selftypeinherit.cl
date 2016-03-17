class Main inherits IO {
    y : SELF_TYPE <- self;
    main() : Object {
        let b : Baz <- new Baz, y : Yaz <- new Yaz in
        {
            printY();
            b.printY();
            y.printY();
        }
    };

    printY() : Object {
        out_string(y.type_name())
    };
};

class Baz inherits Main {
};

class Yaz inherits Baz {
};
