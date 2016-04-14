--from my recollection of what the revealed test case was
class Main {
    io : IO <- new IO;
    main() : Object {
    {
        io.out_string((not (new Bool)).type_name());

        io.out_int((new Int) + 1);

        io.out_string((new String).substr(0, 0).type_name());

        --io.out_string("o".substr(2, 0));
    }
    };
};
