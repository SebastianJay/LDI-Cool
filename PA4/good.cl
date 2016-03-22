class Main inherits IO{
    x : SELF_TYPE;
    y : Int <- 55 / ~4 + if "aa" <= "bb" then 3 else 2 fi;
    main() : Int {
    {
        12*123+(212/2)*12+1223*1312/(1231+24467-123568568)+1563456/(123*(1231+5464));
        42 < (342*1231+((1231-2)/123)-4674);

        let x : Int <- 1, y : String <- "hello", x : String <- y.substr(0, x) in {
        	x <- "=)";
        	y <- "yayy!";
        };
        in_int();
        self@IO.out_int(2);
        (new IO).out_int(3);

        case 0 of
            x : Main => out_int(2);
            xxx : Object => out_int(3);
            x : Int => out_int(4);
        esac;

        if in_int() < 2 then new SELF_TYPE else new Object fi;
        false < true;
        isvoid (self = x);

        while 010 <= ~101 loop
            out_int(3)
        pool;

        0;
    }
    };
};

class Fooey inherits Main {
    main() : Int {
    {
        out_string("make way for the new main!");
        1;
    }
    };

    another() : Main {
    {
        out_int(y);

        case in_int() of
            y : Int => new Fooey;
            x : Bool => new Main;
            z : String => new SELF_TYPE;
        esac;
    }
    };
};
