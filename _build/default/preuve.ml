open Proof_ast
exception PreuveInvalide of string
type sequent = 
  { var : (string * sort ) list;
    hypot: (string* form) list;
    theoreme: (string*form) ;(*une seule formule et creer un type but avec un ensemble de sequent *)
    
  }
type tact = 
  |Liste of  sequent list 




let init_sequent prog = 
  let rec aux l acc = 
  match l with 
  |[] -> acc
  |a::q -> aux q ((a.identh,Proof_ast.analyse_form [] a.formh)::acc)
  in 
   let list = List.rev( aux prog.hyps [] )in 

   {var = [];hypot = list; theoreme = (prog.goal.nameg, (Proof_ast.analyse_form [] prog.goal.formg)) }  

let rec compare l1 l2 env1  = match l1,l2 with 
            |[],[] -> true
            |a::q,b::t -> (eqTerm a b env1 ) && (compare q t env1 ) 
            |_,_ -> false
and 
eqTerm t1 t2 env1  = 
(*tactique prends un sequent et renvoie une liste de séquent hyp hypot -> theoreme -> []*)
(* apply tactique let ls = tactique s renvoie ls@ tl.preuve *)
match t1,t2 with   
  | Int_cst(n1),Int_cst(n2) -> n1 = n2
  | Float_cst (x1), Float_cst(x2) -> x1 =x2
  | Apply(s1,l1),Apply(s2,l2) ->  (s1 = s2) && (compare l1 l2 env1 )
  | Symb(s1),Symb(s2) ->  s1 = s2   
  | Var(x),Var(y) ->  (x=y) || (List.assoc_opt x  env1  = Some(y))
  |_,_ -> false 

let eqAtome a1 a2 env1 = 
match a1,a2 with 
  |Bottom,Bottom -> true
  |Top,Top -> true
  |Eq(t1,t2),Eq(t3,t4) -> ((eqTerm t1 t3 env1 ) && (eqTerm t2 t4 env1 ))
  |Rel(s1,tl),Rel(s2,tl2) -> (s1 = s2) && (compare tl tl2 env1 )
  |_,_ -> false 
let rec eqForm f1 f2  env1 = 
match f1,f2 with 
  | Atom(a1),Atom(a2) -> (eqAtome a1 a2 env1)
  | Or(f1,f2),Or(f3,f4) -> (((eqForm f1 f3 env1 )) && (eqForm f2 f4 env1 )) 
  | And(f1,f2),And(f3,f4) ->(((eqForm f1 f3 env1 )) && (eqForm f2 f4 env1 )) 
  | Imp(f1,f2),Imp(f3,f4) ->(((eqForm f1 f3  env1 )) && (eqForm f2 f4  env1 )) 
  | Not(f1),Not(f2) -> (eqForm f1 f2 env1 )
  | All(x,f1),All(y,f2)-> (eqForm f1 f2 ((x.identp,y.identp)::env1) )
  | Exist(x,f1),Exist(y,f2)-> (eqForm f1 f2 ((x.identp,y.identp)::env1))
  |_,_ -> false
let rec negaform form= 
match form with 
  |Atom(a) -> begin match a with 
            |Bottom ->Atom( Top)
            |Top ->Atom( Bottom)
            |Eq(a,b)  -> Not(Atom(Eq(a,b)))
            |Rel(a,b) -> Not(Atom(Rel(a,b))) 
            
            end 
  |Or(f1,f2) -> And(negaform f1,negaform f2)
  |And(f1,f2) -> Or(negaform f1,negaform f2)
  |Imp(f1,f2) ->  And(f1,negaform f2)
  |Not(f1) -> f1
  |All(x,f) -> Exist(x,negaform f)
  |Exist(x,f) -> All(x,negaform f)
  |ApplyDef(a,b) -> Not(ApplyDef(a,b))
  |Void->Void

