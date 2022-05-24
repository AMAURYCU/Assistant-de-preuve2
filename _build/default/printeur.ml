open Proof_ast
open Preuve

let rec print_term = function 
  | Int_cst(n) -> (string_of_int n)
  | Float_cst(n) -> (string_of_float n)
  | Symb(s) -> s
  | Apply(s,l) -> s^"("^ (print_term_list l)^")"
  | Var(x) -> x 
and 
  print_term_list = function 
  |[] -> ""
  |a::q -> (print_term a) ^ (print_term_list q)

let print_atom = function 
  |Bottom -> "\u{22A5}"
  |Top -> "\u{22A4}"
  |Eq(t1,t2) -> (print_term t1)^ " = " ^(print_term t2)
  |Rel(s,l) -> s^ "("^ (print_term_list l)^")"
let rec printeur form par = 
if par  then match form with 
  | Atom(a) -> print_atom a;
  | Or(e1,e2) -> ""^(printeur e1 false)^"  \u{2228}   "^(printeur e2 false)
  | And(e1,e2) -> (printeur e1 false)^"\u{2227}"^(printeur e2 false)
  | Imp(e1,e2) -> (printeur e1 false)^"  "^  "\u{21D2}"^ "  "  ^(printeur e2 false)
  | Not(e1) -> "\u{00AC}"^(printeur e1 false)
  |All(x,e) -> "\u{2200}"^ x.identp ^" , "^(printeur e false)
  |Exist(x,e) -> "\u{2203}"^x.identp^" , " ^(printeur e false)
  |Void -> ""
  | ApplyDef(s,t) -> s^"("^print_term_list t ^ ")"

else  match form with 
  | Atom(a) -> print_atom a;
  | Or(e1,e2) -> "("^(printeur e1 true) ^ "\u{2228}"   ^(printeur e2 true)^")"
  | And(e1,e2) -> "("^(printeur e1 true)^"\u{2227}"^(printeur e2 true)^")"
  | Imp(e1,e2) -> "("^(printeur e1 true)^"  "^  "\u{21D2}"^ "  " ^(printeur e2 true)^")"
  | Not(e1) -> "("^"\u{00AC}"^(printeur e1 true)^")"
  |All(x,e) -> "\u{2200}"^ x.identp ^" , "^(printeur e true)
  |Exist(x,e) -> "\u{2203}"^x.identp^" , " ^(printeur e true)
  |Void -> ""
  | ApplyDef(s,t) -> s^"("^print_term_list t ^ ")"


let rec profondeur formule prof stock = 
  match formule with
    |Atom(_) -> ("ATOM",prof)::stock
    |Or(e1,e2) -> (profondeur e1 (prof+1) (("OR",prof)::stock))@(profondeur e2 (prof+1) [])
    |And(e1,e2) -> (profondeur e1 (prof+1) (("AND",prof)::stock))@(profondeur e2 (prof+1) [])
    |Imp(e1,e2) -> (profondeur e1 (prof+1) (("IMP",prof)::stock))@(profondeur e2 (prof+1) []) 
    |Not(e1) -> profondeur e1 (prof+1) (("NOT",prof)::stock)
    |All(_,e) -> profondeur e (prof+1) (("ALL",prof)::stock)
    |Exist(_,e) -> profondeur e (prof+1) (("EXIST",prof)::stock)
    |Void -> stock

    ;;

(**code inspiré par http://www.dailly.info/ressources/tri/ocaml_liste/fusion.html  *)
let rec division liste=
    match liste with
    |[]->[],[]
    |_::[]->liste,[]
    |a::b::c->
        let (l1,l2)=division c in
        a::l1,b::l2;;
(* val division : 'a list -> 'a list * 'a list = <fun> *)

let rec fusion liste1 liste2=
    match liste1,liste2 with
    |[],_->liste2;
    |_,[]->liste1;
    |t1::q1,t2::q2->
      let _,b = t1 in let _,d = t2 in 
        if b<d then
            t1::(fusion q1 liste2)
        else
            t2::(fusion liste1 q2);;
(* val fusion : 'a list -> 'a list -> 'a list = <fun> *)

let rec tri_fusion liste=
    match liste with
    |[]->[];
    |_::[]->liste;
    |_ ->
        begin
            let (liste1,liste2)=division liste in
            fusion (tri_fusion(liste1)) (tri_fusion(liste2));
        end;;

let is_vide = function 
  | _::_ -> false
  |[] -> true;;

let rec printeur_plus = function
  |a::q -> let lex,prof = a in if not (is_vide q) then 
    let _,profq = (List.hd q) in if prof == profq then lex^(string_of_int prof)^"     "^(printeur_plus q) 
      else lex^(string_of_int prof)^"\n"^(printeur_plus q) else lex^(string_of_int prof)
  |_ -> failwith("liste vide")
let  print_sort = function 
  |Int ->  "int"
  |Real ->  "real"
  |User(s) -> s
  ;;
let rec print_list = function
  | a::q -> (print_sort a) ^ (print_list q)
  |[] -> ""
let print_symbole s = 
  match s with 
  | Sort -> "sort"
  | Fonction(a,_)  -> "fonction" ^"   "^ (string_of_int (List.length a))
  | Predicate(a) -> "relation" ^"   " ^(string_of_int (List.length a))
  | DefTerm(_)  -> "defterm"
  | DefForm(_)  ->"defform"
  | Hyp(_) ->"Hyp"
  | Goal(_) -> "goal"
let  print_table prog = 
 Hashtbl.iter (fun  key value -> (print_string (key^"   "^(print_symbole value)^"\n")) ) Proof_ast.table;;


let  print_sequent sequent =
print_string ("-----------HYPOTHESES & AXIOMES-----------"^"\n");
 List.iter(fun (a,b)-> (print_string (a^" "^(printeur b true)^"\n"))) sequent.hypot;
 List.iter(fun (a,b)-> (print_string (a^" "^(print_sort b)^"\n"))) sequent.var;
print_string ("-----------OBJECTIF-----------"^"\n");
 let  (a,b) = sequent.theoreme  in   (print_string (a^" "^(printeur b true)^"\n"))

let print_sequent_list sl = 
  List.iter print_sequent sl;

;;