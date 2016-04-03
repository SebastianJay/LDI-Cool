class Main inherits IO {
    main() : Object {
        let f : Main, g : Main <- new Main in
        if isvoid f then
            if isvoid g then
                out_int(0)
            else
                out_int(1)
            fi
        else
            if isvoid g then
                out_int(0)
            else
                out_int(1)
            fi
        fi
    };
};
