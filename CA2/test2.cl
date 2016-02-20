--test demonstrates how the while loop creates a default Object
--in this case that Object is used as the return value for func()
--in most other cases that default Object is dead and should be optimized away
class Main inherits IO {
    func() : Object {
        let x : Int <- 0 in
        while x < 1 loop
            x <- x + 1
        pool
    };

    main() : Object {
        func()
    };
};
