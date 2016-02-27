class Main inherits IO {
    myInt : Int;
    main() : Object { {
    	   myInt <- 2;
           func(1);
           out_int(myInt);
       }
    };
    func(myInt : Int) : Object {
        out_int(myInt)
    };
};
