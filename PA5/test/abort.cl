class Main inherits IO {
    main() : Object {
        {
        out_int(1);
        func(0);
        out_int(2);
        }
    };

    func(x : Int) : Object {
        {
        out_int(0);
        1.abort();
        }
    };
};
