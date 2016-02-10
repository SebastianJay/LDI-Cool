class Main inherits IO {
      main() : Int {
      	     let i : Int <- in_int(), sum : Int <- 0 in {
	     	 while i < 20 loop {
		       sum <- sum + i;
		       i <- i + 1;
		 }
		 pool;
		 0;
	     }
      };
};