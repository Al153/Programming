// writing a postfix assembler as an extension of the forth system

65536 ALLOC CONST codeSegm // 32000 instructions max
65536 ALLOC CONST dataSegm // 64k * 4 bytes available

VARIABLE codePtr 0 codePtr !
VARIABLE dataPtr 0 dataPtr !

: ++4 DUP DUP DUP ++ ++ ++ ++ ; // TICK

: word[!] 						// TICK
	2 * + SWAP OVER
	@ 65535 &
	SWAP 65535 & 16 << | SWAP !
;


: cW codeSegm codePtr @ char[!] codePtr ++ ; // writes a byte to the  											// TICK
: cIW codeSegm codePtr @  + 0 int[!] codePtr ++4 ; // writes an int to the codeSegment							// TICK 
: dW dataSegm dataPtr @ + 0 char[!] dataPtr ++ ; // writes a byte to the dataSegment
: dIW dataSegm dataPtr @  + 0 int[!] dataPtr ++4 ; // writes an int to the dataSegment
: dWW dataSegm dataPtr @ + 0 word[!] dataPtr ++ dataPtr ++ ; // writes a 16 bit word to the datasegment
: currDP dataSegm dataPtr @ + ; // returns the next dataValue to be written to 

// words to create variables
: INT dIW currDP 4 - CONST ; // TICK
: CHAR dW currDP 1 - CONST ;
: WORD dWW currDP 2 - CONST ;

: LABEL: // creates the variable to create a label
	dataSegm dataPtr @ + // gets a pointer to the variable used to hold the label
	dataPtr ++4 // updates codePtr
	CONST // stores the address of the variable
;

: labelVal codeSegm codePtr @ + ;

: LABEL! // store an address to a label variable
	labelVal SWAP !
;

256 TABLE litTab // hashtable of values  // TICK FOR ALL THE LABELLING CODE
VARIABLE litVal
: @value 0 int[@] ;
: @entry 1 int[@] ;
: @next 2 int[@] ;
: !value 0 int[!] ;
: !entry 1 int[!] ;
: !next  2 int[!] ;

: inList // ( topOfList -- pointerToLiteralVariable )
	DUP while
		DUP @value litVal @ =
		if 
			@entry 0 // adds a zero to break the loop
		else
			@next DUP // gets next in list
		then
	loop
;



: byteHash 255 & ; // gets litTab lookup address of a value
: litTab@ litTab litVal @ byteHash int[@] ; // ( -- litTab[hash(litVal)])
: litTab! litTab litVal @ byteHash int[!] ; // ( listPtr -- )
: newTabEn // creates a new hashtable linked list node
			// ( -- literalVarPointer listNode )
	4 ALLOC
	litVal @ OVER !value currDP OVER !entry 0 OVER !next
	litVal @ dIW
	DUP @entry SWAP
; 

: # // # returns the address of a variable initialised to the value passed to it, if one exists, makes one otherwise
	// (value -- address of int containing that value)
	litVal !
	litTab@
	DUP if
		inList DUP if // if it's in the list, then the value will be returned so do nothing
		else
			DROP newTabEn litTab@ OVER !next litTab! // creates a new linked list node and does linkage
			// newTabEn returns the entry anyway
		then
	else
		DROP newTabEn litTab! // create a new table entry and add it to the table
	then
;

: ASM_EXEC
	// write launchpad code to all addresses until the right one is hit
	0 1 while
		50593792 OVER 0 int[!] // writes an unconditional load pc, instruction to the address
		4 + codeSegment # OVER 0 int[!] // writes a variable with the address of the code segment
		4 + 

		0 0 < DROP // in current forth.al file, the less subroutine is defined first, so by dummy calling it,
				   // we can attempt to run the launchpad code  sooner
	1 loop
;


// now "DECLABEL x ... x instrLAB goto ... x :LABEL" should work

// ___________________________________________ FIRST ABSTRACTION FROM MACHINE CODE ___________________________

// mnemonic substitutions
// word to compile single commands 

// Register code declarations

0 CONST  zro,	8 CONST  gp0,
1 CONST  one,	9 CONST  gp1,
2 CONST  acc,	10 CONST  gp2,
3 CONST  jmp,	11 CONST  gp3,
4 CONST  pc,	12 CONST  gp4,
5 CONST  fst,	13 CONST  gp5,
6 CONST  frst,	14 CONST  gp6,
7 CONST  stp, 	15 CONST  gp7,

// op_code declarations

