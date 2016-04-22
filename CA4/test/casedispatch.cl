class Main inherits IO {
    main() : Object {
        let o : Object <- 4 in
            case o of
                i: Int => {func(i); self.func(i); self@Main.func(i);};
                o: Object => {func(~1); self.func(~1); self@Main.func(~1);};
            esac
    };
    func(i: Int) : Object {
        out_int(2*i)
    };
};
