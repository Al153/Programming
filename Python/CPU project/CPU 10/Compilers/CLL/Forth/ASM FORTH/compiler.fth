COMPILER LABEL!
	// COMPILER ROUTINE.
	// PRECONDITION: gp5 stores the dictionary pointer to store the word to.
	// 				 this should have already had its name copied into it, and correct linkage done
		
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

	fRead call;
	NDCTNTRY; // create a new dict entry
	one, COMPMODE sti;
	gp5, COMPDICT ldi;
	gp5, COMPDCTT sti; // initialise the temporary compile dictionary - will store any loops etc

	COMPILLP LABEL! // compile time dictionary loop
		fRead call;
		gp7, COMPTEMP sti; // load up the temporary compile dict (contains any local loop definitions)
		gp7, COMPDCTT ldi;
		DictLkup call;
		gp7, COMPTEMP ldi; // restore the normal dictionary
		gp5, testr, COMPWORD bra; // if has found a word
		DictLkup call;						  // otherwise look up in the regular dictionary
		gp5, testr, COMPCALL bra;





	COMPWORD LABEL! // what to do if a word is found
		gp5, 8 call[]; // execute the compile time word
		one, COMPMODE cma; // if still in compile mode then...
		eq, COMPILLP bra; // loop
		0 COMPRET bra; // else prep for return

	COMPCALL LABEL! // to geneate code to call a word
		// TODO: create a "call word" piece of machine code, and store it to the code segm

	COMPABRT LABEL! // what to do if an error:
		// TODO: print a message, deallocate the excess COMPDCTT entries

	COMPRET LABEL!
		// TODO: store new code segment to dict etc
		// update the register
		// return

// TODO: create compile time words