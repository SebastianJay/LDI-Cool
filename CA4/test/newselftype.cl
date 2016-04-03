class Main inherits IO {
    main() : Object {
	let f : Foo <- (new Bar) in {
	case f.func() of
	    a : Foo => out_string("F");
	    b: Bar => out_string("B");
		esac;
	}
    };
};

class Foo {
    x : Int;
    setX(i : Int) : SELF_TYPE {{x <- i; self;}};
    getX(): Int {x};
    func() : SELF_TYPE {
	let f : SELF_TYPE<- (new SELF_TYPE) in {
	    f<-setX(x);
	    f;
	}
    };
};

class Bar inherits Foo {};
