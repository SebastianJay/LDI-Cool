class Main inherits IO {
    main() : Object {
        let x : Int <- 1 in
        {
        case x of
            x : Int => x <- 2;
            x : String => x <- "3";
        esac;
        out_int(x);
        }
    };
};
