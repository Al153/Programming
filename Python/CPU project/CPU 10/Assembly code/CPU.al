


#_______________ CPU parts _______________

Byte_array RAM 256 []
Byte_array Registers 16 []
char Intruction_register 0
int done 0

int rega_addr 0
int regb_addr 0
int rega 0
int regb 0

Byte_array ALU_flags 5 [0,0,0,0,0]



#____________________________ CPU ____________________________
Load gp0 done %CPU.main_loop
	if gp0 then Halt
Load Jump CPU.main_loop
Load PC CPU.operation



LoadByte gp0 Registers [Zero]  %CPU.operation #Loads gp0 with address of IAR
LoadByte gp1 RAM [gp0]	       
ADD gp0 One
LoadByte gp2 RAM [gp0]



Move Jump PC

#____________________________ ALU_commands ____________________________