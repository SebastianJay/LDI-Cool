class Main {
    y : SELF_TYPE <- self;
    --z : SELF_TYPE <- (new SELF_TYPE);
    a : Int <- a + 1;

    main() : Object {
        let b : Int <- a + 1, c : Int <- b + a in
        self
    };

    me() : SELF_TYPE {
        self
    };
};

class Baz inherits Main {
    baz() : Baz {
        (new SELF_TYPE)@Main.me()
    };

    foo() : SELF_TYPE {
        self
    };
};

class Yaz inherits Baz {
};
