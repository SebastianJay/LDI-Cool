class Main inherits IO {
    func() : Int {
        0
    };
    main() : Object {
        let f : Main <- new Foo in
        out_int(f.func())
    };
};

class Foo inherits Main {
    func() : Int {
        1
    };
};
