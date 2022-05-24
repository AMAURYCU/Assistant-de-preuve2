type sort = (* l'idée est de faire une sorte comme une liste in et une liste out *)
  |Real
  |Int
  |User of string
type fun_sigma = {
  identfs: string;
  sort_fun: sort;  
  sort_params: sort list;
}
(* séparer definitions de termes des definitions de formules (def term  et def form ) *)
type const_sigma= {
  identcs: string;
  sort : sort;
}
type sort_sigma = {
  idents: string;
}
type relat_sigma = {
  sorte_args: sort list;
  idente: string;
}
type declaration_param  = {
  identp: string;
  sortp: sort;
  
}
type term =  
  | Int_cst of int
  | Float_cst of float
  | Symb of string 
  | Apply of string * (term list)(**rajouter application d'une definiton ? -> verrifier si le symbole est dans les def*)
  | Var of string 
type atom = 
  |Bottom
  |Top
  |Eq of term*term
  |Rel of string * (term list)
type form = 
  | Atom of atom
  | Or of form*form
  | And of form * form
  | Imp of form * form
  | Not of form
  | All of (declaration_param) * form
  | Exist of (declaration_param) *form
  | ApplyDef of string*(term list)
  |Void
type tact = 
  | IntroExact 
  | IntroAx
  | IntroAnd
  | IntroOrL
  | IntroAbsurde
  | IntroImplique
  | Introfa of string 
  | IntroExist of term 
  | ModusPonens of form
  | Lemme of form
  | Contrapose 
  | PushNegGoal
  | TierExclu of form
  | EgaliteG of atom 
  | Swap of int 
  | Contradiction of form 
  | Splith of int
  | UseForallHyp of int*term
  |VarFromHyp of int*string
  | Intro 
  | Elim 
  | Derive of int
  | Replace of int
  |Unpack 



  
type declaration_sigma = {
  functions: fun_sigma list;
  const: const_sigma list;
  sort: sort_sigma list;
  relat: relat_sigma list;}
type define_form = {
  ident: string;
  params : declaration_param list;
  form: form;
} 



type hyp = {
  identh: string;
  formh : form;
  
}
type goal = {
  formg : form;
  nameg: string;
 }

type prog = {
  signature :  declaration_sigma;
  define_form : define_form list;
  hyps: hyp list;(**ajouter les theoremes pour pouvoir reutiliser les goals théoremes : hyps list; nom  string; formule et validité de preuve  *)
  goal:  goal;(*rajouter la possibilité de pouvoir avoir plusieurs buts et de redéfinir les formules *)
  (**rajouter les tactiques et rajouter un champs aux hypotheses pour dire si c'est un théoreme (un booléen idéalement ) *)
  

}
(** type def term =*)

type symbole =
  | Sort 
  |Fonction of (sort list) * sort
  | Predicate of (sort list)
  | DefTerm of declaration_param list * term * sort 
  | DefForm of declaration_param list * form 
  | Hyp of string * form
  |Goal of string*form
let table = Hashtbl.create 1000;

exception Type_error of string
let check_sort ident = 
  match ident with 
  |User(s) -> (try let glob = Hashtbl.find table s in if glob != Sort then raise(Type_error (s^" sorte non déclarée"))
               with Not_found -> raise(Type_error (s^" sorte non déclarée")))
  |_ -> ()

let rec analyse_term env term = 
  match term with 
  |Int_cst(_) -> term,Int 
  |Float_cst(_)-> term,Real
  |Symb(s)-> (try let sort,nx = List.assoc s env in Var(nx), sort with Not_found ->
            try let glob = Hashtbl.find table s in match glob with 
            |Fonction([],sort) -> term,sort
            |DefTerm([],_,sort) -> term,sort
            |_ -> raise (Type_error (s^"n'est pas un terme")) with Not_found -> raise (Type_error (s^"n'est pas déclaré")))
  |Apply(s,tlist)-> let tlistp = List.map ( analyse_term env ) tlist in 
           begin  try let glob = Hashtbl.find table s in  begin 
                    match glob with 
                      |Fonction(l,sort) -> if l = List.map snd tlistp 
                                        then Apply(s, List.map fst tlistp),sort 
                                      else raise( Type_error(s^"Application mal formée1"))
                      |DefTerm(l,_,sort) -> let lprime = List.map (fun d -> d.sortp) l 
                                  in if lprime = List.map snd tlistp                            
                                    then Apply(s, List.map fst tlistp),sort 
                                    else raise( Type_error("Application mal formée"))
                      |_ -> raise (Type_error (s^"n'est pas un terme")) end  
                  with Not_found -> raise (Type_error (s^"n'est pas déclaré")) end 
  |Var(f) -> failwith (f^"terme mal formé ")
let rec analyse_atome env atom = 
    match atom with 
      | Eq(t1,t2) -> let t1,s1 = analyse_term env t1 in let t2,s2 = analyse_term env t2 in if s1 = s2 then Eq(t1,t2) else raise(Type_error "Egalité de termes de deux sorte différente")
      | Rel(s,tlist) -> let tlistp = List.map ( analyse_term env ) tlist in 
           begin  try let glob = Hashtbl.find table s in  begin 
                    match glob with 
                      |Predicate(l) -> if l = List.map snd tlistp 
                                        then Rel(s, List.map fst tlistp) 
                                      else raise( Type_error("Application mal formée"))
                      |DefForm(l,_) -> let lprime = List.map (fun d -> d.sortp) l 
                                  in if lprime = List.map snd tlistp                            
                                    then Rel(s, List.map fst tlistp) 
                                    else raise( Type_error("Application mal formée"))
                      |_ -> raise (Type_error (s^"n'est pas un terme")) end  
                  with Not_found -> raise (Type_error (s^"n'est pas déclaré")) end 
      |_-> atom

let rec analyse_form env formule =
match formule with  
         | Atom(a) -> begin  match a with 
                            | Rel(s,tlist) -> let ss = (Hashtbl.find table s) in begin match ss with 
                                                        | DefForm(a,b) -> (analyse_form env (ApplyDef(s,tlist))) 
                                                        |_ -> Atom(analyse_atome env a)end                       
                            |_ -> Atom(analyse_atome env a) end 
         | Or(f1,f2) -> Or((analyse_form env f1) , (analyse_form env f2))
         | And(f1,f2) ->And((analyse_form env f1) , (analyse_form env f2))
         | Imp(f1,f2) ->Imp((analyse_form env f1) , (analyse_form env f2))
         | Not(f) -> Not(analyse_form env f)
         | All(p,f) -> let s = p.sortp  and nx = "_"^p.identp in (check_sort s; All({identp= nx;sortp = s} ,analyse_form ((p.identp,(s,nx))::env) f ) )
         | Exist(p,f) ->let s = p.sortp  and nx = "_"^p.identp in (check_sort s; Exist({identp= nx;sortp = s} ,analyse_form ((p.identp,(s,nx))::env) f ) )
         | Void -> Void
         | ApplyDef(s,tlist) -> let tlistp = List.map ( analyse_term env ) tlist in 
                     try let glob = Hashtbl.find table s in  begin 
                    match glob with
                    |DefForm(l,_) -> let lprime = List.map (fun d -> d.sortp) l 
                                  in if lprime = List.map snd tlistp                            
                                    then ApplyDef(s, List.map fst tlistp) 
                                    else raise( Type_error("Application mal formée"))
                    | _ -> raise (Type_error("application mal forme")) end
                    with Not_found -> raise (Type_error(s^" non définie"))
    
                           

let declaration_sort sortinsign = 
  let ident = sortinsign.idents in (
  match  Hashtbl.find_opt table ident  with 
  |None -> Hashtbl.add table ident Sort  
  |Some(_)-> raise (Type_error (ident ^" sorte déja déclarée")))
  
let declaration_cst constinsign = 
  let ident = constinsign.identcs and sort = constinsign.sort in (
  match Hashtbl.find_opt table ident with 
  |None -> (check_sort sort; Hashtbl.add table ident (Fonction([],sort)))
  |Some(_) -> raise (Type_error (ident ^" objet déja déclarée")) )
  
let declaration_fonction funinsign = 
   let ident = funinsign.identfs and sort = funinsign.sort_fun and sortarg = funinsign.sort_params in (
  match  Hashtbl.find_opt table ident with 
  |None ->  (List.iter check_sort (sort::sortarg); Hashtbl.add table ident (Fonction(sortarg,sort)))
  |Some(_) -> raise (Type_error (ident ^" objet déja déclarée")))
let declaration_relation relinsign = 
 let ident = relinsign.idente and sortarg = relinsign.sorte_args in (
  match Hashtbl.find_opt table ident with 
  | None -> (List.iter check_sort (sortarg); Hashtbl.add table ident (Predicate(sortarg)))
  | Some(_) -> raise (Type_error (ident ^" objet déja déclarée")))

let definition_form def = 
  let ident = def.ident in 
  let param = def.params in 
  let forma = def.form in 
  let env = List.map (fun {identp = n ; sortp = s} -> check_sort s ; n,(s,("_"^n))) param in 
  let form = analyse_form env forma in 
  match Hashtbl.find_opt table ident with 
  | None -> Hashtbl.add table ident (DefForm(param,form)) 
  | Some(_) -> raise (Type_error (ident ^" objet déja déclarée")) 

let definition_hyp hyp = 
  let ident = hyp.identh in 
  let form = hyp.formh in 
  let form = analyse_form [] form in 
  match Hashtbl.find_opt table ident with 
    |None -> Hashtbl.add table ident (Hyp(ident, form))
    |Some(_) -> raise(Type_error(ident^" objet déja déclaré"))
let definition_goal goal =
  let ident = goal.nameg in 
  let form = goal.formg in 
  let form2 = analyse_form [] form in 
  match Hashtbl.find_opt table ident with 
    |None -> Hashtbl.add table ident (Goal(ident, form2))
    |Some(_) -> raise(Type_error(ident^" objet déja déclaré"))
(*rajouter les definitions de termes *)

let fill prog= (*ajouter les symboles a la table de symbole *)
  (*on commence par ajouter les symboles de la signature *)
  List.iter(fun x -> declaration_sort x) prog.signature.sort;(*on ajoute les sortes de la signature *)
  List.iter(fun x -> declaration_cst x) prog.signature.const; (*on ajoute les symboles de constante  *)
  List.iter(fun x -> declaration_fonction x) prog.signature.functions; (*on ajoute les symboles de fonction *)
  List.iter(fun x -> declaration_relation x) prog.signature.relat; (*on ajoute les symboles de relation *)
  List.iter (fun x -> definition_form x) prog.define_form;
  List.iter(fun x -> definition_hyp x) prog.hyps;
  List.iter(fun x -> definition_goal x) [prog.goal] 

let rec subst_term var1 tf ti=
  match ti with 
  | Apply(n,tl) -> Apply(n,List.map(subst_term var1 tf) tl)
  | Var(y) -> if y = var1.identp then tf else ti 
  |_-> ti

let rec subst_form var1 tf fi = 
  match fi with 

  |Atom(Eq(t1,t2)) -> Atom(Eq(subst_term var1 tf t1,subst_term var1 tf t2))
  |Atom(Rel(n,tl)) -> Atom(Rel(n,List.map(subst_term var1 tf) tl))
  | Or(f1,f2) -> Or(subst_form var1 tf f1,subst_form var1 tf f2)
  | And(f1,f2) ->And((subst_form var1 tf f1,subst_form var1 tf f2))
  | Imp(f1,f2) -> Imp((subst_form var1 tf f1,subst_form var1 tf f2))
  | Not(f) -> Not(((subst_form var1 tf f)))
  | All(x,f) -> All(x,subst_form var1 tf f)
  | Exist(x,f) -> Exist(x,subst_form var1 tf f)
  | ApplyDef(n,tl) -> ApplyDef((n,List.map(subst_term var1 tf) tl))
  |_-> fi
