class Main inherits IO {
    main() : Object {
	let x : Int <- in_int(), y: Int <- in_int() in {
	if
	    if x = y then true else false fi
					then out_int(1)
		    else out_int(0) fi;

		       }
    };
};
