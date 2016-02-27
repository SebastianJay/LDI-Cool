class Main {
    main() : Object {
        (new Baz)@SELF_TYPE.func()
    };
};

class Baz inherits Main {
    func() : Object {
        0
    };
};
