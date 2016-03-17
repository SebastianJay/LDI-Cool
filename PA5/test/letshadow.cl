class Main inherits IO {
    main() : Object {
        let x : Int <- 10, x : Int <- x - 5 in
        let x : String <- "0123456789".substr(x, 1) in
            out_string(x)
    };
};
