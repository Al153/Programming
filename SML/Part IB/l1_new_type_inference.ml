(* 2002-11-08 -- Time-stamp: <2006-10-25 09:22:33 pes20>    -*-SML-*- *)
(* Peter Sewell                                                       *)

(* This file contains an interpreter, pretty-printer and type-checker
   for the language L1.  To make it go, copy it into a working
   directory, ensure Moscow ML is available, and type

       mosml -P full l1.ml 

   That will give you a MoscowML top level in which these definitions
   are present.  You can then type
      
      doit ();

   to show the reduction sequence of < l1:=3;!l1 , {l1=0 } >, and

      doit2 ();

   to run the type-checker on the same simple example; you can try
   other examples analogously.  This file doesn't have a parser for
   l1, so you'll have to enter the abstract syntax directly, eg

      prettyreduce (Seq( Assign ("l1",Integer 3), Deref "l1"), [("l1",0)]);

   This has been tested with Moscow ML version 2.00 (June 2000), but
   should work with any other implementation of Standard ML.   *)


(* *********************)
(* the abstract syntax *)
(* *********************)

type loc = string

datatype oper = Plus | GTEQ

datatype expr = 
         Integer of int
       | Boolean of bool
       | Op of expr * oper * expr
       | If of expr * expr * expr
       | Assign of loc * expr
       | Deref of loc
       | Skip
       | Seq of expr * expr
       | While of expr * expr


(* **********************************)
(* typing                           *)
(* **********************************)

(* types *)

datatype type_L1 =
         int
       | unit
       | bool

datatype type_loc =
         intref

type typeEnv = (loc*type_loc) list 

(* in the semantics, type environments gamma are partial functions
from locations to the singleton set {intref}. Here, just as we did for
stores, we represent them as a list of loc*type_loc pairs containing,
for each l in the domain of the type environment, exactly one element
of the form (l,intref).  *)


(* ****************)
(* type inference *)
(* ****************)

(* infertype : typeEnv -> expr -> type_L1 option *)

(* again, we depend on a uniqueness property, without which we would
have to have infertype return a type_L1 list of all the possible types *)

fun lookup ( [], l ) = NONE
  | lookup ( (l',n')::pairs, l) = 
    if l=l' then SOME n' else lookup (pairs,l)

fun infertype gamma (Integer n) = SOME int
  | infertype gamma (Boolean b) = SOME bool
  | infertype gamma (Op (e1,opr,e2)) 
    = (case (infertype gamma e1, opr, infertype gamma e2) of
          (SOME int, Plus, SOME int) => SOME int
        | (SOME int, GTEQ, SOME int) => SOME bool
        | _ => NONE)
  | infertype gamma (If (e1,e2,e3)) 
    = (case (infertype gamma e1, infertype gamma e2, infertype gamma e3) of
           (SOME bool, SOME t2, SOME t3) => 
           (if t2=t3 then SOME t2 else NONE)
         | _ => NONE)
  | infertype gamma (Deref l) 
    = (case lookup (gamma,l) of
           SOME intref => SOME int
         | NONE => NONE)
  | infertype gamma (Assign (l,e)) 
    = (case (lookup (gamma,l), infertype gamma e) of
           (SOME intref,SOME int) => SOME int
         | _ => NONE)
  | infertype gamma (Skip) = SOME unit
  | infertype gamma (Seq (e1,e2))  
    = (case (infertype gamma e1, infertype gamma e2) of
           (SOME t1, SOME t2) => SOME t2
         | _ => NONE )
  | infertype gamma (While (e1,e2)) 
    = (case (infertype gamma e1, infertype gamma e2) of
           (SOME bool, SOME unit) => SOME unit 
         | _ => NONE )
