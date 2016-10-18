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
         if (is_value e1) then (                                        
             case reduce (e2,s) of 
                 SOME (e2',s') => SOME (Op(e1,opr,e2'),s')     (* (op2) *)
               | NONE => NONE )                           
         else (                                                 
             case reduce (e1,s) of 
                 SOME (e1',s') => SOME(Op(e1',opr,e2),s')      (* (op1) *)
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
           (SOME intref,SOME int) => SOME unit
         | _ => NONE)
  | infertype gamma (Skip) = SOME unit
  | infertype gamma (Seq (e1,e2))  
    = (case (infertype gamma e1, infertype gamma e2) of
           (SOME unit, SOME t2) => SOME t2
         | _ => NONE )
  | infertype gamma (While (e1,e2)) 
    = (case (infertype gamma e1, infertype gamma e2) of
           (SOME bool, SOME unit) => SOME unit 
         | _ => NONE )



(* ****************** *)
(* testing machinery  *)
(* ****************** *)
;
load "Listsort";
load "Int";
load "Bool";

(* pretty print expressions *)

fun prettyprintop Plus = "+"
  | prettyprintop GTEQ = ">="
                         
fun prettyprintexpr (Integer n) = Int.toString n
  | prettyprintexpr (Boolean b) = Bool.toString b
  | prettyprintexpr (Op (e1,opr,e2)) 
    = "(" ^ (prettyprintexpr e1) ^ (prettyprintop opr) 
      ^ (prettyprintexpr e2) ^ ")"
  | prettyprintexpr (If (e1,e2,e3)) 
    = "if " ^ (prettyprintexpr e1 ) ^ " then " ^ (prettyprintexpr e2)
      ^ " else " ^ (prettyprintexpr e3)
  | prettyprintexpr (Deref l) = "!" ^ l
  | prettyprintexpr (Assign (l,e)) =  l ^ ":=" ^ (prettyprintexpr e )
  | prettyprintexpr (Skip) = "skip"
  | prettyprintexpr (Seq (e1,e2)) =  (prettyprintexpr e1 ) ^ ";" 
                                     ^ (prettyprintexpr e2)
  | prettyprintexpr (While (e1,e2)) =  "while " ^ (prettyprintexpr e1 ) 
                                       ^ " do " ^ (prettyprintexpr e2)

(* pretty print stores, first sorting by location names for readability *)

fun rawprintstore [] = ""
  | rawprintstore ((l,n)::pairs) = l ^ "=" ^ (Int.toString n) 
                                   ^ " " ^ (rawprintstore pairs)

fun prettyprintstore pairs = 
    let val pairs' = Listsort.sort 
                         (fn ((l,n),(l',n')) => String.compare (l,l'))
                         pairs
    in
        "{" ^ rawprintstore pairs' ^ "}" end

(* pretty print configurations *)

fun prettyprintconfig (e,s) = "< " ^ (prettyprintexpr e) 
                             ^ " , " ^ (prettyprintstore s) ^ " >"

(* do a reduction sequence, printing the initial state and the state
   after each reduction step *)

fun prettyreduce' (e,s) = 
    case reduce (e,s) of 
        SOME (e',s') => 
        ( TextIO.print ("\n -->  " ^ prettyprintconfig (e',s') ) ;
          prettyreduce' (e',s'))
      | NONE => (TextIO.print "\n -/->  " ; 
                 if is_value e then 
                     TextIO.print "(a value)\n" 
                 else 
                     TextIO.print "(stuck - not a value)" )

fun prettyreduce (e,s) = (TextIO.print ("      "^(prettyprintconfig (e,s))) ;
                          prettyreduce' (e,s))

(* **************)
(* simple tests *)
(* **************)

fun doit () = prettyreduce (Seq( Assign ("l1",Integer 3), Deref "l1"), [("l1",0)] )
(*
 infertype [("l1",intref)] (Seq( Assign ("l1",Integer 3), Deref "l1"));;
*)
fun doit2 () = infertype [("l1",intref)] (Seq( Assign ("l1",Integer 3), Deref "l1"));
