class Main inherits IO {
    main() : Object {
        let str : String <- "ab" in
            self.out_string(str <- str.concat("kad")).out_string(str <- str.concat("ra"))
    };
};