let  exactHyp seq = 
  let _,b =   seq.theoreme in 
  let l = List.map (fun (_,y) -> y) seq.hypot in 
  
  if List.exists(fun x -> eqForm x b []) l 
    then 
      let seq2 = [{var = [];hypot = ( seq.theoreme::seq.hypot); theoreme =("", Void)}] in 
        print_string "SUCCESS"; seq2
    else
      raise (PreuveInvalide("Hyp non applicable"))

let newName seq s = (*revoir*)
  if s = "hyp" then ("H"^(string_of_int (List.length seq.hypot)) )else ("G"^(string_of_int(2)))

let ax seq = 
let _,fo =seq.theoreme in 
match fo with 
|Atom(a) -> begin match a with 
  
  |Top -> let seq2 = [{var = [];hypot = ( seq.theoreme::seq.hypot); theoreme = ("",Void)}] in 
        print_string "SUCCESS"; seq2
  |Eq(t1,t2) -> if eqTerm t1 t2 [] then let seq2 = [{var = [];hypot = (seq.hypot); theoreme = ("",Void)}] in 
        print_string "SUCCESS"; seq2 else raise  (PreuveInvalide("axiome non applicable"))
  |_ -> raise  (PreuveInvalide("axiome non applicable"))
  end  
|_ -> raise  (PreuveInvalide("axiome non applicable"))

let et seq =
  let _,fo = seq.theoreme in 
  match fo with 
    |And(f1,f2) -> let sl =  [{var = seq.var; hypot = seq.hypot;theoreme = ("G1",f1);};{var = seq.var; hypot = seq.hypot;theoreme = ("G1",f2)}] in print_string("success"); sl
    |_->raise  (PreuveInvalide("et non applicable"))


let ougauche seq = (*rajouter le droit*)
  let _,fo = seq.theoreme in 
  match fo with 
    | Or(f1,_) -> let sl = [{var = seq.var; hypot = seq.hypot; theoreme = ("G1",f1);}]in print_string("success"); sl
    |_->raise  (PreuveInvalide("et non applicable"))


let absurde seq = 
let _,fo = seq.theoreme in 
  [{var = seq.var; hypot =("HA", (negaform fo))::seq.hypot;theoreme = ("GA",Atom(Bottom)) }]


let implication seq = 
  let _,fo = seq.theoreme in 
    match  fo with
    |Imp(f1,f2) -> [{var = seq.var;hypot = ("HI",f1)::seq.hypot;theoreme = ("GI",f2)}]
    |_ -> raise (PreuveInvalide("implication non applicable"))


