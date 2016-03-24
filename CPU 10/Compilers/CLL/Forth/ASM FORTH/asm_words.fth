// the assembly code for compiled built in words
// other words are built up with calls to the words (compiled thread code)

// _____________________________________ Code for basic functions ______________________________




fREAD LABEL!
		SCANW call;
 		gp6, WORD_BUF ldi;

 		gp6, 8 # adda;
 		gp6, WORD_BF8 sti; // creates a variable to store the address of the end of the word buff
 		gp6, 8 # suba;
 	READLOOP LABEL!
 		gp4, gp5, 0 ldc[]; 	// load up a char to gp4
 								// tests the char for whitespace

			// TEST FOR WHITESPACE
				gp4, zro, cma; 							// if a  null
				eq, READEND bra; // branch to the padding routine
				gp4, 13 # cma; 							// if a CR
				eq, READEND bra; // branch to the padding routine
				gp4, 32 # cma;							// if a space
				eq, READEND bra; // branch to the padding routine
				gp4, 9 # cma;							// if a tab
				eq, READEND bra; // branch to the padding routine
			// store the character to 

			// increment gp6
			gp6, one, addr;
			gp5, one, addr;
			gp6, WORD_BF8 cma;
			eq, READLOOP bra;
		// if loop ends at 8th char, then store the null and return
		zro, gp6, 0 stc[];
		ret;

	READEND LABEL!
		// iterate though to end of word buf writing zeros
		zro, gp6, 0 stc[]; // write zero
		gp6, one, adda; // increment and test
		p6, WORD_BF8 cma;
		eq, READEND bra;
	zro, gp6, 0 stc[]; // at end then write one more zero then ret
	ret;






fEXEC LABEL! // executes a dictionary node (dictNode -- )
		gp5, Popr;
		gp5, 8 call[];
		ret;

f:	 				LABEL!

	// non - monolithic compile
	// the : word 
	// creates a new dict entry (ptr in gp5) and stores the next word on the input to its name part, stores gp7 to its link part and calls
	// the compile subroutine
	fREAD call; // reads the name in
	NDCTNTRY;	// creates a new dict entry
	gp5, gp7, mov; // add new dict entry to the dictionary (linkage is already done)
	COMPILER call; // 
	ret;

fC: 				LABEL! 
	// compiles to the Compile namespace
	// exactly the same as f:, except creates the new word entry in the compile dict


	// Afterwards restores the original gp7 ( the compile subroutine stores the compiled word to gp7 )
	fREAD call;
	NDCTNTRY;
	gp6, COMPDICT ldi;
	gp6, gp5, 8 sti[];
	ret;

fNEW_DICT LABEL! // updates the dictionary pointer to the TOS (allows name spaces)
		gp7, Popr;
		ret;

fDICT LABEL! // Push the current namespace pointer
		gp7, Pushr;
		ret;

fINTERP  	 				LABEL! // outer interpreter loop
	fREAD call;
	fEVAL call;
	0 fINTERP bra;
	ret;

fEVAL    	 				LABEL!	 //		: EVAl isInDict DUP if EXECUTE else DROP TRYINT then ;
		DictLkup call;																	// isInDict, value left in gp5 and on stack	
		jmp, 4 # suba;															// drop from stack as stored in gp5
		gp5, testr, EVAL_ISW bra; // if is in dict then execute it: else test for an integer
			fTRYINT call; // test for an integer
			ret;

		EVAL_ISW LABEL!
			gp5, 8 call[]; // executes contents of gp5
			ret; 			// returns

fTRYINT  	 				LABEL!
	// ///////////////////////////////////
	// TODO: check for an integer in word buf: ie test each character for being in the right range
	// //////////////////////////////////
	

		gp6, WORD_BUF ldi;


		re;

fDALLOC  	 				LABEL!
		gp5, Popr;
		DALLOC call;
		gp5 Pushr;
		ret;
fALLOC   	 				LABEL!
		
		gp5, Popr;
		ALLOC call;
		gp5 Pushr;
		ret;

fALLC_AD 					LABEL!
		gp5, Popr;
		0 ALLC_ADD bra; // branch avoids the need for a return

fREADC 	 					LABEL!
	// /////////////////////////////
	// TODO: READ A char onto the stack, has to obey input state rules
	// /////////////////////////////
f//      	 				LABEL!
	zro, RDIN_ST8 sti; // set the read in state to empty buffer
	ret;

