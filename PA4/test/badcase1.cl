class Main inherits IO {
    main() : Baz {
        case 0 of
            x : Baz => (new Baz);
            x : Bazz => (new Bazz);
        esac
    };
};

class Baz {
    x : Int;
};

class Bazz inherits IO {
    x : Int;
};