let introfa seq sign newname = 
  let _,fo = seq.theoreme in 
    match fo with (*factoriser*)
      |All(x,f) -> if (List.exists (fun y -> y.identfs =  newname) sign.functions ) then failwith("nom deja utiliser") else (*ratraper l'erreur *)
                   if (List.exists (fun y -> y.identcs = x.identp ) sign.const ) then failwith ("capture") else
                   if (List.exists (fun y -> y.idente = x.identp) sign.relat) then failwith("capture") else 
                   if(List.exists(fun y -> y.idents = x.identp) sign.sort ) then failwith("capture") else
                   if(List.exists(fun (s,_) -> s=newname) seq.var) then failwith("nom deja utiliser") else 
                   [{var = (newname,x.sortp)::seq.var;hypot = seq.hypot; theoreme = ("GI", Proof_ast.subst_form x (Var(newname)) f)}]
      |_-> raise (PreuveInvalide("intro impossible"))


let exist seq term = 
  let _,fo = seq.theoreme in 
    match fo with 
   |Exist(y,f)  -> let env = List.map(fun (x,s) -> x, (s,x))seq.var in let t,s = Proof_ast.analyse_term env term in 
      if(y.sortp != s) then raise (Type_error("terme pas de la bonne sorte"));
    [{var = seq.var ; hypot = seq.hypot; theoreme = ("name",(subst_form y t f))}]
    |_-> raise (PreuveInvalide("use impossible"))



let modus_ponens seq form = 
  let _,fo = seq.theoreme in  
    [{var = seq.var; hypot = seq.hypot; theoreme = ("h1",Imp(form,fo))}; {var = seq.var; hypot = seq.hypot; theoreme = ("h1",form )}]


let lem seq form = 
  let _,_ = seq.theoreme in 
    [{var = seq.var; hypot = ("l1",form)::seq.hypot; theoreme = seq.theoreme;};{var = seq.var; hypot = seq.hypot; theoreme = ("l1",form) }]
let contrapose seq = 
  let n,fo = seq.theoreme in 
  match fo with 
  |Imp(a,b) -> 
    [{var = seq.var; hypot = seq.hypot; theoreme = (n,Imp(Not(b),Not(a)))}]
  |_ -> raise(PreuveInvalide ("contrapositoin impossible" ))
let pushnegoal seq = 
  let n,fo  = seq.theoreme in 
  match fo with 
  | Not(f) ->
  [{var = seq.var; hypot = seq.hypot; theoreme = (n,negaform f )}]
  |_-> raise (PreuveInvalide("pushneg non applicable"))
let excludedThirdPart seq form =  
  let n,fo = seq.theoreme in 
  [{var = seq.var; hypot = ("etp",form)::seq.hypot; theoreme = seq.theoreme};{var = seq.var; hypot = ("etp",Not(form))::seq.hypot; theoreme = seq.theoreme}]

let iwantfirst l choice  = (**choice en machine *)
 let block = List.nth l choice in 
  block::(List.filter(fun x -> not(x = block)) l) 

let contradiction seq form= 
  let n,fo = seq.theoreme in 
  match fo with 
  |Atom(Bottom) ->  let _,b = List.split seq.hypot in if (List.exists (fun x-> eqForm x form []) b) && (List.exists (fun x -> eqForm x (Not(form)) [])b) then [{var = seq.var; hypot = seq.hypot; theoreme =("",Void) }] else
  raise (PreuveInvalide("pas de contradiction"))

let splith seq number = (**number en machine*)
  let _,b = (List.split seq.hypot) in 
     let block = (List.nth b number )in 
        match block with 
        | And(f1,f2) -> [{var = seq.var; hypot =("h", f1)::("hh",f2)::seq.hypot; theoreme = seq.theoreme}]
        |_-> raise (PreuveInvalide("l'hypothese choisie n'est pas une conjonction"))
let usefah seq number term =(**number en machine*)
  let _,b = (List.split seq.hypot) in 
    let block = (List.nth b number )in
    match block with 
     |All(y,f)  -> let env = List.map(fun (x,s) -> x, (s,x))seq.var in let t,s = Proof_ast.analyse_term env term in 
       if(y.sortp != s) then raise (Type_error("terme pas de la bonne sorte")) else 
      [{var = seq.var ; hypot = ("name",(subst_form y t f))::seq.hypot; theoreme = seq.theoreme}]
     |_-> raise (PreuveInvalide("use impossible"))

let getvarfromhyp seq number sign newname =  
  let _,b = (List.split seq.hypot) in 
    let block = (List.nth b number )in
    match block with
    |Exist(x,f) -> if (List.exists (fun y -> y.identfs =  newname) sign.functions ) then failwith("nom deja utiliser") else (*ratraper l'erreur *)
                   if (List.exists (fun y -> y.identcs = x.identp ) sign.const ) then failwith ("capture") else
                   if (List.exists (fun y -> y.idente = x.identp) sign.relat) then failwith("capture") else 
                   if(List.exists(fun y -> y.idents = x.identp) sign.sort ) then failwith("capture") else
                   if(List.exists(fun (s,_) -> s=newname) seq.var) then failwith("nom deja utiliser") else 
                   [{var = (newname,x.sortp)::seq.var;hypot = ("GI", Proof_ast.subst_form x (Var(newname)) f)::seq.hypot; theoreme = seq.theoreme}]
    |_-> raise (PreuveInvalide("intro impossible"))
(*let eqleft seq atom = 
let n,fo = seq.theoreme in 
match atom with 
  |Eq(t1,t2) -> )*)
let autoIntro seq = 
  let _,b  = seq.theoreme in 
  match b with 
  | And(f1,f2) -> (et seq)
  | Not(f) -> (absurde seq)
  | Imp(f1,f2) -> (implication seq)
  | Or(f1,f2) -> (ougauche seq)

let autoDerive seq i  = 
  let _,f = List.nth seq.hypot i in 
  match f with 
  |And(f1,f2) -> (splith  seq i)
  |Or(f1,f2) ->  [{var = seq.var; hypot = ("h",f1)::seq.hypot; theoreme = seq.theoreme};{var = seq.var; hypot = ("h",Not(f2))::seq.hypot; theoreme = seq.theoreme}]
  |Imp(f1,f2) -> [{var = seq.var; hypot = ("h",f2)::seq.hypot; theoreme = seq.theoreme};{var = seq.var ; hypot = seq.hypot; theoreme = ("g",f1)}]
  |Not(f) -> [{var = seq.var; hypot = seq.hypot; theoreme = ("G",f)}]

let termVsTerm term todetect toput env = 
  match term with 
  |Apply(n,tl) -> Apply(n, List.map(fun x -> if( eqTerm x todetect env) then toput else x) tl)
  |Var(x) -> if (eqTerm term todetect env) then toput else term 
  |_-> if(eqTerm term todetect env) then toput else term
let rec replaceTerm form todetect toput env = 
  match form with
  |Atom(Eq(t1,t2)) -> Atom(Eq(termVsTerm t1 todetect toput env,termVsTerm t2 todetect toput env))
  |Atom(Rel(n,tl)) -> Atom(Rel(n,List.map(fun t1 ->termVsTerm t1 todetect toput env ) tl))
  | Or(f1,f2) -> Or(replaceTerm f1 todetect toput env ,replaceTerm f2 todetect toput env)
  | And(f1,f2) ->And(replaceTerm f1 todetect toput env ,replaceTerm f2 todetect toput env)
  | Imp(f1,f2) -> Imp((replaceTerm f1 todetect toput env ,replaceTerm f2 todetect toput env))
  | Not(f) -> Not(((replaceTerm f todetect toput env )))
  | All(x,f) -> All(x,replaceTerm f todetect toput env)
  | Exist(x,f) -> Exist(x,replaceTerm f todetect toput env)
  | ApplyDef(n,tl) -> ApplyDef((n,List.map(fun x -> termVsTerm x todetect toput env) tl))
  |_-> form

let rec egalite seq number = 
  let _,f = List.nth seq.hypot number in 
  match f with 
  |Atom(a) -> begin match a with 
          |Eq(t1,t2) -> let _,fg = seq.theoreme in 
            [{var = seq.var; hypot = seq.hypot ; theoreme = ("g",replaceTerm fg t1 t2 [])}]
          |_-> failwith("typer ") end
  |_-> failwith("typer ")

let rec unpackform compact def = 
  match compact with 
  | Atom(a) ->  raise (PreuveInvalide("tactique non applicable"))
         | Or(f1,f2) -> Or(unpackform f1 def,unpackform f2 def)
         | And(f1,f2) -> And(unpackform f1 def, unpackform f2 def)
         | Imp(f1,f2) ->Imp( unpackform f1 def,unpackform f2 def)
         | Not(f1) -> Not(unpackform f1 def)
         | All(p,f) -> All(p, unpackform f def)
         | Exist(p,f) ->Exist(p,unpackform f def)
         | ApplyDef(s,tl) -> let de =  (Hashtbl.find Proof_ast.table s) in begin match de with |DefForm(a,b) ->(subst_form {identp = ("_"^(List.hd a).identp); sortp =(List.hd a).sortp;}  (List.hd tl)  b) end
         |_->raise (PreuveInvalide("tactique non applicable"))

let rec unpack seq prog = 
let _,f = seq.theoreme in  
   [{var = seq.var; hypot = seq.hypot ; theoreme = ("G", unpackform f Void ) }]
                   


