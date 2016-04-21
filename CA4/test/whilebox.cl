class Main inherits IO {
    main() : Object {
        {
        while false loop
           out_int(1) 
        pool;
        while func() loop
            out_int(2)
        pool;
        while func2(false) loop
            out_int(3)
        pool;
        out_int(4);
        }
    };
    func() : Bool {
        false
    };
    func2(b : Bool) : Bool {
        {
        if b then
            out_int(6)
        else
            out_int(5)
        fi;
        b;
        }
    };
};
