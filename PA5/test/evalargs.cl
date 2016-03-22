class Main inherits IO {
    main() : Object {
        let str : String <- "abc" in
            self.out_string(str <- str.concat("e")).out_string(str <- str.concat("d"))
    };
};
