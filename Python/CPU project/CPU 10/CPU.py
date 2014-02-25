_____________________ 32 bit CPU _____________________



__________________ Busses __________________


Name:			Width (bytes):			Notes:	

Main Bus        4						Main CPU Data Bus, connected to all major parts of the CPU

RegControl	    1						Controls read and write to registers: bit[0] 0 => read; 1 => write
MemControl		1						R/W		
ALUControl		1						bits[0=>3]: operation


__________________ Registers __________________

	Address     Notes

	0x0 		Zero register: always = [0,0,0,0]
	0x1			One register:  always = [0,0,0,1]
	0x2 		Accumulator:   stores the result of most recent multiplication
	0x3			jump register: the original value of the program counter gets moved into this
	0x4			Program counter: stores address of the next instruction to execute
    0x5 		Flags set 	- data written here will be ORed with the data in the flags register
    0x6			Flags reset - data written here will be ANDed with the data in the flags register
    0x7			Stack pointer - reserved for stack use (but stack is not built into hardware)
    0x8 		Stack base - reserved for the bottom part of the stack.

    0x9 ==> 0xf GP registers (0...6)


		


__________________ Instruction Set __________________

____ instruction format ____

byte:   0    	1    	2    	3    			4    	5   	 6  	  7

REG     Opcode  Reg1   reg2 	conditional	    A/D	    A/D 	 A/D 	  A/D
L/S 	Opcode  Reg1   index    conditional     A/D	    A/D 	 A/D 	  A/D 

bit [0] of conditional triggers a conditional command if high
bit [1] of conditional triggers an "if x:" conditional with bits [4 ==> 7] as register address
otherwise bits [4 ==> 7] as the conditional flag to check


Opcode   Mnemonic   Type    Notes
00		 Halt  		N/A
01		 Pass		N/A 
02		 MOV        REG
03		 LOD		L/S
04		 STR		L/S
05       CMP		REG
06 		 CMP 		L/S

.
.
.

10		 ADD		REG
11		 SUB		REG
12		 MUL 		REG
13		 DIV        REG
14		 MOD  		REG
15       AND 	    REG
16		 OR 		REG
17		 XOR		REG
18		 NOT 		REG
19       NAND       REG
1a       NOR        REG
1b		 XNOR		REG
1c		 SHL		REG
1d		 SHR		REG
1e		 ADDc 		REG
1f 		 SUBb 		REG

.
.
.

20		 ADD		L/S
21		 SUB		L/S
22		 MUL 		L/S
23		 DIV        L/S
24		 MOD  		L/S
25       AND 	    L/S
26		 OR 		L/S
27		 XOR		L/S
28		 NOT 		L/S
29       NAND       L/S
2a       NOR        L/S
2b		 XNOR		L/S
2c		 SHL		L/S
2d		 SHR		L/S
2e 		 ADDc 		L/S
2f		 SUBb 		L/S


__________________ Flags __________________

