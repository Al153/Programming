Name: Alexander Taylor
CRSID: at736
College: St John's
Supervision Number: 1
Group Number: 3
Date/time of supervision: Wednesday, 1900-20:00

(*____________________ Exercise 1 ____________________*)

	exception YearOutOfBounds; (*Exception for when a particular year is out of bounds*)

	(* (a) *)


	fun four_to_two (year:int) = 
		if year < 1950 then raise YearOutOfBounds
		else if year <2050 then year mod 100
		else raise YearOutOfBounds
	;

	fun two_to_four(year:int) = 
		if year<0 orelse year>99 then raise YearOutOfBounds
		else if year<50 then year + 2000
		else year + 1900
	;

	(* (b) *)

	fun is_greater (y1, y2) =
		if y1<0 orelse y2<0 orelse y1>99 orelse y2>99 then raise YearOutOfBounds (*Checks for bounds errors*)
		else if (y1<50 andalso y2<50) orelse (y1>=50 andalso y2>=50) then (y1>y2) (*if y1 and y2 are on the same side of 2000, compare as normal *)
		else y1<y2 (*if on opposite sides then the comparison is reversed*)
	;

	(* (c) *)

	fun add_years(year,n) = four_to_two(two_to_four(year)+n); (*n is the difference in years - can be negative*)

(*____________________ Exercise 2 ____________________*)

	fun mediani(a,b,c) = 
		if (a>=b andalso c>=a) orelse (a<=b andalso c<=a) then a (* checks each possibile answer for the median *)
		else if (b>=a andalso c>=b) orelse (b<=a  andalso c<=b) then b
		else c
	; 

	fun medianr(a:real,b:real,c:real) = 
		if (a>=b andalso c>=a) orelse (a<=b andalso c<=a) then a (* checks each possibile answer for the median *)
		else if (b>=a andalso c>=b) orelse (b<=a  andalso c<=b) then b
		else c
	; 


(*____________________ Exercise 3 ____________________*)
	
	fun meani(a,b,c) = (a+b+c) div 3;
	fun meanr(a,b,c) = (a+b+c)/3.0;

(*____________________ Exercise 4 ____________________*)
	
	fun facr(0) = 1 | 								(* recursive requiring O(n) stack space *)
		facr(n) = n * facr(n-1)
	;

	fun facre(0) = 1 | 								(* recursive requiring O(1) stack space *)
		facre(n) = facre(n-1) * n
	; 

	fun fac(n) = faci(n,1); 						(* wrapper for iterative function *)
	fun faci(0,total) = total | 					(* iterative function *)
		faci(n,total) = faci(n-1,total*n)
	;

(*____________________ Exercise 8 ____________________*)
	
	fun sumr [] = 0 |
		sumr (x::xs) = sumr (xs) + x
	;

	fun sumi ([],total) = total | 					(* sumi can have tail recursion optimisation, both functions use O(1) stack space*)
		sumi ((x::xs,total)) = sumi(xs,total + x)
	;

(*____________________ Exercise 9 ____________________*)
	exception IndexError;


	fun nth ([],n) = raise IndexError |
		nth ((x::xs),0) = x |
		nth ((x::xs),n) = nth(xs,n-1)
	;

(*
	nth is polymorphic:
	
	- nth([1,2,3],0);
	val it = 1 : int

	- nth([1.0,2.0,3.0],1);
	val it = 2.0 : real

*)

(*____________________ Exercise 10 ____________________*)


	fun evens1 [] = [] |   (*Mutually recursive functions.. evens1 returns the even indices (starting from 1), evens2 returns the odd indices*)
		evens1 (x::xs) = evens2 xs
	and evens2 [] = [] |
		evens2 (x::xs) = (x::evens1 xs)
	;

(*____________________ Exercise 11 ____________________*)

	
	fun flatten [] = [] |
		flatten (x::xs) = x @ flatten xs
	;

	fun flatten2 [] = [] | 
		flatten2 (x::xs) = flatten(x) @ flatten2(xs)
	;

	fun flatten3 [] = [] |
		flatten3 (x::xs) = flatten2(x) @ flatten3(xs)
	;

