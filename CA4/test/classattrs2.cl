class Main inherits IO {
    aaa : Int <- 000;
    aab : Int <- 001;
    aba : Int <- 010;
    abb : Int <- 011;
    baa : Int <- 100;
    bab : Int <- 101;
    bba : Int <- 110;
    bbb : Int <- 111;

    main() : Object {
        {
            aaa <- aba;
            aba <- 3;
            out_int(aaa);
            out_int(aba);
        }
    };
};