0  CONST op_hlt, 10 CONST op_oda,  20 CONST op_modr, 30 CONST op_adcr, 40 CONST op_nota,
1  CONST op_nop, 11 CONST op_ldb,  21 CONST op_andr, 31 CONST op_sbbr, 41 CONST op_nnda,
2  CONST op_mov, 12 CONST op_stb,  22 CONST op_orrr, 32 CONST op_adda, 42 CONST op_nora,
3  CONST op_ldi, 13 CONST op_ldw,  23 CONST op_xorr, 33 CONST op_suba, 43 CONST op_xnra,
4  CONST op_sti, 14 CONST op_stw,  24 CONST op_notr, 34 CONST op_mula, 44 CONST op_shla,
5  CONST op_cmr, 15 CONST op_pas,  25 CONST op_nndr, 35 CONST op_diva, 45 CONST op_shra,
6  CONST op_cma, 16 CONST op_addr, 26 CONST op_norr, 36 CONST op_moda, 46 CONST op_adca,
7  CONST op_ocr, 17 CONST op_subr, 27 CONST op_xnrr, 37 CONST op_anda, 47 CONST op_sbba,
8  CONST op_oca, 18 CONST op_mulr, 28 CONST op_shlr, 38 CONST op_orra, 48 CONST op_inr, 
9  CONST op_odr, 19 CONST op_divr, 29 CONST op_shrr, 39 CONST op_xora, 49 CONST op_ina, 

VARIABLE asm_r1 VARIABLE asm_r2 VARIABLE asm_cnd VARIABLE asm_op VARIABLE asm_addr
: asm;
	// assembles 4 bytes and an int address
	asm_addr ! asm_op ! asm_r2 ! asm_r1 ! asm_cnd ! // stack is: cnd r1 r2 op addr
	asm_op @ cW asm_r1 @ cW asm_r2 @ cW asm_cnd @ cW asm_addr @ cIW // writes each part of the instruction to the code segment
;

// assembly programming can be done from this code alone, but now we can introduce macros to make us more efficient, we can add our macros


// ______________________________________________ SECOND ABSTRACTION _____________________________________________

// streamlined commands, some pseudo commands (branch)

: hlt; 0 0 0 op_hlt, 0 asm; ;
: nop; 0 0 0 op_nop, 0 asm; ;
: mov; 0 ROT op_mov, 0 asm; ;
: ldi; 0 ROT 0 SWAP op_ldi, SWAP asm; ; // a simple unconditional load, with no indexing register
: ldi[]; 0 4ROT op_ldi, SWAP asm; ;  	// unconditional indexed load
: sti; 0 ROT 0 SWAP op_sti, SWAP asm; ; // a simple unconditional store, with no indexing register
: sti[]; 0 4ROT op_sti, SWAP asm; ;  	// unconditional indexed load
: cmr; 0 ROT op_cmr, 0 asm; ;
: cma; 0 ROT 0 SWAP op_cma, SWAP asm; ;
: cma[]; 0 4ROT op_cma, SWAP asm; ;
: ocr; 0 SWAP 0  op_ocr, 0 asm; ;
: oca; 0 SWAP 0 SWAP 0 SWAP op_oca, SWAP asm; ;
: oca[]; 0 ROT 0 SWAP op_oca, SWAP asm; ;
: odr; 0 SWAP 0  op_odr, 0 asm; ;
: oda; 0 SWAP 0 SWAP 0 SWAP op_oda, SWAP asm; ;
: oda[]; 0 ROT 0 SWAP op_oda, SWAP asm; ; 
: ldb; 0 ROT 0 SWAP op_ldb, SWAP asm; ; // a simple unconditional load, with no indexing register
: ldb[]; 0 4ROT op_ldb, SWAP asm; ;  	// unconditional indexed load
: stb; 0 ROT 0 SWAP op_stb, SWAP asm; ; // a simple unconditional store, with no indexing register
: stb[]; 0 4ROT op_stb, SWAP asm; ;  	// unconditional indexed load
: ldw; 0 ROT 0 SWAP op_ldw, SWAP asm; ; // a simple unconditional load, with no indexing register
: ldw[]; 0 4ROT op_ldw, SWAP asm; ;  	// unconditional indexed load
: stw; 0 ROT 0 SWAP op_stw, SWAP asm; ; // a simple unconditional store, with no indexing register
: stw[]; 0 4ROT op_stw, SWAP asm; ;  	// unconditional indexed load

