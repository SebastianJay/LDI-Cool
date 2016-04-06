class Main inherits IO {
    aaa : Int <- 000;
    aab : Int <- 001;
    aba : Int <- 010;
    abb : Int <- 011;
    baa : Int <- 100;
    bab : Int <- 101;
    bba : Int <- 110;
    bbb : Int <- 111;

    bool : Bool <- true < false;
    boolio : Bool <- case self of x : Object => true; y : IO => false; esac;

    main() : Object {
        {
            while not isvoid baa loop
                if ((aaa <- aba) < (bab <- aaa)) = ((bbb <- bab) <= (baa <- abb)) then
                    if bool then
                        out_string(in_string().length().type_name()).abort()
                    else
                        out_string("qwerty").abort()
                    fi
                else
                    if boolio then
                        out_int(in_int()+2143-(~222)+33*~~2).abort()
                    else
                        out_int(out_int(3).type_name().length()).abort()
                    fi
                fi
            pool;
        }
    };
};
