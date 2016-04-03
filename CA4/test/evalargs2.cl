class Main inherits IO {
    
    main(): Object {
        let f: Foo <- new Foo in {
		(f.setS("4")).func(f.setS(f.getS().concat("1")).getS(),
				   f.setS(f.getS().concat("2")).getS(),
				   f.setS(f.getS().concat("3")).getS());
		out_string(f.getS());
		    
	    }
    };

 
};


class Foo {
    s : String <- "a";
    getS() : String { s };
    setS(t : String) : SELF_TYPE {{ s<-t; self;}};
    func(a : String, b: String, c: String) : Foo {
	{s <- s.concat(a.concat(b.concat(c)));
	    self;}
    };
};
