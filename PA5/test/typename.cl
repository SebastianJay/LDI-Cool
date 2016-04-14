class Main inherits IO {
      main(): Object {
      	      {
		out_string(type_name());
		out_string((new Object).type_name());
		out_string(self@IO.type_name());
		out_string((new Bar).type_name());
	      }      	      
      };

};

class Bar {
      x : Int;
};