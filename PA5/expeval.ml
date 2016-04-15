open List
open Hashtbl
open String
open Int32
open Printf
open Scanf
open Annast

(* coolObject RegObj = dynamic type string, list of (name string, location int) fields *)
(* other variants are special cases - primitives and void *)
type coolObject =
    | RegObj of string * (string * int) list
    | IntObj of Int32.t     (* 32 bit int used because Cool requires 32 bit arithmetic *)
    | BoolObj of bool
    | StringObj of string
    | Void
;;

(* opsemEnv = list of (identifier string, location int) bindings *)
type opsemEnv = (string, int) Hashtbl.t;;
(* opsemStore = list of (location int, obj coolObject) mappings *)
type opsemStore = (int, coolObject) Hashtbl.t;;

(* evaluating a program calls (new Main).main() given a class map, implementation map, and parent map *)
let prog_eval (cmap:cmap) (imap:imap) (pmap:pmap) = begin
    (* we keep track of number of stack frames through a mutable var *)
    let activation_count = ref 0 in

    (* takes coolObject self, hashtbl store, hashtbl environment and astExpNode expression to evaluate *)
    (* returns (coolObject value, hashtbl new store) *)
    (* NOTE returning a new store is not strictly necessary since Hashtbl modifies values in place
        however we include it in the return expression so it more closely matches the op sem rules *)
    let rec exp_eval (self : coolObject) (store : opsemStore) (env : opsemEnv) (expNode : astExpNode) =
        (* decompose astExpNode into line number, static type, and actual expression *)
        let (lineno, stype, exp) = expNode in
        (* return a list of num new store locations given current store
            store does not get modified, rather it just gives new location ints for caller's use *)
        let store_newloc tbl num =
            let rec create_loclst numleft ind =
                match numleft with
                | 0 -> []
                | _ -> ind :: create_loclst (numleft-1) (ind+1)
            in
            let len = Hashtbl.length tbl in
            create_loclst num len
        in
        (* return a default coolObject given its dynamic type *)
        let default_obj dtype =
            match dtype with
            | "Int" -> IntObj(Int32.zero)
            | "Bool" -> BoolObj(false)
            | "String" -> StringObj("")
            | _ -> Void
        in
        (* get string class name and list of attributes given a coolObject*)
        let get_typename_attrs obj =
            match obj with
            | RegObj(name, attrs) -> (name, attrs)
            | IntObj(_) -> ("Int", [])
            | BoolObj(_) -> ("Bool", [])
            | StringObj(_) -> ("String", [])
            | Void -> failwith "unexpected Void type in get_typename_attrs"
        in
        (* helper to evaluate arguments in dispatch expression *)
        let rec args_eval self store env margs =
            match margs with
            | [] -> ([], store)
            | hd :: tl ->
                let (arghd, sti) = exp_eval self store env hd in
                let (argtl, ste) = args_eval self sti env tl in
                (arghd :: argtl, ste)
        in
        (* print an error message and exit the program *)
        let out_error formatstr =
            Printf.printf formatstr lineno;
            exit 1
        in
        (* modify (inc/dec) activation_count and check for stack overflow *)
        let inc_stack_frame () =
            activation_count := !activation_count + 1;
            (* 1001 is the magic number that matches reference interpreter behavior *)
            match !activation_count >= 1001 with
            | true -> out_error "ERROR: %d: Exception: stack overflow\n"
            | false -> ()
        in
        let dec_stack_frame () =
            activation_count := !activation_count - 1;
        in
        (* common code reused between self, dynamic, and static dispatch *)
        (* given receiver object, class name to draw method from, method name,
            argument objects, and store, we create the new store+environment and call method *)
        let dispatch_helper recval cname mname argvals store =
            let (_, attrs) = get_typename_attrs recval in
            let impllst = List.assoc cname imap in
            let (formallst, _, mbody) = List.assoc mname impllst in
            let loclst = store_newloc store (List.length formallst) in
            let storeentries = List.combine loclst argvals in
            List.iter (fun (loc, obj) -> Hashtbl.add store loc obj) storeentries;
            let newenv = Hashtbl.create 255 in
            List.iter (fun (name, loc) -> Hashtbl.add newenv name loc) attrs;
            let formallocs = List.combine formallst loclst in
            List.iter (fun (name, loc) -> Hashtbl.add newenv name loc) formallocs;
            inc_stack_frame ();
            let out_tuple = exp_eval recval store newenv mbody in
            dec_stack_frame ();
            out_tuple
        in
        (* actual expression evaluation starts here as a monolithic case block *)
        (* each line of code maps roughly to one line of operational semantics
            -- refer to the CRM to figure out what is going on *)
        match exp with
        (* Assign - generate assignor and modify store so assignee points to it *)
        | Assign(assignee, assignor) ->
            let (_, id) = assignee in
            let (value, st2) = exp_eval self store env assignor in
            let loc = Hashtbl.find env id in
            Hashtbl.replace st2 loc value;
            (value, st2)
        (* Identifier - look up environment+store to get object, or just return self *)
        | Identifier(aId) ->
            let (_, id) = aId in
            let objval = (match id with
            | "self" -> self
            | _ -> Hashtbl.find store (Hashtbl.find env id))
            in
            (objval, store)
        (* primitives - create new objects trivially *)
        | True ->
            (BoolObj(true), store)
        | False ->
            (BoolObj(false), store)
        | Integer(intval) ->
            (IntObj(Int32.of_int intval), store)
        | String(strval) ->
            (StringObj(strval), store)
        (* New - for primitives, create default object;
            otherwise create default attributes and evaluate initializers *)
        | New(aId) ->
            let (_, id) = aId in
            (* new SELF_TYPE uses the dynamic type of self *)
            let dtype = (match id with
            | "SELF_TYPE" -> let (sotype, _) = get_typename_attrs self in sotype
            | _ -> id)
            in
            (match dtype with
            | ("Int" | "Bool" | "String") -> (default_obj dtype, store)
            | _ ->
                (* constructs list of astExpNode:Assign for attribute initializers *)
                let rec build_init_exp attrlst =
                    match attrlst with
                    | [] -> []
                    | hd :: tl ->
                        let (name, _, init) = hd in
                        match init with
                        | NoInit -> build_init_exp tl
                        | Init(initexp) -> (0, "Object", Assign((0, name), initexp)) :: build_init_exp tl
                in
                let attrlst = List.assoc dtype cmap in
                let loclst = store_newloc store (List.length attrlst) in
                let clsfields = List.map (fun ((attrname, _, _), loc) -> (attrname, loc))
                    (List.combine attrlst loclst) in
                let newself = RegObj(dtype, clsfields) in
                let storeentries = List.map (fun ((_, atype, _), loc) -> (loc, default_obj atype))
                    (List.combine attrlst loclst) in
                List.iter (fun (loc, obj) -> Hashtbl.add store loc obj) storeentries;
                let selfenv = Hashtbl.create 255 in
                List.iter (fun (name, loc) -> Hashtbl.add selfenv name loc) clsfields;
                let initblock = (0, "Object", Block(build_init_exp attrlst)) in
                inc_stack_frame ();
                let (_, st3) = exp_eval newself store selfenv initblock in
                dec_stack_frame ();
                (newself, st3))
        (* dispatch - eval args, receiver object; common code exists in dispatch_helper *)
        | SelfDispatch(methid, margs) ->
            let (argvals, argstore) = args_eval self store env margs in
            let (_, mname) = methid in
            let (cname, _) = get_typename_attrs self in
            dispatch_helper self cname mname argvals argstore
        | DynamicDispatch(receiver, methid, margs) ->
            let (argvals, argstore) = args_eval self store env margs in
            let (recval, recstore) = exp_eval self argstore env receiver in
            (match recval with
            | Void -> out_error "ERROR: %d: Exception: dispatch on void\n"
            | _ -> ());
            let (cname, _) = get_typename_attrs recval in
            let (_, mname) = methid in
            dispatch_helper recval cname mname argvals recstore
        | StaticDispatch(receiver, clsid, methid, margs) ->
            let (argvals, argstore) = args_eval self store env margs in
            let (recval, recstore) = exp_eval self argstore env receiver in
            (match recval with
            | Void -> out_error "ERROR: %d: Exception: dispatch on void\n"
            | _ -> ());
            let (_, cname) = clsid in
            let (_, mname) = methid in
            dispatch_helper recval cname mname argvals recstore
        (* If - eval predicate and choose the right branch *)
        | If(predexp, thenexp, elseexp) ->
            let (predicate, predstore) = exp_eval self store env predexp in
            (match predicate with
            | BoolObj(boolval) ->
                (match boolval with
                | true -> exp_eval self predstore env thenexp
                | false -> exp_eval self predstore env elseexp)
            | _ -> failwith "non Bool predicate in if statement")
        (* Block - call exp_eval recursively until all statements complete *)
        | Block(explst) ->
            (match explst with
            | [] -> (Void, store)   (* should only occur from New when class has no attribute initializers *)
            | hd :: [] -> exp_eval self store env hd
            | hd :: tl -> let (_, sti) = exp_eval self store env hd in
                exp_eval self sti env (lineno, stype, Block(tl)))
        (* Let - create new environment, modify store and eval body; if multiple bindings, use recursion *)
        | LetBinding(bindlst, letexp) ->
            (* common code for binding a let var, used for an expression with any number of bindings *)
            let letbind_eval self store env (nameid, lettypeid, init) =
                let (_, name) = nameid in
                let (_, lettype) = lettypeid in
                let (initobj, initstore) = (match init with
                | Init(initexp) -> exp_eval self store env initexp
                | NoInit -> (default_obj lettype, store))
                in
                let loc = List.hd (store_newloc initstore 1) in
                Hashtbl.add initstore loc initobj;
                let newenv = Hashtbl.copy env in
                Hashtbl.add newenv name loc;
                (initstore, newenv)
            in
            (match bindlst with
            | [] -> failwith "no bindings specified in let statement"
            | hd :: [] ->
                let (newstore, newenv) = letbind_eval self store env hd in
                exp_eval self newstore newenv letexp
            | hd :: tl ->
                let (newstore, newenv) = letbind_eval self store env hd in
                let otherbind = (lineno, stype, LetBinding(tl, letexp)) in
                exp_eval self newstore newenv otherbind)
        (* Case - eval case obj and match its least type to evaluate the right branch *)
        | Case(caseexp, branchlst) ->
            (* takes string dynamic type and list of strings for case branch types *)
            (* return a string corresponding to least type (or fails if no match found) *)
            let closest_ancestor dtype branchtypes =
                let rec parent_chain dtype =
                    match dtype with
                    | "Object" -> ["Object"]
                    | x -> x :: parent_chain (List.assoc x pmap)
                in
                let rec walk_chain pchain =
                    match pchain with
                    | [] -> out_error "ERROR: %d: Exception: case without matching branch\n"
                    | hd :: tl ->
                        match List.mem hd branchtypes with
                        | true -> hd
                        | false -> walk_chain tl
                in
                walk_chain (parent_chain dtype)
            in
            let (caseobj, casestore) = exp_eval self store env caseexp in
            (match caseobj with
            | Void -> out_error "ERROR: %d: Exception: case on void\n"
            | _ -> ());
            let (dtype, _) = get_typename_attrs caseobj in
            let branchtypes = List.map (fun (_, (_, btype), _) -> btype) branchlst in
            let ctype = closest_ancestor dtype branchtypes in
            let ((_, casename), _, branchexp) = List.hd (List.filter
                (fun (_, (_, btype), _) -> btype = ctype) branchlst) in
            let loc = List.hd (store_newloc casestore 1) in
            Hashtbl.add casestore loc caseobj;
            let newenv = Hashtbl.copy env in
            Hashtbl.add newenv casename loc;
            exp_eval self casestore newenv branchexp
        (* While - eval predicate, and if true run through body and repeat loop over again *)
        | While(predexp, bodyexp) ->
            let (predicate, predstore) = exp_eval self store env predexp in
            (match predicate with
            | BoolObj(boolval) ->
                (match boolval with
                | true ->
                    let (_, bodystore) = exp_eval self predstore env bodyexp in
                    let (_, loopstore) = exp_eval self bodystore env expNode in
                    (Void, loopstore)
                | false -> (Void, predstore))
            | _ -> failwith "non Bool predicate in while loop")
        (* Isvoid - match with Void coolObject *)
        | IsVoid(voidexp) ->
            let (voidobj, voidstore) = exp_eval self store env voidexp in
            let retbool = (match voidobj with
            | Void -> BoolObj(true)
            | _ -> BoolObj(false))
            in
            (retbool, voidstore)
        (* Not - true -> false and false -> true *)
        | Not(notexp) ->
            let (notobj, notstore) = exp_eval self store env notexp in
            let retbool = (match notobj with
            | BoolObj(boolval) -> BoolObj(not boolval)
            | _ -> failwith "non Bool exp in not")
            in
            (retbool, notstore)
        (* Negate, Plus, Minus, Times, Divide - trivial 32 bit arithmetic *)
        | Negate(negexp) ->
            let (negobj, negstore) = exp_eval self store env negexp in
            let retint = (match negobj with
            | IntObj(intval) -> IntObj(Int32.neg intval)
            | _ -> failwith "non Int exp in negate")
            in
            (retint, negstore)
        | Plus(exp1, exp2) ->
            let (op1, st2) = exp_eval self store env exp1 in
            let (op2, st3) = exp_eval self st2 env exp2 in
            let retint = (match (op1, op2) with
            | (IntObj(intval1), IntObj(intval2)) -> IntObj(Int32.add intval1 intval2)
            | _ -> failwith "non Int exp in plus")
            in
            (retint, st3)
        | Minus(exp1, exp2) ->
            let (op1, st2) = exp_eval self store env exp1 in
            let (op2, st3) = exp_eval self st2 env exp2 in
            let retint = (match (op1, op2) with
            | (IntObj(intval1), IntObj(intval2)) -> IntObj(Int32.sub intval1 intval2)
            | _ -> failwith "non Int exp in minus")
            in
            (retint, st3)
        | Times(exp1, exp2) ->
            let (op1, st2) = exp_eval self store env exp1 in
            let (op2, st3) = exp_eval self st2 env exp2 in
            let retint = (match (op1, op2) with
            | (IntObj(intval1), IntObj(intval2)) -> IntObj(Int32.mul intval1 intval2)
            | _ -> failwith "non Int exp in times")
            in
            (retint, st3)
        | Divide(exp1, exp2) ->
            let (op1, st2) = exp_eval self store env exp1 in
            let (op2, st3) = exp_eval self st2 env exp2 in
            let retint = (match (op1, op2) with
            | (IntObj(intval1), IntObj(intval2)) ->
                (match Int32.to_int intval2 with
                | 0 -> out_error "ERROR: %d: Exception: division by zero\n"
                | _ -> IntObj(Int32.div intval1 intval2))
            | _ -> failwith "non Int exp in divide")
            in
            (retint, st3)
        (* LT, LE, and EQ - primitives are simple, otherwise we need pointer (physical) comparison *)
        | LT(exp1, exp2) ->
            let (op1, st2) = exp_eval self store env exp1 in
            let (op2, st3) = exp_eval self st2 env exp2 in
            let retbool = (match (op1, op2) with
            | (IntObj(intval1), IntObj(intval2)) ->
                BoolObj((Int32.compare intval1 intval2) < 0)
            | (BoolObj(boolval1), BoolObj(boolval2)) ->
                BoolObj(boolval1 < boolval2)    (* OCaml bool compare is same as that of Cool *)
            | (StringObj(strval1), StringObj(strval2)) ->
                BoolObj(strval1 < strval2)
            | _ -> BoolObj(false))  (* Object comparison with LT is always false *)
            in
            (retbool, st3)
        | LE(exp1, exp2) ->
            let (op1, st2) = exp_eval self store env exp1 in
            let (op2, st3) = exp_eval self st2 env exp2 in
            let retbool = (match (op1, op2) with
            | (IntObj(intval1), IntObj(intval2)) ->
                BoolObj((Int32.compare intval1 intval2) <= 0)
            | (BoolObj(boolval1), BoolObj(boolval2)) ->
                BoolObj(boolval1 <= boolval2)
            | (StringObj(strval1), StringObj(strval2)) ->
                BoolObj(strval1 <= strval2)
            | (Void, Void) -> BoolObj(true) (* Void equals Void and nothing else *)
            | (Void, _) -> BoolObj(false)
            | (_, Void) -> BoolObj(false)
            | (obj1, obj2) ->
                BoolObj(obj1 == obj2))      (* use physical equality (==) to check pointer locations *)
            in
            (retbool, st3)
        | EQ(exp1, exp2) ->
            let (op1, st2) = exp_eval self store env exp1 in
            let (op2, st3) = exp_eval self st2 env exp2 in
            let retbool = (match (op1, op2) with
            | (IntObj(intval1), IntObj(intval2)) ->
                BoolObj((Int32.compare intval1 intval2) = 0)
            | (BoolObj(boolval1), BoolObj(boolval2)) ->
                BoolObj(boolval1 = boolval2)
            | (StringObj(strval1), StringObj(strval2)) ->
                BoolObj(strval1 = strval2)
            | (Void, Void) -> BoolObj(true) (* EQ and LE are the same for object comparison *)
            | (Void, _) -> BoolObj(false)
            | (_, Void) -> BoolObj(false)
            | (obj1, obj2) ->
                BoolObj(obj1 == obj2))
            in
            (retbool, st3)
        (* Internal - string, IO, and basic object methods *)
        | Internal(intname) ->
            let retval = (match intname with
                (* abort() - prints "abort" and halts program *)
                | "Object.abort" ->
                    Printf.printf "abort\n";
                    exit 0
                (* copy() - make shallow copy of self
                    if primitive, just return self, otherwise place attrs in new store locations *)
                | "Object.copy" ->      (* NOTE store changes here! but out of convenience we do not return it *)
                    (match self with
                    | RegObj(dtype, attrs) ->
                        let namelst = List.map (fun (name, _) -> name) attrs in
                        let loclst = store_newloc store (List.length attrs) in
                        let vallst = List.map (fun (_, loc) -> Hashtbl.find store loc) attrs in
                        List.iter (fun (loc, obj) -> Hashtbl.add store loc obj) (List.combine loclst vallst);
                        let copyattrs = List.combine namelst loclst in
                        RegObj(dtype, copyattrs)
                    | _ -> self)
                (* type_name() - returns object's dynamic type as String *)
                | "Object.type_name" ->
                    let (dtype, _) = get_typename_attrs self in
                    StringObj(dtype)
                (* concat() - returns self concatenated with a param *)
                | "String.concat" ->
                    let str1 = (match self with
                    | StringObj(strval) -> strval
                    | _ -> failwith "internal argument type check fail (String.concat)")
                    in
                    let str2 = (match Hashtbl.find store (Hashtbl.find env "s") with
                    | StringObj(strval) -> strval
                    | _ -> failwith "internal argument type check fail (String.concat)")
                    in
                    StringObj(String.concat "" [str1; str2])
                (* length() - returns self string length as Int *)
                | "String.length" ->
                    let str = (match self with
                    | StringObj(strval) -> strval
                    | _ -> failwith "internal argument type check fail (String.length)")
                    in
                    IntObj(Int32.of_int (String.length str))
                (* substr() - returns a substring of self string given start index and length *)
                | "String.substr" ->
                    let str = (match self with
                    | StringObj(strval) -> strval
                    | _ -> failwith "internal argument type check fail (String.substr)")
                    in
                    let startind = (match Hashtbl.find store (Hashtbl.find env "i") with
                    | IntObj(intval) -> Int32.to_int intval
                    | _ -> failwith "internal argument type check fail (String.substr)")
                    in
                    let sublen = (match Hashtbl.find store (Hashtbl.find env "l") with
                    | IntObj(intval) -> Int32.to_int intval
                    | _ -> failwith "internal argument type check fail (String.substr)")
                    in
                    (match startind < 0 || sublen < 0 || startind + sublen > String.length str with
                    | true ->
                        Printf.printf "ERROR: 0: Exception: substring out of bounds\n";
                        exit 1
                    | false -> ());
                    StringObj(String.sub str startind sublen)
                (* in_string() - read and return a line from stdin, or empty string if no input or NUL appears *)
                | "IO.in_string" ->
                    (try
                        let str = input_line stdin in
                        (match String.contains str '\x00' with  (* check for NUL *)
                        | true -> StringObj("")
                        | false -> StringObj(str))
                    with
                    | End_of_file -> StringObj(""))
                (* in_int() - read line of input and parse it to an Int, return 0 if out of range or failure *)
                | "IO.in_int" ->
                    (try
                        let str = input_line stdin in
                        (* Scanf reads until the first non-number character *)
                        let intval = try Scanf.sscanf str " %d" (fun x -> x) with Scanf.Scan_failure(_) -> 0 in
                        (match intval < (-2147483648) || intval > 2147483647 with
                        | true -> IntObj(Int32.zero)
                        | false -> IntObj(Int32.of_int intval))
                    with
                    | (End_of_file | Failure(_)) -> IntObj(Int32.zero))
                (* out_string() - print a String to stdout, formatting "unescaped" newlines and tabs *)
                | "IO.out_string" ->
                    let str = (match Hashtbl.find store (Hashtbl.find env "x") with
                    | StringObj(strval) -> strval
                    | _ -> failwith "internal argument type check fail (IO.out_string)")
                    in
                    (* prepare raw cool string for output by converting '\','n' to '\n' etc. *)
                    let rec transform_outstr instr =
                        match String.length instr with
                        | (0 | 1) -> instr
                        | _ -> (match (instr.[0], instr.[1]) with
                            | ('\\', 'n') -> String.concat ""
                                ["\n"; transform_outstr (String.sub instr 2 ((String.length instr) - 2))]
                            | ('\\', 't') -> String.concat ""
                                ["\t"; transform_outstr (String.sub instr 2 ((String.length instr) - 2))]
                            | (_, _) -> String.concat "" [String.sub instr 0 1;
                                transform_outstr (String.sub instr 1 ((String.length instr) - 1))])
                    in
                    Printf.printf "%s" (transform_outstr str);
                    self
                (* out_int() - print an Int to stdout *)
                | "IO.out_int" ->
                    let intval = (match Hashtbl.find store (Hashtbl.find env "x") with
                    | IntObj(ival) -> ival
                    | _ -> failwith "internal argument type check fail (IO.out_int)")
                    in
                    Printf.printf "%d" (Int32.to_int intval);
                    self
                | _ -> failwith "unhandled internal expression")
            in
            (retval, store)
    in
    let store = Hashtbl.create 255 in
    let env = Hashtbl.create 255 in
    (* execute new Main *)
    let newmainexp = (0, "Main", New(0, "Main")) in
    activation_count := 0;
    let (newmain, newstore) = exp_eval Void store env newmainexp in
    (* execute main() on the new Main object *)
    let mainmethexp = (0, "Object", SelfDispatch((0, "main"), [])) in
    activation_count := 0;
    exp_eval newmain newstore env mainmethexp
end;;
