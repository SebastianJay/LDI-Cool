
class Main inherits IO {
    main() : Object {
        let b : Bool in {
            if (b <- true) then out_int(1) else out_int(0) fi;
            if (b <- false) then out_int(1) else out_int(0) fi;
        }
    };
};
