class Main inherits IO {
    func() : Object {
        {
        --if 0 < 3 then 1 else 2 fi;
        --while 0 < 3 loop self pool;
        --new Int;
        let x : Int <- in_int() in
            if x < 3 then
                if x < 4 then
                    if x < 5 then
                        out_int(x)
                    else
                        self
                    fi
                else
                    self
                fi
            else
                self
            fi;
        let y : String <- "hello" in
        let z : String in
            out_string(y);
        let x : Int <- 2 in
        let x : Int <- x - 2 in
            out_int(x);
        }

    };

    main() : Object {
        func()
    };
};
