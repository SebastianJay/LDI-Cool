class Main inherits IO {
    main() : Object {
        case 0 of
            x : Object => out_int(2);
            x : Int => out_int(3);
        esac
    };
};
