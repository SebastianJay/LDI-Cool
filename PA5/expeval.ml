open List
open Hashtbl
open String
open Int32
open Printf
open Annast

(* coolObject RegObj = dynamic type string, list of (name string, location int) fields *)
(* other variants are special cases *)
type coolObject =
    | RegObj of string * (string * int) list
    | IntObj of Int32.t
    | BoolObj of bool
    | StringObj of string
    | Void
;;

(* opsemEnv = list of (identifier string, location int) bindings *)
type opsemEnv = (string, int) Hashtbl.t;;
(* opsemStore = list of (location int, obj coolObject) mappings *)
type opsemStore = (int, coolObject) Hashtbl.t;;

let prog_eval (cmap:cmap) (imap:imap) (pmap:pmap) (ast:ast) =
    let store_newloc tbl num =
        let rec create_loclst numleft ind =
            match numleft with
            | 0 -> []
            | _ -> ind :: create_loclst (numleft-1) (ind+1)
        in
        let len = Hashtbl.length tbl in
        create_loclst num len
    in
    let default_obj dtype =
        match dtype with
        | "Int" -> IntObj(Int32.zero)
        | "Bool" -> BoolObj(false)
        | "String" -> StringObj("")
        | _ -> Void
    in
    let get_typename_attrs obj =
        match obj with
        | RegObj(name, attrs) -> (name, attrs)
        | IntObj(_) -> ("Int", [])
        | BoolObj(_) -> ("Bool", [])
        | StringObj(_) -> ("String", [])
        | Void -> failwith "unexpected Void type in get_typename_attrs"
    in
    let rec args_eval self store env margs =
        match margs with
        | [] -> ([], store)
        | hd :: tl ->
            let (arghd, sti) = exp_eval self store env hd in
            let (argtl, ste) = args_eval self sti env tl in
            (arghd :: argtl, ste)
    and exp_eval (self : coolObject) (store : opsemStore) (env : opsemEnv) (expNode : astExpNode) =
        let (lineno, stype, exp) = expNode in
        match exp with
        | Assign(assignee, assignor) ->
            let (_, id) = assignee in
            let (value, st2) = exp_eval self store env assignor in
            let loc = Hashtbl.find env id in
            Hashtbl.replace st2 loc value;
            (value, st2)
        | Identifier(aId) ->
            let (_, id) = aId in
            let objval = (match id with
            | "self" -> self
            | _ -> Hashtbl.find store (Hashtbl.find env id))
            in
            (objval, store)
        | True ->
            (BoolObj(true), store)
        | False ->
            (BoolObj(false), store)
        | Integer(intval) ->
            (IntObj(Int32.of_int intval), store)
        | String(strval) ->
            (StringObj(strval), store)
        | New(aId) ->
            let (_, id) = aId in
            let dtype = (match id with
            | "SELF_TYPE" -> let (sotype, _) = get_typename_attrs self in sotype
            | _ -> id)
            in
            (match dtype with
            | "Int" -> (IntObj(Int32.zero), store)
            | "Bool" -> (BoolObj(false), store)
            | "String" -> (StringObj(""), store)
            | _ ->
                let extract_field_loc (attr, loc) =
                    let (attrname, _, _) = attr in
                    (attrname, loc)
                in
                let default_field (attr, loc) =
                    let (_, atype, _) = attr in
                    (loc, default_obj atype)
                in
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
                let clsfields = List.map extract_field_loc (List.combine attrlst loclst) in
                let newself = RegObj(dtype, clsfields) in
                let storeentries = List.map default_field (List.combine attrlst loclst) in
                List.iter (fun (loc, obj) -> Hashtbl.add store loc obj) storeentries;
                let selfenv = Hashtbl.create 255 in
                List.iter (fun (name, loc) -> Hashtbl.add selfenv name loc) clsfields;
                let initblock = (0, "Object", Block(build_init_exp attrlst)) in
                let (_, st3) = exp_eval newself store selfenv initblock in
                (newself, st3))
        | SelfDispatch(methid, margs) ->
            let (argvals, argstore) = args_eval self store env margs in
            let (dtype, attrs) = get_typename_attrs self in
            let impllst = List.assoc dtype imap in
            let (_, mname) = methid in
            let (formallst, _, mbody) = List.assoc mname impllst in
            let loclst = store_newloc argstore (List.length formallst) in
            let storeentries = List.combine loclst argvals in
            List.iter (fun (loc, obj) -> Hashtbl.add argstore loc obj) storeentries;
            let newenv = Hashtbl.create 255 in
            List.iter (fun (name, loc) -> Hashtbl.add newenv name loc) attrs;
            let formallocs = List.combine formallst loclst in
            List.iter (fun (name, loc) -> Hashtbl.add newenv name loc) formallocs;
            exp_eval self argstore newenv mbody
        | DynamicDispatch(receiver, methid, margs) ->
            let (argvals, argstore) = args_eval self store env margs in
            let (recval, recstore) = exp_eval self argstore env receiver in
            (match recval with
            | Void -> failwith "dispatch on void" (* TODO exit with proper formatting *)
            | _ -> ());
            let (dtype, attrs) = get_typename_attrs recval in
            let impllst = List.assoc dtype imap in
            let (_, mname) = methid in
            let (formallst, _, mbody) = List.assoc mname impllst in
            let loclst = store_newloc recstore (List.length formallst) in
            let storeentries = List.combine loclst argvals in
            List.iter (fun (loc, obj) -> Hashtbl.add recstore loc obj) storeentries;
            let newenv = Hashtbl.create 255 in
            List.iter (fun (name, loc) -> Hashtbl.add newenv name loc) attrs;
            let formallocs = List.combine formallst loclst in
            List.iter (fun (name, loc) -> Hashtbl.add newenv name loc) formallocs;
            exp_eval recval recstore newenv mbody
        | StaticDispatch(receiver, clsid, methid, margs) ->
            let (argvals, argstore) = args_eval self store env margs in
            let (recval, recstore) = exp_eval self argstore env receiver in
            (match recval with
            | Void -> failwith "dispatch on void" (* TODO exit with proper formatting *)
            | _ -> ());
            let (dtype, attrs) = get_typename_attrs recval in
            let (_, cname) = clsid in
            let impllst = List.assoc cname imap in
            let (_, mname) = methid in
            let (formallst, _, mbody) = List.assoc mname impllst in
            let loclst = store_newloc recstore (List.length formallst) in
            let storeentries = List.combine loclst argvals in
            List.iter (fun (loc, obj) -> Hashtbl.add recstore loc obj) storeentries;
            let newenv = Hashtbl.create 255 in
            List.iter (fun (name, loc) -> Hashtbl.add newenv name loc) attrs;
            let formallocs = List.combine formallst loclst in
            List.iter (fun (name, loc) -> Hashtbl.add newenv name loc) formallocs;
            exp_eval recval recstore newenv mbody
        | If(predexp, thenexp, elseexp) ->
            let (predicate, predstore) = exp_eval self store env predexp in
            (match predicate with
            | BoolObj(boolval) ->
                (match boolval with
                | true -> exp_eval self predstore env thenexp
                | false -> exp_eval self predstore env elseexp)
            | _ -> failwith "non Bool predicate in if statement")
        | Block(explst) ->
            (match explst with
            | [] -> (Void, store)   (* should only occur in attribute initializers *)
            | hd :: [] -> exp_eval self store env hd
            | hd :: tl -> let (_, sti) = exp_eval self store env hd in
                exp_eval self sti env (lineno, stype, Block(tl)))
        | LetBinding(bindlst, letexp) ->
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
        | Case(caseexp, branchlst) ->
            let closest_ancestor dtype branchtypes =
                let rec parent_chain dtype =
                    match dtype with
                    | "Object" -> ["Object"]
                    | x -> x :: parent_chain (List.assoc x pmap)
                in
                let rec walk_chain pchain =
                    match pchain with
                    | [] -> failwith "case no matching branch" (* TODO proper formatting *)
                    | hd :: tl ->
                        match List.mem hd branchtypes with
                        | true -> hd
                        | false -> walk_chain tl
                in
                walk_chain (parent_chain dtype)
            in
            let (caseobj, casestore) = exp_eval self store env caseexp in
            (match caseobj with
            | Void -> failwith "case on void" (* TODO proper formatting *)
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
        | IsVoid(voidexp) ->
            let (voidobj, voidstore) = exp_eval self store env voidexp in
            let retbool = (match voidobj with
            | Void -> BoolObj(true)
            | _ -> BoolObj(false))
            in
            (retbool, voidstore)
        | Not(notexp) ->
            let (notobj, notstore) = exp_eval self store env notexp in
            let retbool = (match notobj with
            | BoolObj(boolval) -> BoolObj(not boolval)
            | _ -> failwith "non Bool exp in not")
            in
            (retbool, notstore)
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
                | 0 -> failwith "division by zero" (* TODO proper formatting *)
                | _ -> IntObj(Int32.div intval1 intval2))
            | _ -> failwith "non Int exp in divide")
            in
            (retint, st3)
        | LT(exp1, exp2) ->
            let (op1, st2) = exp_eval self store env exp1 in
            let (op2, st3) = exp_eval self st2 env exp2 in
            let retbool = (match (op1, op2) with
            | (IntObj(intval1), IntObj(intval2)) ->
                BoolObj((Int32.compare intval1 intval2) < 0)
            | (BoolObj(boolval1), BoolObj(boolval2)) ->
                (match (boolval1, boolval2) with
                | (true, true) -> BoolObj(false)
                | (true, false) -> BoolObj(false)
                | (false, true) -> BoolObj(true)
                | (false, false) -> BoolObj(false))
            | (StringObj(strval1), StringObj(strval2)) ->
                BoolObj(strval1 < strval2)
            | _ -> BoolObj(false))
            in
            (retbool, st3)
        | LE(exp1, exp2) ->
            let (op1, st2) = exp_eval self store env exp1 in
            let (op2, st3) = exp_eval self st2 env exp2 in
            let retbool = (match (op1, op2) with
            | (IntObj(intval1), IntObj(intval2)) ->
                BoolObj((Int32.compare intval1 intval2) <= 0)
            | (BoolObj(boolval1), BoolObj(boolval2)) ->
                (match (boolval1, boolval2) with
                | (true, true) -> BoolObj(true)
                | (true, false) -> BoolObj(false)
                | (false, true) -> BoolObj(true)
                | (false, false) -> BoolObj(true))
            | (StringObj(strval1), StringObj(strval2)) ->
                BoolObj(strval1 <= strval2)
            | (Void, Void) -> BoolObj(true)
            | (Void, _) -> BoolObj(false)
            | (_, Void) -> BoolObj(false)
            | (obj1, obj2) ->   (* TODO figure out pointer comparison *)
                let find_loc obj =
                    match obj with
                    | RegObj(_, _) ->
                        let storelst = Hashtbl.fold (fun loc sobj acc -> (loc, sobj) :: acc) store [] in
                        (match List.filter (fun (loc, sobj) -> sobj == obj) storelst with
                        | [] -> (-1)
                        | (loc, _) :: tl -> loc)
                    | _ -> (-1)
                in
                let loc1 = find_loc obj1 in
                let loc2 = find_loc obj2 in
                BoolObj(loc1 <> (-1) && loc2 <> (-1) && loc1 = loc2))
            in
            (retbool, st3)
        | EQ(exp1, exp2) ->
            let (op1, st2) = exp_eval self store env exp1 in
            let (op2, st3) = exp_eval self st2 env exp2 in
            let retbool = (match (op1, op2) with
            | (IntObj(intval1), IntObj(intval2)) ->
                BoolObj((Int32.compare intval1 intval2) = 0)
            | (BoolObj(boolval1), BoolObj(boolval2)) ->
                (match (boolval1, boolval2) with
                | (true, true) -> BoolObj(true)
                | (true, false) -> BoolObj(false)
                | (false, true) -> BoolObj(false)
                | (false, false) -> BoolObj(true))
            | (StringObj(strval1), StringObj(strval2)) ->
                BoolObj(strval1 = strval2)
            | (Void, Void) -> BoolObj(true)
            | (Void, _) -> BoolObj(false)
            | (_, Void) -> BoolObj(false)
            | (obj1, obj2) ->   (* TODO figure out pointer comparison *)
                let find_loc obj =
                    match obj with
                    | RegObj(_, _) ->
                        let storelst = Hashtbl.fold (fun loc sobj acc -> (loc, sobj) :: acc) store [] in
                        (match List.filter (fun (loc, sobj) -> sobj == obj) storelst with
                        | [] -> (-1)
                        | (loc, _) :: tl -> loc)
                    | _ -> (-1)
                in
                let loc1 = find_loc obj1 in
                let loc2 = find_loc obj2 in
                BoolObj(loc1 <> (-1) && loc2 <> (-1) && loc1 = loc2))
            in
            (retbool, st3)
        | Internal(intname) ->
            let retval = (match intname with
                | "IO.out_string" ->
                    let str = (match Hashtbl.find store (Hashtbl.find env "x") with
                    | StringObj(strval) -> strval
                    | _ -> failwith "internal argument type check fail (IO.out_string)")
                    in
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
    let newmainexp = (0, "Main", New(0, "Main")) in
    let (newmain, newstore) = exp_eval Void store env newmainexp in
    let mainmethexp = (0, "Object", SelfDispatch((0, "main"), [])) in
    exp_eval newmain newstore env mainmethexp
;;
