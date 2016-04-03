class Main inherits IO {
    main() : Object {
        let x : Int <- 1 in
        {
        case x of
            y : Int => x <- 2;
            y : String => x <- 3;
        esac;
        out_int(x);
        }
    };
};
