class Main inherits IO {
	x : Int <- 2;
	main() : Object {
		let y : Object <- 1 in {
			case x of
				x : Object => out_string("Object");
				x : Int => out_int(x);
			esac;
		}
	};
};