: addr; 0 ROT op_addr, 0 asm; ;
: adda; 0 ROT 0 SWAP op_adda, SWAP asm; ;
: adda[]; 0 4ROT op_adda, SWAP asm; ;
: subr; 0 ROT op_subr, 0 asm; ;
: suba; 0 ROT 0 SWAP op_suba, SWAP asm; ;
: suba[]; 0 4ROT op_suba, SWAP asm; ;
: mulr; 0 ROT op_mulr, 0 asm; ;
: mula; 0 ROT 0 SWAP op_mula, SWAP asm; ;
: mula[]; 0 4ROT op_mula, SWAP asm; ;
: divr; 0 ROT op_divr, 0 asm; ;
: diva; 0 ROT 0 SWAP op_diva, SWAP asm; ;
: diva[]; 0 4ROT op_diva, SWAP asm; ;
: modr; 0 ROT op_modr, 0 asm; ;
: moda; 0 ROT 0 SWAP op_moda, SWAP asm; ;
: moda[]; 0 4ROT op_moda, SWAP asm; ;
: andr; 0 ROT op_andr, 0 asm; ;
: anda; 0 ROT 0 SWAP op_anda, SWAP asm; ;
: anda[]; 0 4ROT op_anda, SWAP asm; ;
: orrr; 0 ROT op_orrr, 0 asm; ;
: orra; 0 ROT 0 SWAP op_orra, SWAP asm; ;
: orra[]; 0 4ROT op_orra, SWAP asm; ;
: xorr; 0 ROT op_xorr, 0 asm; ;
: xora; 0 ROT 0 SWAP op_xora, SWAP asm; ;
: xora[]; 0 4ROT op_xora, SWAP asm; ;
: notr; 0 SWAP 0 op_notr, 0 asm; ;
// nota instructions not reg1, not the addressed value
: nndr; 0 ROT op_nndr, 0 asm; ;
: nnda; 0 ROT 0 SWAP op_nnda, SWAP asm; ;
: nnda[]; 0 4ROT op_nnda, SWAP asm; ;
: norr; 0 ROT op_norr, 0 asm; ;
: nora; 0 ROT 0 SWAP op_nora, SWAP asm; ;
: nora[]; 0 4ROT op_nora, SWAP asm; ;
: xnrr; 0 ROT op_xnrr, 0 asm; ;
: xnra; 0 ROT 0 SWAP op_xnra, SWAP asm; ;
: xnra[]; 0 4ROT op_xnra, SWAP asm; ;
: shlr; 0 ROT op_shlr, 0 asm; ;
: shla; 0 ROT 0 SWAP op_shla, SWAP asm; ;
: shla[]; 0 4ROT op_shla, SWAP asm; ;
: shrr; 0 ROT op_shrr, 0 asm; ;
: shra; 0 ROT 0 SWAP op_shra, SWAP asm; ;
: shra[]; 0 4ROT op_shra, SWAP asm; ;
: adcr; 0 ROT op_adcr, 0 asm; ;
: adca; 0 ROT 0 SWAP op_adca, SWAP asm; ;
: adca[]; 0 4ROT op_adca, SWAP asm; ;
: sbbr; 0 ROT op_sbbr, 0 asm; ;
: sbba; 0 ROT 0 SWAP op_sbba, SWAP asm; ;
: sbba[]; 0 4ROT op_sbba, SWAP asm; ;

: inr; 0 SWAP 0 op_inr, 0 asm; ;
: ina; 0 SWAP 0 SWAP op_ina, SWAP asm; ;
: ina[]; 0 ROT 0 ROT op_ina, SWAP asm; ;

// branch pseudocommands
: brr; pc, op_mov, 0 asm; ;
: bra; pc, SWAP 0 SWAP op_ldi, SWAP asm; ;
: bra[]; pc, ROT op_ldi, SWAP asm; ;

// construct conditionals

: testr, 128 64 + + ; // constructs a test register conditional byte
: equ, [ 128 24 + ] ;
: gre, [ 128 25 + ] ;
: les, [ 128 26 + ] ;
: car, [ 128 27 + ] ;
: bor, [ 128 28 + ] ;
: db0, [ 128 29 + ] ;
: sto, [ 128 30 + ] ;
: stu, [ 128 30 + ] ;
: unc, 0 ;

// ______________________________________________ THIRD ASBSTRACTION _________________________
// macro pseudo commands

: goto;
	pc, jmp, mov;
	jmp, 16 # adda;
	pc, SWAP ldi;
;
: gotoIf;
	pc, jmp, mov;
	jmp, 16 # adda;
	bra;
;

97 # oca;
hlt;
ASM_EXEC
