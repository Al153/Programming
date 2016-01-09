(*_____________________Excercise 1_____________________*)

They want verifiable code, use of ML dataypes.
They to develop code incrementally using the interactive interpreter.
(Functional in general) They want to use a language with pure functions so that
they can make use of the optimisations and concurrency available when  using pure functions.
They want to make use of higher order functions to allow more concise code.

(*_____________________Excercise 2_____________________*)
fun xor (a:bool) b = not(a = b);
(*_____________________Excercise 3_____________________*)
fun factInt 0 = 1 
	|factInt n = n * factInt (n-1);
(*It's hard to adapt this to floats, since you cannot use pattern matching or equality
	on floats. One way would be to integerate the function (x^n)*e^(-x) from 1 to infinity*)
(*_____________________Excercise 4_____________________*)
	t(1) = t(0) + 0 = 0
	t(2) = t(1) + 1 = 1
	t(3) = t(2) + 2 = 3

	t(n) = (1/2)(n)(n-1)

(*_____________________Excercise 5_____________________*)
fun empty [] = true |
	empty _ = false;

(*_____________________Excercise 6_____________________*)
fun sum [] = 0 |
	sum (x::xs) = x + (sum xs);
(*_____________________Excercise 7_____________________*)
fun reverse xs =
	let
		fun rev ([],ys) = ys |
		rev (x::xs,ys) = rev(xs,x::ys);
	in
		rev(xs,[])
	end;
(*_____________________Excercise 8_____________________*)
(*auxiliary function*)
(* ''a -> ''a list -> bool *)
fun all_equal_aux x [] = true | 
	all_equal_aux x (y::ys) = (x = y) andalso all_equal_aux x ys;

(*''a list -> bool *)
fun all_equal [] = true |
	all_equal (x::xs) = all_equal_aux x xs;
(*_____________________Excercise 9_____________________*)
fun zip([],[]) = [] |
	zip(x::xs,y::ys) = (x,y) :: zip(xs,ys); (*assumes lists are the same length*)
(*_____________________Excercise 10_____________________*)
fun sorted [] = true |
	sorted [x] = true |
	sorted (x1 :: x2 :: xs) = (x1 =< x2) andalso sorted (x2::xs);
(*_____________________Excercise 11_____________________*)
fun merge [] ys = ys |
	merge xs [] = xs |
	merge (x::xs) (y::ys) = if x <= y
							then x::(merge xs (y::ys))
							else y::(merge (x::xs) ys);
(*_____________________Excercise 12_____________________*)
datatype 'a bTree = Lf | Br of 'a * 'a bTree * 'a bTree;

(*_____________________Excercise 13_____________________*)
datatype 'a List = Nil | Cons of 'a * 'a List;

(*_____________________Excercise 14_____________________*)
exception Empty;
fun hd (Cons(x,xs)) = x | 
	hd _ = raise Empty;

(*_____________________Excercise 15_____________________*)
fun sumTree Lf = 0 |
	sumTree (Br(v,t1,t2)) = v + (sumTree t1) + (sumTree t2);

(*_____________________Excercise 16_____________________*)
exception notFound;

fun listEmpty [] = true | listEmpty _ = false;

fun listLookup _ [] = raise notFound |
	listLookup a ((b,c)::es) = if a = b then c else (listLookup a es) ;

fun listUpdate a b [] = [(a,b)] |
	listUpdate a b ((c,d)::vs) = if a = c then (a,b)::vs else (c,d) :: (listUpdate a b vs);

fun listDelete a [] = [] |
	listDelete a ((b,c)::vs) = if a = b then vs else (b,c) :: (listDelete a vs);


(*_____________________Excercise 17_____________________*)
NOTES

(*_____________________Excercise 18_____________________*)
exception notFound;
fun treeEmpty Lf = true | treeEmpty _ = false;
fun treeLookup _ Lf = raise notFound |
	treeLookup a (Br((b,c),t1,t2)) = if a = b then c else
	if a < b then treeLookup a t1 else treeLookup a t2;
