class Main {
    main() : Object {
	{
	    (new Bar).foo().bar();
	    (new Bar)@Foo.foo().bar();
	       
	}
    };
};

class Foo {
    foo(): SELF_TYPE {
	self
    };
};

class Bar inherits Foo {
    bar():Int {
	foo().bar()
    };
};
