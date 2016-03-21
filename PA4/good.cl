 class Main inherits IO{
    main() : Int {
	{
	    12*123+(212/2)*12+1223*1312/(1231+24467-123568568)+1563456/(123*(1231+5464));
	    42 < (342*1231+((1231-2)/123)-4674);

	    let x : Int, y : String <- "hello" in {
		x <- 0;
		y;
	    };
	    in_int();
	    self@IO.out_int(2);
	    (new IO).out_int(3);
	    
	    case 0 of
		x : Main => out_int(2);
                x : Int => out_int(3);
	    esac;
	    
	    if in_int() < 2 then new SELF_TYPE else new Object fi;
							
	    while true loop
	        out_int(3)
	    pool;

	    0;
	}
    };
};
