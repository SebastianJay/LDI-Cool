class Main inherits IO {
    main() : Object {
	{
	    if (1 < 2) < (2 < 1) then out_int(1) else out_int(0) fi;
	    if (1 < 2) < (1 < 2) then out_int(1) else out_int(0) fi;
	    if (2 < 1) < (2 < 1) then out_int(1) else out_int(0) fi;
	    if (2 < 1) < (1 < 2) then out_int(1) else out_int(0) fi;
	    out_int(9);
	    if (1 < 2) <= (2 < 1) then out_int(1) else out_int(0) fi;
	    if (1 < 2) <= (1 < 2) then out_int(1) else out_int(0) fi;
	    if (2 < 1) <= (2 < 1) then out_int(1) else out_int(0) fi;
	    if (2 < 1) <= (1 < 2) then out_int(1) else out_int(0) fi;
	    out_int(9);
	    if (1 < 2) = (2 < 1) then out_int(1) else out_int(0) fi;
	    if (1 < 2) = (1 < 2) then out_int(1) else out_int(0) fi;
	    if (2 < 1) = (2 < 1) then out_int(1) else out_int(0) fi;
	    if (2 < 1) = (1 < 2) then out_int(1) else out_int(0) fi;
	    
	}					      
    };
};
