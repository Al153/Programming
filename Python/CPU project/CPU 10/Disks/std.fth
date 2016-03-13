// STANDARDS:

: getA READ INDICT ; // ( -- ) gets the adress of the IMD word in the dict
: CR 10 .c 13 .c ; // ( -- )  prints a Carriage return
: TAB 9 .c ; // ( -- ) prints a tab

: hexChar 15 & DUP 10 < if 48 + .c else  55 + .c then ; // prints a single hexadecimal digit from the stack
: .h DUP DUP if // prints out the hex of a number
		0 ROT
		while // put hex characters on the stack, alternated with 1s
			1023 OVER
			4 >> DUP // decrement
		loop
		
		DROP while // print off the chars
			hexChar
		loop
	else
		DROP DROP ." 0"
	then ; //

: .h8 // prints out an int as a padded hexademical number ( n --)
	7 1 while
		OVER 4 >> SWAP 1 - DUP
	loop DROP
	8 1 while 
		SWAP hexChar 1 - DUP
	loop DROP
;

: .ch DUP >> hexChar hexChar ; // prints the hex of a character
// creating a useable for loop

VARIABLE FOR_ITER
VARIABLE FOR_PRED
VARIABLE FOR_NEXT

: FOR FOR_ITER ! FOR_NEXT ! FOR_PRED ! // creates a for loop
	DUP FOR_PRED @ EXEC
	while
		DUP FOR_ITER @ EXEC
		FOR_NEXT @ EXEC DUP
		FOR_PRED @ EXEC
loop DROP ; // start predicate next, looped_code ==> executes looped_code repeatedly

: char[@]
	+ @ 24 >>  // needs to store in first byte
;

: char[!] 			// value address offset
	+ SWAP OVER  	// newAddress value newAddress
	@ 16777215 & 	// newAddress value originalValueMaskedDROPAL
	SWAP 255 & 24 << | SWAP ! 		// FINISHED
;

: word[!] 				// (value address offset --)		
	2 * + SWAP OVER 	
	@ 65535 &
	SWAP 65535 & 16 << | SWAP !
;

: word[@] // ( address offset -- value)
	2 * + @ 16 >>
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


: min OVER OVER < if DROP else SWAP DROP then ; // finds min of two ints
: max OVER OVER > if DROP else SWAP DROP then ; // '' max


: .string 1 while DUP 0 char[@] DUP if .c 1 + 1 then loop DROP ; // ( str -- )  prints a string
: .hString 1 while DUP 0 char[@] DUP if .ch ."  " 1 + 1 then loop DROP ; // ( str -- ) prints the hex of a string

: ++ DUP @ 1 + SWAP ! ; // increments a variable
: -- DUP @ 1 - SWAP ! ; // decrements a variable
: ++4 DUP @ 4 + SWAP ! ; // does 4 ++s on a var
: += OVER @ + SWAP ! ; // i n += ==> i := i + n
: reZero 0 SWAP ! ; 	// stores zero to a variable

VARIABLE strCtr
VARIABLE strPtr

: ?string // copy a string into memory
	strCtr reZero 1
	while 
		READC DUP
		 if strCtr ++ 1 else 0 then 
	loop
	strCtr @ 4 >> 1 + ALLOC strPtr !
	strCtr @ while
		strPtr @ strCtr @ char[!]
		strCtr @ strCtr --
	loop
	strPtr @
;

VARIABLE 4ROTTEMP
: 4ROT SWAP 4ROTTEMP ! ROT 4ROTTEMP @ ; // rotates 4 stack entries



// ( startAddr numberOfBytes -- ) prints out the raw memory locations
: addrDump OVER +  SWAP 1 while DUP .h8 TAB DUP @ .h8 TAB 4 + DUP @ .h8 CR 4 + OVER OVER > loop DROP DROP ;


: .(  // ( --  ) prints ouf the line buffer until a ( is encountered
	1 while 
		READC DUP [ READC \ ] = if
			DROP READC .c
		else
			DUP [ READC ) ] = if
				DROP 0 
			else
				.c
				1
			then
		then
	loop
;

// EXCESS COMMENTS to increase block size
// ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
// ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
// ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
// ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
// ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
// ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
// ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
// ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
// ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
// ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
// ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
// ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
// ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
// ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
// ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
// ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
// ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
// ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
// ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
// ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
// ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
// ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
// ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
// ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
// ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
// ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
// ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
// ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd