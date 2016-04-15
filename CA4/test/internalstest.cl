class Main inherits IO {
     main() : Object {
     	    {
		out_string((new Object).copy().type_name());
		let s : String <- "Hello, world" in {
		    out_int(s.length());
		    out_string(s.type_name());
		    out_string(s);
		    out_string(s.substr(5,4));
		    out_string(s.copy());
                    out_string(s.concat("!"));
		};
		
		out_string("\n");
		out_string("\\");
		out_string("\\\"");
		out_string("\\n");
                out_string("\t");
                1.abort();
                
                out_int(3.copy());
                case 1.copy() of 
                    x : Int => out_int(x);
                    x : Object => out_string("fail");
                esac;
                case true.copy() of
                    x : Bool => out_string("true");
                    x : Object => out_string("fail");
                esac;
                case (new String).copy() of
                    x : String => out_string("string");
                    x : Object => out_string("fail");
                esac;
                case (new IO).copy() of
                    x : IO => out_string("IO");
                    x : Object => out_string("fail");
                esac;
	    }
     };
};
