COMPILER LABEL!
	// COMPILER ROUTINE.
	// PRECONDITION: gp5 stores the dictionary pointer to store the word to.
	// 				 this should have already had its name copied into it, and correct linkage done
	// GP4 will hold a pointer to the next space for an instruction

	// TODO: 
		// alloc some instruction space
		// lookup each word in the incoming stream
			// firstly in the compile time dictionary: if found then execute the word
			// if not, then lookup the word in the regular (gp7) dict, and create an exec instruction jumping to that address
			// if that fails then try to convert the word to a number (hex or integer) and create a push instruction
				// if when these instructions are created then we need to increase the size of the allocation
			// if all fails then abort compilation: 
				// dealloc the memory holding the new instructions
				// dealloc gp5
				// make sure gp7 is set to the right dictionary address
				// return

			// finish compilation: 
				// store new code segment to the dictionary entry
				// update gp7
				// return
	gp5, COMPNODE sti;
	fRead call;
	NDCTNTRY; // create a new dict entry
	one, COMPMODE sti;
	gp5, COMPDICT ldi;
	gp5, COMPDCTT sti; // initialise the temporary compile dictionary - will store any loops etc
	gp5, 8 # ldi;
	ALLOC call;
	gp5, gp4, mov;
	gp5, COMPCSEG sti;
	COMPILLP LABEL! // compile time dictionary loop
		fRead call;
		gp7, COMPTEMP sti; // load up the temporary compile dict (contains any local loop definitions)
		gp7, COMPDCTT ldi;
		DictLkup call;
		gp7, COMPTEMP ldi; // restore the normal dictionary
		gp5, testr, COMPWORD bra; // if has found a word
		DictLkup call;						  // otherwise look up in the regular dictionary
		gp5, testr, COMPCALL bra;  // if in the dictionary, then compile a word call for it
									// finally test for an integer literal
		0 COMPABRT bra; // if all that fails then abort




	COMPWORD LABEL! // what to do if a word is found
		gp5, 8 call[]; // execute the compile time word
		one, COMPMODE cma; // if still in compile mode then...
		eq, COMPILLP bra; // loop
		0 COMPRET bra; // else prep for return



	COMPCALL LABEL! // to generate code to call a word

		gp5, gp5, 8 ldi[]; // make gp5 the code pointer
		gp5, COMPPTR sti; // store the code ptr

		gp5, 40 # ldi;
		ALLC_ADD call; // adds more to the allocation (40 bytes - 5 instructions)		

		gp5, 33820160 #  ldi; 	gp5, gp4, 0 sti[];gp5, 0 # ldi; 			gp5, gp4, 4 sti[]; 	//	pc, gp6, mov;

		gp5, 537788416 # ldi; gp5, gp4, 8 sti[];   gp5,	32 # # 	ldi;  gp5, gp4, 12	sti[];	//	gp6, 32 # adda;
		gp5, 68027136 #  ldi; gp5, gp4, 16 sti[];  gp5,	0 # 	ldi; gp5, gp4, 	20	sti[];	//	gp6, jmp, 0 sti[];
		gp5, 537067520 # ldi; gp5, gp4, 24 sti[];  gp5,	4 # #  	ldi; gp5, gp4, 	28	sti[];	//	jmp, 4 # adda; // needs bounds testing
		gp5, 50593792 #  ldi; gp5, gp4, 32 sti[]; 	gp5, COMPPTR ldi; gp5, gp4, 36 sti[];	//	pc, [current address in gp5 + 8] ldi;
		gp4, 40 # adda; // increment gp4 to point to next available instruction

		0 COMPILLP bra;





	COMPABRT LABEL! // what to do if an error:
		// TODO: print a message, deallocate the excess COMPDCTT entries

		gp5, COMPCSEG ldi; // deallocate the generated code, restore gp7 and the comp dict respectively
		
		DALLOC call;

		ret;

	COMPRET LABEL!
		// TODO: store new code segment to dict etc
		// update the register
		// return

// TODO: create compile time words