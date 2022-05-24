{ 
  open Lexing
  open Formparser
  let keyword_or_ident =
    let h = Hashtbl.create 100 in
    List.iter (fun (s, k) -> Hashtbl.add h s k)
      [ "SIGMA", SIGMA;
        "HYP", HYP;
        "fun", FUN;
        "int", INT;
        "real", REAL;
        "const", CONST;
        "sort", SORT;
        "relat", RELAT;
        "DEF", DEF;
        "prop", PROP;
        "forall", ALL;
        "exists", EXISTS;
        "not", NOT;
        "and", AND;
        "or", OR;
        "GOAL", GOAL;
        
        "TRUE", TOP;
        "FALSE", BOTTOM;
        "APPDEF", AD;

        "EXACT", IEXA;
        "AXIOME",IAX;
        "SPLIT", IAND;
        "LEFT", IOL;
        "ABSURDE", IABS;
        "INTROI", II;
        "INTROFA", IFA ;
        "USE", IEXIST;
        "MODUS", MP;
        "LEMME", LEMME;
        "CONTRAPOSE", CONTRAPOSE;
        "PUSHNEG-GOAL", PNG;
        "TIER-EXCLU", ETP;
        "EQL", EQL;
        "SWAP", SWAP;
        "CONTRADICTION", CONH;
        "SPLIT-HYP", SPLITH;
        "USEFH",UFH;
        "VAR-FROM-H",VFH;
        "INTRO", INTRO;
        "ELIM", ELIM;
        "DERIVE", DERIVE;
        "REPLACE", REPLACE;
        "UNPACK", UNPACK;
     
      ] ;
    fun s ->
      try  Hashtbl.find h s
      with Not_found -> IDENT(s)
 
}

let digit = ['0'-'9']
let number = ['-']? digit+
let alpha = ['a'-'z' 'A'-'Z']
let accent = ("e"|"è"|"ê"|"à"|"ç")
let ident = alpha (alpha | '_' |'-'| digit)*
let stri = '"' (alpha|accent|digit|' ')+ '"'
let flo = digit* '.' digit+
let comment = "(*"(alpha|accent|digit|' ')* "*)"


rule token = parse 
  | ['\n']
      { new_line lexbuf; token lexbuf }
  | [' ' '\t' '\r']+
      { token lexbuf }
  |comment {token lexbuf}
  |number as n {INTC(int_of_string(n))}
  |flo as x {FC(float_of_string(x))}
  | ident as id
      { keyword_or_ident id }
  |"{" {BEGIN}
  |"}" {END}
  |"->" {ARROW}
  |"*" {MUL}
  | ":" {COLON}
  |";" {SEMI}
  | "=" {EQ}
  |"<=" {INFEQ}
  | ":=" {DPEC}
  | "(" {LPAR}
  | ")" {RPAR}
  |"," {COMMA}
  |"=>" {IMP}
  |"[" {LCROCH}
  | "]" {RCROCH}
  |"\"" {QTE}
  | _
      { failwith ("Unknown character : " ^ (lexeme lexbuf)) }
  |eof {EOF}