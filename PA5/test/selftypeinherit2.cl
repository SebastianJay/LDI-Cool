class Main inherits IO {
    main() : Object {
        let b : Baz <- new Baz, y : Yaz <- new Yaz in
        {
            self.printY();
            b.printY();
            y.printY();
        }
    };

    printY() : Object {
        let xx : SELF_TYPE <- new SELF_TYPE in
            out_string(xx.type_name())
    };
};

class Baz inherits Main {
};

class Yaz inherits Baz {
};
