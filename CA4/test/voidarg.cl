class Main inherits IO {
    main(): Object {
        func(0)
    };
    func(i : Int) : Object {
        if isvoid i then out_string("FAIL") else out_string("PASS")fi
    };
};
