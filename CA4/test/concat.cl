class Main inherits IO {
    main() : Object {
        {
        out_string("H".concat("e").concat("l").concat("l").concat("o"));
        let str : String <- "hi" in
            {
                out_string(str.concat("ya"));
                out_string(str);
            };
        }
    };
};
