class Main inherits IO {
    main() : Object {
        {
        out_int(1);
        func();
        out_int(2);
        }
    };

    func() : Object {
        {
        out_int(0);
        1.abort();
        }
    };
};
