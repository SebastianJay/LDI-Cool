class Main inherits IO {
    main() : Object {
	let x : Int <- in_int(), y : Int <- in_int(), s: String <- in_string(), t: String <- in_string(), b : Bar <- new Bar, c : Bar <- new Bar, n : Bar in {
	    b.setX(x);
	    c.setX(x);
	    if x = y then out_string("True") else out_string("False") fi;
	    if x < y then out_string("True") else out_string("False") fi;
	    if x <= y then out_string("True") else out_string("False") fi;
	    out_string("\n");
	    if s = t then out_string("True") else out_string("False") fi;
	    if s < t then out_string("True") else out_string("False") fi;
	    if s <= t then out_string("True") else out_string("False") fi;
	    out_string("\n");
	    if b = c then out_string("True") else out_string("False") fi;
	    if b < c then out_string("True") else out_string("False") fi;
	    if b <= c  then out_string("True") else out_string("False") fi;
	    out_string("\n");
	    c <- b;
	    if b = c then out_string("True") else out_string("False") fi;
	    if b < c then out_string("True") else out_string("False") fi;
	    if b <= c then out_string("True") else out_string("False") fi;
	    out_string("\n");
	    if b = n then out_string("True") else out_string("False") fi;
	    if b < n then out_string("True") else out_string("False") fi;
	    if b <= n then out_string("True") else out_string("False") fi;
	    out_string("\n");
	}
	
    };
};

class Bar {
    x : Int;
    setX(i : Int) : SELF_TYPE {
	{
	    x <- i;
	    self;
	}
    };
};
