// implementation of dict lookups and adds


// ______________________________________ Dict structure: same as CLLForth __________________
// 8 bytes of name, 4 of code addr, 4 of next ptr

// ______________________________________ Code to enact a dict lookup _______________________
	// calling a dict lookup will change these registers:
	//			gp6, gp5, gp4


DictLkup LABEL!
		gp7, gp5, mov;
		gp6, WORD_BUF ldi;

	DLkup_L LABEL! 
		gp4, gp6, 0 ldi[]; // tests if the name and dict name are equal
		gp4, gp5, 0 suba[];
		gp4, testr, DLkup_N bra;
		gp4, gp6, 4 ldi[];
		gp4, gp5, 4 suba[];
		gp4, testr, DLkup_N bra;

							// hence if there is a match then push the result: 
		gp5, Pushr;
		ret;

	DLkup_N LABEL!
		gp5, gp5, 12 ldi[];
		gp5, testr, DLkup_L bra;
		0 # Pusha;
		ret;
