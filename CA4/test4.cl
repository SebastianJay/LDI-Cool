class Main inherits IO{
    main() : Object {
	let x : Int<- 2, f : Foo <- new Foo in {
		f.setX(3);
		out_int(f.getX());
		f.setX(f.getX());
		out_int(f.getX());
		func(f);
		out_int(f.getX());
		func(f.setX(f.setX(12).getX()));
		out_int(f.getX());
		let b : Bar <- new Bar in {
			b.setX(2);
			out_int(b@Foo.getX());
			func(b);
			out_int(b.getX());
			b.setX(f.setX(10).setX(12).setX(324).getX());
			out_int(b.getX());
			out_int(f.getX());
		};
	out_string(
        case f of
            x : Foo => "F";
            y : Object => "O";
        esac);
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
        x+x
    };
};
