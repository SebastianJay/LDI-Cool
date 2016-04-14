class Main inherits IO {
    main() : Object {
        let b: Bool <- true in
        out_string((while b loop
            b <- false
        pool).type_name())
    };
};
