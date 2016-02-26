class Main {
    main() : Object {
	new A
    };
};

class A inherits C {
    x : Int;
};

class B inherits A {
    y : Int;
};

class C inherits B {
    z : Int;
};