fun treeUpdate a b Lf = Br((a,b),Lf,Lf) |
	treeUpdate a b (Br((c,d),t1,t2)) = if a = c then Br((a,b),t1,t2)else
		if a < c then Br((c,d),(treeUpdate a b t1), t2) else Br((c,d),t1,(treeUpdate a b t2));

(*_____________________Excercise 19_____________________*)
In order: visit left child, node value, right child
Pre order: visit node value, left child, right child
Post order: visit left child, right child, node value

(*In order*)
fun toList Lf = [] | 
	toList (Br(a,t1,t2)) =  (toList t1) @ (a :: toList t2);
(*preorder*)
fun toList Lf = [] | 
	toList (Br(a,t1,t2)) = a :: (toList t1 @ (toList t2));
(*Postorder*)
fun toList Lf = [] |
	toList (Br(a,t1,t2)) = toList t1 @ (toList t2) @ [a]; 
(*_____________________Excercise 20_____________________*)

A functional array uses a binary tree to implement an array.

exception Subscript;
exception EmptyArray;
fun lookup _ Lf = raise EmptyArray |
	lookup k (Br(a,t1,t2)) = if k = 0 then raise Subscript else
		if k = 1 then a else
		if k mod 2 = 0 then
			lookup (k div 2) t1
		else
			lookup (k div 2) t2;

(*_____________________Excercise 21_____________________*)
fun map _ [] = [] |
	map f (x::xs) = (f x) :: (map f xs);
(*_____________________Excercise 22_____________________*)
datatype 'a lazyList = Nil | Cons of 'a * ( unit -> 'a lazyList);
(*_____________________Excercise 23_____________________*)
fun toList _ Nil = [] |
	toList n (Cons(x,xf)) = if n = 0 then [] else (x::(toList (n-1) (xf()))); 
(*_____________________Excercise 24_____________________*)
fun interleave Nil y = y |
	interleave x Nil = x |
	interleave (Cons(x,xf)) y = Cons(x,fn () => interleave y (xf()));
(*_____________________Excercise 25_____________________*)
Breadth first: tests all nodes at each level before going onto the next.  Always finds the closest solution first. But has to construct a very large queue of nodes to search
Depth first: Requires far less space than breadth first, but finds the right most solution rather than closest.
Iterative deepening: repeatedly depth first search to a deeper limit until a solution is found. slower than breadth first, but requires less space
(*_____________________Excercise 26_____________________*)
exception NotFound;
fun breadthSearch a [] = raise NotFound |
	breadthSearch a ((Br((b,c),t1,t2))::toSearch) = if a = b then c else breadthSearch a (toSearch @ [t1,t2]); 

fun depthSearch a Lf = raise NotFound |
	depthSearch a (Br((b,c),t1,t2)) = if a = b then c else (depthSearch a t1) handle NotFound => (depthSearch a t2);
(*_____________________Excercise 27_____________________*)
datatype 'a Queue = Qu of 'a list * 'a list;

fun qNorm (Qu([],back)) = Qu(rev back,[]) |
	qNorm q = q;

fun qAdd a (Qu(front,back)) = qNorm (Qu(front,a::back));
fun qRead (Qu(f::fs, back)) = f;
fun qRemove (Qu(f::fs,back)) = qNorm (Qu(fs,back));

(*_____________________Excercise 28_____________________*)

 sorted list of (int * real), where int represents the power, and real represents the coefficient
 addition is then implemented through an augmented merge function

(*_____________________Excercise 29_____________________*)
int ref list is a list of references to integers.
int list ref is a reference to a list of intergers.

(*_____________________Excercise 30_____________________*)

(* functional arrays? *)
fun mapArray f Lf = Lf |
	mapArray f (Br(a,t1,t2)) = Br((f a),(mapArray f t1), (mapArray f t2));