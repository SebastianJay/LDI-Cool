class Main inherits IO {
    main() : Object {{
        out_string(1.type_name());
        out_string(true.type_name());
        out_int(1.copy());
        if true.copy() then out_int(1) else out_int(0) fi;
        
        1.abort();
    }};
};
