class Main inherits IO {
    main() : Object {
	let i : Int <- 4 in
	    while i < 20 loop
	    {
		out_int(fib(i));
		i <- i + 1;
	    } pool
	
      };
      
      fib(n : Int) : Int {
      	    if n < 1 then
	       1
	       else
	       fib(n-1) + fib(n-2) fi
      };

};
