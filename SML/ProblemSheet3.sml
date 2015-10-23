Name: Alexander Taylor
CRSID: at736
College: St John's
Supervision Number: 3
Group Number: 3
Date/time of supervision: Wednesday 4th Nov, 1900-20:00

(* ____________________ Exercise 2 ____________________ *)
	datatype Tree = 
		Lf | Br of ( string * int ) * Tree * Tree;
	
	(*Tree * string * int -> tree*)
	fun update(Lf,b:string,y) = Br((b,y),Lf,Lf) |
		update(Br((a,x),t1,t2),b,y) =
		if (b<a) then (*Update on left hand child*)
			Br((a,x),update(t1,b,y),t2)
		else if (b>a) then (*Update on the right hand child*)
			Br((a,x),t1,update(t2,b,y))
		else (*b=a*) 
			Br((b,y),t1,t2)
	;
	
	exception Missing of string;
	
	(*Tree * string -> int *)
	fun lookup (Br((a,x),t1,t2),b) = 
		if b<a then (*Search left hand child*)
			lookup(t1,b)
		else if b>a then (*Search right hand child*)
			lookup(t2,b)
		else x (*b=a ==> return the node*)
	
		| lookup(Lf,b) = raise Missing b;
	
	exception CouldNotRemove of string;
	
	(*Auxilary function to merge two trees into one*)
	(*Tree * Tree -> Tree*)
	fun mergeTrees(Lf,b) = b |
		mergeTrees(a,Lf) = a |
		mergeTrees(
			Br((a,x),a1,a2),   (*We know that every item in tree B has a greater index than any item in tree a, so merging can happen simply without spoiling the searcheable nature of the tree*)
			Br((b,y),b1,b2)) = Br((a,x),a1, 	(*create a new tree based around node (a,x), with left child a1, and right child the merge of a1, and the b tree*)
			mergeTrees( a2,Br((b,y),b1,b2) 		(*Ie the a tree node gets "promoted" and gains the B tree as one of its children*)
				))
		;
	
	(*Tree * int -> Tree*)
	fun remove(Lf,b:string)  = raise CouldNotRemove b |
		remove(Br((a,x),t1,t2),b) =
			if b<a then (*try to remove on left hand child*)
				Br((a,x),remove(t1,b),t2)
			else if b>a then (*Try to remove on right hand child*)
				Br((a,x),t1,remove(t2,b))
			else (*a=b*)
				mergeTrees(t1,t2) (*Cuts out br*)
	;
	
	(*
	This has a problem in that real use it has a tendency to produce unbalanced trees as the left hand child is always promoted.
	A better solution would be to randomise or  alternated which side gets promoted
	*)
	
	(*#
- val a = Lf;
val a = Lf : Tree
- val a = update(a,"steph",8);
val a = Br (("steph",8),Lf,Lf) : Tree
- val a = update(update(a,"sophie",10),"tom",6);
val a = Br (("steph",8),Br ((#,#),Lf,Lf),Br ((#,#),Lf,Lf)) : Tree
- val a = update(update(a,"George",9),"beth",3);
val a = Br (("steph",8),Br ((#,#),Br #,Lf),Br ((#,#),Lf,Lf)) : Tree
- val a = update(update(a,"Al",1),"Jim",5);
val a = Br (("steph",8),Br ((#,#),Br #,Lf),Br ((#,#),Lf,Lf)) : Tree
- lookup(a,"steph");
val it = 8 : int
- lookup(a,"al");

uncaught exception Missing
  raised at: stdIn:218.26-218.35
- lookup(a,"Al");
val it = 1 : int
- lookup(a,"George");
val it = 9 : int
-
-
- val b = remove(a,"steph");
val b = Br (("sophie",10),Br ((#,#),Br #,Br #),Br ((#,#),Lf,Lf)) : Tree
- val b = remove(a,"tom");
val b = Br (("steph",8),Br ((#,#),Br #,Lf),Lf) : Tree
- lookup(b,"Jim");
val it = 5 : int
- val b = remove(b,"steph")
= ;
val b = Br (("sophie",10),Br ((#,#),Br #,Br #),Lf) : Tree
- val b = remove(b,"sophie")
= ;
val b = Br (("George",9),Br ((#,#),Lf,Lf),Br ((#,#),Br #,Lf)) : Tree
- val b = remove(b,"Jim");
val b = Br (("George",9),Br ((#,#),Lf,Lf),Br ((#,#),Lf,Lf)) : Tree
- val b = remove(b,"beth");
val b = Br (("George",9),Br ((#,#),Lf,Lf),Lf) : Tree
- val b = remove(b,"George");
val b = Br (("Al",1),Lf,Lf) : Tree
- val b = remove(b,"George");

uncaught exception CouldNotRemove
  raised at: stdIn:234.35-234.51
- val b = remove(b,"Al");
val b = Lf : Tree
	
	
	


*)
(* ____________________ Exercise 3 ____________________ *)

	(*Auxilary functions, defining the datatype*)
	datatype 'a fArray = Lf | Br of 'a * 'a fArray * 'a fArray;
	
	exception Subscript;
	 
	(*Defined in the lecture notes*)
	fun sub Lf _ = raise Subscript |
		sub (Br(v,t1,t2)) k  = 
		if k=1 then v
		else if k mod 2 = 0 
				then sub t1 k div 2
				else sub t2 k div 2;
	
	(*Defined in the lecture notes*)
	fun update Lf k w =
			if k=1 then Br(w,Lf,Lf)
			else raise Subscript |
		update (Br(v,t1,t2)) k w  = 
			if k = 1 then Br(w,t1,t2)
			else if k mod 2 = 0 then Br(v,(update t1 (k div 2) w),t2)
			else Br (v,t1,(update t2 (k div 2) w));
	



	exception EmptyArray;

	(*'a fArray -> 'a' fArray*)
	fun remove Lf = raise EmptyArray | (*Can't remove from an empty array*)
		remove (Br(x,t1,Lf))  = t1 | 		(*Removing from an array of size one gives a leaf*)
		remove (Br(x,Br(y,t11,t12),t2))  = Br(y,t2,remove (Br(y,t11,t12)));  (*Complex recursive step*)		(*
		All of the nodes on the right hand side have odd numbered indices eg bbbbbb1 - in binary.
		To subtract one from these we just change the LSB to zero (bbbbbb0) , ie move the entire
		right hand branch of the tree to the left hand side.
		
		The new number 1 should be the current number 2, hence y becomes the top node.
		if the new left hand child was the right hand child (LHC, RHC), then the new RHC is the old 
		LHC, but we still need to remove item 1 from old LHC, and subtract one from the indices, so
		the function recurses
	*)
	
		(*takes only O(log n) time*)
	
	(* 'a fArray * 'a list * int -> 'a fArray *)
	fun constructTest tree [] i = tree | (*creates an fArraytree of a list of items*)
		constructTest tree (x::xs) i  = constructTest (update tree x i) xs (i+1);

	val a = constructTest(Lf,[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15],1);


	(* examples
	- sub(a,3);
	val it = 3 : int
	- sub(a,5);
	val it = 5 : int
	- sub(a,1);
	val it = 1 : int
	- sub(a,10);
	val it = 10 : int

	works as expected before removing

	*)
	
	val b = remove a;

	(*
	- sub(b,2);
	val it = 3 : int
	- sub(b,4);
	val it = 5 : int
	- sub(b,15);	

	uncaught exception Subscript
	  raised at: stdIn:13.24-13.33
	- sub(b,13);
	val it = 14 : int
	- sub(b,3);
	val it = 4 : int

	After the remove, each subscript i returns i+1, as expected
	*)


(* ____________________ Exercise 4 ____________________ *)
	(*determines if x is in list y::ys*)
	(* ''a * ''a list -> bool *)
	fun in_list x [] = false |
		in_list x (y::ys) = if x = y then true else in_list x ys;

	(*appends if x is not in list*)
	(* ''a * ''a list -> ''a list *)
	fun addToList x l = if in_list x l then l else x::l;

	(* recursive, takes two copies of l, so one can be compared, and one can be iterated through *)

	(* fn: (''a -> ''a) * ''a list * ''a list -> ''a list *)
	fun exfr f [] l = [] |
		exfr f (x::xs) l = if (in_list (f x) l) then (addToList x  (exfr f xs l))
						   else exfr f xs l;

	(*Wrapper*)
	(* fn: (''a -> ''a) * ''a list -> ''a list *)
	fun exf f l = exfr f l l ;

	(* Example*)
	fun f x = x + 1;
	exf f [9, 3, 2, 2, 8] = [2,8]


(* ____________________ Exercise 5 ____________________ *)
	datatype 'a option = None | Some of 'a;

	(* ('a -> 'b option) -> 'a' list -> 'b' list *)
	

	fun mapfilter _ [] = [] |
		mapfilter f (x::xs) = let
			fun single_filter (None) = [] | single_filter (Some(a)) = [a]
			in (single_filter (f x)) @ (mapfilter f xs) end;


	(*example*)

	fun even x = if (x mod 2 = 0) then Some(x) else None;

	(*- mapfilter even [1,2,3,4,5,6,7,8,9];
	val it = [2,4,6,8] : int list *)
(* ____________________ Exercise 7 ____________________ *)
	datatype 'a seq = Nil | Cons of 'a * (unit -> 'a seq);

	fun head (Cons(x,_)) = x;
	fun tail(Cons(_,xf)) = xf();


	fun evens Nil = Nil |
		evens (Cons(_,xf)) = odds (xf())
	and odds Nil = Nil |
		odds (Cons(x,xf)) = Cons(x, fn() => (evens (xf())));


	(*Example: *)

	fun sequence k = Cons(k, fn() => sequence (k+1));


	(*-       fun sequence k = Cons(k, fn() => sequence (k+1));
	val sequence = fn : int -> int seq
	- sequence 1;
	val it = Cons (1,fn) : int seq
	- tail it;
	val it = Cons (2,fn) : int seq
	- tail it;
	val it = Cons (3,fn) : int seq
	- tail it;
	val it = Cons (4,fn) : int seq
	- tail it;
	val it = Cons (5,fn) : int seq
	*)

	(*
	- evens (sequence 1);
	val it = Cons (2,fn) : int seq
	- tail it;
	val it = Cons (4,fn) : int seq
	- tail it;
	val it = Cons (6,fn) : int seq
	- tail it;
	val it = Cons (8,fn) : int seq
	- tail it;
	val it = Cons (10,fn) : int seq

	*)

(* ____________________ Exercise 8 ____________________ *)
	datatype 'a LazyTree = Null | Br of 'a * (unit -> 'a LazyTree) * (unit -> 'a LazyTree);

	fun labels Null = Nil | 
		labels (Br(x,t1,t2)) = Cons(x,fn() => (lazyAppend (labels (t1())) (labels (t2())) )) (*Preorder tree traversal*)
	and lazyAppend Nil yf = yf | 															 (*Creates a lazy list from two other lazy lists*)	
		lazyAppend (Cons(x,xf)) yf = Cons(x,fn() => (lazyAppend (xf()) (yf))) ;

	(*Navigating the tree*)

	fun left (Br(_,t1,_)) = t1();
	fun right (Br(_,_,t2)) = t2();

	(*Examples*)
	fun newLazyTree k = Br(k,fn()=>(newLazyTree (2*k)),fn()=> (newLazyTree (2*k+1))); (*Example function, creates the tree..
	(1,
		(2,
			(4,(etc)),
			(5,(etc))
		),
		(3,
			(6,(etc)),
			(7,(etc))
		)
	)
	that is, it spans all integers
		*)
	(*
	- newLazyTree 1;
	val it = Br (1,fn,fn) : int LazyTree
	- left it;
	val it = Br (2,fn,fn) : int LazyTree
	- left it;
	val it = Br (4,fn,fn) : int LazyTree
	- left it;
	val it = Br (8,fn,fn) : int LazyTree
	- right it;
	val it = Br (17,fn,fn) : int LazyTree
	- right it;
	val it = Br (35,fn,fn) : int LazyTree
	- right it;
	val it = Br (71,fn,fn) : int LazyTree
	- left it;
	val it = Br (142,fn,fn) : int LazyTree
	- left it;
	val it = Br (284,fn,fn) : int LazyTree
	

	- labels (newLazyTree 1);
	val it = Cons (1,fn) : int seq
	- tail it;
	val it = Cons (2,fn) : int seq
	- tail it;
	val it = Cons (4,fn) : int seq
	- tail it;
	val it = Cons (8,fn) : int seq
	- tail it;
	val it = Cons (16,fn) : int seq
	- tail it;
	val it = Cons (32,fn) : int seq
	- tail it;
	val it = Cons (64,fn) : int seq
	*)

(* ____________________ Exercise 9 ____________________ *)
		datatype 'a seq = Nil | Cons of 'a * (unit -> 'a seq);



		(* ('a -> 'b) -> 'a seq -> 'b seq *)
		fun lazyMap f Nil = Nil |
			lazyMap f (Cons(x,xf)) = Cons(f x, fn() => (lazyMap f) (xf()) ); (*It was horrible trying to find a way of writng this without f calling xf...*)

		(*Examples...*)
		fun double x = 2*x;
	(*
	- lazyMap double (sequence 1);
	val it = Cons (2,fn) : int seq
	- tail it;
	val it = Cons (4,fn) : int seq
	- tail it;
	val it = Cons (6,fn) : int seq
	- tail it;
	val it = Cons (8,fn) : int seq
	- tail it;
	val it = Cons (10,fn) : int seq
	*)