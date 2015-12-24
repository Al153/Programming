// STANDARDS:

: getA READ INDICT ;
: CR 10 .c 13 .c ;

// creating a useable for loop

VARIABLE FOR_ITER
VARIABLE FOR_PRED
VARIABLE FOR_NEXT

: FOR FOR_ITER ! FOR_NEXT ! FOR_PRED !
	DUP FOR_PRED @ EXEC
	while
		DUP FOR_ITER @ EXEC
		FOR_NEXT @ EXEC DUP
		FOR_PRED @ EXEC
loop ; // start predicate next, looped_code ==> executes looped_code repeatedly

: char[@]
	+ @ 255 &  
;

: char[!] 			// value address offset
	+ SWAP OVER  	// newAddress value newAddress
	@ -256 & 		// newAddress value originalValueMasked
	| SWAP ! 		// FINISHED
;

: int[@] // address, offset ==> address[offset]                 indexes an int array/ @int
	4 * + @
;

: int[!] // value, address, offset ==> NONE - stores to address[offset]
	4 * + !
;

: swapCode // given two dict entry addresses, this function swaps the code pointers - allow construction of recursion
								//
	DUP 2 int[@] 		 		//  addr1 addr2 ==> addr1 addr2 ptr2
	ROT OVER 2 int[@]			// ptr2 addr1 addr2 ptr1
	SWAP 2 int[!] 2 int[!]		// swaps top then stores
;



// building a naive recursive fibonacci number generator

VARIABLE fibRec

: fib DUP DUP 1 = SWAP 0 = | if DROP 1 else DUP 1 -  fibRec @ EXEC SWAP 2 - fibRec @ EXEC + then ;
getA fib fibRec !

1 fib CR . CR .s

// another way to do recursion

: facDummy [ : fact ." I'm a dummy function!" ; 0 ] OVER = if DROP 1 else DUP 1 - fact * then ;
getA facDummy getA fact swapCode

3 fact .

// testting:

: i . ;
: n 1 + ;
: p 10 < ;

0 getA p getA n getA i FOR