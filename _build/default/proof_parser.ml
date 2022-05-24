
module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
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
    | INTC of (
# 9 "proof_parser.mly"
       (int)
# 31 "proof_parser.ml"
  )
    | INT
    | INFEQ
    | IMP
    | IDENT of (
# 8 "proof_parser.mly"
       (string)
# 39 "proof_parser.ml"
  )
    | HYP
    | GOAL
    | FUN
    | FC of (
# 10 "proof_parser.mly"
       (float)
# 47 "proof_parser.ml"
  )
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
  
end

include MenhirBasics

# 1 "proof_parser.mly"
  open Utility
  open Lexing
  open Proof_ast

  


# 77 "proof_parser.ml"

type ('s, 'r) _menhir_state = 
  | MenhirState003 : ('s, _menhir_box_program) _menhir_state
    (** State 003.
        Stack shape : .
        Start symbol: program. *)

  | MenhirState009 : (('s, _menhir_box_program) _menhir_cell1_RELAT _menhir_cell0_IDENT, _menhir_box_program) _menhir_state
    (** State 009.
        Stack shape : RELAT IDENT.
        Start symbol: program. *)

  | MenhirState014 : (('s, _menhir_box_program) _menhir_cell1_sort, _menhir_box_program) _menhir_state
    (** State 014.
        Stack shape : sort.
        Start symbol: program. *)

  | MenhirState021 : (('s, _menhir_box_program) _menhir_cell1_FUN _menhir_cell0_IDENT, _menhir_box_program) _menhir_state
    (** State 021.
        Stack shape : FUN IDENT.
        Start symbol: program. *)

  | MenhirState023 : ((('s, _menhir_box_program) _menhir_cell1_FUN _menhir_cell0_IDENT, _menhir_box_program) _menhir_cell1_loption_separated_nonempty_list_MUL_sort__, _menhir_box_program) _menhir_state
    (** State 023.
        Stack shape : FUN IDENT loption(separated_nonempty_list(MUL,sort)).
        Start symbol: program. *)

  | MenhirState029 : (('s, _menhir_box_program) _menhir_cell1_CONST _menhir_cell0_IDENT, _menhir_box_program) _menhir_state
    (** State 029.
        Stack shape : CONST IDENT.
        Start symbol: program. *)

  | MenhirState032 : (('s, _menhir_box_program) _menhir_cell1_sort_sigma, _menhir_box_program) _menhir_state
    (** State 032.
        Stack shape : sort_sigma.
        Start symbol: program. *)

  | MenhirState033 : (('s, _menhir_box_program) _menhir_cell1_relat_sigma, _menhir_box_program) _menhir_state
    (** State 033.
        Stack shape : relat_sigma.
        Start symbol: program. *)

  | MenhirState035 : (('s, _menhir_box_program) _menhir_cell1_fun_sigma_pv, _menhir_box_program) _menhir_state
    (** State 035.
        Stack shape : fun_sigma_pv.
        Start symbol: program. *)

  | MenhirState037 : (('s, _menhir_box_program) _menhir_cell1_const_sigma_pv, _menhir_box_program) _menhir_state
    (** State 037.
        Stack shape : const_sigma_pv.
        Start symbol: program. *)

  | MenhirState043 : ('s _menhir_cell0_declaration_sigma, _menhir_box_program) _menhir_state
    (** State 043.
        Stack shape : declaration_sigma.
        Start symbol: program. *)

  | MenhirState046 : (('s, _menhir_box_program) _menhir_cell1_DEF _menhir_cell0_IDENT, _menhir_box_program) _menhir_state
    (** State 046.
        Stack shape : DEF IDENT.
        Start symbol: program. *)

  | MenhirState048 : (('s, _menhir_box_program) _menhir_cell1_IDENT, _menhir_box_program) _menhir_state
    (** State 048.
        Stack shape : IDENT.
        Start symbol: program. *)

  | MenhirState055 : ((('s, _menhir_box_program) _menhir_cell1_DEF _menhir_cell0_IDENT, _menhir_box_program) _menhir_cell1_loption_separated_nonempty_list_COMMA_declaration_param__, _menhir_box_program) _menhir_state
    (** State 055.
        Stack shape : DEF IDENT loption(separated_nonempty_list(COMMA,declaration_param)).
        Start symbol: program. *)

  | MenhirState057 : (('s, _menhir_box_program) _menhir_cell1_NOT, _menhir_box_program) _menhir_state
    (** State 057.
        Stack shape : NOT.
        Start symbol: program. *)

  | MenhirState058 : ((('s, _menhir_box_program) _menhir_cell1_NOT, _menhir_box_program) _menhir_cell1_LPAR, _menhir_box_program) _menhir_state
    (** State 058.
        Stack shape : NOT LPAR.
        Start symbol: program. *)

  | MenhirState059 : (('s, _menhir_box_program) _menhir_cell1_LPAR, _menhir_box_program) _menhir_state
    (** State 059.
        Stack shape : LPAR.
        Start symbol: program. *)

  | MenhirState062 : (('s, _menhir_box_program) _menhir_cell1_IDENT, _menhir_box_program) _menhir_state
    (** State 062.
        Stack shape : IDENT.
        Start symbol: program. *)

  | MenhirState064 : (('s, _menhir_box_program) _menhir_cell1_IDENT, _menhir_box_program) _menhir_state
    (** State 064.
        Stack shape : IDENT.
        Start symbol: program. *)

  | MenhirState067 : (('s, _menhir_box_program) _menhir_cell1_term, _menhir_box_program) _menhir_state
    (** State 067.
        Stack shape : term.
        Start symbol: program. *)

  | MenhirState075 : (('s, _menhir_box_program) _menhir_cell1_EXISTS, _menhir_box_program) _menhir_state
    (** State 075.
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

  | MenhirState086 : (('s, _menhir_box_program) _menhir_cell1_term, _menhir_box_program) _menhir_state
    (** State 086.
        Stack shape : term.
        Start symbol: program. *)

  | MenhirState089 : (('s, _menhir_box_program) _menhir_cell1_formule, _menhir_box_program) _menhir_state
    (** State 089.
        Stack shape : formule.
        Start symbol: program. *)

  | MenhirState091 : (('s, _menhir_box_program) _menhir_cell1_formule, _menhir_box_program) _menhir_state
    (** State 091.
        Stack shape : formule.
        Start symbol: program. *)

  | MenhirState094 : (('s, _menhir_box_program) _menhir_cell1_formule, _menhir_box_program) _menhir_state
    (** State 094.
        Stack shape : formule.
        Start symbol: program. *)

  | MenhirState097 : (('s, _menhir_box_program) _menhir_cell1_declaration_param, _menhir_box_program) _menhir_state
    (** State 097.
        Stack shape : declaration_param.
        Start symbol: program. *)

  | MenhirState103 : ((('s, _menhir_box_program) _menhir_cell1_LPAR, _menhir_box_program) _menhir_cell1_formule, _menhir_box_program) _menhir_state
    (** State 103.
        Stack shape : LPAR formule.
        Start symbol: program. *)

  | MenhirState107 : ((('s, _menhir_box_program) _menhir_cell1_LPAR, _menhir_box_program) _menhir_cell1_formule, _menhir_box_program) _menhir_state
    (** State 107.
        Stack shape : LPAR formule.
        Start symbol: program. *)

  | MenhirState111 : ((('s, _menhir_box_program) _menhir_cell1_LPAR, _menhir_box_program) _menhir_cell1_formule, _menhir_box_program) _menhir_state
    (** State 111.
        Stack shape : LPAR formule.
        Start symbol: program. *)

  | MenhirState120 : (('s _menhir_cell0_declaration_sigma, _menhir_box_program) _menhir_cell1_list_define_form_, _menhir_box_program) _menhir_state
    (** State 120.
        Stack shape : declaration_sigma list(define_form).
        Start symbol: program. *)

  | MenhirState123 : (('s, _menhir_box_program) _menhir_cell1_HYP _menhir_cell0_IDENT, _menhir_box_program) _menhir_state
    (** State 123.
        Stack shape : HYP IDENT.
        Start symbol: program. *)

  | MenhirState128 : ((('s _menhir_cell0_declaration_sigma, _menhir_box_program) _menhir_cell1_list_define_form_, _menhir_box_program) _menhir_cell1_list_hypotheses_ _menhir_cell0_IDENT, _menhir_box_program) _menhir_state
    (** State 128.
        Stack shape : declaration_sigma list(define_form) list(hypotheses) IDENT.
        Start symbol: program. *)

  | MenhirState132 : (('s, _menhir_box_program) _menhir_cell1_hypotheses, _menhir_box_program) _menhir_state
    (** State 132.
        Stack shape : hypotheses.
        Start symbol: program. *)

  | MenhirState134 : (('s, _menhir_box_program) _menhir_cell1_define_form, _menhir_box_program) _menhir_state
    (** State 134.
        Stack shape : define_form.
        Start symbol: program. *)


and ('s, 'r) _menhir_cell1_const_sigma_pv = 
  | MenhirCell1_const_sigma_pv of 's * ('s, 'r) _menhir_state * (Proof_ast.const_sigma)

and ('s, 'r) _menhir_cell1_declaration_param = 
  | MenhirCell1_declaration_param of 's * ('s, 'r) _menhir_state * (Proof_ast.declaration_param)

and 's _menhir_cell0_declaration_sigma = 
  | MenhirCell0_declaration_sigma of 's * (Proof_ast.declaration_sigma)

and ('s, 'r) _menhir_cell1_define_form = 
  | MenhirCell1_define_form of 's * ('s, 'r) _menhir_state * (Proof_ast.define_form)

and ('s, 'r) _menhir_cell1_formule = 
  | MenhirCell1_formule of 's * ('s, 'r) _menhir_state * (Proof_ast.form)

and ('s, 'r) _menhir_cell1_fun_sigma_pv = 
  | MenhirCell1_fun_sigma_pv of 's * ('s, 'r) _menhir_state * (Proof_ast.fun_sigma)

and ('s, 'r) _menhir_cell1_hypotheses = 
  | MenhirCell1_hypotheses of 's * ('s, 'r) _menhir_state * (Proof_ast.hyp)

and ('s, 'r) _menhir_cell1_list_define_form_ = 
  | MenhirCell1_list_define_form_ of 's * ('s, 'r) _menhir_state * (Proof_ast.define_form list)

and ('s, 'r) _menhir_cell1_list_hypotheses_ = 
  | MenhirCell1_list_hypotheses_ of 's * ('s, 'r) _menhir_state * (Proof_ast.hyp list)

and ('s, 'r) _menhir_cell1_loption_separated_nonempty_list_COMMA_declaration_param__ = 
  | MenhirCell1_loption_separated_nonempty_list_COMMA_declaration_param__ of 's * ('s, 'r) _menhir_state * (Proof_ast.declaration_param list)

and ('s, 'r) _menhir_cell1_loption_separated_nonempty_list_MUL_sort__ = 
  | MenhirCell1_loption_separated_nonempty_list_MUL_sort__ of 's * ('s, 'r) _menhir_state * (Proof_ast.sort list)

and ('s, 'r) _menhir_cell1_relat_sigma = 
  | MenhirCell1_relat_sigma of 's * ('s, 'r) _menhir_state * (Proof_ast.relat_sigma)

and ('s, 'r) _menhir_cell1_sort = 
  | MenhirCell1_sort of 's * ('s, 'r) _menhir_state * (Proof_ast.sort)

and ('s, 'r) _menhir_cell1_sort_sigma = 
  | MenhirCell1_sort_sigma of 's * ('s, 'r) _menhir_state * (Proof_ast.sort_sigma)

and ('s, 'r) _menhir_cell1_term = 
  | MenhirCell1_term of 's * ('s, 'r) _menhir_state * (Proof_ast.term)

and ('s, 'r) _menhir_cell1_ALL = 
  | MenhirCell1_ALL of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_CONST = 
  | MenhirCell1_CONST of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_DEF = 
  | MenhirCell1_DEF of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_EXISTS = 
  | MenhirCell1_EXISTS of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_FUN = 
  | MenhirCell1_FUN of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_HYP = 
  | MenhirCell1_HYP of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_IDENT = 
  | MenhirCell1_IDENT of 's * ('s, 'r) _menhir_state * (
# 8 "proof_parser.mly"
       (string)
# 333 "proof_parser.ml"
)

and 's _menhir_cell0_IDENT = 
  | MenhirCell0_IDENT of 's * (
# 8 "proof_parser.mly"
       (string)
# 340 "proof_parser.ml"
)

and ('s, 'r) _menhir_cell1_LPAR = 
  | MenhirCell1_LPAR of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_NOT = 
  | MenhirCell1_NOT of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_RELAT = 
  | MenhirCell1_RELAT of 's * ('s, 'r) _menhir_state

and _menhir_box_program = 
  | MenhirBox_program of (Proof_ast.prog) [@@unboxed]

let _menhir_action_01 =
  fun () ->
    (
# 97 "proof_parser.mly"
        (Top)
# 360 "proof_parser.ml"
     : (Proof_ast.atom))

let _menhir_action_02 =
  fun () ->
    (
# 98 "proof_parser.mly"
          (Bottom)
# 368 "proof_parser.ml"
     : (Proof_ast.atom))

let _menhir_action_03 =
  fun t1 t2 ->
    (
# 99 "proof_parser.mly"
                           (Eq(t1,t2))
# 376 "proof_parser.ml"
     : (Proof_ast.atom))

let _menhir_action_04 =
  fun i xs ->
    let sl = 
# 229 "<standard.mly>"
    ( xs )
# 384 "proof_parser.ml"
     in
    (
# 100 "proof_parser.mly"
                                                        (print_string i ;Rel(i,sl))
# 389 "proof_parser.ml"
     : (Proof_ast.atom))

let _menhir_action_05 =
  fun i s ->
    (
# 63 "proof_parser.mly"
                                        (
    {identcs = i; sort = s}
  )
# 399 "proof_parser.ml"
     : (Proof_ast.const_sigma))

let _menhir_action_06 =
  fun i s ->
    (
# 85 "proof_parser.mly"
                             (
    {identp = i; sortp = s;}
  )
# 409 "proof_parser.ml"
     : (Proof_ast.declaration_param))

let _menhir_action_07 =
  fun () ->
    (
# 45 "proof_parser.mly"
                   ({functions = [] ; const = [] ; sort = [];relat = []})
# 417 "proof_parser.ml"
     : (Proof_ast.declaration_sigma))

let _menhir_action_08 =
  fun i ->
    (
# 46 "proof_parser.mly"
                                                            ( let f,c,s,r = i in {functions = f ; const = c ; sort = s;relat = r;})
# 425 "proof_parser.ml"
     : (Proof_ast.declaration_sigma))

let _menhir_action_09 =
  fun f1 i xs ->
    let d = 
# 229 "<standard.mly>"
    ( xs )
# 433 "proof_parser.ml"
     in
    (
# 82 "proof_parser.mly"
                                                                                                     ({ident = i ;params = d;form = f1})
# 438 "proof_parser.ml"
     : (Proof_ast.define_form))

let _menhir_action_10 =
  fun a ->
    (
# 103 "proof_parser.mly"
             (Atom(a))
# 446 "proof_parser.ml"
     : (Proof_ast.form))

let _menhir_action_11 =
  fun f1 f2 ->
    (
# 104 "proof_parser.mly"
                                 (And(f1,f2))
# 454 "proof_parser.ml"
     : (Proof_ast.form))

let _menhir_action_12 =
  fun f1 f2 ->
    (
# 105 "proof_parser.mly"
                                (Or(f1,f2))
# 462 "proof_parser.ml"
     : (Proof_ast.form))

let _menhir_action_13 =
  fun f1 f2 ->
    (
# 106 "proof_parser.mly"
                                (Imp(f1,f2))
# 470 "proof_parser.ml"
     : (Proof_ast.form))

let _menhir_action_14 =
  fun f1 f2 ->
    (
# 107 "proof_parser.mly"
                                                    (Or(f1,f2))
# 478 "proof_parser.ml"
     : (Proof_ast.form))

let _menhir_action_15 =
  fun f1 f2 ->
    (
# 108 "proof_parser.mly"
                                                     (And(f1,f2))
# 486 "proof_parser.ml"
     : (Proof_ast.form))

let _menhir_action_16 =
  fun f1 f2 ->
    (
# 109 "proof_parser.mly"
                                                     (Imp(f1,f2))
# 494 "proof_parser.ml"
     : (Proof_ast.form))

let _menhir_action_17 =
  fun f1 ->
    (
# 110 "proof_parser.mly"
                    (Not(f1))
# 502 "proof_parser.ml"
     : (Proof_ast.form))

let _menhir_action_18 =
  fun f ->
    (
# 111 "proof_parser.mly"
                              (Not(f))
# 510 "proof_parser.ml"
     : (Proof_ast.form))

let _menhir_action_19 =
  fun a ->
    (
# 112 "proof_parser.mly"
                       (Atom(a))
# 518 "proof_parser.ml"
     : (Proof_ast.form))

let _menhir_action_20 =
  fun f1 xs ->
    let sl = 
# 229 "<standard.mly>"
    ( xs )
# 526 "proof_parser.ml"
     in
    (
# 113 "proof_parser.mly"
                                                                                 (Utility.unflat_all_exists (Alls(sl,f1)))
# 531 "proof_parser.ml"
     : (Proof_ast.form))

let _menhir_action_21 =
  fun f1 xs ->
    let sl = 
# 229 "<standard.mly>"
    ( xs )
# 539 "proof_parser.ml"
     in
    (
# 114 "proof_parser.mly"
                                                                                    (Utility.unflat_all_exists (Exists(sl,f1)))
# 544 "proof_parser.ml"
     : (Proof_ast.form))

let _menhir_action_22 =
  fun i s2 xs ->
    let s1 = 
# 229 "<standard.mly>"
    ( xs )
# 552 "proof_parser.ml"
     in
    (
# 50 "proof_parser.mly"
                                                                          ( 
    { identfs= i; sort_fun = s2 ; sort_params = s1}
  )
# 559 "proof_parser.ml"
     : (Proof_ast.fun_sigma))

let _menhir_action_23 =
  fun f i ->
    (
# 118 "proof_parser.mly"
                                     ({formg = f; nameg = i; })
# 567 "proof_parser.ml"
     : (Proof_ast.goal))

let _menhir_action_24 =
  fun f i ->
    (
# 116 "proof_parser.mly"
                                    ({identh = i; formh = f; })
# 575 "proof_parser.ml"
     : (Proof_ast.hyp))

let _menhir_action_25 =
  fun () ->
    (
# 67 "proof_parser.mly"
            ([],[],[],[])
# 583 "proof_parser.ml"
     : (Proof_ast.fun_sigma list * Proof_ast.const_sigma list *
  Proof_ast.sort_sigma list * Proof_ast.relat_sigma list))

let _menhir_action_26 =
  fun f is ->
    (
# 68 "proof_parser.mly"
                                 (let func, const,sort,relat = is in f::func , const,sort,relat)
# 592 "proof_parser.ml"
     : (Proof_ast.fun_sigma list * Proof_ast.const_sigma list *
  Proof_ast.sort_sigma list * Proof_ast.relat_sigma list))

let _menhir_action_27 =
  fun c is ->
    (
# 69 "proof_parser.mly"
                                    (let func, const,sort,relat = is in func , c::const,sort,relat)
# 601 "proof_parser.ml"
     : (Proof_ast.fun_sigma list * Proof_ast.const_sigma list *
  Proof_ast.sort_sigma list * Proof_ast.relat_sigma list))

let _menhir_action_28 =
  fun is s ->
    (
# 70 "proof_parser.mly"
                               (let func,const,sort,relat = is in func, const,s::sort,relat )
# 610 "proof_parser.ml"
     : (Proof_ast.fun_sigma list * Proof_ast.const_sigma list *
  Proof_ast.sort_sigma list * Proof_ast.relat_sigma list))

let _menhir_action_29 =
  fun is r ->
    (
# 71 "proof_parser.mly"
                                (let func,const,sort,relat = is in func,const,sort,r::relat)
# 619 "proof_parser.ml"
     : (Proof_ast.fun_sigma list * Proof_ast.const_sigma list *
  Proof_ast.sort_sigma list * Proof_ast.relat_sigma list))

let _menhir_action_30 =
  fun () ->
    (
# 208 "<standard.mly>"
    ( [] )
# 628 "proof_parser.ml"
     : (Proof_ast.define_form list))

let _menhir_action_31 =
  fun x xs ->
    (
# 210 "<standard.mly>"
    ( x :: xs )
# 636 "proof_parser.ml"
     : (Proof_ast.define_form list))

let _menhir_action_32 =
  fun () ->
    (
# 208 "<standard.mly>"
    ( [] )
# 644 "proof_parser.ml"
     : (Proof_ast.hyp list))

let _menhir_action_33 =
  fun x xs ->
    (
# 210 "<standard.mly>"
    ( x :: xs )
# 652 "proof_parser.ml"
     : (Proof_ast.hyp list))

let _menhir_action_34 =
  fun () ->
    (
# 139 "<standard.mly>"
    ( [] )
# 660 "proof_parser.ml"
     : (Proof_ast.declaration_param list))

let _menhir_action_35 =
  fun x ->
    (
# 141 "<standard.mly>"
    ( x )
# 668 "proof_parser.ml"
     : (Proof_ast.declaration_param list))

let _menhir_action_36 =
  fun () ->
    (
# 139 "<standard.mly>"
    ( [] )
# 676 "proof_parser.ml"
     : (Proof_ast.term list))

let _menhir_action_37 =
  fun x ->
    (
# 141 "<standard.mly>"
    ( x )
# 684 "proof_parser.ml"
     : (Proof_ast.term list))

let _menhir_action_38 =
  fun () ->
    (
# 139 "<standard.mly>"
    ( [] )
# 692 "proof_parser.ml"
     : (Proof_ast.sort list))

let _menhir_action_39 =
  fun x ->
    (
# 141 "<standard.mly>"
    ( x )
# 700 "proof_parser.ml"
     : (Proof_ast.sort list))

let _menhir_action_40 =
  fun df ds g hyp ->
    (
# 35 "proof_parser.mly"
    ({signature =  ds; define_form = df; hyps = hyp; goal = g})
# 708 "proof_parser.ml"
     : (Proof_ast.prog))

let _menhir_action_41 =
  fun _startpos__1_ ->
    let _ = let _startpos = _startpos__1_ in
    (
# 37 "proof_parser.mly"
         ( let pos = _startpos in
          let message =
            Printf.sprintf
              "Syntax error at %d, %d"
              pos.pos_lnum (pos.pos_cnum - pos.pos_bol)
          in
          failwith message )
# 723 "proof_parser.ml"
     : (Proof_ast.prog)) in
    prerr_string "Menhir: misuse: the semantic action associated with the production\nprogram -> error\nis expected to abort the parser, but does not do so.\n";
    assert false

let _menhir_action_42 =
  fun i xs ->
    let s = 
# 229 "<standard.mly>"
    ( xs )
# 733 "proof_parser.ml"
     in
    (
# 75 "proof_parser.mly"
                                                         ({idente = i; sorte_args = s;})
# 738 "proof_parser.ml"
     : (Proof_ast.relat_sigma))

let _menhir_action_43 =
  fun x ->
    (
# 238 "<standard.mly>"
    ( [ x ] )
# 746 "proof_parser.ml"
     : (Proof_ast.declaration_param list))

let _menhir_action_44 =
  fun x xs ->
    (
# 240 "<standard.mly>"
    ( x :: xs )
# 754 "proof_parser.ml"
     : (Proof_ast.declaration_param list))

let _menhir_action_45 =
  fun x ->
    (
# 238 "<standard.mly>"
    ( [ x ] )
# 762 "proof_parser.ml"
     : (Proof_ast.term list))

let _menhir_action_46 =
  fun x xs ->
    (
# 240 "<standard.mly>"
    ( x :: xs )
# 770 "proof_parser.ml"
     : (Proof_ast.term list))

let _menhir_action_47 =
  fun x ->
    (
# 238 "<standard.mly>"
    ( [ x ] )
# 778 "proof_parser.ml"
     : (Proof_ast.sort list))

let _menhir_action_48 =
  fun x xs ->
    (
# 240 "<standard.mly>"
    ( x :: xs )
# 786 "proof_parser.ml"
     : (Proof_ast.sort list))

let _menhir_action_49 =
  fun () ->
    (
# 77 "proof_parser.mly"
        (Real)
# 794 "proof_parser.ml"
     : (Proof_ast.sort))

let _menhir_action_50 =
  fun () ->
    (
# 78 "proof_parser.mly"
        (Int)
# 802 "proof_parser.ml"
     : (Proof_ast.sort))

let _menhir_action_51 =
  fun i ->
    (
# 79 "proof_parser.mly"
              (User(i))
# 810 "proof_parser.ml"
     : (Proof_ast.sort))

let _menhir_action_52 =
  fun i ->
    (
# 73 "proof_parser.mly"
                      ({idents = i;})
# 818 "proof_parser.ml"
     : (Proof_ast.sort_sigma))

let _menhir_action_53 =
  fun i ->
    (
# 91 "proof_parser.mly"
              (Symb(i))
# 826 "proof_parser.ml"
     : (Proof_ast.term))

let _menhir_action_54 =
  fun i xs ->
    let sl = 
# 229 "<standard.mly>"
    ( xs )
# 834 "proof_parser.ml"
     in
    (
# 92 "proof_parser.mly"
                                                       (Apply(i,sl))
# 839 "proof_parser.ml"
     : (Proof_ast.term))

let _menhir_action_55 =
  fun n ->
    (
# 93 "proof_parser.mly"
             (Int_cst(n))
# 847 "proof_parser.ml"
     : (Proof_ast.term))

let _menhir_action_56 =
  fun x ->
    (
# 94 "proof_parser.mly"
           (Float_cst(x))
# 855 "proof_parser.ml"
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
    | CONST ->
        "CONST"
    | DEF ->
        "DEF"
    | DPEC ->
        "DPEC"
    | END ->
        "END"
    | EOF ->
        "EOF"
    | EQ ->
        "EQ"
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
    | IDENT _ ->
        "IDENT"
    | IMP ->
        "IMP"
    | INFEQ ->
        "INFEQ"
    | INT ->
        "INT"
    | INTC _ ->
        "INTC"
    | LCROCH ->
        "LCROCH"
    | LPAR ->
        "LPAR"
    | MUL ->
        "MUL"
    | NOT ->
        "NOT"
    | OR ->
        "OR"
    | PROP ->
        "PROP"
    | RCROCH ->
        "RCROCH"
    | REAL ->
        "REAL"
    | RELAT ->
        "RELAT"
    | RPAR ->
        "RPAR"
    | SEMI ->
        "SEMI"
    | SIGMA ->
        "SIGMA"
    | SORT ->
        "SORT"
    | START ->
        "START"
    | STOP ->
        "STOP"
    | TOP ->
        "TOP"

let _menhir_fail : unit -> 'a =
  fun () ->
    Printf.eprintf "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

include struct
  
  [@@@ocaml.warning "-4-37-39"]
  
  let rec _menhir_run_044 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_DEF (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | IDENT _v ->
          let _menhir_stack = MenhirCell0_IDENT (_menhir_stack, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LPAR ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | IDENT _v ->
                  _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState046
              | RPAR ->
                  let _v = _menhir_action_34 () in
                  _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState046
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_047 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_IDENT (_menhir_stack, _menhir_s, _v) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | COLON ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | REAL ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_49 () in
              _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | INT ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_50 () in
              _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | IDENT _v_2 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let i = _v_2 in
              let _v = _menhir_action_51 i in
              _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_049 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_IDENT -> _ -> _ -> _ -> _ -> _menhir_box_program =
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
              _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState097
          | _ ->
              _eRR ())
      | RPAR ->
          let x = _v in
          let _v = _menhir_action_43 x in
          _menhir_goto_separated_nonempty_list_COMMA_declaration_param_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_goto_separated_nonempty_list_COMMA_declaration_param_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState097 ->
          _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState081 ->
          _menhir_run_050_spec_081 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState075 ->
          _menhir_run_050_spec_075 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState046 ->
          _menhir_run_050_spec_046 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_098 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_declaration_param -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_declaration_param (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_44 x xs in
      _menhir_goto_separated_nonempty_list_COMMA_declaration_param_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_run_050_spec_081 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_ALL -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let x = _v in
      let _v = _menhir_action_35 x in
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
              let _v = _menhir_action_01 () in
              _menhir_run_093_spec_084 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | NOT ->
              _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState084
          | LPAR ->
              _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState084
          | INTC _v_1 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let n = _v_1 in
              let _v = _menhir_action_55 n in
              _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState084 _tok
          | IDENT _v_3 ->
              _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _v_3 MenhirState084
          | FC _v_4 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let x = _v_4 in
              let _v = _menhir_action_56 x in
              _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState084 _tok
          | EXISTS ->
              _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState084
          | BOTTOM ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_02 () in
              _menhir_run_093_spec_084 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | ALL ->
              _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState084
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_093_spec_084 : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_ALL, _menhir_box_program) _menhir_cell1_loption_separated_nonempty_list_COMMA_declaration_param__ -> _ -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let a = _v in
      let _v = _menhir_action_10 a in
      _menhir_run_088 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState084 _tok
  
  and _menhir_run_088 : type  ttv_stack. (((ttv_stack, _menhir_box_program) _menhir_cell1_ALL, _menhir_box_program) _menhir_cell1_loption_separated_nonempty_list_COMMA_declaration_param__ as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | OR ->
          let _menhir_stack = MenhirCell1_formule (_menhir_stack, _menhir_s, _v) in
          _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer
      | IMP ->
          let _menhir_stack = MenhirCell1_formule (_menhir_stack, _menhir_s, _v) in
          _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          let _menhir_stack = MenhirCell1_formule (_menhir_stack, _menhir_s, _v) in
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DEF | EOF | GOAL | HYP | RPAR ->
          let MenhirCell1_loption_separated_nonempty_list_COMMA_declaration_param__ (_menhir_stack, _, xs) = _menhir_stack in
          let MenhirCell1_ALL (_menhir_stack, _menhir_s) = _menhir_stack in
          let f1 = _v in
          let _v = _menhir_action_20 f1 xs in
          _menhir_goto_formule _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_089 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_formule -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TOP ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_01 () in
          _menhir_run_093_spec_089 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | NOT ->
          _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState089
      | LPAR ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState089
      | INTC _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let n = _v in
          let _v = _menhir_action_55 n in
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState089 _tok
      | IDENT _v ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState089
      | FC _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let x = _v in
          let _v = _menhir_action_56 x in
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState089 _tok
      | EXISTS ->
          _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState089
      | BOTTOM ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_02 () in
          _menhir_run_093_spec_089 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | ALL ->
          _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState089
      | _ ->
          _eRR ()
  
  and _menhir_run_093_spec_089 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_formule -> _ -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let a = _v in
      let _v = _menhir_action_10 a in
      _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState089 _tok
  
  and _menhir_run_090 : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_formule as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | OR ->
          let _menhir_stack = MenhirCell1_formule (_menhir_stack, _menhir_s, _v) in
          _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          let _menhir_stack = MenhirCell1_formule (_menhir_stack, _menhir_s, _v) in
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DEF | EOF | GOAL | HYP | IMP | RPAR ->
          let MenhirCell1_formule (_menhir_stack, _menhir_s, f1) = _menhir_stack in
          let f2 = _v in
          let _v = _menhir_action_12 f1 f2 in
          _menhir_goto_formule _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_091 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_formule -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TOP ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_01 () in
          _menhir_run_093_spec_091 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | NOT ->
          _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState091
      | LPAR ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState091
      | INTC _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let n = _v in
          let _v = _menhir_action_55 n in
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState091 _tok
      | IDENT _v ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState091
      | FC _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let x = _v in
          let _v = _menhir_action_56 x in
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState091 _tok
      | EXISTS ->
          _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState091
      | BOTTOM ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_02 () in
          _menhir_run_093_spec_091 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | ALL ->
          _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState091
      | _ ->
          _eRR ()
  
  and _menhir_run_093_spec_091 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_formule -> _ -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let a = _v in
      let _v = _menhir_action_10 a in
      _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState091 _tok
  
  and _menhir_run_092 : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_formule as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | AND ->
          let _menhir_stack = MenhirCell1_formule (_menhir_stack, _menhir_s, _v) in
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DEF | EOF | GOAL | HYP | IMP | OR | RPAR ->
          let MenhirCell1_formule (_menhir_stack, _menhir_s, f1) = _menhir_stack in
          let f2 = _v in
          let _v = _menhir_action_11 f1 f2 in
          _menhir_goto_formule _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_formule : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState128 ->
          _menhir_run_129 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState123 ->
          _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState055 ->
          _menhir_run_119 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState057 ->
          _menhir_run_118 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState058 ->
          _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState111 ->
          _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState107 ->
          _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState103 ->
          _menhir_run_104 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState059 ->
          _menhir_run_100 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState078 ->
          _menhir_run_099 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState094 ->
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState091 ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState089 ->
          _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState084 ->
          _menhir_run_088 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_129 : type  ttv_stack. (((ttv_stack _menhir_cell0_declaration_sigma, _menhir_box_program) _menhir_cell1_list_define_form_, _menhir_box_program) _menhir_cell1_list_hypotheses_ _menhir_cell0_IDENT as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | OR ->
          let _menhir_stack = MenhirCell1_formule (_menhir_stack, _menhir_s, _v) in
          _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer
      | IMP ->
          let _menhir_stack = MenhirCell1_formule (_menhir_stack, _menhir_s, _v) in
          _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          let _menhir_stack = MenhirCell1_formule (_menhir_stack, _menhir_s, _v) in
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EOF ->
          let MenhirCell0_IDENT (_menhir_stack, i) = _menhir_stack in
          let f = _v in
          let _v = _menhir_action_23 f i in
          let MenhirCell1_list_hypotheses_ (_menhir_stack, _, hyp) = _menhir_stack in
          let MenhirCell1_list_define_form_ (_menhir_stack, _, df) = _menhir_stack in
          let MenhirCell0_declaration_sigma (_menhir_stack, ds) = _menhir_stack in
          let g = _v in
          let _v = _menhir_action_40 df ds g hyp in
          MenhirBox_program _v
      | _ ->
          _eRR ()
  
  and _menhir_run_094 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_formule -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TOP ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_01 () in
          _menhir_run_093_spec_094 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | NOT ->
          _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState094
      | LPAR ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState094
      | INTC _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let n = _v in
          let _v = _menhir_action_55 n in
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState094 _tok
      | IDENT _v ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState094
      | FC _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let x = _v in
          let _v = _menhir_action_56 x in
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState094 _tok
      | EXISTS ->
          _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState094
      | BOTTOM ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_02 () in
          _menhir_run_093_spec_094 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | ALL ->
          _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState094
      | _ ->
          _eRR ()
  
  and _menhir_run_093_spec_094 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_formule -> _ -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let a = _v in
      let _v = _menhir_action_10 a in
      _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState094 _tok
  
  and _menhir_run_095 : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_formule as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | OR ->
          let _menhir_stack = MenhirCell1_formule (_menhir_stack, _menhir_s, _v) in
          _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer
      | IMP ->
          let _menhir_stack = MenhirCell1_formule (_menhir_stack, _menhir_s, _v) in
          _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          let _menhir_stack = MenhirCell1_formule (_menhir_stack, _menhir_s, _v) in
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DEF | EOF | GOAL | HYP | RPAR ->
          let MenhirCell1_formule (_menhir_stack, _menhir_s, f1) = _menhir_stack in
          let f2 = _v in
          let _v = _menhir_action_13 f1 f2 in
          _menhir_goto_formule _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_057 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_NOT (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TOP ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_01 () in
          _menhir_run_093_spec_057 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | NOT ->
          _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState057
      | LPAR ->
          let _menhir_stack = MenhirCell1_LPAR (_menhir_stack, MenhirState057) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TOP ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_01 () in
              _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState058 _tok
          | NOT ->
              _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState058
          | LPAR ->
              _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState058
          | INTC _v ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let n = _v in
              let _v = _menhir_action_55 n in
              _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState058 _tok
          | IDENT _v ->
              _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState058
          | FC _v ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let x = _v in
              let _v = _menhir_action_56 x in
              _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState058 _tok
          | EXISTS ->
              _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState058
          | BOTTOM ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_02 () in
              _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState058 _tok
          | ALL ->
              _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState058
          | _ ->
              _eRR ())
      | INTC _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let n = _v in
          let _v = _menhir_action_55 n in
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState057 _tok
      | IDENT _v ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState057
      | FC _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let x = _v in
          let _v = _menhir_action_56 x in
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState057 _tok
      | EXISTS ->
          _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState057
      | BOTTOM ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_02 () in
          _menhir_run_093_spec_057 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | ALL ->
          _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState057
      | _ ->
          _eRR ()
  
  and _menhir_run_093_spec_057 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_NOT -> _ -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let a = _v in
      let _v = _menhir_action_10 a in
      _menhir_run_118 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_run_118 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_NOT -> _ -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_NOT (_menhir_stack, _menhir_s) = _menhir_stack in
      let f1 = _v in
      let _v = _menhir_action_17 f1 in
      _menhir_goto_formule _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_114 : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_LPAR as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | RPAR ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_LPAR (_menhir_stack, _menhir_s) = _menhir_stack in
          let a = _v in
          let _v = _menhir_action_19 a in
          _menhir_goto_formule _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | AND | IMP | OR ->
          let a = _v in
          let _v = _menhir_action_10 a in
          _menhir_goto_formule _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_059 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LPAR (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TOP ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_01 () in
          _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState059 _tok
      | NOT ->
          _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState059
      | LPAR ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState059
      | INTC _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let n = _v in
          let _v = _menhir_action_55 n in
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState059 _tok
      | IDENT _v ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState059
      | FC _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let x = _v in
          let _v = _menhir_action_56 x in
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState059 _tok
      | EXISTS ->
          _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState059
      | BOTTOM ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_02 () in
          _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState059 _tok
      | ALL ->
          _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState059
      | _ ->
          _eRR ()
  
  and _menhir_run_085 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | EQ ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | INTC _v_0 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let n = _v_0 in
              let _v = _menhir_action_55 n in
              _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | IDENT _v_2 ->
              _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState086
          | FC _v_3 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let x = _v_3 in
              let _v = _menhir_action_56 x in
              _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_087 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_term -> _ -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_term (_menhir_stack, _menhir_s, t1) = _menhir_stack in
      let t2 = _v in
      let _v = _menhir_action_03 t1 t2 in
      _menhir_goto_atom _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_atom : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState058 ->
          _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState059 ->
          _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState128 ->
          _menhir_run_093_spec_128 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState123 ->
          _menhir_run_093_spec_123 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState055 ->
          _menhir_run_093_spec_055 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState057 ->
          _menhir_run_093_spec_057 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState111 ->
          _menhir_run_093_spec_111 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState107 ->
          _menhir_run_093_spec_107 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState103 ->
          _menhir_run_093_spec_103 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState078 ->
          _menhir_run_093_spec_078 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState084 ->
          _menhir_run_093_spec_084 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState094 ->
          _menhir_run_093_spec_094 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState089 ->
          _menhir_run_093_spec_089 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState091 ->
          _menhir_run_093_spec_091 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_093_spec_128 : type  ttv_stack. ((ttv_stack _menhir_cell0_declaration_sigma, _menhir_box_program) _menhir_cell1_list_define_form_, _menhir_box_program) _menhir_cell1_list_hypotheses_ _menhir_cell0_IDENT -> _ -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let a = _v in
      let _v = _menhir_action_10 a in
      _menhir_run_129 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState128 _tok
  
  and _menhir_run_093_spec_123 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_HYP _menhir_cell0_IDENT -> _ -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let a = _v in
      let _v = _menhir_action_10 a in
      _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState123 _tok
  
  and _menhir_run_124 : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_HYP _menhir_cell0_IDENT as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | OR ->
          let _menhir_stack = MenhirCell1_formule (_menhir_stack, _menhir_s, _v) in
          _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer
      | IMP ->
          let _menhir_stack = MenhirCell1_formule (_menhir_stack, _menhir_s, _v) in
          _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          let _menhir_stack = MenhirCell1_formule (_menhir_stack, _menhir_s, _v) in
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GOAL | HYP ->
          let MenhirCell0_IDENT (_menhir_stack, i) = _menhir_stack in
          let MenhirCell1_HYP (_menhir_stack, _menhir_s) = _menhir_stack in
          let f = _v in
          let _v = _menhir_action_24 f i in
          let _menhir_stack = MenhirCell1_hypotheses (_menhir_stack, _menhir_s, _v) in
          (match (_tok : MenhirBasics.token) with
          | HYP ->
              _menhir_run_121 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState132
          | GOAL ->
              let _v = _menhir_action_32 () in
              _menhir_run_133 _menhir_stack _menhir_lexbuf _menhir_lexer _v
          | _ ->
              _menhir_fail ())
      | _ ->
          _eRR ()
  
  and _menhir_run_121 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_HYP (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | IDENT _v ->
          let _menhir_stack = MenhirCell0_IDENT (_menhir_stack, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | COLON ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | TOP ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_01 () in
                  _menhir_run_093_spec_123 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
              | NOT ->
                  _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState123
              | LPAR ->
                  _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState123
              | INTC _v_1 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let n = _v_1 in
                  let _v = _menhir_action_55 n in
                  _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState123 _tok
              | IDENT _v_3 ->
                  _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _v_3 MenhirState123
              | FC _v_4 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let x = _v_4 in
                  let _v = _menhir_action_56 x in
                  _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState123 _tok
              | EXISTS ->
                  _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState123
              | BOTTOM ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_02 () in
                  _menhir_run_093_spec_123 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
              | ALL ->
                  _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState123
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_061 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
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
              let _v = _menhir_action_55 n in
              _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState062 _tok
          | IDENT _v_2 ->
              _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState062
          | FC _v_3 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let x = _v_3 in
              let _v = _menhir_action_56 x in
              _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState062 _tok
          | RPAR ->
              let _v = _menhir_action_36 () in
              _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _v
          | _ ->
              _eRR ())
      | EQ ->
          let i = _v in
          let _v = _menhir_action_53 i in
          _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_066 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | COMMA ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | INTC _v_0 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let n = _v_0 in
              let _v = _menhir_action_55 n in
              _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState067 _tok
          | IDENT _v_2 ->
              _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState067
          | FC _v_3 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let x = _v_3 in
              let _v = _menhir_action_56 x in
              _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState067 _tok
          | _ ->
              _eRR ())
      | RPAR ->
          let x = _v in
          let _v = _menhir_action_45 x in
          _menhir_goto_separated_nonempty_list_COMMA_term_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
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
              let _v = _menhir_action_55 n in
              _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState064 _tok
          | IDENT _v_2 ->
              _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState064
          | FC _v_3 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let x = _v_3 in
              let _v = _menhir_action_56 x in
              _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState064 _tok
          | RPAR ->
              let _v = _menhir_action_36 () in
              _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _v
          | _ ->
              _eRR ())
      | AND | COMMA | DEF | EOF | GOAL | HYP | IMP | OR | RPAR ->
          let i = _v in
          let _v = _menhir_action_53 i in
          _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_070 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_IDENT -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_IDENT (_menhir_stack, _menhir_s, i) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_54 i xs in
      _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_term : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState086 ->
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState128 ->
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState123 ->
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState055 ->
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState057 ->
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState058 ->
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState111 ->
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState107 ->
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState103 ->
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState059 ->
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState078 ->
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState094 ->
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState091 ->
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState089 ->
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState084 ->
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState062 ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState067 ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState064 ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_goto_separated_nonempty_list_COMMA_term_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState062 ->
          _menhir_run_069_spec_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState064 ->
          _menhir_run_069_spec_064 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState067 ->
          _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_069_spec_062 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_IDENT -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let x = _v in
      let _v = _menhir_action_37 x in
      _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _v
  
  and _menhir_run_072 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_IDENT -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | AND | DEF | EOF | GOAL | HYP | IMP | OR | RPAR ->
          let MenhirCell1_IDENT (_menhir_stack, _menhir_s, i) = _menhir_stack in
          let xs = _v in
          let _v = _menhir_action_04 i xs in
          _menhir_goto_atom _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | EQ ->
          let MenhirCell1_IDENT (_menhir_stack, _menhir_s, i) = _menhir_stack in
          let xs = _v in
          let _v = _menhir_action_54 i xs in
          _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_069_spec_064 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_IDENT -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let x = _v in
      let _v = _menhir_action_37 x in
      _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _v
  
  and _menhir_run_068 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_term -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_term (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_46 x xs in
      _menhir_goto_separated_nonempty_list_COMMA_term_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_run_074 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_EXISTS (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPAR ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | IDENT _v ->
              _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState075
          | RPAR ->
              let _v = _menhir_action_34 () in
              _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState075
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
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
              let _v = _menhir_action_01 () in
              _menhir_run_093_spec_078 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | NOT ->
              _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState078
          | LPAR ->
              _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState078
          | INTC _v_1 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let n = _v_1 in
              let _v = _menhir_action_55 n in
              _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState078 _tok
          | IDENT _v_3 ->
              _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _v_3 MenhirState078
          | FC _v_4 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let x = _v_4 in
              let _v = _menhir_action_56 x in
              _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState078 _tok
          | EXISTS ->
              _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState078
          | BOTTOM ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_02 () in
              _menhir_run_093_spec_078 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | ALL ->
              _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState078
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_093_spec_078 : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_EXISTS, _menhir_box_program) _menhir_cell1_loption_separated_nonempty_list_COMMA_declaration_param__ -> _ -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let a = _v in
      let _v = _menhir_action_10 a in
      _menhir_run_099 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState078 _tok
  
  and _menhir_run_099 : type  ttv_stack. (((ttv_stack, _menhir_box_program) _menhir_cell1_EXISTS, _menhir_box_program) _menhir_cell1_loption_separated_nonempty_list_COMMA_declaration_param__ as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | OR ->
          let _menhir_stack = MenhirCell1_formule (_menhir_stack, _menhir_s, _v) in
          _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer
      | IMP ->
          let _menhir_stack = MenhirCell1_formule (_menhir_stack, _menhir_s, _v) in
          _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          let _menhir_stack = MenhirCell1_formule (_menhir_stack, _menhir_s, _v) in
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DEF | EOF | GOAL | HYP | RPAR ->
          let MenhirCell1_loption_separated_nonempty_list_COMMA_declaration_param__ (_menhir_stack, _, xs) = _menhir_stack in
          let MenhirCell1_EXISTS (_menhir_stack, _menhir_s) = _menhir_stack in
          let f1 = _v in
          let _v = _menhir_action_21 f1 xs in
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
              _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState081
          | RPAR ->
              let _v = _menhir_action_34 () in
              _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState081
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_133 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_hypotheses -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_hypotheses (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_33 x xs in
      _menhir_goto_list_hypotheses_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_goto_list_hypotheses_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState132 ->
          _menhir_run_133 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState120 ->
          _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_125 : type  ttv_stack. ((ttv_stack _menhir_cell0_declaration_sigma, _menhir_box_program) _menhir_cell1_list_define_form_ as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_list_hypotheses_ (_menhir_stack, _menhir_s, _v) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | IDENT _v_0 ->
          let _menhir_stack = MenhirCell0_IDENT (_menhir_stack, _v_0) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | COLON ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | TOP ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_01 () in
                  _menhir_run_093_spec_128 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
              | NOT ->
                  _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState128
              | LPAR ->
                  _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState128
              | INTC _v_2 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let n = _v_2 in
                  let _v = _menhir_action_55 n in
                  _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState128 _tok
              | IDENT _v_4 ->
                  _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _v_4 MenhirState128
              | FC _v_5 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let x = _v_5 in
                  let _v = _menhir_action_56 x in
                  _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState128 _tok
              | EXISTS ->
                  _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState128
              | BOTTOM ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_02 () in
                  _menhir_run_093_spec_128 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
              | ALL ->
                  _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState128
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_093_spec_055 : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_DEF _menhir_cell0_IDENT, _menhir_box_program) _menhir_cell1_loption_separated_nonempty_list_COMMA_declaration_param__ -> _ -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let a = _v in
      let _v = _menhir_action_10 a in
      _menhir_run_119 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState055 _tok
  
  and _menhir_run_119 : type  ttv_stack. (((ttv_stack, _menhir_box_program) _menhir_cell1_DEF _menhir_cell0_IDENT, _menhir_box_program) _menhir_cell1_loption_separated_nonempty_list_COMMA_declaration_param__ as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | OR ->
          let _menhir_stack = MenhirCell1_formule (_menhir_stack, _menhir_s, _v) in
          _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer
      | IMP ->
          let _menhir_stack = MenhirCell1_formule (_menhir_stack, _menhir_s, _v) in
          _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          let _menhir_stack = MenhirCell1_formule (_menhir_stack, _menhir_s, _v) in
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DEF | GOAL | HYP ->
          let MenhirCell1_loption_separated_nonempty_list_COMMA_declaration_param__ (_menhir_stack, _, xs) = _menhir_stack in
          let MenhirCell0_IDENT (_menhir_stack, i) = _menhir_stack in
          let MenhirCell1_DEF (_menhir_stack, _menhir_s) = _menhir_stack in
          let f1 = _v in
          let _v = _menhir_action_09 f1 i xs in
          let _menhir_stack = MenhirCell1_define_form (_menhir_stack, _menhir_s, _v) in
          (match (_tok : MenhirBasics.token) with
          | DEF ->
              _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState134
          | GOAL | HYP ->
              let _v = _menhir_action_30 () in
              _menhir_run_135 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | _ ->
              _menhir_fail ())
      | _ ->
          _eRR ()
  
  and _menhir_run_135 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_define_form -> _ -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_define_form (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_31 x xs in
      _menhir_goto_list_define_form_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_list_define_form_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState134 ->
          _menhir_run_135 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState043 ->
          _menhir_run_120 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_120 : type  ttv_stack. (ttv_stack _menhir_cell0_declaration_sigma as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_list_define_form_ (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | HYP ->
          _menhir_run_121 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState120
      | GOAL ->
          let _v = _menhir_action_32 () in
          _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState120
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_093_spec_111 : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_LPAR, _menhir_box_program) _menhir_cell1_formule -> _ -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let a = _v in
      let _v = _menhir_action_10 a in
      _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState111 _tok
  
  and _menhir_run_112 : type  ttv_stack. (((ttv_stack, _menhir_box_program) _menhir_cell1_LPAR, _menhir_box_program) _menhir_cell1_formule as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | RPAR ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_formule (_menhir_stack, _, f1) = _menhir_stack in
          let MenhirCell1_LPAR (_menhir_stack, _menhir_s) = _menhir_stack in
          let f2 = _v in
          let _v = _menhir_action_15 f1 f2 in
          _menhir_goto_formule _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | OR ->
          let _menhir_stack = MenhirCell1_formule (_menhir_stack, _menhir_s, _v) in
          _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer
      | IMP ->
          let _menhir_stack = MenhirCell1_formule (_menhir_stack, _menhir_s, _v) in
          _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          let _menhir_stack = MenhirCell1_formule (_menhir_stack, _menhir_s, _v) in
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_093_spec_107 : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_LPAR, _menhir_box_program) _menhir_cell1_formule -> _ -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let a = _v in
      let _v = _menhir_action_10 a in
      _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState107 _tok
  
  and _menhir_run_108 : type  ttv_stack. (((ttv_stack, _menhir_box_program) _menhir_cell1_LPAR, _menhir_box_program) _menhir_cell1_formule as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | RPAR ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_formule (_menhir_stack, _, f1) = _menhir_stack in
          let MenhirCell1_LPAR (_menhir_stack, _menhir_s) = _menhir_stack in
          let f2 = _v in
          let _v = _menhir_action_16 f1 f2 in
          _menhir_goto_formule _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | OR ->
          let _menhir_stack = MenhirCell1_formule (_menhir_stack, _menhir_s, _v) in
          _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer
      | IMP ->
          let _menhir_stack = MenhirCell1_formule (_menhir_stack, _menhir_s, _v) in
          _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          let _menhir_stack = MenhirCell1_formule (_menhir_stack, _menhir_s, _v) in
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_093_spec_103 : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_LPAR, _menhir_box_program) _menhir_cell1_formule -> _ -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let a = _v in
      let _v = _menhir_action_10 a in
      _menhir_run_104 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState103 _tok
  
  and _menhir_run_104 : type  ttv_stack. (((ttv_stack, _menhir_box_program) _menhir_cell1_LPAR, _menhir_box_program) _menhir_cell1_formule as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | RPAR ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_formule (_menhir_stack, _, f1) = _menhir_stack in
          let MenhirCell1_LPAR (_menhir_stack, _menhir_s) = _menhir_stack in
          let f2 = _v in
          let _v = _menhir_action_14 f1 f2 in
          _menhir_goto_formule _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | OR ->
          let _menhir_stack = MenhirCell1_formule (_menhir_stack, _menhir_s, _v) in
          _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer
      | IMP ->
          let _menhir_stack = MenhirCell1_formule (_menhir_stack, _menhir_s, _v) in
          _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          let _menhir_stack = MenhirCell1_formule (_menhir_stack, _menhir_s, _v) in
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_116 : type  ttv_stack. (((ttv_stack, _menhir_box_program) _menhir_cell1_NOT, _menhir_box_program) _menhir_cell1_LPAR as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | RPAR ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | OR ->
              let _menhir_stack = MenhirCell1_formule (_menhir_stack, _menhir_s, _v) in
              _menhir_run_102 _menhir_stack _menhir_lexbuf _menhir_lexer
          | IMP ->
              let _menhir_stack = MenhirCell1_formule (_menhir_stack, _menhir_s, _v) in
              _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer
          | AND ->
              let _menhir_stack = MenhirCell1_formule (_menhir_stack, _menhir_s, _v) in
              _menhir_run_110 _menhir_stack _menhir_lexbuf _menhir_lexer
          | DEF | EOF | GOAL | HYP | RPAR ->
              let MenhirCell1_LPAR (_menhir_stack, _) = _menhir_stack in
              let MenhirCell1_NOT (_menhir_stack, _menhir_s) = _menhir_stack in
              let f = _v in
              let _v = _menhir_action_18 f in
              _menhir_goto_formule _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
          | _ ->
              _eRR ())
      | OR ->
          let _menhir_stack = MenhirCell1_formule (_menhir_stack, _menhir_s, _v) in
          _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer
      | IMP ->
          let _menhir_stack = MenhirCell1_formule (_menhir_stack, _menhir_s, _v) in
          _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          let _menhir_stack = MenhirCell1_formule (_menhir_stack, _menhir_s, _v) in
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_102 : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_LPAR, _menhir_box_program) _menhir_cell1_formule -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPAR ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TOP ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_01 () in
              _menhir_run_093_spec_103 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | NOT ->
              _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState103
          | LPAR ->
              _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState103
          | INTC _v ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let n = _v in
              let _v = _menhir_action_55 n in
              _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState103 _tok
          | IDENT _v ->
              _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState103
          | FC _v ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let x = _v in
              let _v = _menhir_action_56 x in
              _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState103 _tok
          | EXISTS ->
              _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState103
          | BOTTOM ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_02 () in
              _menhir_run_093_spec_103 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | ALL ->
              _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState103
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_106 : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_LPAR, _menhir_box_program) _menhir_cell1_formule -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPAR ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TOP ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_01 () in
              _menhir_run_093_spec_107 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | NOT ->
              _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState107
          | LPAR ->
              _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState107
          | INTC _v ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let n = _v in
              let _v = _menhir_action_55 n in
              _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState107 _tok
          | IDENT _v ->
              _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState107
          | FC _v ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let x = _v in
              let _v = _menhir_action_56 x in
              _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState107 _tok
          | EXISTS ->
              _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState107
          | BOTTOM ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_02 () in
              _menhir_run_093_spec_107 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | ALL ->
              _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState107
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_110 : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_LPAR, _menhir_box_program) _menhir_cell1_formule -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPAR ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TOP ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_01 () in
              _menhir_run_093_spec_111 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | NOT ->
              _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState111
          | LPAR ->
              _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState111
          | INTC _v ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let n = _v in
              let _v = _menhir_action_55 n in
              _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState111 _tok
          | IDENT _v ->
              _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState111
          | FC _v ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let x = _v in
              let _v = _menhir_action_56 x in
              _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState111 _tok
          | EXISTS ->
              _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState111
          | BOTTOM ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_02 () in
              _menhir_run_093_spec_111 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | ALL ->
              _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState111
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_100 : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_LPAR as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_formule (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | RPAR ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | OR ->
              _menhir_run_102 _menhir_stack _menhir_lexbuf _menhir_lexer
          | IMP ->
              _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer
          | AND ->
              _menhir_run_110 _menhir_stack _menhir_lexbuf _menhir_lexer
          | _ ->
              _eRR ())
      | OR ->
          _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer
      | IMP ->
          _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_050_spec_075 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_EXISTS -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let x = _v in
      let _v = _menhir_action_35 x in
      _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState075
  
  and _menhir_run_050_spec_046 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_DEF _menhir_cell0_IDENT -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let x = _v in
      let _v = _menhir_action_35 x in
      _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState046
  
  and _menhir_run_051 : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_DEF _menhir_cell0_IDENT as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_loption_separated_nonempty_list_COMMA_declaration_param__ (_menhir_stack, _menhir_s, _v) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | COLON ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | PROP ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | DPEC ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | TOP ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      let _v = _menhir_action_01 () in
                      _menhir_run_093_spec_055 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
                  | NOT ->
                      _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState055
                  | LPAR ->
                      _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState055
                  | INTC _v_1 ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      let n = _v_1 in
                      let _v = _menhir_action_55 n in
                      _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState055 _tok
                  | IDENT _v_3 ->
                      _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _v_3 MenhirState055
                  | FC _v_4 ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      let x = _v_4 in
                      let _v = _menhir_action_56 x in
                      _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState055 _tok
                  | EXISTS ->
                      _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState055
                  | BOTTOM ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      let _v = _menhir_action_02 () in
                      _menhir_run_093_spec_055 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
                  | ALL ->
                      _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState055
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  let rec _menhir_goto_declaration_sigma : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let _menhir_stack = MenhirCell0_declaration_sigma (_menhir_stack, _v) in
      match (_tok : MenhirBasics.token) with
      | DEF ->
          _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState043
      | GOAL | HYP ->
          let _v = _menhir_action_30 () in
          _menhir_run_120 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState043 _tok
      | _ ->
          _eRR ()
  
  let rec _menhir_run_040 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let i = _v in
      let _v = _menhir_action_08 i in
      _menhir_goto_declaration_sigma _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  let rec _menhir_run_038 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_const_sigma_pv -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_const_sigma_pv (_menhir_stack, _menhir_s, c) = _menhir_stack in
      let is = _v in
      let _v = _menhir_action_27 c is in
      _menhir_goto_in_sigma _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_goto_in_sigma : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState003 ->
          _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState032 ->
          _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState037 ->
          _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState035 ->
          _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState033 ->
          _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_039 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_sort_sigma -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_sort_sigma (_menhir_stack, _menhir_s, s) = _menhir_stack in
      let is = _v in
      let _v = _menhir_action_28 is s in
      _menhir_goto_in_sigma _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_run_036 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_fun_sigma_pv -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_fun_sigma_pv (_menhir_stack, _menhir_s, f) = _menhir_stack in
      let is = _v in
      let _v = _menhir_action_26 f is in
      _menhir_goto_in_sigma _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_run_034 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_relat_sigma -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_relat_sigma (_menhir_stack, _menhir_s, r) = _menhir_stack in
      let is = _v in
      let _v = _menhir_action_29 is r in
      _menhir_goto_in_sigma _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  let rec _menhir_run_004 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | IDENT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | SEMI ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let i = _v in
              let _v = _menhir_action_52 i in
              let _menhir_stack = MenhirCell1_sort_sigma (_menhir_stack, _menhir_s, _v) in
              (match (_tok : MenhirBasics.token) with
              | SORT ->
                  _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState032
              | RELAT ->
                  _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState032
              | FUN ->
                  _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState032
              | CONST ->
                  _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState032
              | END ->
                  let _v = _menhir_action_25 () in
                  _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _v
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_007 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_RELAT (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | IDENT _v ->
          let _menhir_stack = MenhirCell0_IDENT (_menhir_stack, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | COLON ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | REAL ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_49 () in
                  _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState009 _tok
              | INT ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_50 () in
                  _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState009 _tok
              | IDENT _v_2 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let i = _v_2 in
                  let _v = _menhir_action_51 i in
                  _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState009 _tok
              | SEMI ->
                  let _v = _menhir_action_38 () in
                  _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_013 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | MUL ->
          let _menhir_stack = MenhirCell1_sort (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | REAL ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_49 () in
              _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState014 _tok
          | INT ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_50 () in
              _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState014 _tok
          | IDENT _v_2 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let i = _v_2 in
              let _v = _menhir_action_51 i in
              _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState014 _tok
          | _ ->
              _eRR ())
      | ARROW | SEMI ->
          let x = _v in
          let _v = _menhir_action_47 x in
          _menhir_goto_separated_nonempty_list_MUL_sort_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_separated_nonempty_list_MUL_sort_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState021 ->
          _menhir_run_016_spec_021 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState009 ->
          _menhir_run_016_spec_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState014 ->
          _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_016_spec_021 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_FUN _menhir_cell0_IDENT -> _ -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let x = _v in
      let _v = _menhir_action_39 x in
      _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState021 _tok
  
  and _menhir_run_022 : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_FUN _menhir_cell0_IDENT as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_loption_separated_nonempty_list_MUL_sort__ (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | ARROW ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | REAL ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_49 () in
              _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | INT ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_50 () in
              _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | IDENT _v_2 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let i = _v_2 in
              let _v = _menhir_action_51 i in
              _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_024 : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_FUN _menhir_cell0_IDENT, _menhir_box_program) _menhir_cell1_loption_separated_nonempty_list_MUL_sort__ -> _ -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | SEMI ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_loption_separated_nonempty_list_MUL_sort__ (_menhir_stack, _, xs) = _menhir_stack in
          let MenhirCell0_IDENT (_menhir_stack, i) = _menhir_stack in
          let MenhirCell1_FUN (_menhir_stack, _menhir_s) = _menhir_stack in
          let s2 = _v in
          let _v = _menhir_action_22 i s2 xs in
          let _menhir_stack = MenhirCell1_fun_sigma_pv (_menhir_stack, _menhir_s, _v) in
          (match (_tok : MenhirBasics.token) with
          | SORT ->
              _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState035
          | RELAT ->
              _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState035
          | FUN ->
              _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState035
          | CONST ->
              _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState035
          | END ->
              let _v = _menhir_action_25 () in
              _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _v
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_019 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_FUN (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | IDENT _v ->
          let _menhir_stack = MenhirCell0_IDENT (_menhir_stack, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | COLON ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | REAL ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_49 () in
                  _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState021 _tok
              | INT ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_50 () in
                  _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState021 _tok
              | IDENT _v_2 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let i = _v_2 in
                  let _v = _menhir_action_51 i in
                  _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState021 _tok
              | ARROW ->
                  let _v = _menhir_action_38 () in
                  _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState021 _tok
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_027 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_CONST (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | IDENT _v ->
          let _menhir_stack = MenhirCell0_IDENT (_menhir_stack, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | COLON ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | REAL ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_49 () in
                  _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
              | INT ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_50 () in
                  _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
              | IDENT _v_2 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let i = _v_2 in
                  let _v = _menhir_action_51 i in
                  _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_030 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_CONST _menhir_cell0_IDENT -> _ -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | SEMI ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell0_IDENT (_menhir_stack, i) = _menhir_stack in
          let MenhirCell1_CONST (_menhir_stack, _menhir_s) = _menhir_stack in
          let s = _v in
          let _v = _menhir_action_05 i s in
          let _menhir_stack = MenhirCell1_const_sigma_pv (_menhir_stack, _menhir_s, _v) in
          (match (_tok : MenhirBasics.token) with
          | SORT ->
              _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState037
          | RELAT ->
              _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState037
          | FUN ->
              _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState037
          | CONST ->
              _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState037
          | END ->
              let _v = _menhir_action_25 () in
              _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _v
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_016_spec_009 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_RELAT _menhir_cell0_IDENT -> _ -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let x = _v in
      let _v = _menhir_action_39 x in
      _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_run_017 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_RELAT _menhir_cell0_IDENT -> _ -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | SEMI ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell0_IDENT (_menhir_stack, i) = _menhir_stack in
          let MenhirCell1_RELAT (_menhir_stack, _menhir_s) = _menhir_stack in
          let xs = _v in
          let _v = _menhir_action_42 i xs in
          let _menhir_stack = MenhirCell1_relat_sigma (_menhir_stack, _menhir_s, _v) in
          (match (_tok : MenhirBasics.token) with
          | SORT ->
              _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState033
          | RELAT ->
              _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState033
          | FUN ->
              _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState033
          | CONST ->
              _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState033
          | END ->
              let _v = _menhir_action_25 () in
              _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer _v
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_015 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_sort -> _ -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_sort (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_48 x xs in
      _menhir_goto_separated_nonempty_list_MUL_sort_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  let rec _menhir_run_000 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | SIGMA ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | BEGIN ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | SORT ->
                  _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState003
              | RELAT ->
                  _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState003
              | FUN ->
                  _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState003
              | END ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_07 () in
                  _menhir_goto_declaration_sigma _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
              | CONST ->
                  _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState003
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
          let _startpos__1_ = _startpos in
          let _v = _menhir_action_41 _startpos__1_ in
          MenhirBox_program _v
  
end

let program =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_program v = _menhir_run_000 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v