fDROPALL	 				LABEL!
	zro, stp, mov; // set the data stack pointer to zero
	ret;

fHALT   	 				LABEL!
	hlt;

f.dict  	 				LABEL!
	// /////////////////////////
	// TODO: prints the current dict
	// /////////////////////////
f.cDict 					LABEL!
	// ////////////////////////
	// TODO: prints the compile dict
	// ////////////////////////

f.s	 						LABEL!
	// ////////////////////////////////
	// TODO: print entire stack in hex
	// ////////////////////////////////

	// increment gp4 repeatedly, printing in hex the answer until it is equal to stp
fPASS  	 					LABEL!
	ret;
f.c	 						LABEL!
	gp5, Popr;
	gp5, ocr;

f.BUF	 					LABEL!	

		gp6, WORD_BUF ldi;
		gp6, 0 oca[];
		gp6, 1 oca[];
		gp6, 2 oca[];
		gp6, 3 oca[];
		gp6, 4 oca[];
		gp6, 5 oca[];
		gp6, 6 oca[];
		gp6, 7 oca[];
	 	ret;

fCONV_INT	 				LABEL!
	// TODO:

	// runs through the word buf, checking the bytes are in the right range, if they are then push 1 else push 0

fISINT   	 				LABEL!
	// TODO:
	// runs through the word buf, creating an int
fINDICT  	 				LABEL!
	0 DictLkup bra; // using a branch to avoid a double return


fTABLE   	 				LABEL!
		fREAD call; // gets the name
		NDCTNTRY; // creates a dict entry
		gp5, gp7, mov; // adds to the dictionary
		gp5, 10 8 * 4 + # ldi; // at least 10 instructions, plus one piece of data
		ALLOC call; // allocate a chunk of memory the right size

		
		gp5, gp6, mov; // use gp6 as temp
		gp5, Popr; // get size
		gp5, 4 # mula;
		ALLOC call; // allocates and get address
		gp5, gp6, 10 8 * sti[]; // stores to appropriate place
		gp6, gp5, mov; // restores gp5
		

		gp6, gp5, 10 8 * sti[]; // uses a variable in the code stream
		// needs to compile a ret instruction
		0 $N !
		51250176 $ 9 8 * $						// gp6, pc, (9*8) ldi[]; // uses the PC to index the value to push
		68028160 $ 0 $						// gp6, stp, 0 sti[]; // TODO: needs bounds checking
		537329664 $ 4 # $									// stp, 4 # adda;
	
	
		553844736 $ 4 # $ 					// ret: jmp, 4 # suba;
		50594560 $ 0 $ 						// 		pc, jmp, 0 ldi[];
		ret;
fCONST   	 				LABEL!

		fREAD call; // gets the name
		NDCTNTRY; // creates a dict entry
		gp5, gp7, mov; // adds to the dictionary
		gp5, 10 8 * 4 + # ldi; // at least 10 instructions, plus one piece of data
		ALLOC call; // allocate a chunk of memory the right size
		gp6, Popr;
		gp6, gp5, 10 8 * sti[]; // uses a variable in the code stream
		// needs to compile a ret instruction
		0 $N !
		51250176 $ 9 8 * $						// gp6, pc, (9*8) ldi[]; // uses the PC to index the value to push
		68028160 $ 0 $						// gp6, stp, 0 sti[]; // TODO: needs bounds checking
		537329664 $ 4 # $									// stp, 4 # adda;
	
	
		553844736 $ 4 # $ 					// ret: jmp, 4 # suba;
		50594560 $ 0 $ 						// 		pc, jmp, 0 ldi[];
		ret;

fVARIABLE        	 		LABEL!
		fREAD call; // gets the name
		NDCTNTRY; // creates a dict entry
		gp5, gp7, mov; // adds to the dictionary
		gp5, 10 8 * 4 + # ldi; // at least 10 instructions, plus one piece of data
		ALLOC call; // allocate a chunk of memory the right size

		gp5, gp6, mov; // use gp6 as temp
		gp5, 4 # ldi; 
		ALLOC call; // allocates and get address
		gp5, gp6, 10 8 * sti[]; // stores to appropriate place
		gp6, gp5, mov; // restores gp5
		

		gp6, gp5, 10 8 * sti[]; // uses a variable in the code stream
		// needs to compile a ret instruction
		0 $N !
		51250176 $ 9 8 * $						// gp6, pc, (9*8) ldi[]; // uses the PC to index the value to push
		68028160 $ 0 $						// gp6, stp, 0 sti[]; // TODO: needs bounds checking
		537329664 $ 4 # $									// stp, 4 # adda;
	
	
		553844736 $ 4 # $ 					// ret: jmp, 4 # suba;
		50594560 $ 0 $ 						// 		pc, jmp, 0 ldi[];
		ret;

