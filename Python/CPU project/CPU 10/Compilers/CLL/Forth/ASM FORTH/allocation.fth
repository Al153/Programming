// allocation module for ASM forth

// ______________________________ ALLOCATION ______________________________
// the stack should always be the last VARIABLE to be allocated by CLLforth, so the the asmforth system can access all of the memory after that.
// stack frame design:
//		Pointer to the next block
//		Alloced state: 0 for alloced, 1 for empty, 2 for TOS


200000 TABLE ALLC_STK // create a very large chunk of memory for the STACK
VARIABLE ALLC_TOP // points to the top of the allocation stack
200000 ALLC_TOP ! // counts down towards 0

ALLOC_INI LABEL! // initialise the allocation module
	to be added:

ALLOC LABEL! // stack based allocation // gp5: length to allocate. return TOS; set the state flag to alloced; then PUSH TOS+length; set new TOS flag to 2
		// registers used: 	gp5 - length to allocate; gp5 becomes the pointer returned
		//					gp4 - used as anauxiliary
		gp4, ALLC_TOP ldi; // get a pointer to the TOS
		gp4, rskip1; // skips next instruction if gp4 is positive
		pc, ALLC_OF ldi; // if stack is full then raise an error
		zro, gp4, ALLC_STK 4 + sti[]; // set the current TOS's state to alloced
		gp5, gp4, ALLC_STK adda[]; // get the new TOS pointer
		gp4, 8 # suba; // increment gp4 to point to the new TOS
		gp5, gp4, ALLC_STK sti[]; // store new TOS ptr to TOS
		gp5, 2 # lodi; // generate and store a TOS flag to the TOS's state
		gp5, gp4 ALLC_STK 4 + sti[]; // ditto
		gp5, gp4 ALLC_STK 8 + ldi[]; // get the old TOS pointer to return it
		gp4, ALLC_TOP sti; // save the new TOS
		ret; // return
	
	ALLC_OF LABEL!
		echo( ERROR: run out of stack space for allocation)
		zro, gp5, mov;
		ret; // returns 0, but could other stuff in the future

ALLC_ADD LABEL!
		// amount to increase most recent allocation by is in gp5
		gp4, ALLC_TOP ldi;
		gp4, ALLC_TOP ldi; // get a pointer to the TOS
		gp4, rskip1; // skips next instruction if gp4 is positive
		pc, ALLC_OF ldi; // if stack is full then raise an error
		gp5, gp4, ALLC_TOP adda[]; // add th3 contents of gp5  to the pointer to the next new node
		gp5, gp4, ALLC_TOP sti[];
		ret;

DALLOC LABEL! // stack based deallocation // when a block is dalloced, search the stack for a pointer matching
	// need to search through the stack for a matching address
	// gp5 = address
		gp4, ALLC_TOP ldi; // initialise the gp4 with the top of stack
	
	DLOC_SCH LABEL!
		gp5, gp4, ALLC_STK cma[];
		les, DLOC_M bra;
		gp4, 8 # adda;
		gp4, 200000 # cma;
		les,  DLOC_SCH bra;

	echo( ERROR: TRIED TO DEALLOCATE WRONG ADDRESS)// handle error due to trying to dalloc wrong address
	ret;

	DLOC_M LABEL! // found a match


		one, gp4, ALLC_STCK 4 - cma[]; // needs to check if current node is one below TOS
		les, DLOC_RED bra; // if less then is TOS
		zro, gp4 ALLC_STCK 4 + sti[];				 // if isn't the TOS, then mark the node as empty
		ret;

	DLOC_RED LABEL!
		one, gp5, mov; one, gp5, mov;	// sets new TOS
		gp5, gp4, ALLC_STCK 4 + sti[];	
		gp4, ALLC_TOP sti;				// store pointer to ALLC_TOP
		gp4, 8 # adda;

		one, gp4, ALLC_STCK 4 + cma[]; // check if node below is empty
		equ, DLOC_RED bra; // if so then loops
		ret;