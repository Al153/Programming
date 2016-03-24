1 4096 * ADDBLOCK
2 4096 * ADDBLOCK
3 4096 * ADDBLOCK
4 4096 * ADDBLOCK
5 4096 * ADDBLOCK
6 4096 * ADDBLOCK

	2 TABLE ROOT // root namespace
	4 TABLE ROOT_SEN // builds a sentinel for the root namespace
	ROOT_SEN ROOT !
	ROOT_SEN ROOT 4 + ! 
	
	0 ROOT_SEN !
	0 ROOT_SEN 4 + !
	ROOT ROOT_SEN 8 + !
	GETDICT ROOT_SEN 12 + !
	ROOT_SEN SETDICT
	
	0 CONST NS_START
	4 CONST NS_END
	0 CONST SE_NAME1
	4 CONST SE_NAME2
	8 CONST SE_CODE
	12 CONST SE_NEXT
	
	1024 TABLE N_STACK
	VARIABLE NPTR 0 NPTR !
	: >n NPTR @ DUP 1023 > if ." ERROR: N_STACK full." 10 .c 13 .c DROP DROP else N_STACK SWAP 4 * + ! NPTR @ 1 + NPTR ! then  ; // ( a -- ) N: ( -- a ) // words manipulating the namespace stack
	: n> NPTR @ DUP 0 = if ." ERROR: N_STACK empty." 10 .c 13 .c else 1 - NPTR ! N_STACK NPTR @ 4 * + @ then ; // ( -- a) N: ( a -- )
	: npeek n> DUP >n ; // ( -- TONS ) returns the top of the n stack
	ROOT >n // place root on the n_stack
	: dict_pop GETDICT DUP SE_NEXT + @ SETDICT ; // ( -- TOD ) removes the top of the dictionary and pushes is pointer to the stack
	: EXPORT // ( -- ) exports the most recently defined word outside the namespace
		npeek // peek for TONS
		NS_END + @ // get seninel for TONS
		dict_pop // removes top of dict (most recent element)
		// element.next := sentinel.next
		// sentinel.next := element
	
		SWAP
		OVER OVER // E S E S
		SE_NEXT + @
		SWAP SE_NEXT + !
		SE_NEXT + !
	;
	: N_SPACE: // ( -- )
		2 ALLOC DUP CONST // create new namespace object
		4 ALLOC 		  // create new buffer/dict entry object
		0 OVER SE_NAME1 + ! 		  // dict entry has name \00
		0 OVER SE_NAME2 + ! 	  // ""
		OVER OVER SE_CODE + !   // store namespace address into code field of dict entry
		SWAP OVER OVER NS_END + ! NS_START + ! // store dict entry to start field and end field of namespace
	;
	
	: -> // ( NS_Pointer -- ) loads a namespace WARNING: DO NOT LOAD A NAMESPACE TWICE At THE SAME TIME : WILL RESULT IN THE DICTIONARY BECOMING A LOOP 
		DUP >n 
		DUP NS_END + @ GETDICT SWAP SE_NEXT + !
		NS_START + @ SETDICT
	;
	: ;; // ( -- ) unloads a namespace
		n> DUP 0 > if
			GETDICT OVER NS_START + !
			NS_END + @ SE_NEXT + @ SETDICT
		then 
	;
