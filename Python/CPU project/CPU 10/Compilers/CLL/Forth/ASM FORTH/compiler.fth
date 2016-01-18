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