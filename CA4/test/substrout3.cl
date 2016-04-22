class Main inherits IO {
    main() : Object {
            let i : Int <- 0,  s : String <- "testtesttesttesttesttesttesttesttesttesttesttesttest" in {
                while i < s.length() loop {
                    out_string(s.substr(0,i).concat("\n"));
                    i <- i + 1;
                } pool;
                out_string(s.substr(s.length()-1, 0));
                while 0 <= i loop {
                    out_string(s.substr(i,s.length()-i).concat("\n"));
                    i <- i - 1;
                } pool;
                out_string(s.substr(0, func(5)));
             }
    };
    func(i : Int) : Int {
        func2(i)
    };
    func2(i: Int) : Int {
        2*i
    };
};
