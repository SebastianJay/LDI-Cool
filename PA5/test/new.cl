class Main inherits IO {
    main() : Object {
        {
            (new IO).out_int(1);
            out_int(new Int);
            out_string(new String);
            new Object;
            new Bool;
            out_int((new String).length());
            out_string(self.type_name());
            out_string((new Object).type_name());
            out_string((new SELF_TYPE).type_name());
            out_string((new IO).type_name());
            out_string((new Int).type_name());
            out_string((new Bool).type_name());
            out_string((new String).type_name());
            if new Bool then out_int(1) else out_int(0) fi;
        }
    };

};
