class Main inherits IO {
    main() : Object {{
        if true.copy() then out_string("true") else out_string("false") fi;
        if false.copy() then out_string("true") else out_string("false") fi;
    }};
};
