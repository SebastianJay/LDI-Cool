class Main {
    main() : SELF_TYPE {
        self
    };
    func(x : Main) : Int {
        333
    };
};

class Baz inherits Main {
    func2() : SELF_TYPE {
        (new SELF_TYPE).func(self)
    };
};
