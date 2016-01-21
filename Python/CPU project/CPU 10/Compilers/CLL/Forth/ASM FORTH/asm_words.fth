// the assembly code for compiled built in words
// other words are built up with calls to the words (compiled thread code)

// _____________________________________ Code for basic functions ______________________________




fREAD LABEL!
		// TODO: copy into gp6
		SCANW call;

 		gp6, WORD_BUF ldi;

;




fEXEC LABEL! // executes a dictionary node (dictNode -- )
		gp5, Popr;
		gp5, 4 call[];
		ret;

f:	 				LABEL!
	// /////////////////////////////////////////////
	// TODO: WRITE COMPILER
	// /////////////////////////////////////////////
	// non - monolithic compile
	// the : word 
	// creates a new dict entry (ptr in gp5) and stores the next word on the input to its name part, stores gp7 to its link part and calls
	// the compile subroutine
	fREAD call;
	NDCTNTRY;

fC: 				LABEL! 
	// compiles to the Compile namespace

	// //////////////////////////////////
	// TODO: exactly the same as f:, except creates the new word entry in the compile dict
	// //////////////////////////////////

	// Afterwards restores the original gp7 ( the compile subroutine stores the compiled word to gp7 )
	fREAD call;
	NDCTNTRY;


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
			gp5, 4 call[]; // executes contents of gp5
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
	// TODO: alloc and add to dict
fCONST   	 				LABEL!
	// TODO: alloc and add to dict
fVARIABLE        	 		LABEL!#
	// TODO: alloc and add to dict

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