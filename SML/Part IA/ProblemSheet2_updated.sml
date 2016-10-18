Name: Alexander Taylor
CRSID: at736
College: St John's
Supervision Number: 2
Group Number: 3
Date/time of supervision: Wednesday 28th October, 19: 00-20:00



(*_________________________ Exercise 1 _________________________*)
	(*returns true if the elements in x are found in y in order but not necessarily together *)
	(*val sublist = fn: 'a list * 'a list -> bool, where 'a is comparable*)

	fun sublist([],y) = true |
		sublist(x,[]) = false |
		sublist((x::xs),(y::ys)) = 	if (x = y) then
										sublist(xs,ys)
									else
										sublist(x::xs,ys);
	(*
		sublist([1,3],[0,1,2,3]) ==> true
	


	*)


	(*Alternate version... *)
	(*Only returns true if the elements in x are all in y in order and together *)

	(* There are two functions - one scans for the first element, the second checks that the elements are together*)
	

	(*val sublist_found = fn: 'a list * 'a list -> bool, where 'a is comparable*)
	(*Checks elements are together*)
	fun sublist_found([],_) = true | 
		sublist_found(_,[]) = false |
		sublist_found((x::xs),(y::ys)) = if (x = y) then 
											sublist_found(xs,ys)
										else
											false;

	(*val sublist = fn: 'a list * 'a list -> bool, where 'a is comparable*)

	fun sublist([],_) = true |  (*This function scans list until it finds the first value of x in y, then switches state to sublist found*)
		sublist(_,[]) = false |
		sublist((x::xs),(y::ys)) = if (x=y) then sublist_found(xs,ys) 
									else sublist(x::xs,ys);




	(*
		sublist([1,3],[0,1,2,3]) ==> false
	*)

(*_________________________ Exercise 2 _________________________*)
	(*val reversei = fn: 'a list  * 'a list -> 'a list *)
	fun reversei([],ys) = ys |
		reversei(x::xs, ys) = reversei(xs, x::ys) ;

	(*val reverse = fn: 'a list -> 'a list*)
	fun reverse(l) = reversei(l,l);

	(*val cmp_list = fn: 'a list * 'a list -> 'a list, when 'a is comparable*)
	fun cmp_list([],[]) = true |
		cmp_list(_,[]) = false |
		cmp_list([],_) = false |
		cmp_list(x::xs,y::ys) = if x = y then cmp_list(xs,ys) else false;

	(*val is_palindrome = fn: 'a list -> 'a list, where 'a is comparable*)
	fun is_palindrome(L) = cmp_list(L,reverse(L));


(*_________________________ Exercise 3 _________________________*)
	(*

	> val f = fn: 'a * 'b -> 'b * 'a
	> val g = fn: 'a -> 'a list

	f(1, true) -> (true,1)  - It appears that f reverses the order of its arguments ( it reverses the order of the types )
	g(0) -> [0] 			- g returns a list of the type of the input value, so [0]  or 0::nil is plausible

	*)
(*_________________________ Exercise 4 _________________________*)
	(* Several different functions *)

	(* returns the minimum out of x and y *)
	(* int * int -> int *)
	fun smallest(x,y) = if (x<y) then x else y;

	(* Finds the smallest integer in a list *)
	(* int list -> int *) (*also works for real list *)
	fun min([x]) = x |
		min(x::xs) = smallest(x,min(xs));

	(*given the smallest value in the list, removes the first instance of it from the list*)
	(* 'a * 'a list -> 'a list where a is comparable*)
	fun remove_min(m,[]) = [] |
		remove_min(m,[x]) = if m = x then [] else [x] |
		remove_min(m,x::xs) = if m = x then xs else x::remove_min(m,xs);

	(*remove min (1,[3,2,4,1,5] -> [3,2,4,5]*)


	(* 'a list -> 'a list *)
	fun sel_sort([]) = [] |
		sel_sort(L) = let val m = min(L) in  m::sel_sort(remove_min(m,L)) end;

	(* 	Takes o(n) auxilary space
		(the space used to construct the return list, and the min/remove runs).

		Functions min and remove_min take O(n) time and are each called O(n) times
		so the algorithm takes O(n^2) time.


	*)

(*_________________________ Exercise 5 _________________________*)
	(*
	Three functions: one does a swapping run (looks at each pair and swaps
												if they are out of order)
					 The next is an iterative function that repeatedly calls the
					 swapping run function

					 The last is a wrapper function
	*)
	
	(*'a * 'a list -> 'a list, 'a is comparable*)
	fun bubble_run(x,[]) = [x] |  (*Bubble run does a swapping pass*)
		bubble_run(y,x::xs) = if x>y then x::bubble_run(y,xs) else (* Implicitly swaps x and y*)
										  y::bubble_run(x,xs); 
	
	(* 'a list * 'a list -> 'a list, 'a is comparable*)
	fun bubble_sort_i([],L) = L |    (* Takes two lists: the first represents a counter, so the algorithm stops when it's empty, the second is actually sorted *)
		bubble_sort_i(x::xs,y::ys) = bubble_sort_i(xs,bubble_run(y,ys));


	(*'a list -> 'a list, a is comparable*)
	fun bubblesort (x) = bubble_sort_i(x,x); (* Wrapper *)


	(*
	Uses O(n) space to construct a new list during each bubble_run.
	Bubble_run takes O(n) time, since it iterates through the list, and is called n times
	So the algorithm uses O(n^2) time

	*)

(*_________________________ Exercise 6 _________________________*)
	(*
	Time complexity of linear, given imperative style arrays, since it consists of a constant number of
	loops over the input array and the array of keys generated.

	if r is the range in values of the numbers to be sorted:

		Has O(n) + O(r) = O(n+r) running time if arrays are randomly accessible.
		Has O(n+r) space complexity - needs an array of size n, and of size r.

		This does not violate slide 502, since counting sort does not use comparisons to sort.


	Naively, the time complexity of the lookups in the first and third loops are O(n), and O(n^2)  in ML, since ML needs to traverse the list
	that the values are stored in. The lookups and stores in the second loop are O(1), since the array in the second loop is 
	traversed from start to end. Since these lookups are in loops, they become O(n^2), O(r), O(n^3), so the algorithm is in total O(r + n^3).
	The space complexity remains O(n+r)

	If balanced binary search trees are used instead of the count list, then the loops become O(n log n), O(r log r), O(n^2 log n), giving an overall time complexity of O(n^2 Log n + r log r).
	*)

(*_________________________ Exercise 7 _________________________*)
	datatype month = 
	 	january | february | march | april | may | june | july | august | september | october | november | december	
	
	 (*month * int -> int*)
	fun to_day(january,day) = day |
		to_day(february,day) = 31 + day |
		to_day(march,day) = 59 + day |
		to_day(april,day) = 90 + day |
		to_day(may,day) = 120 + day |
		to_day(june,day) = 151 + day |
		to_day(july,day) = 181 + day |
		to_day(august,day) = 212 + day |
		to_day(september,day) = 243 + day |
		to_day(october,day) = 273 + day |
		to_day(november,day) = 304 + day |
		to_day(december,day) = 334 + day;

	(*int -> (month * int) *)
	fun to_date(day) =  if day <= 31  then (january,day) else
		 		if day <= 59   then (february,day-31) else
		 		if day <= 90   then (march,day-59) else
		 		if day <= 120  then (april,day-90)else 
		 		if day <= 151  then (may,day-120) else
		 		if day <= 181  then (june,day-151) else
		 		if day <= 212  then (july,day-181) else
		 		if day <= 243  then (august,day-212) else
		 		if day <= 273  then (september,day-243) else
		 		if day <= 304  then (october,day-273) else
		 		if day <= 334  then (november,day-304) else
				(december,day-334);


(*_________________________ Exercise 8 _________________________*)

	datatype ’a mylist = Nil | Cons of ’a * ’a mylist;	

	(* 'a mylist -> 'a *)
	fun myhd Nil = raise Empty |
		myhd (Cons(x,xs)) = x;	

	(* 'a mylist -> 'a *)
	fun mytl Nil = raise Empty |
		mytl (Cons(x,xs)) = xs;

	(* 'a mylist -> bool *)
	fun mynull Nil = true |
		mynull L = false;

	(* 'a mylist * 'a mylist -> 'a mylist*)
	fun myappend(Nil,ys) = ys |
		myappend (Cons(x,xs),ys) = Cons(x,myappend(xs,ys));

	(* 'a mylist * 'a mylist -> 'a mylist*)
	fun myrevi(Nil,ys) = ys | (*Iterative with a wrapper*)
		myrevi(Cons(x,xs),ys) = myrevi(xs,Cons(x,ys));

	(* 'a mylist -> 'a mylist *)
	fun myrev(xs) = myrevi(xs,Nil);

	(* 'a list -> 'a mylist *)
	fun to_mylist [] = Nil |
		to_mylist (x::xs) = Cons(x,to_mylist(xs));

	(* 'a mylist -> 'a list *)
	fun to_list Nil = [] |
		to_list(Cons(x,xs)) = x::to_list(xs);


(*_________________________ Exercise 9 _________________________*)
	datatype Boolean =
		Var of string
		| Not of Boolean
		| And of Boolean * Boolean
		| Or of Boolean * Boolean;

	(*Examples*)
	val c = And(Var("a"),Var("b"));
	val d = Or(Not(And(c,Var("d"))),Var("d"));

	(* Boolean -> string list *)
	fun names (Var(s)) = [s] |  (* inefficient use of @, and will list names as many times as they are used*)
		names(Not(b)) = names b |
		names(And(a,b)) = names(a) @ names(b) |
		names(Or(a,b)) = names(a) @ names(b);

	(* eg names(d) -> a,b,d *)


	(*Functions to deal with merging distinct elements *)

		(* ''a * ''a list -> bool*)
	fun is_in_list(a,[]) = false |
		is_in_list(a,x::xs) = if a = x then true else is_in_list(a,xs);

		(* appends only the element such that each element appears once*)
		(* ''a list * ''a list -> ''a list*)
	fun distinct_append(xs,[]) = xs |
		distinct_append([],ys) = ys |
		distinct_append(x::xs,ys) = if (is_in_list(x,ys)) then distinct_append(xs,ys) else x::distinct_append(xs,ys);

	(**)

	(*Very similar to names - only picks out each name once *)

	fun distinct_names(Var(s)) = [s] |
		distinct_names(Not(b)) = distinct_names b |
		distinct_names(And(a,b)) = distinct_append(distinct_names a, distinct_names b) |
		distinct_names(Or(a,b)) = distinct_append(distinct_names a, distinct_names b);

	(*Simple eval function*)

	(*Boolean * string list -> bool *)
	fun eval(Var(b),L) = is_in_list(b,L) |
		eval(Not(b),L) = not(eval(b,L)) |
		eval(And(a,b),L) = eval(a,L) andalso eval(b,L) |
		eval(Or(a,b),L) = eval(a,L) orelse eval(b,L);



	(*given a list of lists, and element k, all cons appends k to all lists in the list of lists*)
	(* 'a * 'a list list -> 'a list list *)
	fun allcons (_, []) = [] |
		allcons(k, x::xs) = (k::x)::allcons(k,xs);

	(*Given a list of names, create contexts creates a list of all contexts *)
	(* 'a list -> 'a list list *)
	fun createContexts([]) = [[]] | (*No names gives a single context, the empty list*)
		createContexts(n::ns) = let val l = createContexts(ns) in l @ allcons(n,l) end; (*all possibilities without n @ all posibilities with n*)

	(*Boolean * 'a list list -> bool*)
	fun evalAll(E,[]) = true | (*If all contexts have been eval-ed and returned true then return true*)
		evalAll(E,x::xs) = eval(E,x) andalso evalAll(E,xs);



		(* evals all input combinations to see if they are all true*)

	(*Boolean -> bool*)
	fun allTrue(E) = evalAll(E,createContexts(distinct_names(E)));

	val a = Or(Or(Or(Or(Var("a"),Not(Var("a"))),Var("b")),Var("c")),Var("d"));

	(* allTrue(a) ==> true *)
 		

(*_________________________ Exercise 10 _________________________*)

	(* No variables *)

	datatype Expr = 
		Int of int |
		Neg of Expr |
		Add of Expr * Expr |
		Multi of Expr * Expr;

	(*Expr -> int*)
	fun eval(Int(a)) = a |
		eval(Neg(a)) = 0 - eval(a) | (* SML/NJ didn't seem to like ~. it was throwing an overload conflict error*)
		eval(Add(a,b)) = eval(a) + eval(b) |
		eval(Multi(a,b)) = eval(a) * eval(b);

	eval(Multi(Add(Int 1, Int 2),Neg(Int 3))); (* returns ~9 *)



	(* with variables *)

	datatype Expr = 
		Int of int |
		Var of string |
		Neg of Expr |
		Add of Expr * Expr |
		Multi of Expr * Expr;

	exception NotFoundInContext

	(* Function to retrieve the value of a variable from a context*)
	(*string * (string * int) list -> int*)
	fun getValue(name:string,[]) = raise NotFoundInContext | 
		getValue(name:string,(dict_name:string,value:int)::xs) = if name = dict_name then value else getValue(name,xs);

	(*Expr -> int*)
	fun eval(Int(a),context) = a |
		eval(Var(name),context) = getValue(name,context) |
		eval(Neg(a),context) = 0 - eval(a,context) | 
		eval(Add(a,b),context) = eval(a,context) + eval(b,context) |
		eval(Multi(a,b),context) = eval(a,context) * eval(b,context);

	val context = [("x",7),("y",8)];
	eval(Multi(Var "x", Var "y"),context);  (* Returns 56:int *)