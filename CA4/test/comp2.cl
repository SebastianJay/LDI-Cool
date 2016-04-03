-- Taken from https://piazza.com/class/ijen7n8b3bi1tc?cid=315
class Main inherits IO {
      x : Object <- "string";
      y : Object <- 5;
      main() : Object {{
      
         if x < y then
            out_string("true\n")
         else
            out_string("false\n")
         fi;

         if y < x then
            out_string("true\n")
         else
            out_string("false\n")
         fi;

         x <- 1;

         if x < y then
            out_string("true\n")
         else
            out_string("false\n")
         fi;
         
      }};
};