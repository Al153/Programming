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
(* an interpreter for the semantics *)
(* **********************************)

fun is_value (Integer n) = true
  | is_value (Boolean b) = true
  | is_value (Skip) = true
  | is_value _ = false

  (* In the semantics, a store is a finite partial function from
  locations to integers.  In the implementation, we represent a store
  as a list of loc*int pairs containing, for each l in the domain of
  the store, exactly one element of the form (l,n).  The operations

    lookup : store * loc         -> int option
    update : store * (loc * int) -> store option

  both return NONE if given a location that is not in the domain of
  the store.  This is not a very efficient implementation, but it is
  simple. *)

type store = (loc * int) list

fun lookup ( [], l ) = NONE
  | lookup ( (l',n')::pairs, l) = 
    if l=l' then SOME n' else lookup (pairs,l)

fun update'  front [] (l,n) = NONE
 |  update'  front ((l',n')::pairs) (l,n) = 
    if l=l' then 
        SOME(front @ ((l,n)::pairs) )
    else 
        update' ((l',n')::front) pairs (l,n)

fun update (s, (l,n)) = update' [] s (l,n)


  (* now define the single-step function

     reduce :  expr * store -> (expr * store) option 

  which takes a configuration (e,s) and returns either NONE, if it has
  no transitions, or SOME (e',s'), if it has a transition (e,s) -->
  (e',s'). 

  Note that the code depends on global properties of the semantics,
  including the fact that it defines a deterministic transition
  system, so the comments indicating that particular lines of code
  implement particular semantic rules are not the whole story.  *)

fun reduce (Integer n,s) = NONE
  | reduce (Boolean b,s) = NONE
  | reduce (Op (e1,opr,e2),s) = 
    (case (e1,opr,e2) of
         (Integer n1, Plus, Integer n2) => SOME(Integer (n1+n2), s)   (*op + *)
       | (Integer n1, GTEQ, Integer n2) => SOME(Boolean (n1 >= n2), s)(*op >=*)
       | (e1,opr,e2) => (                                               
         if (is_value e2) then (                                        
             case reduce (e1,s) of 
                 SOME (e1',s') => SOME (Op(e1',opr,e2),s')     (* (op2b) *)
               | NONE => NONE )                           
         else (                                                 
             case reduce (e2,s) of 
                 SOME (e2',s') => SOME(Op(e1,opr,e2'),s')      (* (op1b) *)
               | NONE => NONE ) ) )
  | reduce (If (e1,e2,e3),s) =
    (case e1 of
         Boolean(true) => SOME(e2,s)                           (* (if1) *)
       | Boolean(false) => SOME(e3,s)                          (* (if2) *)
       | _ => (case reduce (e1,s) of
                   SOME(e1',s') => SOME(If(e1',e2,e3),s')      (* (if3) *)
                 | NONE => NONE ))
  | reduce (Deref l,s) = 
    (case lookup  (s,l) of                
          SOME n => SOME(Integer n,s)                          (* (deref) *)
        | NONE => NONE )                  
  | reduce (Assign (l,e),s) =                                  
    (case e of                                                 
         Integer n => (case update (s,(l,n)) of 
                           SOME s' => SOME(Skip, s')           (* (assign1) *)
                         | NONE => NONE)                                   
       | _ => (case reduce (e,s) of                           
                   SOME (e',s') => SOME(Assign (l,e'), s')     (* (assign2) *)
                 | NONE => NONE  ) )                          
  | reduce (While (e1,e2),s) = SOME( If(e1,Seq(e2,While(e1,e2)),Skip),s) (* (while) *)
  | reduce (Skip,s) = NONE                                     
  | reduce (Seq (e1,e2),s) =                                   
    (case e1 of                                                 
        Skip => SOME(e2,s)                                     (* (seq1) *)
      | _ => ( case reduce (e1,s) of                           
                 SOME (e1',s') => SOME(Seq (e1',e2), s')       (* (seq2) *)
               | NONE => NONE ) )                                        


  (* now define the many-step evaluation function

     evaluate :  expr * store -> (expr * store) option 

  which takes a configuration (e,s) and returns the unique (e',s')
  such that   (e,s) -->* (e',s') -/->.  *)

fun evaluate (e,s) = case reduce (e,s) of 
                         NONE => (e,s)
                       | SOME (e',s') => evaluate (e',s')


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

(* ****************** *)
(* testing machinery  *)
(* ****************** *)
;
load "Listsort";
load "Int";
load "Bool";

(* pretty print expressions *)

