class Main inherits IO {
      main() : Int {
      	     let i : Int <- 0, sum : Int <- 0 in {
	     	 while i < 20 loop
		       sum <- sum + i
		 pool;
		 0;
	     }
      };
};