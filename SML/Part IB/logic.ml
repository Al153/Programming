type expr = 
	Var of string | 
	Fun of string * (expr list)

type proposition =
	Term of string |
	Predicate of string * (expr list) |
	ForAll of string * proposition |
	Exists of string * proposition |
	Not of proposition |
	And of proposition * proposition |
	Or of proposition * proposition |
	Implies of proposition * proposition

;;

let rec elim_implies p = 
	match p with
		| Term(s) -> Term(s)
		| Predicate(s,l) -> Predicate(s,l)
		| ForAll(x,p) -> ForAll(x, elim_implies p)
		| Exists(x,p) -> Exists(x, elim_implies p)
		| Not(q) -> Not( elim_implies q)
		| And(q, o) -> And( elim_implies q, elim_implies o)
		| Or(q, o) -> Or( elim_implies q, elim_implies o)
		| Implies(a, b) -> Or(Not(elim_implies a), elim_implies b)
	;;

let rec elim_implies_step p = 
	match p with
		| Term(s) -> (Term(s), false)
		| Predicate(s,l) -> (Predicate(s,l), false)
		| ForAll(x,p) -> let (res, success) = elim_implies_step p in (ForAll(x, res), success)
		| Exists(x,p) -> let (res, success) = elim_implies_step p in (Exists(x, res), success)

		| Not(q) ->
			let (res, success) = elim_implies_step q
			in (Not(res), success)
		| And(q, o) -> 
			let (res,success) = elim_implies_step q
			in
				if success then
					(And(res, o), success) 
				else
					let (res,success) = elim_implies_step q
					in (And(q,res), success)

		| Or(q, o) -> 
			let (res,success) = elim_implies_step q
			in
				if success then
					(Or(res, o), success) 
				else
					let (res,success) = elim_implies_step q
					in (Or(q,res), success)

		| Implies(a, b) -> (Or(Not(a), b), true)
	;;

let rec push_not = function
	| Term(s) -> Term(s)
	| Predicate(s,l) -> Predicate(s,l)
	| Not(expr) ->
		( match expr with
				| Term(s) -> Not(Term(s))
				| Predicate(s,l) -> Not(Predicate(s,l))
				| Not(e) -> push_not(e)
				| And(a,b) -> Or(push_not(Not(a)), push_not(Not(b)))
				| Or(a,b) -> And(push_not(Not(a)), push_not(Not(b)))
				| ForAll(x,p) -> Exists(x, push_not(Not(p)))
				| Exists(x,p) -> ForAll(x, push_not(Not(p)))
		)
	| And(a,b) -> And(push_not a, push_not b)
	| Or(a,b) ->  Or(push_not a, push_not b)
	| ForAll(x,p) -> ForAll(x, push_not p)	
	| Exists(x,p) -> Exists(x, push_not p)
;;

let rec push_not_step = function
	| Term(s) -> (Term(s), false)
	| Predicate(s,l) -> (Predicate(s,l), false)
	| ForAll(x,p) -> let (res, success) = push_not_step p in (ForAll(x, res), success)
	| Exists(x,p) -> let (res, success) = push_not_step p in (Exists(x, res), success)
	| Not(expr) ->
		( match expr with
				| Term(s) -> (Not(Term(s)), false)
				| Predicate(s,l) -> (Not(Predicate(s,l)), false)
				| Not(e) -> (e, true)
				| And(a,b) -> (Or(Not(a), Not(b)), true)
				| Or(a,b) -> (And(Not(a), Not(b)), true)
				| ForAll(x,p) -> (Exists(x, (Not(p))), true)
				| Exists(x,p) -> (ForAll(x, (Not(p))), true)
		)
	| And(a,b) -> 
		let (res,success) = push_not_step a
			in
				if success then
					(And(res, b), success) 
				else
					let (res,success) = push_not_step b
					in (And(a,res), success)
	| Or(a,b) -> 
	let (res,success) = push_not_step a
			in
				if success then
					(Or(res, b), success) 
				else
					let (res,success) = push_not_step b
					in (Or(a,res), success)

;;

let rec toCNF = function
	| Term(s) -> Term(s)
	| Predicate(s,l) -> Predicate(s,l)
	| Not(expr) -> Not(expr) (* Since Nots should most tightly bound*)
		
	| And(a,b) -> And(toCNF a, toCNF  b)
	| Or(a,b) ->  Or(toCNF a, toCNF b)
	| ForAll(x,p) -> ForAll(x, push_not p)	
	| Exists(x,p) -> Exists(x, push_not p)


let p = 
Not(
	Implies(
		And(
			ForAll("x",
				Or(
					Predicate("P",[Var("x")]),
					Implies(Term("Q"),Not(Predicate("R",[Var("x")])))
				)
			),
			ForAll(
				"x",
				Implies(
					Implies(Term("Q"), Not(Predicate("S",[Var("x")]))),
					And(Predicate("P",[Var("x")]),Predicate("R",[Var("x")]))
				)
			)
		),
		ForAll("x",Predicate("S",[Var("x")]))
	)
)

in let q = (elim_implies(p))  in
push_not(q)
;;