class Main inherits IO {
    main() : Object {
        {
        let i : Int <- 0 in
        let buffer : String in {
            --adjust upper bound as needed
            while i < 10000 loop
            {
                buffer <- buffer.concat(in_string());
                i <- i + 1;
            }
            pool;
            out_int(buffer.length());
            out_string(buffer);
        };
        }
    };
};
