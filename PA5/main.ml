open Annast
open Expeval

(* read the cl-type file and then evaluate the program, plain and simple *)
let main () = begin
    let (cmap, imap, pmap, _) = read_cltype Sys.argv.(1) in
    prog_eval cmap imap pmap
end;;

main();;
