open Annast
open Expeval

let main () = begin
    let (cmap, imap, pmap, ast) = read_cltype Sys.argv.(1) in
    prog_eval cmap imap pmap ast
end;;

main();;
