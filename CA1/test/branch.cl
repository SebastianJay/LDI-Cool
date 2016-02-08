class Main inherits IO {
      main () : Int {			
      	   let x : Int in {
	       x <- in_int();
	       if x < 10 then
	       	  out_string("less")
	       else
		  out_string("more")
	       fi;
	       0;  	
	   }
      };      
};