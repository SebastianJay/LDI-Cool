class Main inherits IO {
    main() : Object {{
       func(new Object);
       func(new Int);
       func(new Bool); 
       func(new String);
       func(new IO); 
    }};  
    func(o : Object) : Object {
        case o of
            x : Object => out_string("O\n");
            x : Int => out_string("I\n");
            x : Bool => out_string("B\n");
            x : String => out_string("S\n");
            x : IO => out_string("IO\n");
        esac
    };
};
