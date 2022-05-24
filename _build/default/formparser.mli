
(* The type of tokens. *)

type token = 
  | VFH
  | UNPACK
  | UFH
  | TOP
  | SWAP
  | STOP
  | START
  | SPLITH
  | SORT
  | SIGMA
  | SEMI
  | RPAR
  | REPLACE
  | RELAT
  | REAL
  | RCROCH
  | QTE
  | PROP
  | PNG
  | OR
  | NOT
  | MUL
  | MP
  | LPAR
  | LEMME
  | LCROCH
  | IOL
  | INTRO
  | INTC of (int)
  | INT
  | INFEQ
  | IMP
  | II
  | IFA
  | IEXIST
  | IEXA
  | IDENT of (string)
  | IAX
  | IAND
  | IABS
  | HYP
  | GOAL
  | FUN
  | FC of (float)
  | EXISTS
  | ETP
  | EQL
  | EQ
  | EOF
  | END
  | ELIM
  | DPEC
  | DERIVE
  | DEF
  | CONTRAPOSE
  | CONST
  | CONH
  | COMMA
  | COLON
  | BOTTOM
  | BEGIN
  | ARROW
  | AND
  | ALL
  | AD

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val program: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Proof_ast.tact)

val atom: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Proof_ast.atom)
