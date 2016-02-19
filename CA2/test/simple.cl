class Main inherits IO {
    func() : Object {
        {
        if 0 < 3 then 1 else 2 fi;
        while 0 < 3 loop self pool;
        new Int;
        }
    };

    main() : Object {
        self
    };
};
