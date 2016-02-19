class Main inherits IO {
      main():Int {
          let x : Int <- 0 in {
	      while x < 5 loop
	      	    x <- x + 1
	      pool;
	      x;
	  }
      };
};