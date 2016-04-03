class Main inherits IO {
    main() : Object {
        let x : Object <- while false loop 123 pool in
            if isvoid x then
                out_int(0)
            else
                out_int(1)
            fi
    };
};
