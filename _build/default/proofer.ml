
let () =
  let file = Sys.argv.(1) in
  let in_channel = open_in file in
  let lexbuf = Lexing.from_channel in_channel in
  let ast = Proof_parser.program Prooflexer.token lexbuf in
  close_in in_channel;
  Proof_ast.fill ast;
  let form = (List.hd ast.define_form) in 
  let form2 = form.form in
 (* let dest = open_out "texte.txt" in 
  let string = read_line() in 
  output_string dest string ;
  close_out dest;
  let inp = open_in "texte.txt" in 
  let buff = Lexing.from_channel inp in 
  
  let ast2 = Formparser.program Formlex.token buff in 
  close_in inp;
*)
   

  
  (*print_string (Printeur.printeur form2 false);*)
 (* let sort = (List.hd (ast.signature.functions)).sort_fun in 
  let sortList = Utility.in_out sort;
  in let a,b = sortList in 
  print_string (Printeur.print_list a);*)

  (*print_string (Printeur.printeur_plus sortList);*)

  Printf.printf "\n";

  (*Printeur.print_table ast;*)
   let sq1 = (Preuve.init_sequent ast) in 
  (Printeur.print_sequent sq1) ;
  let chaine = read_line() in 
  if String.uppercase_ascii chaine = "EXIT" then raise (Not_found) else 
  Interface.prompt chaine [sq1] ast;


  Printf.printf "Successfully checked program %s\n BRANCHER L ANALYSEUR\n " file;
  