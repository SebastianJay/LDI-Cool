class Main inherits IO {
    main() : Object {
        let x : Int <- 1 in
        {
        case x of
            y : Int => y <- 2;
            y : String => y <- "3";
        esac;
        out_int(x);
        }
    };
};
