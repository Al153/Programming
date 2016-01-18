// __________________________________ code to fill line buffer _________________________


READ_IN LABEL! // uses gp5
		
	
		gp7, RDIN_TMP sti; // store gp7 to open up an extra register
		zro, gp7, mov;

	RDIN_LPP LABEL!
		gp5, getW; // get and print the next character
		gp5, ocr;
		gp5, RDIN_NL cma; // if it is a EOL then break out of the loop
		equ, RDIN_EOL bra;

		gp5, RDIN_BS cma; // if it is a backspace, jump to the BSP handling code
		equ, RDIN_BSP bra;

		gp5, gp7, LINE_BUF stc[]; // stores the character to the LINE_BUF
		gp7, one, addr; // inmcrement line pointer
		gp7, 255 # anda;
		0 RDIN_LPP bra; // unconditional jump to the loop


	RDIN_BSP LABEL!
		gp7, testr, 2 nskip; 
			62 # oca;				// if the lp is 0 then just print a >
			0 RDIN_LPP bra;

		// else
			zro, gp7, LINE_BUF stc[];
			gp7, one, subr;
			RDIN_BS oca;
			RDIN_BSP oca;
			0 RDIN_LPP bra;

	RDIN_EOL LABEL!
		zro, gp7, LINE_BUF stc[]; // nullifies the string
		RDIN_LF oca; // outputs a linefeed
		gp7, one, addr;
		gp7, 255 # anda;

		gp7, testr, 4 nskip; // fill rest of buffer with 0s
			zro, gp7, LINE_BUF stc[];
			gp7, one, addr;
			gp7, 255 # andr;
			0 5 njmpBack;

		one, RDIN_ST8 sti; // store a one to the RDIN state
		gp7, RDIN_LP sti;
		gp7, RDIN_TMP ldi; // restore gp7
		ret; // return

// ____________________________________ Scan Word into the buffer ______________________

SCANW LABEL! // ( leaves pointer to the next word in gp5)

		gp7, RDIN_TMP sti; // store gp7 to open up an extra register
		gp7, RDIN_LP ldi

		one, RDIN_ST8 cma;
		eq, 5 nskip; // skips 5 instrs if readin state = 1; if call is changed then update this function
		READ_IN call; // if the readin state = 0 then call READ_IN  and refill the buffer


		ISWSPACE call;			// test for white space
			zro, ISWS_ST8 cma;
			eq, 9 nskip;			
									// if is then:
				gp7, one, addr;					//	increment the gp7 (mod 256)
				one, ISWS_ST8 cma;								// 	if lineBuff[gp7] == 13 or 0 then READ_IN
				eq, 5 nskip;
				READ_IN call;
				0 16 njmpBack; 			// loop

		gp7, gp5, mov; gp5, LINE_BUF # adda; // load gp5 with the return value ( lineBuf + linePtr )
		gp5, SCANW_RS sti; // store for return

		ISWSPACE call;			// test for white space
			zro, ISWS_ST8 cma;
			eq, 3 nskip;		
				gp7, one, addr;		// if so then increment gp7 (mod 256)
				gp7, 255 # anda;			  		
				0 10 njmpBack;  // loop

		gp5, SCANW_RS ldi;
		/////////////////////////////////////////////
		// needs to to EOL check
		//////////////////////////////////////////////
		gp7, RDIN_LP sti;
		gp7, RDIN_TMP ldi; // restore gp7
		ret; // return


ISWSPACE LABEL! // assumes gp7 contains the value
	acc, 2 # ldi; // loads up a 2 to the acc
	acc, ISWS_ST8 sti; // default to two
	gp5, gp7, LINE_BUF ldi[];
	gp5, testr, zro, zro, op_sti, ISWS_ST8 asm; // create a sustom store if command, if the value isn't zro then store 0 to teh state
	gp5, 13 # cma; 							// if a CR
	eq, acc, zro, op_sti, ISWS_ST8 asm; // create a custom store if command, store a 2
	gp5, 32 # cma;							// if a space
	eq, one, zro, op_sti, ISWS_ST8 asm; // create a custom store if command, store a 1
	gp5, 9 # cma;							// if a tab
	eq, one, zro, op_sti, ISWS_ST8 asm; // create a custom store if command, store a 1
	ret;


ISEOL LABEL!