-- Taken from https://piazza.com/class/ijen7n8b3bi1tc?cid=315
class Main inherits IO {
      x : Object <- "string";
      y : Object <- 5;
      a : Object <- "z";
      b : Object <- 7;
      main() : Object {{
      
         if x < y then
            out_string("true\n")
         else
            out_string("false\n")
         fi;

         if y < x then
            out_string("true\n")
         else
            out_string("false\n")
         fi;

         if x < a then
            out_string("true\n")
         else
            out_string("false\n")
         fi;

	 if y < b then
	 	out_string("true\n")
	else
		out_string("false\n")
	fi;

	let c : Object <- false, d : Object <- true in
	{
		if c < x then
            out_string("true\n")
         else
            out_string("false\n")
         fi;

	if c < d then
            out_string("true\n")
         else
            out_string("false\n")
         fi;


	};
         
      }};
};
