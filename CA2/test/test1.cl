--test demonstrates the need for symbol table to have stack of registers
--each let binding pushes a new register onto the stack, that entry is popped at end
class Main inherits IO {
    func(arg : Int) : Object {
        {
            let x : Int <- arg - 1 in {
                let x : Int <- x * 2 in {
                    let x : Int <- x + 1 in {
                        out_int(x); --prints 2*(x-1)+1 = 2x-1
                    };
                    out_int(x); --prints 2*(x-1) = 2x-2
                };
                out_int(x); --prints 2x
            };
        }
    };

    main() : Object {
        func(in_int())
    };
};
