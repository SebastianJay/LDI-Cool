class Main inherits IO {
    main() : Object {
        {
            func(3);
        }
    };
    func(i : Int) : Object {
        case i of
            x: Int => out_int(i);
            o: Object => out_string("Fail");
        esac
    };
};