f=       	 				LABEL!
		stp, 8 # cma; // make sure there is 2 or more elements on stack
		gre, 1 nskip;
		one, testr, stckUndr bra;
		
		gp4, stp, -8 ldi[]; 
		gp5, stp, -4 ldi[];
		stp, 8 # suba;
		zro, gp6, mov;
		gp4, gp5, cmr;
		gre, one, gp6, op_mov, 0 asm;
		ret;

f>       	 				LABEL!
		// TODO: deal with 2s complement
		stp, 8 # cma; // make sure there is 2 or more elements on stack
		gre, 1 nskip;
		one, testr, stckUndr bra;
		
		gp4, stp, -8 ldi[]; 
		gp5, stp, -4 ldi[];
		stp, 8 # suba;
		zro, gp6, mov;
		gp4, gp5, cmr;
		gre, one, gp6, op_mov, 0 asm;
		ret;

f<	 						LABEL!
		// TODO: deal with 2s complement
		stp, 8 # cma; // make sure there is 2 or more elements on stack
		gre, 1 nskip;
		one, testr, stckUndr bra;
		
		gp4, stp, -8 ldi[]; 
		gp5, stp, -4 ldi[];
		stp, 8 # suba;
		zro, gp6, mov;
		gp4, gp5, cmr;
		les, one, gp6, op_mov, 0 asm;
		ret;

f>>      	 				LABEL!
		stp, 8 # cma; // make sure there is 2 or more elements on stack
		gre, 1 nskip;
		one, testr, stckUndr bra;
		
		gp4, stp, -8 ldi[]; 
		gp5, stp, -4 ldi[];
		stp, 8 # suba;
		gp4, gp5, shrr;
		gp4, Pushr;

		ret;
f<<      	 				LABEL!
		stp, 8 # cma; // make sure there is 2 or more elements on stack
		gre, 1 nskip;
		one, testr, stckUndr bra;
		
		gp4, stp, -8 ldi[]; 
		gp5, stp, -4 ldi[];
		stp, 8 # suba;
		gp4, gp5, shlr;
		gp4, Pushr;
		ret;

f~^      	 				LABEL!
		stp, 8 # cma; // make sure there is 2 or more elements on stack
		gre, 1 nskip;
		one, testr, stckUndr bra;
		
		gp4, stp, -8 ldi[]; 
		gp5, stp, -4 ldi[];
		stp, 8 # suba;
		gp4, gp5, xnrr;
		gp4, Pushr;

		ret;
f~|      	 				LABEL!
		stp, 8 # cma; // make sure there is 2 or more elements on stack
		gre, 1 nskip;
		one, testr, stckUndr bra;
		
		gp4, stp, -8 ldi[]; 
		gp5, stp, -4 ldi[];
		stp, 8 # suba;
		gp4, gp5, norr;
		gp4, Pushr;

		ret;

f~&      	 				LABEL!
		stp, 8 # cma; // make sure there is 2 or more elements on stack
		gre, 1 nskip;
		one, testr, stckUndr bra;
		
		gp4, stp, -8 ldi[]; 
		gp5, stp, -4 ldi[];
		stp, 8 # suba;
		gp4, gp5, nndr;
		gp4, Pushr;

		ret;
f~       	 				LABEL!
		stp, testr, 1 nskip;
		one, testr, stckUndr bra;
		

		gp5, stp, -4 ldi[];
		stp, 4 # suba;
		gp5, notr;
		gp5, Pushr;
		ret;

f^       	 				LABEL!
		stp, 8 # cma; // make sure there is 2 or more elements on stack
		gre, 1 nskip;
		one, testr, stckUndr bra;
		
		gp4, stp, -8 ldi[]; 
		gp5, stp, -4 ldi[];
		stp, 8 # suba;
		gp4, gp5, xorr;
		gp4, Pushr;

		ret;

