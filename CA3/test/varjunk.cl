class Main inherits IO {
      main():Object {
          let x : Int in {
	      x <- x + 1;
	      x <- 2 * x;
	      x <- 12 / x;
	      x <- x / 12;
	      out_int(in_int() * x);
	  }
      };
};