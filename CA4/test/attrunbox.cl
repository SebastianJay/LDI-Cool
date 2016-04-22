class Main inherits IO {
    o : Object <- 2;
    main() : Object {
        let x : Object <- 1 in  {
        if x < o then out_int(1) else out_int(0) fi;            
        x <- 2;
        if x = o then out_int(1) else out_int(0) fi;
        x <- 3;
        if o < x then out_int(1) else out_int(0) fi;
        }
    };
};
