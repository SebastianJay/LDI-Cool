class Main inherits IO {
    main() : Object {{
        out_whatever(1);
        out_whatever("hello");
        out_whatever(true);
        out_whatever(new Object);
    }};
    
    out_whatever(o : Object) : Object {
        case o of
            x : Int => out_int(x);
            s : String => out_string(s);
            o : Object => out_string(o.type_name());
        esac
    };
};
