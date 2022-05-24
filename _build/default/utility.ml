open Proof_ast



type quant_list = 
|Alls of (declaration_param list) * form 
|Exists of (declaration_param list) * form

let rec unflat_all_exists = function
  |Alls(p,f) -> let rec aux = function 
          | [a] -> All(a,f)
          | a::q ->  All(a,(aux q)) 
          | _ -> failwith "erreur: pas de quantificateur sans variable"
          in aux p
  | Exists(p,f) -> let rec aux = function 
          | [a] -> Exist(a,f) 
          | a::q ->  Exist(a,(aux q))
         
          | _ -> failwith "erreur: pas de quantificateur sans variable"
          in aux p

let rec first_relat = function
  | a::q -> List.append [a.ident] (first_relat q)
  |[] -> []

 
(**creer une fonction pour que quelque soit le type de symbole on puisse acceder a sa sort *)