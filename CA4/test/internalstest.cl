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
		};
		
		out_string("\n");
		out_string("\\");
		out_string("\\\"");
		out_string("\\n");
	    }
     };
};