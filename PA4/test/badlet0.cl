class Main inherits IO {
    main() : Object {
        let x : SELF_TYPE <- (new Baz) in 0
    };
};

class Baz inherits Main {
    x : Int;
};
