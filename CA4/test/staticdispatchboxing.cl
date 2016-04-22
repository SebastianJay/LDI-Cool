class Main inherits IO {
    main(): Object {
        {
            self@IO.out_int(2);
            self@IO.out_string("hello");
            self@Main.func(true); 
            self@Main.func(false);
        }
    };
    func(b: Bool) : Object{
        out_int(if b then 1 else 0 fi)
    };
};
