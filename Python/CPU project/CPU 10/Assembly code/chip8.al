Architecture of new CPU

1 accumulator 	  
16 index registers 8 bits
256 bytes of RAM
Havard architecture
256 bytees of ROM
Instr  Reg    A/D
0000   0000   0000 0000


Opcode
0 		HLT
1		LTA Loads literal value of A/D into ACC
2		LTI Loads literal value of A/D into specified I register

3		LDA Load ACC from memory, using I register as an index	

4		MVT Move ACC to an I reg 
5		MVB Move I reg to acc

6		CMP compares ACC with address (indexed by I reg)

7 		JMP Jump, Loads PC with A/D + Ireg
8		JPE Jump if equal  
9		JPG Jump if Greater
a		JPL Jump if less

b		ADD Adds ACC with value at address + I reg
c		OR  
d		AND
e		NOT


Cycle





