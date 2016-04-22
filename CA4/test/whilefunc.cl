class Main inherits IO {
    main() : Object {
        let i : Int <- 0 in
            while func(i) loop
                out_int(i <- i + 1)
            pool
    };
    func(i:Int) : Bool {
        i < 5
    };
};
