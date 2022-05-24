open Printeur
open Proof_ast


let parse string =  

  let buff = Lexing.from_string string in 

  
  let ast2 = Formparser.program Formlex.token buff in 
  ast2 



let rec  prompt chaine sq1 prog = 
print_string chaine;
  try let tact = parse chaine in 
  match tact with 
  |Unpack -> let sq2 = Preuve.unpack(List.hd sq1) prog in (Printeur.print_sequent_list (List.append (List.tl sq1) sq2)); (prompt (read_line()) ((List.tl sq1)@sq2) prog);
  | Replace(i) -> let sq2 = Preuve.egalite(List.hd sq1) i in (Printeur.print_sequent_list (List.append (List.tl sq1) sq2)); (prompt (read_line()) ((List.tl sq1)@sq2) prog);
  | Derive(i) -> let sq2 = Preuve.autoDerive(List.hd sq1) i  in (Printeur.print_sequent_list (List.append (List.tl sq1) sq2)); (prompt (read_line()) ((List.tl sq1)@sq2) prog);
  | Intro -> let sq2 = Preuve.autoIntro(List.hd sq1) in  (Printeur.print_sequent_list (List.append (List.tl sq1) sq2)); (prompt (read_line()) ((List.tl sq1)@sq2) prog);
  | IntroExact -> let sq2 = Preuve.exactHyp (List.hd sq1) in (Printeur.print_sequent_list (List.append (List.tl sq1) sq2)); (prompt (read_line()) ((List.tl sq1)@sq2) prog);
  | IntroAx -> let sq2 = Preuve.ax (List.hd sq1) in (Printeur.print_sequent_list (List.append (List.tl sq1) sq2)); (prompt (read_line()) ((List.tl sq1)@sq2) prog);
  | IntroAnd -> let sq2 = Preuve.et (List.hd sq1) in (Printeur.print_sequent_list (List.append (List.tl sq1) sq2)); (prompt (read_line()) (List.append sq2 (List.tl sq1)) prog );
  | IntroOrL -> let sq2 = Preuve.ougauche (List.hd sq1) in (Printeur.print_sequent_list (List.append (List.tl sq1) sq2)); (prompt (read_line()) ((List.tl sq1)@sq2) prog);
  | IntroAbsurde -> let sq2 = Preuve.absurde(List.hd sq1) in (Printeur.print_sequent_list (List.append (List.tl sq1) sq2)); (prompt (read_line()) ((List.tl sq1)@sq2) prog);
  | IntroImplique -> let sq2 = Preuve.implication(List.hd sq1) in (Printeur.print_sequent_list (List.append (List.tl sq1) sq2)); (prompt (read_line()) ((List.tl sq1)@sq2) prog);
  | Introfa(s) -> let sq2 = (Preuve.introfa(List.hd sq1 ) (prog.signature) s) in (Printeur.print_sequent_list (List.append sq2 (List.tl sq1) )); (prompt (read_line()) ((List.tl sq1)@sq2) prog);
  | IntroExist(s) -> let sq2 = (Preuve.exist (List.hd sq1) s) in (Printeur.print_sequent_list (List.append (List.tl sq1) sq2)); (prompt (read_line()) ((List.tl sq1)@sq2) prog);
  | ModusPonens(f) -> let sq2 = (Preuve.modus_ponens (List.hd sq1) f ) in (Printeur.print_sequent_list (List.append (List.tl sq1) sq2)); (prompt (read_line()) ((List.tl sq1)@sq2) prog);
  | Lemme(f) -> let sq2 = (Preuve.lem (List.hd sq1) f ) in (Printeur.print_sequent_list (List.append (List.tl sq1) sq2)); (prompt (read_line()) ((List.tl sq1)@sq2) prog);
  | Contrapose -> let sq2 = Preuve.contrapose(List.hd sq1) in  (Printeur.print_sequent_list (List.append (List.tl sq1) sq2)); (prompt (read_line()) ((List.tl sq1)@sq2) prog);
  | PushNegGoal -> let sq2 = Preuve.pushnegoal(List.hd sq1) in  (Printeur.print_sequent_list (List.append (List.tl sq1) sq2)); (prompt (read_line()) ((List.tl sq1)@sq2) prog);
  | TierExclu(f) -> let sq2 = Preuve.excludedThirdPart(List.hd sq1)f in  (Printeur.print_sequent_list (List.append (List.tl sq1) sq2)); (prompt (read_line()) ((List.tl sq1)@sq2) prog);
  | Swap(i) -> let sq2 =( Preuve.iwantfirst sq1 i) in (Printeur.print_sequent_list (List.append (List.tl sq1) sq2)); (prompt (read_line()) ((List.tl sq1)@sq2) prog);
  | Contradiction(f) -> let sq2 = (Preuve.contradiction (List.hd sq1) f) in (Printeur.print_sequent_list (List.append (List.tl sq1) sq2)); (prompt (read_line()) ((List.tl sq1)@sq2) prog);
  | Splith(i) -> let sq2 = (Preuve.splith (List.hd sq1) i) in (Printeur.print_sequent_list (List.append (List.tl sq1) sq2)); (prompt (read_line()) ((List.tl sq1)@sq2) prog);
  | UseForallHyp(i,t) -> let sq2 = (Preuve.usefah (List.hd sq1) i t ) in (Printeur.print_sequent_list (List.append (List.tl sq1) sq2)); (prompt (read_line()) ((List.tl sq1)@sq2) prog);
  | VarFromHyp(i,t) -> let sq2 = (Preuve.getvarfromhyp (List.hd sq1) i (prog.signature)t) in (Printeur.print_sequent_list (List.append (List.tl sq1) sq2)); (prompt (read_line()) ((List.tl sq1)@sq2) prog);
  with |_-> (prompt (read_line()) sq1 prog)
  (*if (chaincor) = "EXACT HYP" then let sq2 = Preuve.exactHyp (List.hd sq1) in (Printeur.print_sequent_list (List.append (List.tl sq1) sq2)); (prompt (read_line()) ((List.tl sq1)@sq2) prog);  else  
    if chaincor = "AXIOME" then let sq2 = Preuve.ax (List.hd sq1) in (Printeur.print_sequent_list (List.append (List.tl sq1) sq2)); (prompt (read_line()) ((List.tl sq1)@sq2) prog); else 
    if chaincor = "SPLIT" then let sq2 = Preuve.et (List.hd sq1) in (Printeur.print_sequent_list (List.append (List.tl sq1) sq2)); (prompt (read_line()) (List.append sq2 (List.tl sq1)) prog ); else 
    if chaincor ="LEFT" then let sq2 = Preuve.ougauche (List.hd sq1) in (Printeur.print_sequent_list (List.append (List.tl sq1) sq2)); (prompt (read_line()) ((List.tl sq1)@sq2) prog); else 
    if chaincor = "ABSURDE" then let sq2 = Preuve.absurde(List.hd sq1) in (Printeur.print_sequent_list (List.append (List.tl sq1) sq2)); (prompt (read_line()) ((List.tl sq1)@sq2) prog); else 
    if chaincor = "IMPLIQUE" then let sq2 = Preuve.implication(List.hd sq1) in (Printeur.print_sequent_list (List.append (List.tl sq1) sq2)); (prompt (read_line()) ((List.tl sq1)@sq2) prog); else 
    if chaincor = "INTROFA" then  let s = (read_line()) in let sq2 = (Preuve.introfa(List.hd sq1 ) (prog.signature) s) in (Printeur.print_sequent_list (List.append sq2 (List.tl sq1) )); (prompt (read_line()) ((List.tl sq1)@sq2) prog); else
    if chaincor = "USE" then  let s = (read_line()) in let sq2 = (Preuve.exist (List.hd sq1) (parse s)) in (Printeur.print_sequent_list (List.append (List.tl sq1) sq2)); (prompt (read_line()) ((List.tl sq1)@sq2) prog); else
    print_string "tactique inconnue"; let chaine2 = read_line() in prompt chaine2 sq1 prog;;*)