f|       	 				LABEL!
		stp, 8 # cma; // make sure there is 2 or more elements on stack
		gre, 1 nskip;
		one, testr, stckUndr bra;
		
		gp4, stp, -8 ldi[]; 
		gp5, stp, -4 ldi[];
		stp, 8 # suba;
		gp4, gp5, orrr;
		gp4, Pushr;
		ret;
	
f&       	 				LABEL!
		stp, 8 # cma; // make sure there is 2 or more elements on stack
		gre, 1 nskip;
		one, testr, stckUndr bra;
		
		gp4, stp, -8 ldi[]; 
		gp5, stp, -4 ldi[];
		stp, 8 # suba;
		gp4, gp5, andr;
		gp4, Pushr;
		ret;

f%	 						LABEL!
		stp, 8 # cma; // make sure there is 2 or more elements on stack
		gre, 1 nskip;
		one, testr, stckUndr bra;
		
		gp4, stp, -8 ldi[]; 
		gp5, stp, -4 ldi[];
		stp, 8 # suba;
		gp4, gp5, modr; // TODO: update to use two's complement
		gp4, Pushr;
		ret;
f/       	 				LABEL!
		stp, 8 # cma; // make sure there is 2 or more elements on stack
		gre, 1 nskip;
		one, testr, stckUndr bra;
		
		gp4, stp, -8 ldi[]; 
		gp5, stp, -4 ldi[];
		stp, 8 # suba;
		gp4, gp5, divr;
		gp4, Pushr;
		ret;
f*       	 				LABEL!
		stp, 8 # cma; // make sure there is 2 or more elements on stack
		gre, 1 nskip;
		one, testr, stckUndr bra;
		
		gp4, stp, -8 ldi[]; 
		gp5, stp, -4 ldi[];
		stp, 8 # suba;
		gp4, gp5, mulr;
		gp4, Pushr;
		ret;
f-       	 				LABEL!
		stp, 8 # cma; // make sure there is 2 or more elements on stack
		gre, 1 nskip;
		one, testr, stckUndr bra;
		
		gp4, stp, -8 ldi[]; 
		gp5, stp, -4 ldi[];
		stp, 8 # suba;
		gp4, gp5, subr;
		gp4, Pushr;
		ret;

f+      	 				LABEL!
		stp, 8 # cma; // make sure there is 2 or more elements on stack
		gre, 1 nskip;
		one, testr, stckUndr bra;
		
		gp4, stp, -8 ldi[]; 
		gp5, stp, -4 ldi[];
		stp, 8 # suba;
		gp4, gp5, addr;
		gp4, Pushr;
		ret;

fDROP    	 				LABEL!
		stp, rskip1; // constructs a custom skip if stp != 0 instruction
		one, testr, stckUndr bra;
		stp, 4 # suba;
		ret;	

fOVER    	 				LABEL!
		stp, 8 # cma; // make sure there is 2 or more elements on stack
		gre, 1 nskip;
		one, testr, stckUndr bra;
		
		gp5, stp, -8 ldi[]; 
		gp5, Pushr;
		ret;

fROT     	 				LABEL!
		stp, 12 # cma; // make sure there is 3 or more elements on stack
		gre, 1 nskip;
		one, testr, stckUndr bra;
		
		gp4, stp, -12 ldi[]; 
		gp5, stp, -8 ldi[];
		gp6, stp, -4 ldi[];
		gp4, stp, -8 sti[];
		gp5, stp, -4 sti[];
		gp6, stp, -12 sti[];
		ret;

fSWAP   	 				LABEL!
		stp, 8 # cma; // make sure there is 2 or more elements on stack
		gre, 1 nskip;
		one, testr, stckUndr bra;
		
		gp4,	stp, -8 ldi[]; 
		gp5, stp, -4 ldi[];
		gp5, stp, -8 sti[];
		gp4, stp, -4 sti[];
		ret;

fDUP     	 				LABEL!
		gp5, Peekr;
		gp5, Pushr; // gets bounds check
		ret;

f.	 						LABEL!
		// TODO: needs to work with negative numbers
		gp5, Popr;
		gp5, odr;
		ret;
	

f!      	 				LABEL!
		gp5, Popr; // address
		gp4, Popr; // 
		gp4, gp5, 0 sti[];
		ret;

f@	 						LABEL!
		gp5, Popr; // address
		gp5, 0 Pushr[]; // pushes value at address
		ret;