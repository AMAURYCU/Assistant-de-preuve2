
module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
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
    | INTC of (
# 9 "formparser.mly"
       (int)
# 43 "formparser.ml"
  )
    | INT
    | INFEQ
    | IMP
    | II
    | IFA
    | IEXIST
    | IEXA
    | IDENT of (
# 8 "formparser.mly"
       (string)
# 55 "formparser.ml"
  )
    | IAX
    | IAND
    | IABS
    | HYP
    | GOAL
    | FUN
    | FC of (
# 10 "formparser.mly"
       (float)
# 66 "formparser.ml"
  )
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
  
end

include MenhirBasics

# 1 "formparser.mly"
  open Utility
  open Lexing
  open Proof_ast

  


# 102 "formparser.ml"

type ('s, 'r) _menhir_state = 
  | MenhirState000 : ('s, _menhir_box_atom) _menhir_state
    (** State 000.
        Stack shape : .
        Start symbol: atom. *)

  | MenhirState004 : (('s, _menhir_box_atom) _menhir_cell1_IDENT, _menhir_box_atom) _menhir_state
    (** State 004.
        Stack shape : IDENT.
        Start symbol: atom. *)

  | MenhirState006 : (('s, 'r) _menhir_cell1_IDENT, 'r) _menhir_state
    (** State 006.
        Stack shape : IDENT.
        Start symbol: <undetermined>. *)

  | MenhirState009 : (('s, 'r) _menhir_cell1_term, 'r) _menhir_state
    (** State 009.
        Stack shape : term.
        Start symbol: <undetermined>. *)

  | MenhirState018 : (('s, _menhir_box_atom) _menhir_cell1_term, _menhir_box_atom) _menhir_state
    (** State 018.
        Stack shape : term.
        Start symbol: atom. *)

  | MenhirState021 : (('s, _menhir_box_atom) _menhir_cell1_IDENT, _menhir_box_atom) _menhir_state
    (** State 021.
        Stack shape : IDENT.
        Start symbol: atom. *)

  | MenhirState040 : ('s _menhir_cell0_INTC, _menhir_box_program) _menhir_state
    (** State 040.
        Stack shape : INTC.
        Start symbol: program. *)

  | MenhirState058 : ('s, _menhir_box_program) _menhir_state
    (** State 058.
        Stack shape : .
        Start symbol: program. *)

  | MenhirState061 : (('s, _menhir_box_program) _menhir_cell1_NOT, _menhir_box_program) _menhir_state
    (** State 061.
        Stack shape : NOT.
        Start symbol: program. *)

  | MenhirState062 : (('s, _menhir_box_program) _menhir_cell1_LPAR, _menhir_box_program) _menhir_state
    (** State 062.
        Stack shape : LPAR.
        Start symbol: program. *)

  | MenhirState064 : (('s, _menhir_box_program) _menhir_cell1_IDENT, _menhir_box_program) _menhir_state
    (** State 064.
        Stack shape : IDENT.
        Start symbol: program. *)

  | MenhirState068 : (('s, _menhir_box_program) _menhir_cell1_EXISTS, _menhir_box_program) _menhir_state
    (** State 068.
        Stack shape : EXISTS.
        Start symbol: program. *)

  | MenhirState078 : ((('s, _menhir_box_program) _menhir_cell1_EXISTS, _menhir_box_program) _menhir_cell1_loption_separated_nonempty_list_COMMA_declaration_param__, _menhir_box_program) _menhir_state
    (** State 078.
        Stack shape : EXISTS loption(separated_nonempty_list(COMMA,declaration_param)).
        Start symbol: program. *)

  | MenhirState081 : (('s, _menhir_box_program) _menhir_cell1_ALL, _menhir_box_program) _menhir_state
    (** State 081.
        Stack shape : ALL.
        Start symbol: program. *)

  | MenhirState084 : ((('s, _menhir_box_program) _menhir_cell1_ALL, _menhir_box_program) _menhir_cell1_loption_separated_nonempty_list_COMMA_declaration_param__, _menhir_box_program) _menhir_state
    (** State 084.
        Stack shape : ALL loption(separated_nonempty_list(COMMA,declaration_param)).
        Start symbol: program. *)

  | MenhirState088 : (('s, _menhir_box_program) _menhir_cell1_AD _menhir_cell0_IDENT, _menhir_box_program) _menhir_state
    (** State 088.
        Stack shape : AD IDENT.
        Start symbol: program. *)

  | MenhirState093 : (('s, _menhir_box_program) _menhir_cell1_term, _menhir_box_program) _menhir_state
    (** State 093.
        Stack shape : term.
        Start symbol: program. *)

  | MenhirState096 : (('s, _menhir_box_program) _menhir_cell1_formule, _menhir_box_program) _menhir_state
    (** State 096.
        Stack shape : formule.
        Start symbol: program. *)

  | MenhirState098 : (('s, _menhir_box_program) _menhir_cell1_formule, _menhir_box_program) _menhir_state
    (** State 098.
        Stack shape : formule.
        Start symbol: program. *)

  | MenhirState101 : (('s, _menhir_box_program) _menhir_cell1_formule, _menhir_box_program) _menhir_state
    (** State 101.
        Stack shape : formule.
        Start symbol: program. *)

  | MenhirState104 : (('s, _menhir_box_program) _menhir_cell1_declaration_param, _menhir_box_program) _menhir_state
    (** State 104.
        Stack shape : declaration_param.
        Start symbol: program. *)

  | MenhirState110 : ((('s, _menhir_box_program) _menhir_cell1_LPAR, _menhir_box_program) _menhir_cell1_formule, _menhir_box_program) _menhir_state
    (** State 110.
        Stack shape : LPAR formule.
        Start symbol: program. *)

  | MenhirState114 : ((('s, _menhir_box_program) _menhir_cell1_LPAR, _menhir_box_program) _menhir_cell1_formule, _menhir_box_program) _menhir_state
    (** State 114.
        Stack shape : LPAR formule.
        Start symbol: program. *)

  | MenhirState118 : ((('s, _menhir_box_program) _menhir_cell1_LPAR, _menhir_box_program) _menhir_cell1_formule, _menhir_box_program) _menhir_state
    (** State 118.
        Stack shape : LPAR formule.
        Start symbol: program. *)

  | MenhirState127 : ('s, _menhir_box_program) _menhir_state
    (** State 127.
        Stack shape : .
        Start symbol: program. *)

  | MenhirState134 : ('s, _menhir_box_program) _menhir_state
    (** State 134.
        Stack shape : .
        Start symbol: program. *)

  | MenhirState148 : ('s, _menhir_box_program) _menhir_state
    (** State 148.
        Stack shape : .
        Start symbol: program. *)

  | MenhirState159 : ('s, _menhir_box_program) _menhir_state
    (** State 159.
        Stack shape : .
        Start symbol: program. *)

  | MenhirState162 : ('s, _menhir_box_program) _menhir_state
    (** State 162.
        Stack shape : .
        Start symbol: program. *)

  | MenhirState166 : ('s, _menhir_box_program) _menhir_state
    (** State 166.
        Stack shape : .
        Start symbol: program. *)

  | MenhirState168 : (('s, _menhir_box_program) _menhir_cell1_INTC, _menhir_box_program) _menhir_state
    (** State 168.
        Stack shape : INTC.
        Start symbol: program. *)

  | MenhirState184 : ('s, _menhir_box_program) _menhir_state
    (** State 184.
        Stack shape : .
        Start symbol: program. *)


and ('s, 'r) _menhir_cell1_declaration_param = 
  | MenhirCell1_declaration_param of 's * ('s, 'r) _menhir_state * (Proof_ast.declaration_param)

and ('s, 'r) _menhir_cell1_formule = 
  | MenhirCell1_formule of 's * ('s, 'r) _menhir_state * (Proof_ast.form)

and ('s, 'r) _menhir_cell1_loption_separated_nonempty_list_COMMA_declaration_param__ = 
  | MenhirCell1_loption_separated_nonempty_list_COMMA_declaration_param__ of 's * ('s, 'r) _menhir_state * (Proof_ast.declaration_param list)

and ('s, 'r) _menhir_cell1_term = 
  | MenhirCell1_term of 's * ('s, 'r) _menhir_state * (Proof_ast.term)

and ('s, 'r) _menhir_cell1_AD = 
  | MenhirCell1_AD of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_ALL = 
  | MenhirCell1_ALL of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_EXISTS = 
  | MenhirCell1_EXISTS of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_IDENT = 
  | MenhirCell1_IDENT of 's * ('s, 'r) _menhir_state * (
# 8 "formparser.mly"
       (string)
# 291 "formparser.ml"
)

and 's _menhir_cell0_IDENT = 
  | MenhirCell0_IDENT of 's * (
# 8 "formparser.mly"
       (string)
# 298 "formparser.ml"
)

and ('s, 'r) _menhir_cell1_INTC = 
  | MenhirCell1_INTC of 's * ('s, 'r) _menhir_state * (
# 9 "formparser.mly"
       (int)
# 305 "formparser.ml"
)

and 's _menhir_cell0_INTC = 
  | MenhirCell0_INTC of 's * (
# 9 "formparser.mly"
       (int)
# 312 "formparser.ml"
)

and ('s, 'r) _menhir_cell1_LPAR = 
  | MenhirCell1_LPAR of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_NOT = 
  | MenhirCell1_NOT of 's * ('s, 'r) _menhir_state

and _menhir_box_program = 
  | MenhirBox_program of (Proof_ast.tact) [@@unboxed]

and _menhir_box_atom = 
  | MenhirBox_atom of (Proof_ast.atom) [@@unboxed]

let _menhir_action_02 =
  fun () ->
    (
# 128 "formparser.mly"
        (Top)
# 332 "formparser.ml"
     : (Proof_ast.atom))

let _menhir_action_03 =
  fun () ->
    (
# 129 "formparser.mly"
          (Bottom)
# 340 "formparser.ml"
     : (Proof_ast.atom))

let _menhir_action_04 =
  fun t1 t2 ->
    (
# 130 "formparser.mly"
                           (Eq(t1,t2))
# 348 "formparser.ml"
     : (Proof_ast.atom))

let _menhir_action_05 =
  fun i xs ->
    let sl = 
# 229 "<standard.mly>"
    ( xs )
# 356 "formparser.ml"
     in
    (
# 131 "formparser.mly"
                                                        (Rel(i,sl))
# 361 "formparser.ml"
     : (Proof_ast.atom))

let _menhir_action_06 =
  fun i s ->
    (
# 115 "formparser.mly"
                             (
    {identp = i; sortp = s;}
  )
# 371 "formparser.ml"
     : (Proof_ast.declaration_param))

let _menhir_action_07 =
  fun a ->
    (
# 134 "formparser.mly"
              (Atom(a))
# 379 "formparser.ml"
     : (Proof_ast.form))

let _menhir_action_08 =
  fun f1 f2 ->
    (
# 135 "formparser.mly"
                                 (And(f1,f2))
# 387 "formparser.ml"
     : (Proof_ast.form))

let _menhir_action_09 =
  fun f1 f2 ->
    (
# 136 "formparser.mly"
                                (Or(f1,f2))
# 395 "formparser.ml"
     : (Proof_ast.form))

let _menhir_action_10 =
  fun f1 f2 ->
    (
# 137 "formparser.mly"
                                 (Imp(f1,f2))
# 403 "formparser.ml"
     : (Proof_ast.form))

let _menhir_action_11 =
  fun f1 f2 ->
    (
# 138 "formparser.mly"
                                                     (Or(f1,f2))
# 411 "formparser.ml"
     : (Proof_ast.form))

let _menhir_action_12 =
  fun f1 f2 ->
    (
# 139 "formparser.mly"
                                                     (And(f1,f2))
# 419 "formparser.ml"
     : (Proof_ast.form))

let _menhir_action_13 =
  fun f1 f2 ->
    (
# 140 "formparser.mly"
                                                     (Imp(f1,f2))
# 427 "formparser.ml"
     : (Proof_ast.form))

let _menhir_action_14 =
  fun f1 ->
    (
# 141 "formparser.mly"
                     (Not(f1))
# 435 "formparser.ml"
     : (Proof_ast.form))

let _menhir_action_15 =
  fun a ->
    (
# 142 "formparser.mly"
                       (Atom(a))
# 443 "formparser.ml"
     : (Proof_ast.form))

let _menhir_action_16 =
  fun f1 xs ->
    let sl = 
# 229 "<standard.mly>"
    ( xs )
# 451 "formparser.ml"
     in
    (
# 143 "formparser.mly"
                                                                                 (Utility.unflat_all_exists (Alls(sl,f1)))
# 456 "formparser.ml"
     : (Proof_ast.form))

let _menhir_action_17 =
  fun f1 xs ->
    let sl = 
# 229 "<standard.mly>"
    ( xs )
# 464 "formparser.ml"
     in
    (
# 144 "formparser.mly"
                                                                                    (Utility.unflat_all_exists (Exists(sl,f1)))
# 469 "formparser.ml"
     : (Proof_ast.form))

let _menhir_action_18 =
  fun i xs ->
    let sl = 
# 229 "<standard.mly>"
    ( xs )
# 477 "formparser.ml"
     in
    (
# 145 "formparser.mly"
                                                                      (ApplyDef(i,sl))
# 482 "formparser.ml"
     : (Proof_ast.form))

let _menhir_action_19 =
  fun _startpos__1_ ->
    let _ = let _startpos = _startpos__1_ in
    (
# 146 "formparser.mly"
          ( let pos = _startpos in
          let message =
            Printf.sprintf
              "Syntax error at %d, %d"
              pos.pos_lnum (pos.pos_cnum - pos.pos_bol)
          in
          failwith message )
# 497 "formparser.ml"
     : (Proof_ast.form)) in
    prerr_string "Menhir: misuse: the semantic action associated with the production\nformule -> error\nis expected to abort the parser, but does not do so.\n";
    assert false

let _menhir_action_20 =
  fun () ->
    (
# 139 "<standard.mly>"
    ( [] )
# 507 "formparser.ml"
     : (Proof_ast.declaration_param list))

let _menhir_action_21 =
  fun x ->
    (
# 141 "<standard.mly>"
    ( x )
# 515 "formparser.ml"
     : (Proof_ast.declaration_param list))

let _menhir_action_22 =
  fun () ->
    (
# 139 "<standard.mly>"
    ( [] )
# 523 "formparser.ml"
     : (Proof_ast.term list))

let _menhir_action_23 =
  fun x ->
    (
# 141 "<standard.mly>"
    ( x )
# 531 "formparser.ml"
     : (Proof_ast.term list))

let _menhir_action_24 =
  fun () ->
    (
# 39 "formparser.mly"
             (IntroExact)
# 539 "formparser.ml"
     : (Proof_ast.tact))

let _menhir_action_25 =
  fun () ->
    (
# 40 "formparser.mly"
            (IntroAx)
# 547 "formparser.ml"
     : (Proof_ast.tact))

let _menhir_action_26 =
  fun () ->
    (
# 41 "formparser.mly"
             (IntroAnd)
# 555 "formparser.ml"
     : (Proof_ast.tact))

let _menhir_action_27 =
  fun () ->
    (
# 42 "formparser.mly"
           (IntroOrL)
# 563 "formparser.ml"
     : (Proof_ast.tact))

let _menhir_action_28 =
  fun () ->
    (
# 43 "formparser.mly"
             (IntroAbsurde)
# 571 "formparser.ml"
     : (Proof_ast.tact))

let _menhir_action_29 =
  fun () ->
    (
# 44 "formparser.mly"
           (IntroImplique)
# 579 "formparser.ml"
     : (Proof_ast.tact))

let _menhir_action_30 =
  fun s ->
    (
# 45 "formparser.mly"
                            (Introfa(s))
# 587 "formparser.ml"
     : (Proof_ast.tact))

let _menhir_action_31 =
  fun t ->
    (
# 46 "formparser.mly"
                              (IntroExist(t) )
# 595 "formparser.ml"
     : (Proof_ast.tact))

let _menhir_action_32 =
  fun t ->
    (
# 47 "formparser.mly"
                              (ModusPonens(t))
# 603 "formparser.ml"
     : (Proof_ast.tact))

let _menhir_action_33 =
  fun f ->
    (
# 48 "formparser.mly"
                                (Lemme(f))
# 611 "formparser.ml"
     : (Proof_ast.tact))

let _menhir_action_34 =
  fun () ->
    (
# 49 "formparser.mly"
                   (Contrapose)
# 619 "formparser.ml"
     : (Proof_ast.tact))

let _menhir_action_35 =
  fun () ->
    (
# 50 "formparser.mly"
           (PushNegGoal)
# 627 "formparser.ml"
     : (Proof_ast.tact))

let _menhir_action_36 =
  fun f ->
    (
# 51 "formparser.mly"
                        (TierExclu(f))
# 635 "formparser.ml"
     : (Proof_ast.tact))

let _menhir_action_37 =
  fun a ->
    (
# 52 "formparser.mly"
                     (EgaliteG(a))
# 643 "formparser.ml"
     : (Proof_ast.tact))

let _menhir_action_38 =
  fun i ->
    (
# 53 "formparser.mly"
                           (Swap(i))
# 651 "formparser.ml"
     : (Proof_ast.tact))

let _menhir_action_39 =
  fun f ->
    (
# 54 "formparser.mly"
                              (Contradiction(f))
# 659 "formparser.ml"
     : (Proof_ast.tact))

let _menhir_action_40 =
  fun i ->
    (
# 55 "formparser.mly"
                             (Splith(i))
# 667 "formparser.ml"
     : (Proof_ast.tact))

let _menhir_action_41 =
  fun i t ->
    (
# 56 "formparser.mly"
                                        (UseForallHyp(i,t))
# 675 "formparser.ml"
     : (Proof_ast.tact))

let _menhir_action_42 =
  fun i t ->
    (
# 57 "formparser.mly"
                                         (VarFromHyp(i,t))
# 683 "formparser.ml"
     : (Proof_ast.tact))

let _menhir_action_43 =
  fun () ->
    (
# 58 "formparser.mly"
             (Intro)
# 691 "formparser.ml"
     : (Proof_ast.tact))

let _menhir_action_44 =
  fun i ->
    (
# 59 "formparser.mly"
                                     (Introfa(i))
# 699 "formparser.ml"
     : (Proof_ast.tact))

let _menhir_action_45 =
  fun t ->
    (
# 60 "formparser.mly"
                            (IntroExist(t))
# 707 "formparser.ml"
     : (Proof_ast.tact))

let _menhir_action_46 =
  fun i t ->
    (
# 61 "formparser.mly"
                                         (UseForallHyp(i,t))
# 715 "formparser.ml"
     : (Proof_ast.tact))

let _menhir_action_47 =
  fun d i ->
    (
# 62 "formparser.mly"
                                                  (VarFromHyp(d,i))
# 723 "formparser.ml"
     : (Proof_ast.tact))

let _menhir_action_48 =
  fun f ->
    (
# 63 "formparser.mly"
                              (ModusPonens(f))
# 731 "formparser.ml"
     : (Proof_ast.tact))

let _menhir_action_49 =
  fun i ->
    (
# 64 "formparser.mly"
                              (Derive(i))
# 739 "formparser.ml"
     : (Proof_ast.tact))

let _menhir_action_50 =
  fun i ->
    (
# 65 "formparser.mly"
                              (Replace(i))
# 747 "formparser.ml"
     : (Proof_ast.tact))

let _menhir_action_51 =
  fun () ->
    (
# 66 "formparser.mly"
              (Unpack)
# 755 "formparser.ml"
     : (Proof_ast.tact))

let _menhir_action_52 =
  fun _startpos__1_ ->
    let _ = let _startpos = _startpos__1_ in
    (
# 67 "formparser.mly"
         ( let pos = _startpos in
          let message =
            Printf.sprintf
              "Syntax error at %d, %d"
              pos.pos_lnum (pos.pos_cnum - pos.pos_bol)
          in
          failwith message )
# 770 "formparser.ml"
     : (Proof_ast.tact)) in
    prerr_string "Menhir: misuse: the semantic action associated with the production\nprogram -> error\nis expected to abort the parser, but does not do so.\n";
    assert false

let _menhir_action_53 =
  fun x ->
    (
# 238 "<standard.mly>"
    ( [ x ] )
# 780 "formparser.ml"
     : (Proof_ast.declaration_param list))

let _menhir_action_54 =
  fun x xs ->
    (
# 240 "<standard.mly>"
    ( x :: xs )
# 788 "formparser.ml"
     : (Proof_ast.declaration_param list))

let _menhir_action_55 =
  fun x ->
    (
# 238 "<standard.mly>"
    ( [ x ] )
# 796 "formparser.ml"
     : (Proof_ast.term list))

let _menhir_action_56 =
  fun x xs ->
    (
# 240 "<standard.mly>"
    ( x :: xs )
# 804 "formparser.ml"
     : (Proof_ast.term list))

let _menhir_action_57 =
  fun () ->
    (
# 107 "formparser.mly"
        (Real)
# 812 "formparser.ml"
     : (Proof_ast.sort))

let _menhir_action_58 =
  fun () ->
    (
# 108 "formparser.mly"
        (Int)
# 820 "formparser.ml"
     : (Proof_ast.sort))

let _menhir_action_59 =
  fun i ->
    (
# 109 "formparser.mly"
              (User(i))
# 828 "formparser.ml"
     : (Proof_ast.sort))

let _menhir_action_60 =
  fun i ->
    (
# 122 "formparser.mly"
              (Symb(i))
# 836 "formparser.ml"
     : (Proof_ast.term))

let _menhir_action_61 =
  fun i xs ->
    let sl = 
# 229 "<standard.mly>"
    ( xs )
# 844 "formparser.ml"
     in
    (
# 123 "formparser.mly"
                                                       (Apply(i,sl))
# 849 "formparser.ml"
     : (Proof_ast.term))

let _menhir_action_62 =
  fun n ->
    (
# 124 "formparser.mly"
             (Int_cst(n))
# 857 "formparser.ml"
     : (Proof_ast.term))

let _menhir_action_63 =
  fun x ->
    (
# 125 "formparser.mly"
           (Float_cst(x))
# 865 "formparser.ml"
     : (Proof_ast.term))

let _menhir_print_token : token -> string =
  fun _tok ->
    match _tok with
    | AD ->
        "AD"
    | ALL ->
        "ALL"
    | AND ->
        "AND"
    | ARROW ->
        "ARROW"
    | BEGIN ->
        "BEGIN"
    | BOTTOM ->
        "BOTTOM"
    | COLON ->
        "COLON"
    | COMMA ->
        "COMMA"
    | CONH ->
        "CONH"
    | CONST ->
        "CONST"
    | CONTRAPOSE ->
        "CONTRAPOSE"
    | DEF ->
        "DEF"
    | DERIVE ->
        "DERIVE"
    | DPEC ->
        "DPEC"
    | ELIM ->
        "ELIM"
    | END ->
        "END"
    | EOF ->
        "EOF"
    | EQ ->
        "EQ"
    | EQL ->
        "EQL"
    | ETP ->
        "ETP"
    | EXISTS ->
        "EXISTS"
    | FC _ ->
        "FC"
    | FUN ->
        "FUN"
    | GOAL ->
        "GOAL"
    | HYP ->
        "HYP"
    | IABS ->
        "IABS"
    | IAND ->
        "IAND"
    | IAX ->
        "IAX"
    | IDENT _ ->
        "IDENT"
    | IEXA ->
        "IEXA"
    | IEXIST ->
        "IEXIST"
    | IFA ->
        "IFA"
    | II ->
        "II"
    | IMP ->
        "IMP"
    | INFEQ ->
        "INFEQ"
    | INT ->
        "INT"
    | INTC _ ->
        "INTC"
    | INTRO ->
        "INTRO"
    | IOL ->
        "IOL"
    | LCROCH ->
        "LCROCH"
    | LEMME ->
        "LEMME"
    | LPAR ->
        "LPAR"
    | MP ->
        "MP"
    | MUL ->
        "MUL"
    | NOT ->
        "NOT"
    | OR ->
        "OR"
    | PNG ->
        "PNG"
    | PROP ->
        "PROP"
    | QTE ->
        "QTE"
    | RCROCH ->
        "RCROCH"
    | REAL ->
        "REAL"
    | RELAT ->
        "RELAT"
    | REPLACE ->
        "REPLACE"
    | RPAR ->
        "RPAR"
    | SEMI ->
        "SEMI"
    | SIGMA ->
        "SIGMA"
    | SORT ->
        "SORT"
    | SPLITH ->
        "SPLITH"
    | START ->
        "START"
    | STOP ->
        "STOP"
    | SWAP ->
        "SWAP"
    | TOP ->
        "TOP"
    | UFH ->
        "UFH"
    | UNPACK ->
        "UNPACK"
    | VFH ->
        "VFH"

let _menhir_fail : unit -> 'a =
  fun () ->
    Printf.eprintf "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

include struct
  
  [@@@ocaml.warning "-4-37-39"]
  
  let rec _menhir_run_026_spec_000 : type  ttv_stack. ttv_stack -> _ -> _menhir_box_atom =
    fun _menhir_stack _v ->
      MenhirBox_atom _v
  
  let rec _menhir_goto_program : type  ttv_stack. ttv_stack -> _ -> _menhir_box_program =
    fun _menhir_stack _v ->
      MenhirBox_program _v
  
  let rec _menhir_run_163 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _v _tok ->
      match (_tok : MenhirBasics.token) with
      | EOF ->
          let a = _v in
          let _v = _menhir_action_37 a in
          _menhir_goto_program _menhir_stack _v
      | _ ->
          _eRR ()
  
  let rec _menhir_run_173 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_INTC -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _v _tok ->
      match (_tok : MenhirBasics.token) with
      | EOF ->
          let MenhirCell1_INTC (_menhir_stack, _, i) = _menhir_stack in
          let t = _v in
          let _v = _menhir_action_46 i t in
          _menhir_goto_program _menhir_stack _v
      | _ ->
          _eRR ()
  
  let rec _menhir_run_149 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _v _tok ->
      match (_tok : MenhirBasics.token) with
      | EOF ->
          let t = _v in
          let _v = _menhir_action_31 t in
          _menhir_goto_program _menhir_stack _v
      | _ ->
          _eRR ()
  
  let rec _menhir_run_139 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _v _tok ->
      match (_tok : MenhirBasics.token) with
      | EOF ->
          let t = _v in
          let _v = _menhir_action_45 t in
          _menhir_goto_program _menhir_stack _v
      | _ ->
          _eRR ()
  
  let rec _menhir_run_041 : type  ttv_stack. ttv_stack _menhir_cell0_INTC -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _v _tok ->
      match (_tok : MenhirBasics.token) with
      | EOF ->
          let MenhirCell0_INTC (_menhir_stack, i) = _menhir_stack in
          let t = _v in
          let _v = _menhir_action_41 i t in
          _menhir_goto_program _menhir_stack _v
      | _ ->
          _eRR ()
  
  let rec _menhir_error_run_185 : type  ttv_stack. ttv_stack -> _menhir_box_program =
    fun _menhir_stack ->
      _eRR ()
  
  let rec _menhir_error_run_175 : type  ttv_stack. ttv_stack -> _menhir_box_program =
    fun _menhir_stack ->
      _eRR ()
  
  let rec _menhir_error_run_160 : type  ttv_stack. ttv_stack -> _menhir_box_program =
    fun _menhir_stack ->
      _eRR ()
  
  let rec _menhir_error_run_128 : type  ttv_stack. ttv_stack -> _menhir_box_program =
    fun _menhir_stack ->
      _eRR ()
  
  let rec _menhir_error_run_124 : type  ttv_stack. ttv_stack -> _menhir_box_program =
    fun _menhir_stack ->
      _eRR ()
  
  let rec _menhir_error_run_119 : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_LPAR, _menhir_box_program) _menhir_cell1_formule -> _menhir_box_program =
    fun _menhir_stack ->
      _eRR ()
  
  let rec _menhir_error_run_115 : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_LPAR, _menhir_box_program) _menhir_cell1_formule -> _menhir_box_program =
    fun _menhir_stack ->
      _eRR ()
  
  let rec _menhir_error_run_111 : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_LPAR, _menhir_box_program) _menhir_cell1_formule -> _menhir_box_program =
    fun _menhir_stack ->
      _eRR ()
  
  let rec _menhir_error_run_107 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_LPAR -> _menhir_box_program =
    fun _menhir_stack ->
      _eRR ()
  
  let rec _menhir_error_run_106 : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_EXISTS, _menhir_box_program) _menhir_cell1_loption_separated_nonempty_list_COMMA_declaration_param__ -> _menhir_box_program =
    fun _menhir_stack ->
      _eRR ()
  
  let rec _menhir_error_run_102 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_formule -> _menhir_box_program =
    fun _menhir_stack ->
      _eRR ()
  
  let rec _menhir_error_run_099 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_formule -> _menhir_box_program =
    fun _menhir_stack ->
      _eRR ()
  
  let rec _menhir_error_run_097 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_formule -> _menhir_box_program =
    fun _menhir_stack ->
      _eRR ()
  
  let rec _menhir_error_run_095 : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_ALL, _menhir_box_program) _menhir_cell1_loption_separated_nonempty_list_COMMA_declaration_param__ -> _menhir_box_program =
    fun _menhir_stack ->
      _eRR ()
  
  let rec _menhir_error_goto_formule : type  ttv_stack. ttv_stack -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _v _menhir_s ->
      match _menhir_s with
      | MenhirState184 ->
          _menhir_error_run_185 _menhir_stack
      | MenhirState166 ->
          _menhir_error_run_175 _menhir_stack
      | MenhirState159 ->
          _menhir_error_run_160 _menhir_stack
      | MenhirState127 ->
          _menhir_error_run_128 _menhir_stack
      | MenhirState058 ->
          _menhir_error_run_124 _menhir_stack
      | MenhirState061 ->
          _menhir_error_run_123 _menhir_stack _v
      | MenhirState118 ->
          _menhir_error_run_119 _menhir_stack
      | MenhirState114 ->
          _menhir_error_run_115 _menhir_stack
      | MenhirState110 ->
          _menhir_error_run_111 _menhir_stack
      | MenhirState062 ->
          _menhir_error_run_107 _menhir_stack
      | MenhirState078 ->
          _menhir_error_run_106 _menhir_stack
      | MenhirState101 ->
          _menhir_error_run_102 _menhir_stack
      | MenhirState098 ->
          _menhir_error_run_099 _menhir_stack
      | MenhirState096 ->
          _menhir_error_run_097 _menhir_stack
      | MenhirState084 ->
          _menhir_error_run_095 _menhir_stack
      | _ ->
          _menhir_fail ()
  
  and _menhir_error_run_123 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_NOT -> _ -> _menhir_box_program =
    fun _menhir_stack _v ->
      let MenhirCell1_NOT (_menhir_stack, _menhir_s) = _menhir_stack in
      let f1 = _v in
      let _v = _menhir_action_14 f1 in
      _menhir_error_goto_formule _menhir_stack _v _menhir_s
  
  let rec _menhir_error_run_059 : type  ttv_stack. ttv_stack -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _startpos__1_ = _startpos in
      let _v = _menhir_action_19 _startpos__1_ in
      _menhir_error_goto_formule _menhir_stack _v _menhir_s
  
  let rec _menhir_run_017 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_atom) _menhir_state -> _ -> _menhir_box_atom =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | EQ ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | INTC _v_0 ->
              let n = _v_0 in
              let _v = _menhir_action_62 n in
              _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | IDENT _v_2 ->
              let _menhir_stack = MenhirCell1_IDENT (_menhir_stack, MenhirState018, _v_2) in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | LPAR ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | INTC _v_3 ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      let n = _v_3 in
                      let _v = _menhir_action_62 n in
                      _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState021 _tok
                  | IDENT _v_5 ->
                      _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v_5 MenhirState021
                  | FC _v_6 ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      let x = _v_6 in
                      let _v = _menhir_action_63 x in
                      _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState021 _tok
                  | RPAR ->
                      let _v = _menhir_action_22 () in
                      _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | FC _v_9 ->
              let x = _v_9 in
              let _v = _menhir_action_63 x in
              _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_025 : type  ttv_stack. (ttv_stack, _menhir_box_atom) _menhir_cell1_term -> _ -> _ -> _ -> _ -> _menhir_box_atom =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_term (_menhir_stack, _menhir_s, t1) = _menhir_stack in
      let t2 = _v in
      let _v = _menhir_action_04 t1 t2 in
      _menhir_goto_atom _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_atom : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState162 ->
          _menhir_run_163 _menhir_stack _v _tok
      | MenhirState062 ->
          _menhir_run_121 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState184 ->
          _menhir_run_100_spec_184 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState166 ->
          _menhir_run_100_spec_166 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState159 ->
          _menhir_run_100_spec_159 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState127 ->
          _menhir_run_100_spec_127 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState058 ->
          _menhir_run_100_spec_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState061 ->
          _menhir_run_100_spec_061 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState118 ->
          _menhir_run_100_spec_118 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState114 ->
          _menhir_run_100_spec_114 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState110 ->
          _menhir_run_100_spec_110 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState078 ->
          _menhir_run_100_spec_078 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState084 ->
          _menhir_run_100_spec_084 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState101 ->
          _menhir_run_100_spec_101 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState096 ->
          _menhir_run_100_spec_096 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState098 ->
          _menhir_run_100_spec_098 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState000 ->
          _menhir_run_026_spec_000 _menhir_stack _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_121 : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_LPAR as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | RPAR ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_LPAR (_menhir_stack, _menhir_s) = _menhir_stack in
          let a = _v in
          let _v = _menhir_action_15 a in
          _menhir_goto_formule _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | AND | IMP | OR ->
          let a = _v in
          let _v = _menhir_action_07 a in
          _menhir_goto_formule _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_formule : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState184 ->
          _menhir_run_185 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState166 ->
          _menhir_run_175 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState159 ->
          _menhir_run_160 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState127 ->
          _menhir_run_128 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState058 ->
          _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState061 ->
          _menhir_run_123 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState118 ->
          _menhir_run_119 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState114 ->
          _menhir_run_115 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState110 ->
          _menhir_run_111 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState062 ->
          _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState078 ->
          _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState101 ->
          _menhir_run_102 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState098 ->
          _menhir_run_099 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState096 ->
          _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState084 ->
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_185 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | OR ->
          let _menhir_stack = MenhirCell1_formule (_menhir_stack, _menhir_s, _v) in
          _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer
      | IMP ->
          let _menhir_stack = MenhirCell1_formule (_menhir_stack, _menhir_s, _v) in
          _menhir_run_101 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EOF ->
          let f = _v in
          let _v = _menhir_action_39 f in
          _menhir_goto_program _menhir_stack _v
      | AND ->
          let _menhir_stack = MenhirCell1_formule (_menhir_stack, _menhir_s, _v) in
          _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_096 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_formule -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TOP ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_02 () in
          _menhir_run_100_spec_096 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | NOT ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState096
      | LPAR ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState096
      | INTC _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let n = _v in
          let _v = _menhir_action_62 n in
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState096 _tok
      | IDENT _v ->
          _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState096
      | FC _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let x = _v in
          let _v = _menhir_action_63 x in
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState096 _tok
      | EXISTS ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState096
      | BOTTOM ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_03 () in
          _menhir_run_100_spec_096 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | ALL ->
          _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState096
      | AD ->
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState096
      | _ ->
          _menhir_error_run_059 _menhir_stack _menhir_lexbuf MenhirState096
  
  and _menhir_run_100_spec_096 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_formule -> _ -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let a = _v in
      let _v = _menhir_action_07 a in
      _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState096 _tok
  
  and _menhir_run_097 : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_formule as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | OR ->
          let _menhir_stack = MenhirCell1_formule (_menhir_stack, _menhir_s, _v) in
          _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          let _menhir_stack = MenhirCell1_formule (_menhir_stack, _menhir_s, _v) in
          _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EOF | IMP | RPAR ->
          let MenhirCell1_formule (_menhir_stack, _menhir_s, f1) = _menhir_stack in
          let f2 = _v in
          let _v = _menhir_action_09 f1 f2 in
          _menhir_goto_formule _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_098 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_formule -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TOP ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_02 () in
          _menhir_run_100_spec_098 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | NOT ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState098
      | LPAR ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState098
      | INTC _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let n = _v in
          let _v = _menhir_action_62 n in
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState098 _tok
      | IDENT _v ->
          _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState098
      | FC _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let x = _v in
          let _v = _menhir_action_63 x in
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState098 _tok
      | EXISTS ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState098
      | BOTTOM ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_03 () in
          _menhir_run_100_spec_098 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | ALL ->
          _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState098
      | AD ->
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState098
      | _ ->
          _menhir_error_run_059 _menhir_stack _menhir_lexbuf MenhirState098
  
  and _menhir_run_100_spec_098 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_formule -> _ -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let a = _v in
      let _v = _menhir_action_07 a in
      _menhir_run_099 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState098 _tok
  
  and _menhir_run_099 : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_formule as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | AND ->
          let _menhir_stack = MenhirCell1_formule (_menhir_stack, _menhir_s, _v) in
          _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EOF | IMP | OR | RPAR ->
          let MenhirCell1_formule (_menhir_stack, _menhir_s, f1) = _menhir_stack in
          let f2 = _v in
          let _v = _menhir_action_08 f1 f2 in
          _menhir_goto_formule _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_061 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_NOT (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TOP ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_02 () in
          _menhir_run_100_spec_061 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | NOT ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState061
      | LPAR ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState061
      | INTC _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let n = _v in
          let _v = _menhir_action_62 n in
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState061 _tok
      | IDENT _v ->
          _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState061
      | FC _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let x = _v in
          let _v = _menhir_action_63 x in
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState061 _tok
      | EXISTS ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState061
      | BOTTOM ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_03 () in
          _menhir_run_100_spec_061 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | ALL ->
          _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState061
      | AD ->
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState061
      | _ ->
          _menhir_error_run_059 _menhir_stack _menhir_lexbuf MenhirState061
  
  and _menhir_run_100_spec_061 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_NOT -> _ -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let a = _v in
      let _v = _menhir_action_07 a in
      _menhir_run_123 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_run_123 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_NOT -> _ -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_NOT (_menhir_stack, _menhir_s) = _menhir_stack in
      let f1 = _v in
      let _v = _menhir_action_14 f1 in
      _menhir_goto_formule _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_062 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LPAR (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TOP ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_02 () in
          _menhir_run_121 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState062 _tok
      | NOT ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState062
      | LPAR ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState062
      | INTC _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let n = _v in
          let _v = _menhir_action_62 n in
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState062 _tok
      | IDENT _v ->
          _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState062
      | FC _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let x = _v in
          let _v = _menhir_action_63 x in
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState062 _tok
      | EXISTS ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState062
      | BOTTOM ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_03 () in
          _menhir_run_121 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState062 _tok
      | ALL ->
          _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState062
      | AD ->
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState062
      | _ ->
          _menhir_error_run_059 _menhir_stack _menhir_lexbuf MenhirState062
  
  and _menhir_run_092 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | EQ ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | INTC _v_0 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let n = _v_0 in
              let _v = _menhir_action_62 n in
              _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | IDENT _v_2 ->
              _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState093
          | FC _v_3 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let x = _v_3 in
              let _v = _menhir_action_63 x in
              _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_094 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_term -> _ -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_term (_menhir_stack, _menhir_s, t1) = _menhir_stack in
      let t2 = _v in
      let _v = _menhir_action_04 t1 t2 in
      _menhir_goto_atom _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_005 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPAR ->
          let _menhir_stack = MenhirCell1_IDENT (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | INTC _v_0 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let n = _v_0 in
              let _v = _menhir_action_62 n in
              _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState006 _tok
          | IDENT _v_2 ->
              _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState006
          | FC _v_3 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let x = _v_3 in
              let _v = _menhir_action_63 x in
              _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState006 _tok
          | RPAR ->
              let _v = _menhir_action_22 () in
              _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v
          | _ ->
              _eRR ())
      | AND | COMMA | EOF | IMP | OR | RPAR ->
          let i = _v in
          let _v = _menhir_action_60 i in
          _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_008 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | COMMA ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | INTC _v_0 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let n = _v_0 in
              let _v = _menhir_action_62 n in
              _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState009 _tok
          | IDENT _v_2 ->
              _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState009
          | FC _v_3 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let x = _v_3 in
              let _v = _menhir_action_63 x in
              _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState009 _tok
          | _ ->
              _eRR ())
      | RPAR ->
          let x = _v in
          let _v = _menhir_action_55 x in
          _menhir_goto_separated_nonempty_list_COMMA_term_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_separated_nonempty_list_COMMA_term_ : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState088 ->
          _menhir_run_011_spec_088 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState064 ->
          _menhir_run_011_spec_064 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState021 ->
          _menhir_run_011_spec_021 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState004 ->
          _menhir_run_011_spec_004 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState006 ->
          _menhir_run_011_spec_006 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState009 ->
          _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_011_spec_088 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_AD _menhir_cell0_IDENT -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let x = _v in
      let _v = _menhir_action_23 x in
      _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer _v
  
  and _menhir_run_089 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_AD _menhir_cell0_IDENT -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | RPAR ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell0_IDENT (_menhir_stack, i) = _menhir_stack in
          let MenhirCell1_AD (_menhir_stack, _menhir_s) = _menhir_stack in
          let xs = _v in
          let _v = _menhir_action_18 i xs in
          _menhir_goto_formule _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_011_spec_064 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_IDENT -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let x = _v in
      let _v = _menhir_action_23 x in
      _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _v
  
  and _menhir_run_065 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_IDENT -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | AND | EOF | IMP | OR | RPAR ->
          let MenhirCell1_IDENT (_menhir_stack, _menhir_s, i) = _menhir_stack in
          let xs = _v in
          let _v = _menhir_action_05 i xs in
          _menhir_goto_atom _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | EQ ->
          let MenhirCell1_IDENT (_menhir_stack, _menhir_s, i) = _menhir_stack in
          let xs = _v in
          let _v = _menhir_action_61 i xs in
          _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_term : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState168 ->
          _menhir_run_173 _menhir_stack _v _tok
      | MenhirState148 ->
          _menhir_run_149 _menhir_stack _v _tok
      | MenhirState134 ->
          _menhir_run_139 _menhir_stack _v _tok
      | MenhirState093 ->
          _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState184 ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState166 ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState162 ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState159 ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState127 ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState058 ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState061 ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState118 ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState114 ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState110 ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState062 ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState078 ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState101 ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState098 ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState096 ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState084 ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState040 ->
          _menhir_run_041 _menhir_stack _v _tok
      | MenhirState018 ->
          _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState000 ->
          _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState088 ->
          _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState064 ->
          _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState021 ->
          _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState004 ->
          _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState009 ->
          _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState006 ->
          _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_011_spec_021 : type  ttv_stack. (ttv_stack, _menhir_box_atom) _menhir_cell1_IDENT -> _ -> _ -> _ -> _ -> _menhir_box_atom =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let x = _v in
      let _v = _menhir_action_23 x in
      _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_run_022 : type  ttv_stack. (ttv_stack, _menhir_box_atom) _menhir_cell1_IDENT -> _ -> _ -> _ -> _ -> _menhir_box_atom =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_IDENT (_menhir_stack, _menhir_s, i) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_61 i xs in
      _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_011_spec_004 : type  ttv_stack. (ttv_stack, _menhir_box_atom) _menhir_cell1_IDENT -> _ -> _ -> _ -> _menhir_box_atom =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let x = _v in
      let _v = _menhir_action_23 x in
      _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v
  
  and _menhir_run_014 : type  ttv_stack. (ttv_stack, _menhir_box_atom) _menhir_cell1_IDENT -> _ -> _ -> _ -> _menhir_box_atom =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_IDENT (_menhir_stack, _menhir_s, i) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_61 i xs in
      _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_011_spec_006 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_IDENT -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let x = _v in
      let _v = _menhir_action_23 x in
      _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v
  
  and _menhir_run_012 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_IDENT -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_IDENT (_menhir_stack, _menhir_s, i) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_61 i xs in
      _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_010 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_term -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_term (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_56 x xs in
      _menhir_goto_separated_nonempty_list_COMMA_term_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_063 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPAR ->
          let _menhir_stack = MenhirCell1_IDENT (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | INTC _v_0 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let n = _v_0 in
              let _v = _menhir_action_62 n in
              _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState064 _tok
          | IDENT _v_2 ->
              _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState064
          | FC _v_3 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let x = _v_3 in
              let _v = _menhir_action_63 x in
              _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState064 _tok
          | RPAR ->
              let _v = _menhir_action_22 () in
              _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _v
          | _ ->
              _eRR ())
      | EQ ->
          let i = _v in
          let _v = _menhir_action_60 i in
          _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_067 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_EXISTS (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPAR ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | IDENT _v ->
              _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState068
          | RPAR ->
              let _v = _menhir_action_20 () in
              _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState068
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_069 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_IDENT (_menhir_stack, _menhir_s, _v) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | COLON ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | REAL ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_57 () in
              _menhir_goto_sort _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | INT ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_58 () in
              _menhir_goto_sort _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | IDENT _v_2 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let i = _v_2 in
              let _v = _menhir_action_59 i in
              _menhir_goto_sort _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_goto_sort : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_IDENT -> _ -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_IDENT (_menhir_stack, _menhir_s, i) = _menhir_stack in
      let s = _v in
      let _v = _menhir_action_06 i s in
      match (_tok : MenhirBasics.token) with
      | COMMA ->
          let _menhir_stack = MenhirCell1_declaration_param (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | IDENT _v ->
              _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState104
          | _ ->
              _eRR ())
      | RPAR ->
          let x = _v in
          let _v = _menhir_action_53 x in
          _menhir_goto_separated_nonempty_list_COMMA_declaration_param_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_goto_separated_nonempty_list_COMMA_declaration_param_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState104 ->
          _menhir_run_105 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState081 ->
          _menhir_run_075_spec_081 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState068 ->
          _menhir_run_075_spec_068 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_105 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_declaration_param -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_declaration_param (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_54 x xs in
      _menhir_goto_separated_nonempty_list_COMMA_declaration_param_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_run_075_spec_081 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_ALL -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let x = _v in
      let _v = _menhir_action_21 x in
      _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState081
  
  and _menhir_run_082 : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_ALL as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_loption_separated_nonempty_list_COMMA_declaration_param__ (_menhir_stack, _menhir_s, _v) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | COMMA ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TOP ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_02 () in
              _menhir_run_100_spec_084 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | NOT ->
              _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState084
          | LPAR ->
              _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState084
          | INTC _v_1 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let n = _v_1 in
              let _v = _menhir_action_62 n in
              _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState084 _tok
          | IDENT _v_3 ->
              _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer _v_3 MenhirState084
          | FC _v_4 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let x = _v_4 in
              let _v = _menhir_action_63 x in
              _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState084 _tok
          | EXISTS ->
              _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState084
          | BOTTOM ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_03 () in
              _menhir_run_100_spec_084 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | ALL ->
              _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState084
          | AD ->
              _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState084
          | _ ->
              _menhir_error_run_059 _menhir_stack _menhir_lexbuf MenhirState084)
      | _ ->
          _eRR ()
  
  and _menhir_run_100_spec_084 : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_ALL, _menhir_box_program) _menhir_cell1_loption_separated_nonempty_list_COMMA_declaration_param__ -> _ -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let a = _v in
      let _v = _menhir_action_07 a in
      _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState084 _tok
  
  and _menhir_run_095 : type  ttv_stack. (((ttv_stack, _menhir_box_program) _menhir_cell1_ALL, _menhir_box_program) _menhir_cell1_loption_separated_nonempty_list_COMMA_declaration_param__ as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | OR ->
          let _menhir_stack = MenhirCell1_formule (_menhir_stack, _menhir_s, _v) in
          _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer
      | IMP ->
          let _menhir_stack = MenhirCell1_formule (_menhir_stack, _menhir_s, _v) in
          _menhir_run_101 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          let _menhir_stack = MenhirCell1_formule (_menhir_stack, _menhir_s, _v) in
          _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EOF | RPAR ->
          let MenhirCell1_loption_separated_nonempty_list_COMMA_declaration_param__ (_menhir_stack, _, xs) = _menhir_stack in
          let MenhirCell1_ALL (_menhir_stack, _menhir_s) = _menhir_stack in
          let f1 = _v in
          let _v = _menhir_action_16 f1 xs in
          _menhir_goto_formule _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_101 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_formule -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TOP ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_02 () in
          _menhir_run_100_spec_101 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | NOT ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState101
      | LPAR ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState101
      | INTC _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let n = _v in
          let _v = _menhir_action_62 n in
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState101 _tok
      | IDENT _v ->
          _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState101
      | FC _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let x = _v in
          let _v = _menhir_action_63 x in
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState101 _tok
      | EXISTS ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState101
      | BOTTOM ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_03 () in
          _menhir_run_100_spec_101 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | ALL ->
          _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState101
      | AD ->
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState101
      | _ ->
          _menhir_error_run_059 _menhir_stack _menhir_lexbuf MenhirState101
  
  and _menhir_run_100_spec_101 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_formule -> _ -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let a = _v in
      let _v = _menhir_action_07 a in
      _menhir_run_102 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState101 _tok
  
  and _menhir_run_102 : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_formule as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | OR ->
          let _menhir_stack = MenhirCell1_formule (_menhir_stack, _menhir_s, _v) in
          _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer
      | IMP ->
          let _menhir_stack = MenhirCell1_formule (_menhir_stack, _menhir_s, _v) in
          _menhir_run_101 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          let _menhir_stack = MenhirCell1_formule (_menhir_stack, _menhir_s, _v) in
          _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EOF | RPAR ->
          let MenhirCell1_formule (_menhir_stack, _menhir_s, f1) = _menhir_stack in
          let f2 = _v in
          let _v = _menhir_action_10 f1 f2 in
          _menhir_goto_formule _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_080 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_ALL (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPAR ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | IDENT _v ->
              _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState081
          | RPAR ->
              let _v = _menhir_action_20 () in
              _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState081
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_085 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_AD (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPAR ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | IDENT _v ->
              let _menhir_stack = MenhirCell0_IDENT (_menhir_stack, _v) in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | LPAR ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | INTC _v_0 ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      let n = _v_0 in
                      let _v = _menhir_action_62 n in
                      _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState088 _tok
                  | IDENT _v_2 ->
                      _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState088
                  | FC _v_3 ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      let x = _v_3 in
                      let _v = _menhir_action_63 x in
                      _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState088 _tok
                  | RPAR ->
                      let _v = _menhir_action_22 () in
                      _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer _v
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_075_spec_068 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_EXISTS -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let x = _v in
      let _v = _menhir_action_21 x in
      _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState068
  
  and _menhir_run_076 : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_EXISTS as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_loption_separated_nonempty_list_COMMA_declaration_param__ (_menhir_stack, _menhir_s, _v) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | COMMA ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TOP ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_02 () in
              _menhir_run_100_spec_078 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | NOT ->
              _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState078
          | LPAR ->
              _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState078
          | INTC _v_1 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let n = _v_1 in
              let _v = _menhir_action_62 n in
              _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState078 _tok
          | IDENT _v_3 ->
              _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer _v_3 MenhirState078
          | FC _v_4 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let x = _v_4 in
              let _v = _menhir_action_63 x in
              _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState078 _tok
          | EXISTS ->
              _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState078
          | BOTTOM ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_03 () in
              _menhir_run_100_spec_078 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | ALL ->
              _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState078
          | AD ->
              _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState078
          | _ ->
              _menhir_error_run_059 _menhir_stack _menhir_lexbuf MenhirState078)
      | _ ->
          _eRR ()
  
  and _menhir_run_100_spec_078 : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_EXISTS, _menhir_box_program) _menhir_cell1_loption_separated_nonempty_list_COMMA_declaration_param__ -> _ -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let a = _v in
      let _v = _menhir_action_07 a in
      _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState078 _tok
  
  and _menhir_run_106 : type  ttv_stack. (((ttv_stack, _menhir_box_program) _menhir_cell1_EXISTS, _menhir_box_program) _menhir_cell1_loption_separated_nonempty_list_COMMA_declaration_param__ as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | OR ->
          let _menhir_stack = MenhirCell1_formule (_menhir_stack, _menhir_s, _v) in
          _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer
      | IMP ->
          let _menhir_stack = MenhirCell1_formule (_menhir_stack, _menhir_s, _v) in
          _menhir_run_101 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          let _menhir_stack = MenhirCell1_formule (_menhir_stack, _menhir_s, _v) in
          _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EOF | RPAR ->
          let MenhirCell1_loption_separated_nonempty_list_COMMA_declaration_param__ (_menhir_stack, _, xs) = _menhir_stack in
          let MenhirCell1_EXISTS (_menhir_stack, _menhir_s) = _menhir_stack in
          let f1 = _v in
          let _v = _menhir_action_17 f1 xs in
          _menhir_goto_formule _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_175 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | OR ->
          let _menhir_stack = MenhirCell1_formule (_menhir_stack, _menhir_s, _v) in
          _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer
      | IMP ->
          let _menhir_stack = MenhirCell1_formule (_menhir_stack, _menhir_s, _v) in
          _menhir_run_101 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EOF ->
          let f = _v in
          let _v = _menhir_action_48 f in
          _menhir_goto_program _menhir_stack _v
      | AND ->
          let _menhir_stack = MenhirCell1_formule (_menhir_stack, _menhir_s, _v) in
          _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_160 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | OR ->
          let _menhir_stack = MenhirCell1_formule (_menhir_stack, _menhir_s, _v) in
          _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer
      | IMP ->
          let _menhir_stack = MenhirCell1_formule (_menhir_stack, _menhir_s, _v) in
          _menhir_run_101 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EOF ->
          let f = _v in
          let _v = _menhir_action_36 f in
          _menhir_goto_program _menhir_stack _v
      | AND ->
          let _menhir_stack = MenhirCell1_formule (_menhir_stack, _menhir_s, _v) in
          _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_128 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | OR ->
          let _menhir_stack = MenhirCell1_formule (_menhir_stack, _menhir_s, _v) in
          _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer
      | IMP ->
          let _menhir_stack = MenhirCell1_formule (_menhir_stack, _menhir_s, _v) in
          _menhir_run_101 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EOF ->
          let f = _v in
          let _v = _menhir_action_33 f in
          _menhir_goto_program _menhir_stack _v
      | AND ->
          let _menhir_stack = MenhirCell1_formule (_menhir_stack, _menhir_s, _v) in
          _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_124 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | OR ->
          let _menhir_stack = MenhirCell1_formule (_menhir_stack, _menhir_s, _v) in
          _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer
      | IMP ->
          let _menhir_stack = MenhirCell1_formule (_menhir_stack, _menhir_s, _v) in
          _menhir_run_101 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EOF ->
          let t = _v in
          let _v = _menhir_action_32 t in
          _menhir_goto_program _menhir_stack _v
      | AND ->
          let _menhir_stack = MenhirCell1_formule (_menhir_stack, _menhir_s, _v) in
          _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_119 : type  ttv_stack. (((ttv_stack, _menhir_box_program) _menhir_cell1_LPAR, _menhir_box_program) _menhir_cell1_formule as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | RPAR ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_formule (_menhir_stack, _, f1) = _menhir_stack in
          let MenhirCell1_LPAR (_menhir_stack, _menhir_s) = _menhir_stack in
          let f2 = _v in
          let _v = _menhir_action_12 f1 f2 in
          _menhir_goto_formule _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | OR ->
          let _menhir_stack = MenhirCell1_formule (_menhir_stack, _menhir_s, _v) in
          _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer
      | IMP ->
          let _menhir_stack = MenhirCell1_formule (_menhir_stack, _menhir_s, _v) in
          _menhir_run_101 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          let _menhir_stack = MenhirCell1_formule (_menhir_stack, _menhir_s, _v) in
          _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_115 : type  ttv_stack. (((ttv_stack, _menhir_box_program) _menhir_cell1_LPAR, _menhir_box_program) _menhir_cell1_formule as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | RPAR ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_formule (_menhir_stack, _, f1) = _menhir_stack in
          let MenhirCell1_LPAR (_menhir_stack, _menhir_s) = _menhir_stack in
          let f2 = _v in
          let _v = _menhir_action_13 f1 f2 in
          _menhir_goto_formule _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | OR ->
          let _menhir_stack = MenhirCell1_formule (_menhir_stack, _menhir_s, _v) in
          _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer
      | IMP ->
          let _menhir_stack = MenhirCell1_formule (_menhir_stack, _menhir_s, _v) in
          _menhir_run_101 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          let _menhir_stack = MenhirCell1_formule (_menhir_stack, _menhir_s, _v) in
          _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_111 : type  ttv_stack. (((ttv_stack, _menhir_box_program) _menhir_cell1_LPAR, _menhir_box_program) _menhir_cell1_formule as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | RPAR ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_formule (_menhir_stack, _, f1) = _menhir_stack in
          let MenhirCell1_LPAR (_menhir_stack, _menhir_s) = _menhir_stack in
          let f2 = _v in
          let _v = _menhir_action_11 f1 f2 in
          _menhir_goto_formule _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | OR ->
          let _menhir_stack = MenhirCell1_formule (_menhir_stack, _menhir_s, _v) in
          _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer
      | IMP ->
          let _menhir_stack = MenhirCell1_formule (_menhir_stack, _menhir_s, _v) in
          _menhir_run_101 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          let _menhir_stack = MenhirCell1_formule (_menhir_stack, _menhir_s, _v) in
          _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_107 : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_LPAR as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_formule (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | RPAR ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | OR ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | LPAR ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | TOP ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      let _v = _menhir_action_02 () in
                      _menhir_run_100_spec_110 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
                  | NOT ->
                      _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState110
                  | LPAR ->
                      _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState110
                  | INTC _v_1 ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      let n = _v_1 in
                      let _v = _menhir_action_62 n in
                      _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState110 _tok
                  | IDENT _v_3 ->
                      _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer _v_3 MenhirState110
                  | FC _v_4 ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      let x = _v_4 in
                      let _v = _menhir_action_63 x in
                      _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState110 _tok
                  | EXISTS ->
                      _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState110
                  | BOTTOM ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      let _v = _menhir_action_03 () in
                      _menhir_run_100_spec_110 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
                  | ALL ->
                      _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState110
                  | AD ->
                      _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState110
                  | _ ->
                      _menhir_error_run_059 _menhir_stack _menhir_lexbuf MenhirState110)
              | _ ->
                  _eRR ())
          | IMP ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | LPAR ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | TOP ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      let _v = _menhir_action_02 () in
                      _menhir_run_100_spec_114 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
                  | NOT ->
                      _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState114
                  | LPAR ->
                      _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState114
                  | INTC _v_8 ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      let n = _v_8 in
                      let _v = _menhir_action_62 n in
                      _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState114 _tok
                  | IDENT _v_10 ->
                      _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer _v_10 MenhirState114
                  | FC _v_11 ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      let x = _v_11 in
                      let _v = _menhir_action_63 x in
                      _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState114 _tok
                  | EXISTS ->
                      _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState114
                  | BOTTOM ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      let _v = _menhir_action_03 () in
                      _menhir_run_100_spec_114 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
                  | ALL ->
                      _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState114
                  | AD ->
                      _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState114
                  | _ ->
                      _menhir_error_run_059 _menhir_stack _menhir_lexbuf MenhirState114)
              | _ ->
                  _eRR ())
          | AND ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | LPAR ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | TOP ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      let _v = _menhir_action_02 () in
                      _menhir_run_100_spec_118 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
                  | NOT ->
                      _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState118
                  | LPAR ->
                      _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState118
                  | INTC _v_15 ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      let n = _v_15 in
                      let _v = _menhir_action_62 n in
                      _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState118 _tok
                  | IDENT _v_17 ->
                      _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer _v_17 MenhirState118
                  | FC _v_18 ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      let x = _v_18 in
                      let _v = _menhir_action_63 x in
                      _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState118 _tok
                  | EXISTS ->
                      _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState118
                  | BOTTOM ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      let _v = _menhir_action_03 () in
                      _menhir_run_100_spec_118 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
                  | ALL ->
                      _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState118
                  | AD ->
                      _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState118
                  | _ ->
                      _menhir_error_run_059 _menhir_stack _menhir_lexbuf MenhirState118)
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | OR ->
          _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer
      | IMP ->
          _menhir_run_101 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_100_spec_110 : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_LPAR, _menhir_box_program) _menhir_cell1_formule -> _ -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let a = _v in
      let _v = _menhir_action_07 a in
      _menhir_run_111 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState110 _tok
  
  and _menhir_run_100_spec_114 : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_LPAR, _menhir_box_program) _menhir_cell1_formule -> _ -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let a = _v in
      let _v = _menhir_action_07 a in
      _menhir_run_115 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState114 _tok
  
  and _menhir_run_100_spec_118 : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_LPAR, _menhir_box_program) _menhir_cell1_formule -> _ -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let a = _v in
      let _v = _menhir_action_07 a in
      _menhir_run_119 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState118 _tok
  
  and _menhir_run_100_spec_184 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let a = _v in
      let _v = _menhir_action_07 a in
      _menhir_run_185 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState184 _tok
  
  and _menhir_run_100_spec_166 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let a = _v in
      let _v = _menhir_action_07 a in
      _menhir_run_175 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState166 _tok
  
  and _menhir_run_100_spec_159 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let a = _v in
      let _v = _menhir_action_07 a in
      _menhir_run_160 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState159 _tok
  
  and _menhir_run_100_spec_127 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let a = _v in
      let _v = _menhir_action_07 a in
      _menhir_run_128 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState127 _tok
  
  and _menhir_run_100_spec_058 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let a = _v in
      let _v = _menhir_action_07 a in
      _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState058 _tok
  
  let rec _menhir_run_000 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_atom =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TOP ->
          let _v = _menhir_action_02 () in
          _menhir_run_026_spec_000 _menhir_stack _v
      | INTC _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let n = _v in
          let _v = _menhir_action_62 n in
          _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState000 _tok
      | IDENT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LPAR ->
              let _menhir_stack = MenhirCell1_IDENT (_menhir_stack, MenhirState000, _v) in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | INTC _v_0 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let n = _v_0 in
                  let _v = _menhir_action_62 n in
                  _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState004 _tok
              | IDENT _v_2 ->
                  _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState004
              | FC _v_3 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let x = _v_3 in
                  let _v = _menhir_action_63 x in
                  _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState004 _tok
              | RPAR ->
                  let _v = _menhir_action_22 () in
                  _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v
              | _ ->
                  _eRR ())
          | EQ ->
              let _v =
                let i = _v in
                _menhir_action_60 i
              in
              _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState000 _tok
          | _ ->
              _eRR ())
      | FC _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let x = _v in
          let _v = _menhir_action_63 x in
          _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState000 _tok
      | BOTTOM ->
          let _v = _menhir_action_03 () in
          _menhir_run_026_spec_000 _menhir_stack _v
      | _ ->
          _eRR ()
  
  let rec _menhir_run_027 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VFH ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | COLON ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | INTC _v ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | SEMI ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      (match (_tok : MenhirBasics.token) with
                      | IDENT _v_0 ->
                          let _tok = _menhir_lexer _menhir_lexbuf in
                          (match (_tok : MenhirBasics.token) with
                          | EOF ->
                              let (i, t) = (_v, _v_0) in
                              let _v = _menhir_action_42 i t in
                              _menhir_goto_program _menhir_stack _v
                          | _ ->
                              _eRR ())
                      | _ ->
                          _eRR ())
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | UNPACK ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | EOF ->
              let _v = _menhir_action_51 () in
              _menhir_goto_program _menhir_stack _v
          | _ ->
              _eRR ())
      | UFH ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | COLON ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | INTC _v ->
                  let _menhir_stack = MenhirCell0_INTC (_menhir_stack, _v) in
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | SEMI ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      (match (_tok : MenhirBasics.token) with
                      | INTC _v_1 ->
                          let _tok = _menhir_lexer _menhir_lexbuf in
                          let n = _v_1 in
                          let _v = _menhir_action_62 n in
                          _menhir_run_041 _menhir_stack _v _tok
                      | IDENT _v_3 ->
                          _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v_3 MenhirState040
                      | FC _v_4 ->
                          let _tok = _menhir_lexer _menhir_lexbuf in
                          let x = _v_4 in
                          let _v = _menhir_action_63 x in
                          _menhir_run_041 _menhir_stack _v _tok
                      | _ ->
                          _eRR ())
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | SWAP ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | COLON ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | INTC _v ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | EOF ->
                      let i = _v in
                      let _v = _menhir_action_38 i in
                      _menhir_goto_program _menhir_stack _v
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | SPLITH ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | COLON ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | INTC _v ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | EOF ->
                      let i = _v in
                      let _v = _menhir_action_40 i in
                      _menhir_goto_program _menhir_stack _v
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | REPLACE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | COLON ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | INTC _v ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | EOF ->
                      let i = _v in
                      let _v = _menhir_action_50 i in
                      _menhir_goto_program _menhir_stack _v
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | PNG ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | EOF ->
              let _v = _menhir_action_35 () in
              _menhir_goto_program _menhir_stack _v
          | _ ->
              _eRR ())
      | MP ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | COLON ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | TOP ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_02 () in
                  _menhir_run_100_spec_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
              | NOT ->
                  _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState058
              | LPAR ->
                  _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState058
              | INTC _v ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let n = _v in
                  let _v = _menhir_action_62 n in
                  _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState058 _tok
              | IDENT _v ->
                  _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState058
              | FC _v ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let x = _v in
                  let _v = _menhir_action_63 x in
                  _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState058 _tok
              | EXISTS ->
                  _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState058
              | BOTTOM ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_03 () in
                  _menhir_run_100_spec_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
              | ALL ->
                  _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState058
              | AD ->
                  _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState058
              | _ ->
                  _menhir_error_run_059 _menhir_stack _menhir_lexbuf MenhirState058)
          | _ ->
              _eRR ())
      | LEMME ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | COLON ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | TOP ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_02 () in
                  _menhir_run_100_spec_127 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
              | NOT ->
                  _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState127
              | LPAR ->
                  _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState127
              | INTC _v ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let n = _v in
                  let _v = _menhir_action_62 n in
                  _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState127 _tok
              | IDENT _v ->
                  _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState127
              | FC _v ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let x = _v in
                  let _v = _menhir_action_63 x in
                  _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState127 _tok
              | EXISTS ->
                  _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState127
              | BOTTOM ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_03 () in
                  _menhir_run_100_spec_127 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
              | ALL ->
                  _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState127
              | AD ->
                  _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState127
              | _ ->
                  _menhir_error_run_059 _menhir_stack _menhir_lexbuf MenhirState127)
          | _ ->
              _eRR ())
      | IOL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | EOF ->
              let _v = _menhir_action_27 () in
              _menhir_goto_program _menhir_stack _v
          | _ ->
              _eRR ())
      | INTRO ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | EOF ->
              let _v = _menhir_action_43 () in
              _menhir_goto_program _menhir_stack _v
          | COLON ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | QTE ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | IDENT _v ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      (match (_tok : MenhirBasics.token) with
                      | QTE ->
                          let _tok = _menhir_lexer _menhir_lexbuf in
                          (match (_tok : MenhirBasics.token) with
                          | EOF ->
                              let i = _v in
                              let _v = _menhir_action_44 i in
                              _menhir_goto_program _menhir_stack _v
                          | _ ->
                              _eRR ())
                      | _ ->
                          _eRR ())
                  | _ ->
                      _eRR ())
              | INTC _v ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let n = _v in
                  let _v = _menhir_action_62 n in
                  _menhir_run_139 _menhir_stack _v _tok
              | IDENT _v ->
                  _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState134
              | FC _v ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let x = _v in
                  let _v = _menhir_action_63 x in
                  _menhir_run_139 _menhir_stack _v _tok
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | II ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | EOF ->
              let _v = _menhir_action_29 () in
              _menhir_goto_program _menhir_stack _v
          | _ ->
              _eRR ())
      | IFA ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | COLON ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | IDENT _v ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | EOF ->
                      let s = _v in
                      let _v = _menhir_action_30 s in
                      _menhir_goto_program _menhir_stack _v
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | IEXIST ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | COLON ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | INTC _v ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let n = _v in
                  let _v = _menhir_action_62 n in
                  _menhir_run_149 _menhir_stack _v _tok
              | IDENT _v ->
                  _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState148
              | FC _v ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let x = _v in
                  let _v = _menhir_action_63 x in
                  _menhir_run_149 _menhir_stack _v _tok
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | IEXA ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | EOF ->
              let _v = _menhir_action_24 () in
              _menhir_goto_program _menhir_stack _v
          | _ ->
              _eRR ())
      | IAX ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | EOF ->
              let _v = _menhir_action_25 () in
              _menhir_goto_program _menhir_stack _v
          | _ ->
              _eRR ())
      | IAND ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | EOF ->
              let _v = _menhir_action_26 () in
              _menhir_goto_program _menhir_stack _v
          | _ ->
              _eRR ())
      | IABS ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | EOF ->
              let _v = _menhir_action_28 () in
              _menhir_goto_program _menhir_stack _v
          | _ ->
              _eRR ())
      | ETP ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TOP ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_02 () in
              _menhir_run_100_spec_159 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | NOT ->
              _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState159
          | LPAR ->
              _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState159
          | INTC _v ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let n = _v in
              let _v = _menhir_action_62 n in
              _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState159 _tok
          | IDENT _v ->
              _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState159
          | FC _v ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let x = _v in
              let _v = _menhir_action_63 x in
              _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState159 _tok
          | EXISTS ->
              _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState159
          | BOTTOM ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_03 () in
              _menhir_run_100_spec_159 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | ALL ->
              _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState159
          | AD ->
              _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState159
          | _ ->
              _menhir_error_run_059 _menhir_stack _menhir_lexbuf MenhirState159)
      | EQL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TOP ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_02 () in
              _menhir_run_163 _menhir_stack _v _tok
          | INTC _v ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let n = _v in
              let _v = _menhir_action_62 n in
              _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState162 _tok
          | IDENT _v ->
              _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState162
          | FC _v ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let x = _v in
              let _v = _menhir_action_63 x in
              _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState162 _tok
          | BOTTOM ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_03 () in
              _menhir_run_163 _menhir_stack _v _tok
          | _ ->
              _eRR ())
      | ELIM ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | COLON ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | TOP ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_02 () in
                  _menhir_run_100_spec_166 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
              | NOT ->
                  _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState166
              | LPAR ->
                  _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState166
              | INTC _v ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | SEMI ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      (match (_tok : MenhirBasics.token) with
                      | QTE ->
                          let _tok = _menhir_lexer _menhir_lexbuf in
                          (match (_tok : MenhirBasics.token) with
                          | IDENT _v_6 ->
                              let _tok = _menhir_lexer _menhir_lexbuf in
                              (match (_tok : MenhirBasics.token) with
                              | QTE ->
                                  let _tok = _menhir_lexer _menhir_lexbuf in
                                  (match (_tok : MenhirBasics.token) with
                                  | EOF ->
                                      let (i, d) = (_v_6, _v) in
                                      let _v = _menhir_action_47 d i in
                                      _menhir_goto_program _menhir_stack _v
                                  | _ ->
                                      _eRR ())
                              | _ ->
                                  _eRR ())
                          | _ ->
                              _eRR ())
                      | INTC _v_7 ->
                          let _menhir_stack = MenhirCell1_INTC (_menhir_stack, MenhirState166, _v) in
                          let _tok = _menhir_lexer _menhir_lexbuf in
                          let n = _v_7 in
                          let _v = _menhir_action_62 n in
                          _menhir_run_173 _menhir_stack _v _tok
                      | IDENT _v_9 ->
                          let _menhir_stack = MenhirCell1_INTC (_menhir_stack, MenhirState166, _v) in
                          _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v_9 MenhirState168
                      | FC _v_10 ->
                          let _menhir_stack = MenhirCell1_INTC (_menhir_stack, MenhirState166, _v) in
                          let _tok = _menhir_lexer _menhir_lexbuf in
                          let x = _v_10 in
                          let _v = _menhir_action_63 x in
                          _menhir_run_173 _menhir_stack _v _tok
                      | _ ->
                          _eRR ())
                  | EQ ->
                      let _v =
                        let n = _v in
                        _menhir_action_62 n
                      in
                      _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState166 _tok
                  | _ ->
                      _eRR ())
              | IDENT _v ->
                  _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState166
              | FC _v ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let x = _v in
                  let _v = _menhir_action_63 x in
                  _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState166 _tok
              | EXISTS ->
                  _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState166
              | BOTTOM ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_03 () in
                  _menhir_run_100_spec_166 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
              | ALL ->
                  _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState166
              | AD ->
                  _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState166
              | _ ->
                  _menhir_error_run_059 _menhir_stack _menhir_lexbuf MenhirState166)
          | _ ->
              _eRR ())
      | DERIVE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | COLON ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | INTC _v ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | EOF ->
                      let i = _v in
                      let _v = _menhir_action_49 i in
                      _menhir_goto_program _menhir_stack _v
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | CONTRAPOSE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | EOF ->
              let _v = _menhir_action_34 () in
              _menhir_goto_program _menhir_stack _v
          | _ ->
              _eRR ())
      | CONH ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | COLON ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | TOP ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_02 () in
                  _menhir_run_100_spec_184 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
              | NOT ->
                  _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState184
              | LPAR ->
                  _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState184
              | INTC _v ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let n = _v in
                  let _v = _menhir_action_62 n in
                  _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState184 _tok
              | IDENT _v ->
                  _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState184
              | FC _v ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let x = _v in
                  let _v = _menhir_action_63 x in
                  _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState184 _tok
              | EXISTS ->
                  _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState184
              | BOTTOM ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_03 () in
                  _menhir_run_100_spec_184 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
              | ALL ->
                  _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState184
              | AD ->
                  _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState184
              | _ ->
                  _menhir_error_run_059 _menhir_stack _menhir_lexbuf MenhirState184)
          | _ ->
              _eRR ())
      | _ ->
          let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
          let _startpos__1_ = _startpos in
          let _v = _menhir_action_52 _startpos__1_ in
          MenhirBox_program _v
  
end

let program =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_program v = _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v

let atom =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_atom v = _menhir_run_000 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v
