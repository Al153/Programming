(*_________________ EXAMPLE SHEET ONE __________________*)

(*Q1*)

exception IncompatibleYear;
fun testYear aa = if aa>99 or aa<0 then raise IncompatibleYear else true;


fun four_to_two yyyy = if (yyyy>2049) orelse (yyyy<1950) then raise IncompatibleYear else
	if yyyy >= 2000 then yyyy - 2000 else yyyy-1900;

fun two_to_four yy = if yy>99 orelse yy<0 then raise IncompatibleYear else
	if yy>=50 then yy+1900 else yy+2000;

fun compareYears aa bb = if testYear a andalso testYear b then
	if (aa<50 andalso bb<50) orelse (aa>=50 andalso bb>=50) then (a>b) else (b>a);
	else false; (*will never get to this point. we just need this part so that the function is grammatically correct*)

fun addYears yy toAdd = if testYear yy then
	four_to_two (toAdd + two_to_four yy) 
	else false;

(*Q2*)

fun median a b c = 	if (a<b) then 
						if (b<c) then b 
						else if (a<c) then c else a
					else if a<c then a
						else if c<b then b else c;

fun medianr  (a:real) b c = 	if (a<b) then 
						if (b<c) then b 
						else if (a<c) then c else a
					else if a<c then a
						else if c<b then b else c;

a)	median = fn: int -> int -> int -> int
	medianr = fn: real -> real -> real -> real

b)	one deals with ints the other reals
c)	medianr has a :real type constraint
d) 	it was necessary, since the type inference algorithm had no way of inferring what type a b c were and hence would have defaulted to int
e)	yes, when it is not clear to other programmers what the types are - to maintain clearer code

(*Q3*)

fun mean a b c = (a+b+c) div 3;
fun meanr a b c = (a+b+c)/3.0;

a)	mean = fn: int -> int -> int -> int
	meanr = fn: real -> real -> real -> real 

b) div, /
c) + * -, not / div mod
 (*Q4*)

fun fact 0 = 1 |
	fact n = n * fact (n-1);
fun facti 0 acc = acc |
	facti n acc = facti (n-1) (acc*n);

(*Q5-7 are proofs *)

(*Q8*)

fun sum [] = 0 |
	sum (x::xs) = x + sum xs;

fun sumi [] v = v |
	sumi (x:xs) v = sumi xs (v+x);

fun nth (x::_) 0 = x |
	nth (_::xs) n = nth xs (n-1);

polymorphic since the list can be any type

fun evens [] = [] |
	evens (_::xs) = odds xs 
and odds [] = [] |
	odds (x::xs) = x::(evens xs);

fun evens [] = [] |
	evens [_] = [] |
	evens (_::(x::xs)) = x :: (evens xs);

fun flatten [] = [] |
	flatten (xs::xss) = xs @ flatten xss;

fun flatten2 xs = flatten (map flatten xs);
fun flatten3 xs = flatten (map flatten2 xs);


(*Problemsheet 2*)

(*Q1*)

fun foundSublist [] _ = true |
	foundSublist _ [] = false |
	foundSublist (x::xs) (y::ys) = if (x=y) then (foundSublist xs ys) else (foundSublist (x::xs) ys);

fun sublist [] _ = true |
	sublist _ [] = false |
	sublist (x::xs) (y::ys) = if x = y then (foundSublist xs ys) else sublist (x::xs) ys;

(*Q2*)
fun revi [] ys = ys |
	revi (x::xs) ys = revi xs (x::ys);

fun listEqual [] [] = true |
	listEqual [] _ = false |
	listEqual _ [] = false |
	listEqual (x::xs) (y::ys) = (x=y) andalso (listEqual xs ys);

fun palindrome xs = (listEqual (revi xs []) xs);

(*Q3*)

(true,1)
0::nil

(*Q4*)

fun findMin [x] = (x,[]) |
	findMin (x::xs) = let val (min,reduced) = findMin xs in 
						if x<min then (x,min::reduced) else (min,x::reduced) end; 
 
fun selectionSort [] = [] |
	selectionSort (xs) = let val (min,new) = findMin xs in min::(selectionSort new) end;
(*Q5*)
^ exactly the same as above..
(*Q6 is ignored*)

(*Q7 - too long and boring :P*)

(*Q8*)
datatype 'a mylist = Nil | Cons of 'a * 'a mylist;

