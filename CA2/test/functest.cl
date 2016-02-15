class Main inherits IO {
    func(x : Int, y : String) : Object {
        (*
        let zzz : Int in
        let z : Int <- x + 3 in
        let zz : String <- y.concat("h") in
        if zz = "hh" then
            z <- z + 2
        else
            self
        fi
        *)

        {
        let x : Int <- 0 in
        while x < 5 loop {
            let x : String <- "HI" in
                out_string(x);
            out_int(x);
            x <- x + 1;
        }pool;
        
        out_int(x);
        new Int;
        false;
        --let aaa : Int in
        --aaa <- bbb;

        let z : Int <- 0 in
        if z = 1 then
            2
        else
            1
        fi;

        }

    };

    main() : Object {
        func(1, "")
    };
};
