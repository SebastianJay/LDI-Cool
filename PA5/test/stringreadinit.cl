class Main inherits IO {
    x : String <- case self of
        y : Int => x <- "int";
        z : IO => in_string();
        a : Object => a.type_name();
        esac;

    main() : Object {
        {
            (new SELF_TYPE)@IO.out_string(x);
        }
    };
};
