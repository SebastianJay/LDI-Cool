open Printf
open List

(* identifier = line number and id name *)
type astID = int * string;;
(* optional astID, used for class inherits or no_inherits *)
type astIDInit =
    | IDInit of astID
    | IDNoInit      (*we prefix ID to avoid name conflicts with astExpInit*)
;;

(* different types of expressions, followed by the tuple that defines their arguments *)
type astExp =
    | Assign of astID * astExpNode
    | SelfDispatch of astID * astExpNode list
    | DynamicDispatch of astExpNode * astID * astExpNode list
    | StaticDispatch of astExpNode * astID * astID * astExpNode list
    | If of astExpNode * astExpNode * astExpNode
    | While of astExpNode * astExpNode
    | Block of astExpNode list
    | New of astID
    | IsVoid of astExpNode
    | Plus of astExpNode * astExpNode
    | Minus of astExpNode * astExpNode
    | Times of astExpNode * astExpNode
    | Divide of astExpNode * astExpNode
    | LT of astExpNode * astExpNode
    | LE of astExpNode * astExpNode
    | EQ of astExpNode * astExpNode
    | Not of astExpNode
    | Negate of astExpNode
    | Integer of int
    | String of string
    | Identifier of astID
    | True
    | False
    | LetBinding of (astID * astID * astExpInit) list * astExpNode
    | Case of astExpNode * (astID * astID * astExpNode) list
    | Internal of string
(* expression node = line number, static type, node content *)
and astExpNode =
    int * string * astExp
(* optional expression node, used for attribute initializers and let bindings *)
and astExpInit =
    | Init of astExpNode
    | NoInit
;;

(* a class feature can be a method or an attribute *)
(* attribute = name, static type, optional initializer *)
(* method = name, (name, type) formal list, return type, method body *)
type astFeat =
    | Attribute of astID * astID * astExpInit
    | Method of astID * (astID * astID) list * astID * astExpNode
;;

(* class = name, optional parent, list of features *)
type astClass = astID * astIDInit * astFeat list;;
(* ast = list of ast classes *)
type ast = astClass list;;

(* class map attribute = name, static type, optional initializer *)
type cmapAttr = string * string * astExpInit;;
(* class map class = name, list of attributes *)
type cmapClass = string * cmapAttr list;;
(* class map = list of cmap classes *)
type cmap = cmapClass list;;

(* implementation map implementation = list of formal names, name of original class, method body*)
type imapImpl = string list * string * astExpNode;;
(* implementation map method = name and implementation *)
type imapMethod = string * imapImpl;;
(* implementation map class = name, list of methods *)
type imapClass = string * imapMethod list;;
(* implementation map = list of imap classes *)
type imap = imapClass list;;

(* parent map class = name of child, name of parent *)
type pmapClass = string * string;;
(* parent map = list of pmap classes *)
type pmap = pmapClass list;;

