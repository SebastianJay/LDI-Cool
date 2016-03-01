class Main inherits IO {
    main():Int {
    let y : Int <- in_int() in
    let x : Int <- y in {
        while x < 5 loop {
            x <- x + 1;
            out_int(x);
        }pool;
        --out_string("\n");
        x <- y;
        while x <= 5 loop {
            x <- x + 1;
            out_int(x);
        }pool;
        --out_string("\n");
        x <- y;
        while x = 5 loop {
            x <- x + 1;
            out_int(x);
        }pool;
        x;
    }
    };
};
