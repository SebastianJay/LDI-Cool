class Main inherits IO {
      x : Int <- 12 * 45;
      y : String <- "Hello" + ", World";
      main(a : Int, b : String) : Object {
      	     let z : Int <- in_int() in {
		if z < x * 2 + 32 - 34 / 45 then out_int(1) else out_int(0) fi;
		while not z <= 0 loop z = z/2 pool;
		let q : Object <- new Main in {
		    case q of
		    	 s : String => out_string(s + "it's" + " a " + " string");
			 i : Int => out_int(i);
			 m : Main => out_string("");
			 o : Object => out_string("It's something");
		    esac;
		    
		};
		out_int(~12 * 2 + 43 / (34*0) + 12-34 -(18/3+3) - (((3+3)/2)*12));
		let b: Bool <- false in {
		    b <- not b;
		    if b = true then out_string("true") else out_int(0) fi; 
	     	};
		let f : Foo <- new Baz in {
		    out_int(f.bar(3));
		    out_int(f@Foo.bar(3));
		};
		0;
	     }
      };
};

class Foo {
      bar(x : Int) : Int {
      	    x * x
      };
};

class Baz inherits Foo {
      bar(x : Int) : Int {
      	    x + x
      };
};