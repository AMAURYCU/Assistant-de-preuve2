%{open Utility
  open Lexing
  open Proof_ast

  

%}
%token <string> IDENT
%token <int> INTC
%token <float> FC
%token REAL INT SORT RELAT
%token EOF
%token BEGIN END COLON SEMI LPAR RPAR DPEC COMMA LCROCH RCROCH
%token SIGMA DEF PROP HYP GOAL START STOP
%token FUN ARROW CONST
%token MUL EQ INFEQ
%token ALL EXISTS NOT AND OR IMP TOP BOTTOM
%token AD

%start program


%right ARROW
%right IMP
%right OR
%right AND
%right NOT
%left EQ

%type<Proof_ast.prog> program

%%
program:
  |ds = declaration_sigma df = list(define_form) hyp = list( hypotheses) g = goal EOF 
    {{signature =  ds; define_form = df; hyps = hyp; goal = g}} 

  |error { let pos = $startpos in
          let message =
            Printf.sprintf
              "Syntax error at %d, %d"
              pos.pos_lnum (pos.pos_cnum - pos.pos_bol)
          in
          failwith message };
declaration_sigma: 
  |SIGMA BEGIN END {{functions = [] ; const = [] ; sort = [];relat = []}}
  |SIGMA BEGIN i = in_sigma (*fspv = fun_sigma_sans_pv*) END{ let f,c,s,r = i in {functions = f ; const = c ; sort = s;relat = r;}}
  
  ;
fun_sigma_pv:
  | FUN i = IDENT COLON s1= separated_list(MUL,sort) ARROW s2 = sort SEMI { 
    { identfs= i; sort_fun = s2 ; sort_params = s1}
  };

(*const_sigma_sans_pv:
| CONST i = IDENT COLON s = sort {
  {ident = i; sort = s}
}
fun_sigma_sans_pv:
| FUN i = IDENT COLON s1 = sort ARROW s2 = sort SEMI {
  {ident = i; sort_param = s1; sort_sortie = s2}
}*)
const_sigma_pv:
  | CONST i = IDENT COLON s = sort SEMI {
    {identcs = i; sort = s}
  };
in_sigma:
  |(*vide*) {[],[],[],[]}
  |f =fun_sigma_pv is = in_sigma {let func, const,sort,relat = is in f::func , const,sort,relat}
  |c = const_sigma_pv is = in_sigma {let func, const,sort,relat = is in func , c::const,sort,relat}
  |s = sort_sigma is = in_sigma{let func,const,sort,relat = is in func, const,s::sort,relat }
  |r = relat_sigma is = in_sigma{let func,const,sort,relat = is in func,const,sort,r::relat}
sort_sigma:
| SORT i = IDENT SEMI {{idents = i;}};
relat_sigma:
|RELAT i = IDENT COLON s = separated_list(MUL,sort) SEMI {{idente = i; sorte_args = s;}};
sort:
  |REAL {Real}
  |INT  {Int}
  | i = IDENT {User(i)}

define_form :
  |DEF i = IDENT LPAR  d = separated_list(COMMA,declaration_param)  RPAR COLON PROP DPEC f1 = formule{{ident = i ;params = d;form = f1}};

declaration_param:
  | i = IDENT COLON s = sort {
    {identp = i; sortp = s;}
  }
  
  ;
term :
  | i = IDENT {Symb(i)}(*les vérifications seront faites dans un autre fichier*)
  | i = IDENT LPAR sl= separated_list(COMMA,term) RPAR {Apply(i,sl)}(*les vérifications seront faites dans un autre fichier*)
  | n = INTC {Int_cst(n)}
  | x = FC {Float_cst(x)}

atom:
  | TOP {Top}
  |BOTTOM {Bottom}
   |t1 = term EQ t2 = term {Eq(t1,t2)}
   | i = IDENT LPAR sl = separated_list(COMMA,term) RPAR{print_string i ;Rel(i,sl)}

formule: 
  | a = atom {Atom(a)}
  |f1 = formule AND f2 = formule {And(f1,f2)}
  |f1 = formule OR f2 = formule {Or(f1,f2)}
  |f1 = formule IMP f2= formule {Imp(f1,f2)}
  |LPAR f1 = formule RPAR OR LPAR f2 = formule RPAR {Or(f1,f2)}
  |LPAR f1 = formule RPAR AND LPAR f2 = formule RPAR {And(f1,f2)}
  |LPAR f1 = formule RPAR IMP LPAR f2 = formule RPAR {Imp(f1,f2)}
  |NOT f1 = formule {Not(f1)}
  | NOT LPAR f = formule RPAR {Not(f)}
  | LPAR a = atom RPAR {Atom(a)}
  |ALL LPAR sl = separated_list(COMMA,declaration_param) RPAR COMMA f1 = formule {Utility.unflat_all_exists (Alls(sl,f1))}
  |EXISTS LPAR sl = separated_list(COMMA,declaration_param) RPAR COMMA f1 = formule {Utility.unflat_all_exists (Exists(sl,f1))}
hypotheses:
  | HYP i = IDENT COLON f = formule {{identh = i; formh = f; }}
goal:
  | GOAL i = IDENT COLON f = formule {{formg = f; nameg = i; }}
  (**attention au renomage des déclarations de relation identE*)