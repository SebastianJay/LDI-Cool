class Main {
    main() : SELF_TYPE {
        self
    };
};

class Baz inherits Main {
    func() : SELF_TYPE {
        (new SELF_TYPE).main()
    };
};
