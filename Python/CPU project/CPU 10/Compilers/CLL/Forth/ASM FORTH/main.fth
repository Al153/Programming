// a forth written in fassembler.
// this will be a fully compiled, more canonical threaded forth - the compiler should generate thread code







// order of execution:
//	 prime with std.fth
//	 run fassembler.fth
//	 run this file to set up the LABELs, special words, and variables
//	 run the rest of the files in the folder, allocation last



// ALL LABELs and variables should be stored here





















// need to create
	// a dictionary lookup function
	// dictionary structure
	// a save to dictionary function
	// a load new dictionary function
	
	// a variable containing interpreter state: compile mode, interpreter mode
	// create and push a dummy function, which signals a stack underflow at the bottom of the stack.

	// linked list allocation
	// some variable to mark the

// standard register allocation:
	// jmp: return stack pointer
	// stp: data stack pointer
	// gp7: current dictionary head
	// gp6: address of the word buffer/used during call
	// gp5, gp4: occasionally used by runtime functions
	//
	// gp0-gp3 are never touched by the runtime
	// gp4, gp5, gp6 can be used, but cannot be assumed to store the correct value between uses
	// gp7 can be used by custon assembly but MUST be restored after use
	//
	//
	//
	//
	//
LABEL: stckOver // need to define these labels
LABEL: stckUndr // 
LABEL: DLookup
LABEL: DLkup_L // loop
LABEL: DLkup_N // no match
LABEL: ALLC_INI
LABEL: ALLOC
LABEL: ALLC_ADD
LABEL: DALLOC
LABEL: DLOC_SCH // dalloc search
LABEL: DLOC_M
LABEL: DLOC_RED

LABEL: ALLC_OF // allocation overflow


 // variables for IO
256 TABLE LINE_BUF // buffers for read commands
9 ALLOC INT WORD_BUF 
0 INT RDIN_ST8 // read in state: One: full, Zero: empty
0 INT RDIN_TMP // temporary value to store gp7
0 CHAR RDIN_CHR
10 # CONST RDIN_LF // linefeed
0 # CONST RDIN_NUL // NULL
8 # CONST RDIN_BS // backspace
13 # CONST RDIN_NL // carriage return
0 INT RDIN_LP  // linepointer

LABEL: READ_IN // READ IN
LABEL: RDIN_EOL // what to do at EOL
LABEL: RDIN_BSP // what to do if a Backspace
LABEL: RDIN_LPP // read in loop

LABEL: SCANW // scan in a word
LABEL: ISWSPACE // checks if the top of the stack if a piece of whitespace
0 INT ISWS_ST8 // stores the IS whitespace state. 0: not whitespace 1: regular white space, 2: EOL
INT SCANW_RS // scanword result
INT ISEOL_ST // is EOL state
LABEL: ISEOL // checks if there is an EOL before the next word

LABEL: COMPILER // compiler subroutine
LABEL: COMPILLP // the compile word definition loop
LABEL: COMPWORD // execute a word in the compiler namespace
LABEL: COMPRET // prepare the compiler for completion 
LABEL: COMPABRT // what to do if a compilation fails
LABEL: COMPCALL // generate a word call instruction to call a word
0 INT COMPDICT // pointer to the compile mode dictionary
0 INT COMPDCTT // pointer to the temporary compile mode dictionary - stores loop/if words
0 INT COMPMODE // compile mode variable: 0 for interp, 1 for compile
0 INT COMPTEMP // store the current name space pointer
// ASM words: - pre compiled words

LABEL: fREAD
LABEL: fEXEC 
LABEL: f: 				// compile word
LABEL: fC: 				// compile a compile time word
LABEL: fNEW_DICT
LABEL: fDICT // PUSH the current namespace pointer
LABEL: fINTERP  
LABEL: fEVAL    
LABEL: fTRYINT  
LABEL: fDALLOC  
LABEL: fALLOC   
LABEL: fREADC 
LABEL: f//      
LABEL: fDROPALL
LABEL: fHALT   
LABEL: f.dict 
LABEL: f.CDict
LABEL: f.s
LABEL: fPASS  
LABEL: f.c
LABEL: f.BUF
LABEL: fCONV_INT
LABEL: fISINT   
LABEL: f:
LABEL: fINDICT  
LABEL: fEXEC    
LABEL: fREAD    
LABEL: fTABLE   
LABEL: fCONST   
LABEL: fVARIABLE        
LABEL: f=       
LABEL: f>       
LABEL: f<
LABEL: f>>      
LABEL: f<<      
LABEL: f~^      
LABEL: f~|      
LABEL: f~&      
LABEL: f~       
LABEL: f^       
LABEL: f|       
LABEL: f&       
LABEL: f%
LABEL: f/       
LABEL: f*       
LABEL: f-       
LABEL: f+      
LABEL: fDROP    
LABEL: fOVER    
LABEL: fROT     
LABEL: fSWAP   
LABEL: fDUP     
LABEL: f.
LABEL: f!      
LABEL: f@

LABEL: EVAL_ISW // what to do if a word is found in the dictionary
// ________________________________ GENERAL ASSEMBLY MACRO WORDS __________________________________
: call; // generates call assembly
	pc, gp6, mov;
	gp6, 32 # adda;
	gp6, jmp, 0 sti[];
	jmp, 4 # adda; // needs bounds testing
	pc, SWAP ldi;
;

: call[]; // generates call assembly
	pc, gp6, mov;
	gp6, 32 # adda;
	gp6, jmp, 0 sti[];
	jmp, 4 # adda; // needs bounds testing
	pc, SWAP ldi[];
;

: ret; // generates return assembly
	jmp, 4 # suba;
	pc, jmp, 0 ldi[];
;

: Pushr; 
	stp, 0 sti[]; // needs bounds checking
	stp, 4 # adda;
;

: Pusha;
	gp5, SWAP ldi; // needs bounds checking
	gp5, stp, 0 sti[];
	stp, 4 # adda;
;

: Popr;
	stp, rskip1; // constructs a custom skip if stp != 0 instruction
	one, testr, stckUndr bra;
	stp, 4 # suba;
	stp, 0 ldi[]; // loads designated register
;

: Peekr;
	stp, rskip1; // constructs a custom skip if stp != 0 instruction
	one, testr, stckUndr bra;
	stp, -4 ldi[]; // loads designated register
;

: Popa;
	stp, rskip1; // constructs a custom skip if stp != 0 instruction
	one, testr, stckUndr bra;
	stp, 4 # suba;
	gp5, stp, 0 ldi[];
	gp5, SWAP sti; // store to the address
;

// ________________________________  MORE SPECIFIC ASSEMBLY MACRO WORDS _____________________________
: ralloc; // (register -- )
	// stores allocated space to the register
	DUP gp5, mov;
	ALLOC  call;
	gp5, SWAP mov;
;

: rallocAdd; // ( register -- )
	gp5, mov;
	ALLC_ADD call;
;

: EXEC;
	gp5, Popr;
	gp5, 4 call[];
;

: NDCTNTRY; // creates a new dict entry, with the next word in the word buffer as its name
			// gp4 as an auxiliary register
			// gp5 holds the dict entry
	gp5, 16 # ldi;
	ALLOC call;
	gp6, WORD_BUF ldi;
	gp4, gp6, 0 ldi[];
	gp4, gp5, 0 sti[];
	gp4, gp6, 4 ldi[];
	gp4, gp5, 4 sti[];
;








// starting assembly
 




