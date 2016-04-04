class Main inherits IO {
    main() : Object {
	let f1 <- (new Foo).setBar((new Bar).setI(2)), f2 <- f1.copy() in {
	    out_int(f2.getBar().getI());
	    f1.getBar().setI(3);
	    out_int(f2.getBar().getI());
	}
    };
};

class Foo {
    b : Bar;
    setBar(nb:Bar) : Object {
	b <- nb
	    };
    getBar():Bar {b};
};

class Bar {
    i : Int;
    setI(ni):Bar{{i <- ni;self;}};
    getI():Int{i};
};
