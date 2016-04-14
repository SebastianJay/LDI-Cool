class Main inherits IO {
	main() : Object {
		let x : Object <- "hello", y : Int in {
			case x of
				y:String => out_string(y);
				y:Int => out_int(y);
			esac;
		}
	};
};