fun myhd (Cons(x,_)) = x;
fun mytl (Cons(_,xs) = xs;
fun mynull Nil = true |
	mynull _ = false;

fun myappend Nil xs = xs |
	myappend (Cons(x,xs)) ys = Cons(x,myappend xs ys);

fun myrev Nil ys = ys |
	myrev (Cons(x,xs)) ys = myrev xs (Cons(x,ys));

fun to_mylist nil = Nil |
	to_mylist (x::xs) = Cons(x,to_mylist xs);

fun to_list Nil = nil |
	to_list (Cons(x,xs)) = x::(to_list xs);

(*Q9*)

datatype Boolean = 
	Var of string |
	Not of Boolean |
	And of Boolean * Boolean |
	Or of Boolean * Boolean;


fun names (Var(n)) = [n] |
	names (Not(b)) = names b |
	names (And(b,c)) = (names b) @ (names c) |
	names (Or(b,c)) = (names b) @ (names c);

fun iterNames (Var(n)) namesList = n::namesList |
	iterNames (Not(b)) namesList = iterNames b namesList |
	iterNames (And(b,c)) namesList = iterNames b (iterNames c namesList) |
	iterNames (Or(b,c)) namesList = iterNames b (iterNames c namesList);

fun names a = iterNames a [];

fun inList a [] = false |
	inList a (x::xs) = (a=x) orelse (inList a xs);

fun dIterNames (Var(n)) namesList = if inList n namesList then namesList else n::namesList |
	dIterNames (Not(b)) namesList = dIterNames b namesList |
	dIterNames (And(b,c)) namesList = dIterNames b (dIterNames c namesList) |
	dIterNames (Or(b,c)) namesList = dIterNames b (dIterNames c namesList);

fun dNames a = dIterNames a [];

fun eval (Var n) context = inList n context |
	eval (Not b) context = not (eval b context)|
	eval (And(a,b)) context = (eval a context) andalso (eval b context) |
	eval (Or(a,b)) context = (eval a context) orelse (eval b context);

fun alternate _ [] = [] |
	alternate a (x::xs) = (a::x)::(x::alternate a xs); (* a  [l1,l2,l3] => [a::l1, l1, a::l2, l2, a::l3, l3]*)

fun powerSet [] = [[]] |
	powerSet (x::xs) = let val pxs = powerSet xs in
		alternate x pxs
	end;

fun evalForAll _ [] = true |
	evalForAll e (c::cs) = (eval e c) andalso (evalForAll e cs);

fun trueForAll e = evalForAll e (powerSet (dNames e));


(*Q10*)

datatype Expr = 
	Val of int |
	Neg of Expr |
	Sum of Expr * Expr |
	Prod of Expr * Expr;

fun eval (Val n) = n |
	eval (Neg e) = ~ eval e |
	eval (Sum(e,d)) = eval e + (eval d) |
	eval (Prod(e,d)) = eval e * (eval d);

(*Second part*)

datatype Expr = 
	Var of string |
	Neg of Expr |
	Sum of Expr * Expr |
	Prod of Expr * Expr;

fun fetch _ [] = 0 |
	fetch n ((name,x)::pairs) = if n=name then x else fetch n pairs;

fun eval (Var n) context = fetch n context |
	eval (Neg e) context = ~ (eval e context) |
	eval (Sum(e,d)) context = eval e context + (eval d context) |
	eval (Prod(e,d)) context = eval e context * (eval d context);




(*_________________ Problemsheet 3 __________________*)

datatype 'a tree = Lf | Br of 'a * 'a tree * 'a tree;

fun getRightmost (Br(v,t1,Lf)) = (v,t1) |
	getRightmost (Br(v,t1,t2)) = let val (vr,newR) = getRightmost t2 in (vr,Br(v,t1,newR)) end;

fun rotAdd Lf t2 = t2 | (*function merges two trees by finding the rightmost of left and making it the new root*)
	rotAdd t1 t2 = let val (newRootValue,newT1) = getRightmost t1
				in Br(newRootValue,newT1,t2) end;

fun delete _ Lf = Lf |
	delete n (Br((name,x),t1,t2)) = if n=name then (rotAdd t1 t2) else
									if n<name then Br((name,x),(delete n t1), t2) else
													Br((name,x),t1,(delete n t2));7


fun remove (Br(_,Lf,_)) = Lf |
	remove (Br(_,Br(v,t11,t12),t2)) = Br(v,t2,remove Br(v,t11,t12));


(*Q4*)

fun inList _ nil = false |
	inList n (x::xs) = x=n orelse inList n xs;

fun exfrec _ [] _ = [] |
	exfred f (x::xs) all = if inList (f x) all then x::(exfrec f xs all) else (exfrec f xs al);

fun exf f xs = exfrec f xs xs;


datatype 'a option = None | Some of 'a

fun mapfilter _ [] = [] |
	mapfilter f (x::xs) = case (f x) of None => mapfilter f xs | Some(y) = y::(mapfilter f xs);


(*Skipping tripos Q 2009 P1 Q1*)

(*Q7*)

datatype 'a lazyList = Nil | Cons of 'a * (unit -> 'a lazyList);

fun lhd (Cons(n,_)) = n;
fun ltl(Cons(_,xf)) = xf();
fun from n = Cons(n,fn () => (from (n+1)));

fun evens Nil = Nil |
	evens (Cons(x,xf)) = odds (xf())
and odds  Nil = Nil |
	odds (Cons(x,xf)) = Cons(x, fn () => evens (xf()));

fun evens2 Nil = Nil |
	evens2 (Cons(_,xf)) = case xf() of Nil => Nil |
									Cons(x,xf) => Cons(x,fn () => evens2 (xf()));



(*Q8*)

datatype 'a lazyList = Nil | Cons of 'a * (unit -> 'a lazyList);
datatype 'a lazyTree = Lf | Br of 'a * (unit -> 'a lazyTree) * (unit -> 'a lazyTree);

fun merge Nil xs = xs |
	merge (Cons(x,xf)) y = Cons(x,fn () => (merge y (xf())));
	
fun labels Lf = Nil |
	labels (Br(v,t1,t2)) = Cons(v,fn () => (merge (labels (t1())) (labels (t2()))));

(*Q9*)


fun lmap _ Nil = Nil |
	lmap f (Cons(x,xf)) = Cons(f x,fn () => ((lmap f) (xf())));


