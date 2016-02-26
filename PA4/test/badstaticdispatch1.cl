class Main {
    main() : Object {
        (new Bazz)@Baz.funcky()
    };
};

class Baz {
    func() : Object {
        0
    };
};

class Bazz inherits Baz {
    funcky() : Object {
        0
    };
};
