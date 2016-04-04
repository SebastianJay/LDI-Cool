class Main inherits IO {
    main() : Object {
	let f1: Foo <- (new Foo).setBar((new Bar).setI(2)), f2: Foo <- f1.copy() in {
	    out_int(f2.getBar().getI());
	    f1.getBar().setI(3);
	    out_int(f2.getBar().getI());
	}
    };
};

class Foo {
    b : Bar;
    setBar(nb:Bar) : Foo {{
	    b <- nb;
	    self;
	}};
    getBar():Bar {b};
};

class Bar {
    i : Int;
    setI(ni:Int):Bar{{i <- ni;self;}};
    getI():Int{i};
};
