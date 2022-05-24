
(* The type of tokens. *)

type token = 
  | TOP
  | STOP
  | START
  | SORT
  | SIGMA
  | SEMI
  | RPAR
  | RELAT
  | REAL
  | RCROCH
  | PROP
  | OR
  | NOT
  | MUL
  | LPAR
  | LCROCH
  | INTC of (int)
  | INT
  | INFEQ
  | IMP
  | IDENT of (string)
  | HYP
  | GOAL
  | FUN
  | FC of (float)
  | EXISTS
  | EQ
  | EOF
  | END
  | DPEC
  | DEF
  | CONST
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

val program: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Proof_ast.prog)
