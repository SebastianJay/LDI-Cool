class Main inherits IO{
    main() : Object {
	{
        out_int(2147483647+1);
        out_int(2147483647*4/4);
        out_int((~2147483647-1)*4/4);
        out_int((~2147483647-1));
        out_int(~2147483647 + ~2);
        out_int(~2147483647 - 1);
        out_int(~2147483647 / 2);
        0;
	}
    };
};
