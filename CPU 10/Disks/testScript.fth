0 ADDBLOCK SWITCH
PRINTING ->
	R_STACK ->
		DISK -> 
			8 40 FORMAT
			DATABLCK ->
				BLCK -> NEW CONST THIS
				THIS 0 LOADBLCK




				NEW CONST ALLOCATD
				ALLOCATD .h8
				BLCK -> NEW ;; CONST BLOCK
				BLOCK ALLOCATD
				BLCK -> LOADBLCK ;;
				BLOCK BLCK -> .BLCK ;;



0 ADDBLOCK SWITCH
PRINTING ->
	R_STACK ->
		DISK ->
				8 40 FORMAT .s
				INODE -> IND_FIL #INODE
				