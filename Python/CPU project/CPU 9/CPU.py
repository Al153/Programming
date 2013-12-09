#CPU is little endian


busses:
	memory control bus 			bMC     1    	Memory field [0:4] + R/W [7]
	memory address/data bus 	bMAD	4	 	Memory data and address (depends on memory state)  

	ALU control bus 			bAC     1		ALU op [...] ALU controls (carry,signed) [...],[...]
	ALU data bus    			bAD     4		Data relay between ALU and main CPU

	register control bus 		bRC     2		byte[0]: field [0:4], register R/W [7] byte[1]: Register address[0:5]
	register data bus 	 		bRD     4		Register data


Command crib sheet:


	command type:       byte0   byte1   byte2   byte3        byte4   byte5   byte6   byte

	Reg                 opcode  reg1    field   conditional  reg2    Null    Null    Null

    Load/store          opcode  reg1    field** conditional  A/D     A/D     A/D     A/D

    ALU[reg bit 7 lo]*  opcode  reg1    field   conditional  reg2    Null    Null    Null

    ALU[reg bit 7 hi]*  opcode  reg1    field** conditional  A/D     A/D     A/D    A/D

    *ALU commands are either Reg or L/S based whether they are or not depends on bit 7 of the reg1 byte
    *Also packaged are the options [swap (bit 6) - returns result of calculation to the non default location (reg2 or A/D)]
    							   [unsigned (bit 5)] - carries out the operation on the unsigned data]

    **In L/S style commands, bits [5:] specify an index register to modify the address, in ALU ops acting as L/S commands, bit[4] specifies whether 
      the A/D bytes should be treated as data or address  (0:addr, 1:data) 


	opcode   mnemonic     type              comments

	00    	Halt        register          	Stops CPU operation
	01		ADD 		ALU					ADDs two values together (either register or reg and A/D)
	02		SUB 		ALU					Subtracts reg2 from reg1 and puts into reg1
	03		ADDC		ALU					Add with carry
	04		SUBB 		ALU   				Subtract with borrowing 
	05		MUL	        ALU 				Multiply
	06		DIV			ALU					Divide 
	07		MOD 		ALU					Modulo
	08		AND 		ALU					Bitwise AND
	09		OR 			ALU					Bitwise OR
	0a		NOT 		ALU
	0b		XOR 		ALU
	0c		NAND 		ALU
	0d		NOR 		ALU
	0e		XNOR 		ALU
	0f		RROT 		ALU
 	10		LROT 		ALU
 	11		RSH			ALU
 	12		LSH 		ALU
 	13		CMP			ALU               Compares two values and edits the flag register 
 	14		MOV		    Reg               Moves value from one register to another
 	15		LODA        L/S               Load address (loads data from address in A/D bytes)
 	16		LODD		L/S               Load data (loads data from A/D bytes)
 	17		STR         L/S               Store(Stores a register value into memory)
 	18		POP			L/S               POP  (Pops from stack into a register)
 	19		PSH			REG               Push (pushes a register value into stack) 
 	1a		GGTO        L/S               Global GoTo (puts data into both pP and rP)   
 	1b
 	1c
 	1d
 	1e
 	1f
 	20
 	21
 	22
 	23
 	24
 	25
 	26
 	27
 	28
 	29
 	2a
 	2b
 	2c
 	2d
 	2e
 	2f