EXPORT EXPORT EXPORT EXPORT ;;  // export: EXPORT, -> , ;;, N_SPACE: then save namespace operations to ROOT namespace
N_SPACE: STANDARD
STANDARD ->
	: %N_SPACE ." INCOMPLETE WORD: %NSPACE" ; // very complex word to deallocate an entire namespace 
	
	N_SPACE: PRINTING
	PRINTING ->
		: CR 10 .c 13 .c ; // ( -- )  prints a Carriage return
		: .(  // ( -- ) prints out the line buffer until a ( is encountered
			1 while 
				READC DUP [ READC \ ] = if
					DROP READC DUP [ READC n ] = if DROP CR  1 else .c 1 then
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
		: TAB 9 .c ; // ( -- ) prints a tab
		: TODO ." ERROR: CODE STILL HAS TODO SECTIONS " HALT ;
		: SPACE 32 .c ; // ( -- ) prints a space
		: BS 8 .c ;  // ( -- ) prints a backspace
		: hexChar 15 & DUP 10 < if 48 + .c else  55 + .c then ; // ( 0x -- ) prints a single hexadecimal digit from the stack
	
		: .h DUP DUP if // ( n -- ) prints out the hex of a number
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
			then ;
	
		: .h8 // prints out an int as a padded hexademical number ( n --)
			7 1 while
				OVER 4 >> SWAP 1 - DUP
			loop DROP
			8 1 while 
				SWAP hexChar 1 - DUP
			loop DROP
		;
	
		: .ch DUP 4 >> hexChar hexChar ; // ( c -- ) prints the hex of a character
		.( COMPILED: Printing words.\n)
		
	;;
	N_SPACE: COMPARE
	COMPARE -> 
		: <= > 1 - ;
		: =< > 1 - ;
		: >= < 1 - ;
		: => < 1 - ;
		: != = 1 - ;
		: min OVER OVER < if DROP else SWAP DROP then ; // (a b  -- min ) finds min of two ints
		: max OVER OVER > if DROP else SWAP DROP then ; // (a b -- max ) '' max ''
	;; 
	PRINTING -> .( COMPILED: More comparison words\n)  ;;
	
	N_SPACE: MEMORY
	MEMORY -> 
	
		: char[@] // (addr offset -- )
			+ @ 24 >>  // needs to store in first byte
		;
		: char[!] 			// ( value address offset -- )
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
		: int[@] // (addr off -- address[offset]  )               indexes an int array/ @int
			4 * + @
		;
		: int[!] // ( val addr off -- ) value, address, offset ==> NONE - stores to address[offset]
			4 * + !
		;
		: ++ DUP @ 1 + SWAP ! ; // ( var -- ) increments a variable
		: -- DUP @ 1 - SWAP ! ; // ( var -- )decrements a variable
		: ++4 DUP @ 4 + SWAP ! ; // ( var -- )does 4 ++s on a var
		: += OVER @ + SWAP ! ; // ( var value -- )i n += ==> i := i + n
		: reZero 0 SWAP ! ; 	// ( var -- ) stores zero to a variable
		N_SPACE: 4ROT
	
		4ROT ->
			VARIABLE 4ROTTEMP
			: 4ROT SWAP 4ROTTEMP ! ROT 4ROTTEMP @ ; // ( a b c d -- d a b c ) rotates 4 stack entries
		EXPORT ;;
		: getA READ INDICT ; // ( -- addr ) gets the adress of the IMD word in the dict
	;;

	PRINTING -> .( COMPILED: Advanced memory access.\n)  ;;
	N_SPACE: FOR
	FOR ->	
		// creating a useable for loop
		VARIABLE FOR_ITER
		VARIABLE FOR_PRED
		VARIABLE FOR_NEXT
		// ( predicateptr nextptr iteratedptr -- )
		: FOR FOR_ITER ! FOR_NEXT ! FOR_PRED ! // creates a for loop
			FOR_PRED @ EXEC
			while
				FOR_ITER @ EXEC
				FOR_NEXT @ EXEC
				FOR_PRED @ EXEC
			loop
		; // start predicate next, looped_code ==> executes looped_code repeatedly
		EXPORT 
	;;
	MEMORY ->
		: swapCode // (ADD1 ADD2 -- ) given two dict entry addresses, this function swaps the code pointers - allow construction of recursion
										//
			DUP 2 int[@] 		 		//  addr1 addr2 ==> addr1 addr2 ptr2
			ROT OVER 2 int[@]			// ptr2 addr1 addr2 ptr1
			SWAP 2 int[!] 2 int[!]		// swaps top then stores
		;
	;;

	PRINTING -> .( COMPILED: FOR loops and basic dictionary tools.\n)  ;;

	N_SPACE: STRINGS
	PRINTING ->
		MEMORY ->
			STRINGS ->
				VARIABLE strCtr
				VARIABLE strPtr
				VARIABLE S1
				VARIABLE s2
				: COMPARE // ( STR1 STR2 -- BOOLEAN ) compares two null ended string objects
					S2 ! s1 !
					1 while
						s1 @ 0 char[@]
						s2 @ 0 char[@]
						OVER = if 
							0 = if 
								-1 0 // end of string - break the loop, return true
							else
								s1 ++
								s2 ++
								1 // don't break loop
							then
						else

 							DROP 0 0 // break loop and return false
						then
					loop
				;
				: .string 1 while DUP 0 char[@] DUP if .c 1 + 1 then loop DROP ; // ( str -- )  prints a string
				: .hString 1 while DUP 0 char[@] DUP if .ch SPACE 1 + 1 then loop DROP ; // ( str -- ) prints the hex of a string
				: ?string // ( -- allocation ) copy a string into memory
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
			EXPORT EXPORT EXPORT ;;
		EXPORT EXPORT EXPORT ;;
		.( COMPILED: string maniuplation words.\n)
	;;

	N_SPACE: DEBUG
	PRINTING -> 
		DEBUG ->
			// ( startAddr numberOfBytes -- ) prints out the raw memory locations
			: addrDump OVER +  SWAP 1 while DUP .h8 TAB DUP @ .h8 TAB 4 + DUP @ .h8 CR 4 + OVER OVER > loop DROP DROP ; 
		;;
		.( COMPILED: Debugging words.\n)
	;;

	N_SPACE: R_STACK
	MEMORY ->
		PRINTING ->
			R_STACK ->
				1024 TABLE RSTACK // alternative stack for soring local variables
				VARIABLE RPTR 0 RPTR !
				: >r RPTR @ DUP 1023 > if ." ERROR: RSTACK full." CR DROP DROP else RSTACK SWAP int[!] RPTR ++ then  ; // ( a -- ) R: ( -- a )
				: r> RPTR @ 0 = if ." ERROR: RSTACK empty." CR  else RPTR -- RSTACK RPTR @ int[@] then ; // ( -- a) R: ( a -- )
				: rPeek r> DUP >r ;
				: .r
					RPTR @ if
						0 1 while
							RSTACK OVER int[@] .h8 SPACE SPACE
							1 + DUP RPTR @ <
						loop DROP
					then CR 
				;
				: r@ r> @ >r ; // R: ( addr -- val )
				: r! r> r> SWAP ! ; // R: ( val addr -- )
				: rDROP r> DROP ; // R: ( a -- )
				: rDUP r> DUP >r >r ; // R: ( a -- a a )
				: rSWAP r> r> SWAP >r >r ; // R: ( a b -- b a )
				: rROT r> r> r> ROT ROT >r >r >r ; // R: ( a b c -- c a b )
				: rOVER r> r> SWAP OVER >r >r ; // R: ( a b -- a b a )
				.( COMPILED: RSTACK manipulation words.\n) 
			;;
		;;
	;;
	
	N_SPACE: DISK
	MEMORY ->
		PRINTING ->
			R_STACK ->
				DISK ->
					7 CONST S_BLOCK
					// SUPER BLOCK (S_BLOCK) structure:
					// 0: next block
					// 4: last block
					// 8: root
					//
					//
					//
					: EXECBLCK 4096 * ADDBLOCK ;							// ( diskADDr -- ) Queue a block for execution
					N_SPACE: BLCK // A BLCK object is the representation of a disk block loaded into memory
					BLCK -> // words to manipulate BLCK objects
						: @PTR 0 + @ ; // ( BLCK -- PTR ) retrieve the pointer variable from a BLCK object
						: @DATA 4 + @ ; // ( BLCK -- TABLE ) // retrieve the DATA table from a BLCK object
						: !PTR 0 + ! ; // ( PTR BLCK -- ) // store a pointer variable to a BLCK object (update the location of the variable)
						: !DATA 4 + ! ; // ( TABLE BLCK -- ) store a table to a BLCK object ( update location of the table)
						: NEW
							2 ALLOC >r
							1024 ALLOC rPeek 4 + !
							1 ALLOC 0 OVER ! rPeek !
							r> ; //  ( -- BLCK )  create a new BLCK object
						: FREE
							DUP DUP
							@PTR DALLOC 
							@DATA DALLOC
							DALLOC
						;					
						: LOADBLCK 4096 * SWAP DUP >r @DATA 4096 @DISK r> @PTR reZero ; // ( BLCK diskADDR -- success? ) load a specific block to memory
						: STORBLCK 4096 * SWAP DUP >r @DATA 4096 !DISK r> @PTR reZero ; // ( BLCK diskADDR -- success? ) store a block
						: BLCKJUMP 4095 & SWAP @PTR ! ; 							// ( BLCK blockaddr -- ) jumps within he block
						: CHR+ DUP >r  @PTR  @ 1 + 4095 &  r> @PTR  ! ;				// ( BLCK -- ) increments BLCK_PTR
						: CHR- DUP >r  @PTR  @ 1 - 4095 &  r> @PTR  ! ;				// ( BLCK -- ) decrements BLCK_PTR
						: >CHR SWAP >r rPeek @DATA rPeek @PTR @ char[!]  r> CHR+ ; 		// ( BLCK char -- ) write a char to the loaded block
						: CHR> >r rPeek @DATA rPeek @PTR @ char[@]  r> CHR+ ;         // ( BLCK -- char ) read a char from the loaded block
						: .BLCK >r  // ( BLCK -- ) print out the contents of a block
							
								rPeek @PTR reZero
								1 while
									rPeek CHR> .c
									rPeek @PTR 
									@ 0 { COMPARE -> } !=  { ;; }
								loop
								r> @PTR reZero 
							
						;
						: LINEWRTE >r 1 while READC DUP if rPeek SWAP >CHR 1 then loop rPeek 10  >CHR rPeek 13 >CHR rDROP ; // ( BLCK -- ) writes a line from the input to the in memory block, and scrolls 	the BLCK_PTR appropriately
						: .LINE >r 1 while rPeek CHR> DUP .c  10 = 1 - loop rDROP ; // ( BLCK -- ) prints out a line from the loaded block, scrolling to the end
						: LINE+ >r 1 while rPeek CHR> 10 = 1 - loop rDROP ; // ( BLCK -- ) scrolls to the next line
						: LINE- >r rPeek CHR- 1 while rPeek CHR- rPeek  @DATA rPeek @PTR  @ char[@] 10 = 1 - loop r> CHR+ ; // ( BLCK -- ) scrolls to the start of the current line
						: TO_LINE( 	// ( BLCK -- ) writes a line to the block, ends with a ")"
							>r
							0 1 while
								READC 
								SWAP if // if escaped
									rPeek SWAP >CHR 0 1 // write the char and set escaped to 0
								else
									DUP [ READC ) ] = // check for a bracket
									if
										DROP 0		  // break out of the loop
									else DUP [ READC \ ] = if // check for a backslash - to escape stuff
											DROP 1 1 		  // if so, set escaped to 1 and loop
										else
											rPeek SWAP >CHR 0 1 			// else write the char, no escape and loop
										then
									then 
								then
							loop
							rPeek 13 >CHR r> 10 >CHR
						;
						: CLR_BLCK // ( BLCK -- ) writes zeroes the BLCK
							@DATA >r 
							rPeek  @PTR  reZero
							4096 1 while
									4 - // through in 4s
									0 OVER rPeek + ! // cycle through block writing zeroes. Optimised
								DUP 0 >
							loop DROP rDROP
						;
						N_SPACE COPY
						COPY ->
							VARIABLE Data1 VARIABLE Data2
							: COPY // ( BLCK1 BLCK2 -- ) copies the data and pointer of BLCK1 to BLCK2
								." TEST ME PLEASE"
								OVER @PTR OVER @PTR SWAP @ SWAP !
								Data2 ! Data1 !
								4096 1 while
									4 - 
									Data1 @ OVER int[@]
									OVER Data2 @ SWAP int[!]
								
									DUP 0 >
								loop
							; EXPORT
						;;
						N_SPACE: .HEX // code to print out the hex of a BLCK
						.HEX ->
							VARIABLE DSK_PTR
							: .HBLCK_I DSK_PTR @ .h8 ." : " 
								 
								rPeek DSK_PTR @ int[@] .h8 SPACE
								rPeek  DSK_PTR @ 1 + int[@] .h8 SPACE
								rPeek  DSK_PTR @ 2 + int[@] .h8 SPACE
								rPeek  DSK_PTR @ 3 + int[@] .h8 CR
							;
							: .HBLCK_N DSK_PTR 4 += ;
							: .HBLCK_P  DSK_PTR @ 1024 < ;
							: .HEX // ( BLCK -- ) prints out the hex of the data section of the BLCK
								@DATA >r
								0 DSK_PTR !
								[ getA .HBLCK_P ] [ getA .HBLCK_N ] [ getA .HBLCK_I ] FOR
								rDROP
							; EXPORT
						;;
					;;
					.( COMPILED: Disk block maniplation words.\n) 
					
					N_SPACE: FORMAT
					FORMAT ->
						VARIABLE FRMT_END
						VARIABLE DSK_PTR
						: FRMT_PRD DSK_PTR @ FRMT_END @ < ;
						: FRMT_NXT DSK_PTR ++ ;
						BLCK -> NEW ;; CONST FRMTBLCK // BLCK object used for formatting the disk 
						: FRMT_ITR
							DSK_PTR @ 1 + FRMTBLCK { BLCK -> } @DATA { ;; } 0 int[!] // write pointers to DISK
							DSK_PTR @ 1 - FRMTBLCK { BLCK -> } @DATA { ;; } 1 int[!]
							FRMTBLCK DSK_PTR @ { BLCK -> } STORBLCK { ;; } DROP // write block to disk;
							DSK_PTR @ .h8 BS BS BS BS BS BS BS BS
						;
				
						: FORMAT // ( START END -- ) formats FileSystem of partition into a chain of INODES, and places head of chain in the superBlock
							OVER OVER FRMT_END ! DSK_PTR ! // first INODE in file
							FRMTBLCK { BLCK -> } CLR_BLCK { ;; }
							CR ." Formatting disk block: "  
							[ getA FRMT_PRD ] [ getA FRMT_NXT ] [ getA FRMT_ITR ] FOR
							0 FRMTBLCK { BLCK -> } @DATA { ;; } 0 int[!]
							FRMTBLCK DSK_PTR @ 1 - { BLCK -> } STORBLCK { ;; } DROP // adds a null value
							{ BLCK -> }
								FRMTBLCK @DATA 1 int[!] // store end
								FRMTBLCK @DATA 0 int[!] // store start
								FRMTBLCK S_BLOCK STORBLCK DROP // write to the super block
							{ ;; }
							CR
						; EXPORT
						.( COMPILED: Disk formatting words.\n)
					;;

					N_SPACE: DATABLCK
					DATABLCK ->
						BLCK -> NEW ;; CONST ALLCBLCK
						: NEW // ( -- DSK_POINTER ) alloc data block and returns the disk block address of it
							{ BLCK -> }
								ALLCBLCK S_BLOCK LOADBLCK DROP						
								ALLCBLCK @DATA 0 int[@] >r
								rPeek 0 = if
									." ERROR: RAN OUT OF DISK SPACE" HALT
								then
								ALLCBLCK rPeek LOADBLCK DROP
								ALLCBLCK @DATA 0 int[@] >r // get the next in chain
								ALLCBLCK S_BLOCK LOADBLCK DROP
								r> ALLCBLCK @DATA 0 int[!] // store to the S block
								ALLCBLCK S_BLOCK STORBLCK DROP // store the S block and return the DSK_POINTER
							{ ;; }
							r> // return the DSK pointer
						;
						: FREE // ( DSK_POINTER -- SUCCESS? ) deallocates a block by its address
							{ BLCK -> }
								ALLCBLCK CLR_BLCK
								ALLCBLCK S_BLOCK LOADBLCK DROP // loads up the super block
								ALLCBLCK @DATA 0 int[@] >r // gets old head of pool
								DUP ALLCBLCK @DATA 0 int[!] // stores new head of pool
								ALLCBLCK S_BLOCK STORBLCK DROP // commits the changes to the superblock
								r> ALLCBLCK @DATA 0 int[!] // stores the previous head of the pool to the deallocated block
								S_BLOCK ALLCBLCK @DATA 1 int[!] // stores a pointer to the superblock in the previous partition
								ALLCBLCK SWAP STORBLCK // commits the change to the new block
							{ ;; }
						;
					;;
					.( COMPILED: Fundamental filesystem tools.\n) 
					// Inode fields: 0: DSK_pointer; 1: Type; 2: ref count/parent; 3: size(int blocks, up to 2^20); 4: data; 5:  free space in top block; 6: marked 	flags;
					// in the file system, a binary file address of a byte is 32 bits and has 3 fields: Block1 : 10 bits; Block2: 10 bits; inBlockAddress: 12 bits					
					N_SPACE: INODE
					INODE ->
						: IND_DIR 1000 ; // ( -- TYPE ) type code
						: IND_FIL 2000 ; // ( -- TYPE ) type code
						0 CONST IND_DSK
						1 CONST IND_TYPE
						2 CONST IND_REF
						2 CONST IND_PAR
						3 CONST IND_SIZE
						4 CONST IND_DATA
						1048576 CONST MAX_SIZE
						: @DISK { BLCK -> } @DATA IND_DSK int[@] { ;; } ; // ( INODE -- DSK ) gets the disk location of an inode
						
						: !TYPE SWAP { BLCK -> } @DATA  IND_TYPE int[!] { ;; } ; // ( INODE TYPE -- ) sets the type of an inode

						: @TYPE { BLCK -> } @DATA { ;; } IND_TYPE int[@] ; // ( INODE -- TYPE ) returns the type of an inode

						: COMMIT >r rPeek @DISK 4096 * r> { BLCK -> } @DATA { ;; } 4096 !DISK ; // ( INODE -- success? ) commits an inode to disk
						
						: !REF SWAP DUP @TYPE IND_FIL =
							if { BLCK -> } @DATA IND_REF int[!] { ;; }
							else ." ERROR: Tried to set reference count of a non-file INODE" DROP DROP then
						;

						: @REF DUP @TYPE IND_FIL =
							if { BLCK -> } @DATA IND_REF @ { ;; }
							else ." ERROR: Tried to get reference count of a non-file INODE" DROP DROP  0 then
						;

						: ++REF DUP @TYPE IND_FIL =  // ( INODE 	-- ) inrecrements the reference count of a file inode
							if { BLCK -> } @DATA IND_REF 4 * + ++ { ;; }
							else DROP ." ERROR: Tried to increment reference count of a non-file INODE." then
						;
						: --REF DUP @TYPE IND_FIL =  // ( INODE 	-- ) inrecrements the reference count of a file inode
							if { BLCK -> } @DATA IND_REF 4 * + -- { ;; }
							else DROP ." ERROR: Tried to decrement reference count of a non-file INODE." then
						;
						
						: !PARENT SWAP DUP @TYPE IND_DIR = // ( INODE 	PAR_DSK -- ) sets the parent of a dir inode
							if { BLCK -> } @DATA { ;; }
								IND_PAR int[!]
							else DROP DROP ." ERROR: Tried to set parent of a non directory INODE." then
						;
						: @PARENT DUP @TYPE IND_DIR =  if { BLCK -> } @DATA { ;; } IND_PAR int[@] else DROP ." ERROR: Tried to get parent of a non directory INODE." then ; // ( INODE -- 	PAR_DSK ) sets returns the parent of a dir inode
						
						: @SIZE  { BLCK -> } @DATA { ;; } IND_SIZE int[@] ; // ( INODE -- SIZE ) returns the size of the file/dir represented by an inode
						
						: !SIZE SWAP  { BLCK -> } @DATA { ;; } IND_SIZE int[!] ; // ( INODE SIZE -- ) sets the size of the file/dir represented by an inode

						: @DATA { BLCK -> } @DATA { ;; } IND_DATA int[@] ; // ( INODE -- DSK ) returns the DSK of the block containing the indirect data blocks

						: !DATA SWAP { BLCK -> } @DATA { ;; } IND_DATA int[!] ; // ( INODE DSK -- ) sets the DSK of the block containing the indirect data blocks
						
						: ++SIZE DUP @SIZE 1 + 0 OVER > // ( INODE  -- ) increases the 	size of a file/dir represented by an inode spaniel
							if DROP DROP ." ERROR: file size increased too much"
							else !SIZE then 
						; 
						: --SIZE @SIZE 1 - 0 OVER > // ( INODE  -- ) decreases the 	size of a file/represented by an inode
							if DROP DROP ." ERROR: file size decreased too much"
							else DUP !SIZE then
						; 
								
						N_SPACE: LOOKUP 
						LOOKUP -> 
							N_SPACE: TABLE_1
							TABLE_1 ->
								BLCK -> NEW ;; CONST BTABLE // address space of table
								VARIABLE TABL_LOC // location from where the table was loaded
								: SET DUP TABL_LOC ! BTABLE SWAP { BLCK -> } LOADBLCK  { ;; } DROP ; // ( DSK -- ) sets current LK from a DSK ;
								: COMMIT BTABLE TABL_LOC @ { BLCK -> } STORBLCK  { ;; } DROP ; // ( -- ) commits table to disk
								: CLEAR BTABLE { BLCK -> } CLR_BLCK { ;; } ; // ( -- clears the current table )
								N_SPACE: PRIV
								PRIV ->
									: @TABLE 1023 & BTABLE { BLCK -> } @DATA { ;; }  SWAP int[@] ; // ( Addr -- DSK ) looks up in LK from LK value
									: !TABLE SWAP 1023 & BTABLE  { BLCK -> } @DATA { ;; } SWAP int[!] ; // ( Addr DSK -- ) stores a DSK to an address in the table
									: FETCH 10 >> @TABLE ; // ( Address -- DSK ) looks up LK2 pointer from LK1 
									: STORE 10 >> !TABLE ; // ( DSK Address -- ) Stores LK2 pointer to LK1
									EXPORT EXPORT
								;;
							;;
							N_SPACE: TABLE_2
							TABLE_2 ->
								BLCK -> NEW ;; CONST BTABLE // address space of table
								VARIABLE TABL_LOC // location from where the table was loaded
								: SET DUP TABL_LOC ! BTABLE SWAP { BLCK -> } LOADBLCK  { ;; } DROP ; // ( DSK -- ) sets current LK from a DSK ;
								: COMMIT BTABLE TABL_LOC @ { BLCK -> } STORBLCK  { ;; } DROP ; // ( -- ) commits table to disk
								: CLEAR BTABLE { BLCK -> } CLR_BLCK { ;; } ; // ( -- clears the current table )
								N_SPACE: PRIV
								PRIV ->
									: @TABLE 1023 & BTABLE { BLCK -> } @DATA { ;; }  SWAP int[@] ; // ( Addr -- DSK ) looks up in LK from LK value
									: !TABLE SWAP 1023 & BTABLE  { BLCK -> } @DATA { ;; } SWAP int[!] ; // ( Addr DSK -- ) stores a DSK to an address in the table
									: FETCH @TABLE ; // ( Address -- DSK ) looks up LK2 pointer from LK1 
									: STORE !TABLE ; // ( DSK Address -- ) Stores LK2 pointer to LK1
									EXPORT EXPORT
								;;
							;;
							: GETBLOCK // ( INODE ADDRESS -- DSK ) returns the address of a block
								OVER @SIZE OVER { COMPARE -> } <= { ;; } if DROP DROP ." ERROR: Block requested does not exist" 0
								else
									SWAP @DATA
									{ TABLE_1 -> }
										SET  // need to load table to memory
										DUP FETCH
									DUP 0 = if
										DROP ." ERROR: Block requested does not exist" 0
									else
										{ ;; TABLE_2 -> }
											SET // get p2
											FETCH
										{ ;; }
									then
								then
							; 
						;;
						: @BLCK ROT { LOOKUP -> } GETBLOCK { ;; } DUP 0 = if 1 else { BLCK -> } LOADBLCK { ;; } then ; // ( INODE ADDRESS BLCK -- success? ) loads the block of the correct address if it exists
						: !BLCK  ROT { LOOKUP -> } GETBLOCK	{ ;; } DUP 0 = if 1 else { BLCK -> }  STORBLCK { ;; } then ; // ( INODE ADDRESS BLCK -- success? ) stores the INODE DATA block to the correct address if it exists
						
						N_SPACE: INODEAUX
						INODEAUX -> 
							VARIABLE T_SIZE // size of the inode
							VARIABLE T_IND // temporary Inode variable
							VARIABLE T_DSK // stores the DSK to return
							VARIABLE T_BLCK // stores the block
							: +BLCK // ( BLCK INODE -- DSK? ) appends a data block to the end of a file represented by an INODE
								T_IND ! T_BLCK !
								T_IND @ @SIZE T_SIZE !
								T_SIZE @ MAX_SIZE = if 0 ." ERROR: File has reached max block size"							
								else
									T_IND @ @DATA
									{ LOOKUP -> TABLE_1 -> }
										SET 
										T_SIZE @ FETCH DUP
									{ ;; }
									0 = if // if the LK_1 entry for the table is 0
										DROP
										{ DATABLCK -> } NEW { ;; TABLE_2 -> } CLEAR TABL_LOC ! { ;; } // allocates new lookup Table on disk and loads it into LK2
										{ DATABLCK -> } NEW DUP { ;; TABLE_2 -> } T_SIZE @ STORE COMMIT { ;; } T_DSK ! // allocates new block on disk, stores the pointer, and stores it to the LK2 
										{ TABLE_2 -> } TABL_LOC @ { ;; TABLE_1 -> } T_SIZE @ STORE COMMIT { ;; } // stores the new LK 2 to LK1	
										T_IND @ ++SIZE // increments the size of the file
										T_DSK @ // returns DSK
									else
										{ TABLE_2 -> }
											SET  // sets table to LK2
											T_SIZE @ FETCH // retrieves next DSK from LK2
											0 = if // if is empty all is ood
												{ DATABLCK -> } NEW { ;; } T_DSK ! // allocates the new block
												T_DSK @ T_SIZE @ SET // stores to the LK2 table
												COMMIT // commits the LK2							
												T_IND @ ++SIZE // increments the size of the file
												T_DSK @ // returns DSK
											else 
											0 ." ERROR: No more disk blocks available in file"
											then
										{ ;; }
									then
									{ ;; }	
								then ;
						EXPORT ;;
						N_SPACE: #INODE
						#INODE ->	
							BLCK -> NEW ;; CONST P_INODE 		// table representing the new INODE
							BLCK -> NEW ;; CONST P_TABLE 		// Table representing LK1 for the new INODE
							: CLEAR P_INODE { BLCK -> } CLR_BLCK { ;; } ; // ( -- ) clears P_INODE
							CLEAR // ( clears the current INODE )
							: STORE P_INODE SWAP { BLCK -> } STORBLCK { ;; } ; // ( DSK -- success? ) stores the P_INODE to disk
							: #INODE // ( ?PARENT type -- DSK), changes blck_space, allocates and inits an inode. needs parent if type -- IND_DIR
								{ BLCK -> }
									IND_DIR = if // if a directory
										{ DATABLCK -> } NEW { ;; } // get the new INODE				
										P_INODE IND_DIR !TYPE // set the type
										P_INODE SWAP !PARENT // set the parent
										{ DATABLCK -> }
											NEW  			// create a new data block for indirect pointers
											DUP DUP  		// DUP twice
											P_TABLE SWAP LOADBLCK DROP   // Load into memory
											P_TABLE CLR_BLCK 		// clear it
											P_TABLE SWAP STORBLCK DROP   // store it to disk
										{ ;; ;; }
										P_INODE SWAP !DATA  // store pointer into INODE
										{ BLCK -> }
										STORE DROP 			// store INODE to disk
									else
										{ DATABLCK -> } NEW { ;; } // get the new INODE				
										P_INODE IND_FIL !TYPE // set the type
										P_INODE 0 !REF 		  //	Has no references
										{ DATABLCK -> }
											NEW  			// create a new data block for indirect pointers
											DUP DUP  		// DUP twice
											P_TABLE SWAP LOADBLCK DROP   // Load into memory
											P_TABLE CLR_BLCK 		// clear it
											P_TABLE SWAP STORBLCK DROP   // store it to disk
										{ ;; ;; }
										P_INODE SWAP !DATA  // store pointer into INODE
										{ BLCK -> }
										STORE DROP 			// store INODE to disk
									then
								{ ;; }
							; EXPORT		
						;;
					;;
					N_SPACE: FD
					FD ->
						N_SPACE: PRIV
							PRIV ->
								: @INODE 0 int[@] ; // ( FD -- INODE ) returns the INODE of an FD
								: @BLCK 1 int[@] ; // ( FD -- BLCK ) returns the current open BLCK of an FD
								: @DSK 2 int[@] ; // ( FD -- DSK ) returns the current open DSK
								: @MAX 3 int[@] ; // ( FD -- DSK ) returns the maximum DSK that can be opened
								: @EOF? 4 int[@] ; // ( FD -- BOOL ) gets whether there has been an EOF
								: !INODE SWAP 0 int[!] ; // ( FD INODE -- ) sets the INODE of an FD
								: !BLCK SWAP 1 int[!] ; // ( FD BLCK -- ) sets the current open BLCK of an FD
								: !DSK SWAP 2 int[!] ; // ( FD DSK -- ) sets the current open DSK ( doesnt !BLCK )
								: !MAX SWAP 3 int[!] ; // ( FD DSK -- ) sets the maximum DSK that can be opened
								: !EOF? SWAP 4 int[!] ; // ( FD BOOL -- ) sets the EOF? field
								VARIABLE i
								: EXECF_I
									rPeek @INODE i @
									{ INODE -> LOOKUP -> }
										GETBLOCK ADDBLOCK
									{ ;; ;; }
								;
								: EXECF_P i @ rPeek @MAX < ;
								: EXECF_N i ++ ;
							;; 
						// FD:
							// 0 : INODE
							// 4 : Current BLCK
							// 8 : Current DSK - needs to be run through the BLOCK table
							// 12: Maximium DSK
							// 16: EOF?

						: NEW 			// ( -- FD ) creates a new file descriptor
							5 ALLOC >r
							{ BLCK -> }
								NEW NEW
							{ ;; }
							rPeek 0 int[!]
							rPeek 1 int[!]
							r>
						;

						: CHR> // ( FD -- CHR ) fetches the next char to be read
							>r
							{ PRIV -> }
								rPeek @EOF? if
									-1 rDROP
								else
									rPeek @BLCK // get current block
									{ BLCK -> }
										DUP CHR> // get a char
										SWAP @PTR @ 0 = if // if has reached end of block
									{ ;; }
										rPeek 8 + DUP ++ // increase the current loaded DSK
										@ rPeek @MAX = if // if has reached the MAX
											rPeek -1 !EOF
										else
											rPeek @INODE rPeek @DSK rPeek @BLCK
											{ INODE -> } @BLCK { ;; } // load the new BLCK
										then
									then
									rDROP
								then
							{ ;; }
						;
						: >CHR  // ( FD CHR -- ) stores a char to the file
							>r r>
							{ PRIV -> }
								rPeek @EOF? if
									// if an EOF, then need to add another block to the file
									@INODE { INODE -> } +BLCK { ;; } DROP
								then
								rPeek @BLCK // get current block
								{ BLCK -> }
									DUP  rSWAP r> >CHR // get a char
									@PTR @ 0 = if // if has reached end of block
								{ ;; }
									rPeek @INODE rPeek @DSK rPeek @BLCK { INODE -> } !BLCK { ;; } DROP // store the full BLCK
									rPeek @DSK DUP ++ // increase the current loaded DSK
									@ rPeek @MAX = if // if has reached the MAX
										rPeek -1 !EOF
									else
										rPeek @INODE rPeek @DSK rPeek @BLCK
										{ INODE -> } @BLCK { ;; } DROP // load the new BLCK
									then
								then
								rDROP
							{ ;; }
						;
						: EXECFTH // ( FD -- ??? ) EXECUTES A FORTH FILE BY LOADING into the block queue and switches to disk
							>r
							rPeek @INODE { INDOE -> } @TYPE  IND_FIL = { ;; } if
								{ PRIV -> }
									0 i !
									[ getA EXECF_P ] [ getA EXECF_N ] [ getA EXECF_I ] FOR
								{ ;; }
								rDrop SWITCH SWITCH // guarrantees switching to disk and back
							else
								rDrop ." ERROR: can not EXECFTH a directory"
							then
						;

						: OPEN // ( DSK -- FD )
							{ PRIV -> }
								NEW >r  					// create a new FD
								rPeek @INODE SWAP 			// get the FD's INODE object
								{ BLCK -> }
									LOADBLCK 				// Load the INODE from disk
								{ ;; }
								rPeek 0 !DSK 				// Set that the currently open block is 0
								rPeek @INODE
								{ INODE -> }
									@SIZE DUP
								{ ;; }
								rPeek SWAP !MAX 			// Set that the max node is FD.INODE.SIZE
								0 > if 
									{ INODE -> } 
										rPeek @INODE
										0 rPeek 1 int[@] @BLCK // INODE -> @BLCK loads the 0th block from the inode. avoids namespace issues by manually @BLCKing it's BLCK
									{ ;; }
								else
									rPeek @BLCK { BLCK -> } CLR_BLCK { ;; }
								then
								r>
							{ ;; }
						;

						: CLOSE // ( FD -- ) deallocates an FD and its blocks
							DUP DUP { PRIV -> } @BLCK SWAP @INODE { ;; }
							{ BLCK -> } FREE FREE { ;; } DALLOC   // close the INODE and BLCK then the FD
						;
					;;
					// DIR STRUCTURE:
					//	10 Chars of name, 1 of null, 1 of end of dir, 4 of DSK
					N_SPACE: DIR
					DIR ->
						N_SPACE PRIV
						PRIV ->
							: getEntry // ( DIR -- ptr ) returns a pointer to a 16 char entry
							;
							: reset // ( DIR -- )
								>r
								{ FD -> }
									{ PRIV -> }
										rPeek 0 !DSK // set the open BLCK to zero
										rPeek @INODE  0 rPeek @BLCK { INODE -> } @BLsCK { ;; } // load the zeroth block
										rPeek @BLCK { BLCK -> } @PTR reZero { ;; }
									{ ;; }
								{ ;; }
								rDrop
							;
						;;
						: NEXT TODO >r rPeek getEntry DUP DUP 11 char[@] ROT 12 +  SWAP ; // ( DIR -- LAST DSK STRING ) splits a dir entry into parts

					;;
					.( COMPILED: INODE maniuplation tools.\n)
					N_SPACE: SHELL
					SHELL ->
						BLCK -> NEW ;; CONST CWD // current working directory INODE
						: init // ( SIZE -- ) creates a root Inode, and stores it to the superblock
	 						S_BLOCK SWAP OVER + FORMAT // format the disk
	 						0 IND_DIR #INODE // create the root
	 						{ BLCK -> }
	 							NEW DUP CLR_BLCK >r // to store the super node
	 							rPeek S_BLOCK LOADBLCK 						
	 							if ." ERROR: could not load super block"  else
	 								rPeek @DATA SWAP 2 int[!]
	 								rPeek S_BLOCK STORBLCK
		 						then
		 						r> FREE
		 					{ ;; }
						;
						: $ S_BLOCK // ( -- INODE ) gets the root directory and pushes its INODE to the stack 
							{ BLCK -> }
								NEW >r
								rPeek S_BLOCK LOADBLCK
								rPeek @DATA 3 int[@]
								rPeek SWAP LOADBLCK
							{ ;; }
							r>
						;
						: # // ( -- INODE ) copies an INODE of the CWD
							{ BLCK -> } NEW CWD OVER COPY { ;; }
						;
						: \ // ( INODE -- INODE ) [ reads from READSTRINGCHAR ]
							?string
							TODO // needs to  compare the read in string against entries in the inode
						;
						: cd DUP CWD { BLCK -> } COPY FREE { ;; } ; // ( INODE -- ) copies the INODE into the CWD
						: dir TODO ; // prints contents of the CWD
					;;
				;;
			;;
		;;
	;;
	PRINTING -> .( Finished.\n) ;;

	N_SPACE: USER
	USER -> 
	SWITCH
// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // 
// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // 
// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // 
// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // 
// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // 
// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // 
// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // 
// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // 
// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // 
// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // 
// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // 
// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // 
// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // 
// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // 
// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // 
// // // // // // // // // // // // // // // // // // // // // // // // // // /