(*
takes in string filepath to cl-type file
returns cmap * imap * pmap * ast tuple
*)
let read_cltype filepath = begin
    let fin = open_in filepath in
        let read_astid fin =
            let lineno = int_of_string (input_line fin) in
            let idname = input_line fin in
            (lineno, idname)
        in
        let rec read_astexpnodelist fin numleft =
            match numleft with
            | 0 -> []
            | _ ->
                let exp = read_astexpnode fin in
                exp :: read_astexpnodelist fin (numleft - 1)
        and read_astexpnode fin =
            let lineno = int_of_string (input_line fin) in
            let stype = input_line fin in
            match input_line fin with
            | "not" -> let node1 = read_astexpnode fin in
                (lineno, stype, Not(node1))
            | "negate" -> let node1 = read_astexpnode fin in
                (lineno, stype, Negate(node1))
            | "isvoid" -> let node1 = read_astexpnode fin in
                (lineno, stype, IsVoid(node1))
            | "plus" -> let node1 = read_astexpnode fin in
                let node2 = read_astexpnode fin in
                (lineno, stype, Plus(node1, node2))
            | "minus" -> let node1 = read_astexpnode fin in
                let node2 = read_astexpnode fin in
                (lineno, stype, Minus(node1, node2))
            | "times" -> let node1 = read_astexpnode fin in
                let node2 = read_astexpnode fin in
                (lineno, stype, Times(node1, node2))
            | "divide" -> let node1 = read_astexpnode fin in
                let node2 = read_astexpnode fin in
                (lineno, stype, Divide(node1, node2))
            | "lt" -> let node1 = read_astexpnode fin in
                let node2 = read_astexpnode fin in
                (lineno, stype, LT(node1, node2))
            | "le" -> let node1 = read_astexpnode fin in
                let node2 = read_astexpnode fin in
                (lineno, stype, LE(node1, node2))
            | "eq" -> let node1 = read_astexpnode fin in
                let node2 = read_astexpnode fin in
                (lineno, stype, EQ(node1, node2))
            | "while" -> let node1 = read_astexpnode fin in
                let node2 = read_astexpnode fin in
                (lineno, stype, While(node1, node2))
            | "new" -> let node1 = read_astid fin in
                (lineno, stype, New(node1))
            | "identifier" -> let node1 = read_astid fin in
                (lineno, stype, Identifier(node1))
            | "assign" -> let node1 = read_astid fin in
                let node2 = read_astexpnode fin in
                (lineno, stype, Assign(node1, node2))
            | "if" -> let node1 = read_astexpnode fin in
                let node2 = read_astexpnode fin in
                let node3 = read_astexpnode fin in
                (lineno, stype, If(node1, node2, node3))
            | "dynamic_dispatch" -> let node1 = read_astexpnode fin in
                let node2 = read_astid fin in
                let numargs = int_of_string (input_line fin) in
                let node3 = read_astexpnodelist fin numargs in
                (lineno, stype, DynamicDispatch(node1, node2, node3))
            | "static_dispatch" -> let node1 = read_astexpnode fin in
                let node2 = read_astid fin in
                let node3 = read_astid fin in
                let numargs = int_of_string (input_line fin) in
                let node4 = read_astexpnodelist fin numargs in
                (lineno, stype, StaticDispatch(node1, node2, node3, node4))
            | "self_dispatch" -> let node1 = read_astid fin in
                let numargs = int_of_string (input_line fin) in
                let node2 = read_astexpnodelist fin numargs in
                (lineno, stype, SelfDispatch(node1, node2))
            | "block" -> let numargs = int_of_string (input_line fin) in
                let node1 = read_astexpnodelist fin numargs in
                (lineno, stype, Block(node1))
            | "let" ->
                let rec read_astexpletbind fin numleft =
                    match numleft with
                    | 0 -> []
                    | _ -> match input_line fin with
                        | "let_binding_init" ->
                            let name = read_astid fin in
                            let stype = read_astid fin in
                            let exp = read_astexpnode fin in
                            (name, stype, Init(exp)) :: read_astexpletbind fin (numleft - 1)
                        | _ ->
                            let name = read_astid fin in
                            let stype = read_astid fin in
                            (name, stype, NoInit) :: read_astexpletbind fin (numleft - 1)
                in
                let numbind = int_of_string (input_line fin) in
                let bindlist = read_astexpletbind fin numbind in
                let exp = read_astexpnode fin in
                (lineno, stype, LetBinding(bindlist, exp))
            | "case" ->
                let rec read_astexpcasebind fin numleft =
                    match numleft with
                    | 0 -> []
                    | _ -> let name = read_astid fin in
                        let stype = read_astid fin in
                        let exp = read_astexpnode fin in
                        (name, stype, exp) :: read_astexpcasebind fin (numleft - 1)
                in
                let exp = read_astexpnode fin in
                let numbind = int_of_string (input_line fin) in
                let bindlist = read_astexpcasebind fin numbind in
                (lineno, stype, Case(exp, bindlist))
            | "integer" -> let node1 = int_of_string (input_line fin) in
                (lineno, stype, Integer(node1))
            | "string" -> let node1 = input_line fin in
                (lineno, stype, String(node1))
            | "true" -> (lineno, stype, True)
            | "false" -> (lineno, stype, False)
            | "internal" -> let node1 = input_line fin in
                (lineno, stype, Internal(node1))
            | _ -> raise Not_found
        in
        let read_ast fin =
            let rec read_ast_class fin numleft =
                let rec read_ast_feature fin numleft =
                    let rec read_ast_methformals fin numleft =
                        match numleft with
                        | 0 -> []
                        | _ ->
                            let formalname = read_astid fin in
                            let formaltype = read_astid fin in
                            (formalname, formaltype) :: read_ast_methformals fin (numleft - 1)
                    in
                    match numleft with
                    | 0 -> []
                    | _ ->
                        match input_line fin with
                        | "method" -> let methodname = read_astid fin in
                        let numformals = int_of_string (input_line fin) in
                        let formallist = read_ast_methformals fin numformals in
                        let methodtype = read_astid fin in
                        let methodbody = read_astexpnode fin in
                        Method(methodname, formallist, methodtype, methodbody) :: read_ast_feature fin (numleft - 1)
                        | "attribute_init" -> let attrname = read_astid fin in
                        let attrtype = read_astid fin in
                        let attrbody = read_astexpnode fin in
                        Attribute(attrname, attrtype, Init(attrbody)) :: read_ast_feature fin (numleft - 1)
                        | _ -> let attrname = read_astid fin in
                        let attrtype = read_astid fin in
                        Attribute(attrname, attrtype, NoInit) :: read_ast_feature fin (numleft - 1)
                in
                match numleft with
                | 0 -> []
                | _ ->
                    let classname = read_astid fin in
                    let inherits = match input_line fin with
                        | "inherits" -> let pclass = read_astid fin in IDInit(pclass)
                        | _ -> IDNoInit
                    in let numfeat = int_of_string (input_line fin) in
                    let featlist = read_ast_feature fin numfeat in
                    (classname, inherits, featlist) :: read_ast_class fin (numleft - 1)
            in
            let numclasses = int_of_string (input_line fin) in
            read_ast_class fin numclasses
        in
        let read_classmap fin =
            let rec read_classmap_class fin numleft =
                let rec read_classmap_attr fin numleft =
                    match numleft with
                    | 0 -> []
                    | _ ->
                        match input_line fin with
                        | "initializer" ->
                            let name = input_line fin in
                            let atype = input_line fin in
                            let exp = read_astexpnode fin in
                            (name, atype, Init(exp)) :: read_classmap_attr fin (numleft - 1)
                        | _ ->
                            let name = input_line fin in
                            let atype = input_line fin in
                            (name, atype, NoInit) :: read_classmap_attr fin (numleft - 1)
                in
                match numleft with
                | 0 -> []
                | _ ->
                    let classname = input_line fin in
                    let numattrs = int_of_string (input_line fin) in
                    let cattrlist = read_classmap_attr fin numattrs in
                    (classname, cattrlist) :: read_classmap_class fin (numleft - 1)
            in
            let _ = input_line fin in   (*consume class_map line*)
            let numclasses = int_of_string (input_line fin) in
            read_classmap_class fin numclasses
        in
        let read_implmap fin =
            let rec read_implmap_class fin numleft =
                let rec read_implmap_method fin numleft =
                    let rec read_implmap_methformals fin numleft =
                        match numleft with
                        | 0 -> []
                        | _ ->
                            let formalname = input_line fin in
                            formalname :: read_implmap_methformals fin (numleft - 1)
                    in
                    match numleft with
                    | 0 -> []
                    | _ ->
                        let methodname = input_line fin in
                        let numformals = int_of_string (input_line fin) in
                        let formallist = read_implmap_methformals fin numformals in
                        let origclass = input_line fin in
                        let bodyexp = read_astexpnode fin in
                        let impltuple = (formallist, origclass, bodyexp) in
                        (methodname, impltuple) :: read_implmap_method fin (numleft - 1)
                in
                match numleft with
                | 0 -> []
                | _ ->
                    let classname = input_line fin in
                    let nummethods = int_of_string (input_line fin) in
                    let methodlist = read_implmap_method fin nummethods in
                    (classname, methodlist) :: read_implmap_class fin (numleft - 1)
            in
            let _ = input_line fin in (*consume implementation_map line*)
            let numclasses = int_of_string (input_line fin) in
            read_implmap_class fin numclasses
        in
        let read_parentmap fin =
            let rec read_parentmap_class fin numleft =
                match numleft with
                | 0 -> []
                | _ ->
                    let child = input_line fin in
                    let parent = input_line fin in
                    (child, parent) :: read_parentmap_class fin (numleft - 1)
            in
            let _ = input_line fin in (*consume parent_map line*)
            let numclasses = int_of_string (input_line fin) in
            read_parentmap_class fin numclasses
        in
        try
            let cmap = read_classmap fin in
            let imap = read_implmap fin in
            let pmap = read_parentmap fin in
            let ast = read_ast fin in
            close_in fin;
            (cmap, imap, pmap, ast)
        with e ->
            close_in_noerr fin;
            raise e
end;;
