--omitted when submitting
class Main inherits IO {
    main() : Object {
        self
        (*
        let l : ListNode <- new ListNode in
        while true loop
            l <- l.push(1)
        pool
        *)
    };
};

class ListNode {
    next : ListNode;
    val : Object;
    push(obj : Object) : ListNode {
        {
        next <- new ListNode;
        next.setVal(obj);
        next;
        }
    };

    setVal(obj : Object) : Object {
        val <- obj
    };
};
