class Main {
    main() : Object {
    let x : Int <- 2, f : Foo <- new Foo in {
		f.setX(3);
		f.setX(f.getX());
		func(f);
		func(f.setX(f.setX(12).getX()));
		let b : Bar <- new Bar in {
			b.setX(2);
			func(b);
			b.setX(f.setX(10).setX(12).setX(324).getX());
		    };
	}
    };
    func(f : Foo) : Foo {
	f.setX(f.getX() * f.getX())
    };
};

class Foo {
    x : Int <- 0;
    getX() : Int {
	x
	    };
    setX(nx : Int) : SELF_TYPE {
	{
	    x <- nx;
	    self;
	}
    };
};

class Bar inherits Foo {
    getX() : Int {
	x*x
    };
};
