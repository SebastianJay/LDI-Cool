class Main inherits IO {
      main():Object {
          let x : Int, y : Bool <- tRue in {
	      x <- x + 1;
	      x <- 2 * x;
	      x <- 12 / x;
	      x <- x / 12;
	      out_int(in_int() * x);
	      if not y  then out_int(1) else out_int(0) fi; 
	  }
      };
};