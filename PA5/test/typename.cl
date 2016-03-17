class Main inherits IO {
    main() : Object {
        {
        out_string((new Main).type_name());
        out_string((new Int).type_name());
        out_string((new IO).type_name());
        out_string((new Bool).type_name());
        out_string((new String).type_name());
        out_string((new Foo).type_name());
        out_string((new Bar).type_name());
        }
    };
};

class Foo{
};

class Bar{
};
