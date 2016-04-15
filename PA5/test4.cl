class Main inherits IO{
    x : Int;
    main() : Object { {
        x <- x + 1;
        out_int(x);
        main();
        }
    };
};
