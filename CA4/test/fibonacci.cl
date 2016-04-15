class Main inherits IO {
    main() : Object {
	let i : Int <- 20 in
            out_int(fib(i))
	
      };
      
      fib(n : Int) : Int {
      	    if n < 1 then
	       1
	       else
	       fib(n-1) + fib(n-2) fi
      };

};
