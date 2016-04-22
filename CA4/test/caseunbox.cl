class Main inherits IO {
    main() : Object {
        let x : Object <- 5 in
            out_int(case x of o:Object => ~1; i : Int => i; esac)
    };
};
