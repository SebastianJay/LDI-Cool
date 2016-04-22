class Main inherits IO {
    main() : Object {
        case if false then new Object else new Int fi of
            i : Int => out_int(i);
            o : Object => out_string("Fail");
        esac

    };
};
