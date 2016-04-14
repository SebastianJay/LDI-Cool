class Main inherits IO {
    main() : Object {
        {
        let i : Int <- 0 in
        let buffer : String in {
            --adjust upper bound as needed
            while i < 130 loop
            {
                buffer <- buffer.concat(in_string());
                out_int(i);
                out_int(buffer.length());
                out_string("\n");
                i <- i + 1;
            }
            pool;
            out_int(buffer.length());
            out_string(buffer);
        };
        }
    };
};
