class Main inherits IO {
    main() : Object {
        {
            let i : Int <- 0, v : Object <- while i < 5 loop {i <- i + 1; i;}pool in {
                if isvoid v then out_string("VOID") else
                    case v of 
                        x : Int => out_int(x);
                        o : Object => out_string(o.type_name());
                    esac
                fi;
            };
        }
    };
};
