16 bit
stack based
64kbit stack


opcode  instrs

00		Halt 				Halts
01		PushLit <x>         Pushes the next value in memory onto the stack
02		Push [x]            Pushes the value addressed by the next word in memory onto the stacks
03		Store [x] 			Pops to the value address by the next word in memory onto the stack
04		Push_ind [x]        . . . ind ==> . . .  value at (x+ind)mod 2**16
05 		Store_ind [x]       . . . value ind ==> . . . value is stored at ind+x mod 2**16
		
06		Call [x]
07		Cond_call [x]
08      return
09      condReturn
		
0a		Greater?
0b		Less?
0c		Equal?
		
0d		ADD
0e		SUB
0f		MUL
10		DIV
11		MOD
12		AND
13		OR
14		XOR
15		NOT
16		NAND
17		NOR
18		XNOR
19		SHR
1a		SHL

1b 		Drop
2c 		Dup
2d 		Swap



array SVM_Stack	65536 [] 											#empty array of size 65535
Word SVM_Stack.pointer 0 
array SVM.memory 65536 []


int SVM.instrs0 $SVM.Halt
int SVM.instrs0 $SVM.PushLit
int SVM.instrs0 $SVM.Push
int SVM.instrs0 $SVM.Store

int SVM.instrs0 $SVM.Push_ind
int SVM.instrs0 $SVM.Store_ind
int SVM.instrs0 $SVM.Call
int SVM.instrs0 $SVM.Cond_call

int SVM.instrs0 $SVM.return
int SVM.instrs0 $SVM.condReturn
int SVM.instrs0 $SVM.Greater
int SVM.instrs0 $SVM.Less

int SVM.instrs0 $SVM.Equal
int SVM.instrs0 $SVM.ADD
int SVM.instrs0 $SVM.SUB
int SVM.instrs0 $SVM.MUL
int SVM.instrs0 $SVM.DIV
int SVM.instrs0 $SVM.MOD
int SVM.instrs0 $SVM.AND
int SVM.instrs0 $SVM.OR
int SVM.instrs0 $SVM.XOR
int SVM.instrs0 $SVM.NOT
int SVM.instrs0 $SVM.NAND
int SVM.instrs0 $SVM.NOR
int SVM.instrs0 $SVM.XNOR
int SVM.instrs0 $SVM.SHR
int SVM.instrs0 $SVM.SHL
int SVM.instrs0 $SVM.Drop
int SVM.instrs0 $SVM.Dup
int SVM.instrs0 $SVM.Swap
int SVM.instrs0 0
int SVM.instrs0 0

def SVM_PC gp1
def SVM_INSTR gp2
def SVM_DAT1 gp3
def SVM_DAT2 gp4

#_____________________________________ Execution cycle _____________________________________
LoadWord SVM_INSTR SVM.memory [SVM_PC] %SVM.main_loop
ADD SVM_PC @2
AND SVM_PC @65535

AND SVM_INSTR @31
SHL SVM_INSTR @2
Load PC SVM.instrs0 [SVM_INSTR]

#_________________________________ stack_operations _____________________
							
Load gp7 SVM_stack.pointer  				%SVM_stack.push
 						
Store gp0 SVM_stack [gp7]
ADD gp7 @4 										    #increment stack pointer
Compare gp7 @65536 									#check for overflow
if Greater then  Load PC SVM.stack_overflow
Store gp7 SVM_stack.pointer

Move Jump PC



Load gp7 SVM_stack.pointer %SVM_stack.pop
SUB gp7 @4 
if Borrow then Load PC SVM.stack_underflow
Store gp7 SVM_stack.pointer
Load gp0  SVM_stack [gp7]

Move Jump PC

#__________________________ instruction code __________________________
Goto Execution_over %SVM.Halt

LoadWord gp0 SVM.memory [SVM_PC] %SVM.PushLit
Goto SVM_stack.push
ADD SVM_PC @2
AND SVM_PC @65535
Load PC sVM.main_loop

LoadWord gp0 SVM.memory [SVM_PC] %SVM.Push
LoadWord gp0 SVM.memory [gp0]
Goto SVM_stack.push
ADD SVM_PC @2
AND SVM_PC @65535
Load PC sVM.main_loop

LoadWord gp5 SVM.memory [SVM_PC] %SVM.Store
Goto SVM_stack.pop
StoreWord gp0 SVM.memory [gp5]
ADD SVM_PC @2
AND SVM_PC @65535
Load PC sVM.main_loop

LoadWord gp0 SVM.memory [SVM_PC] %SVM.Pushind
LoadWord gp5 SVM.memory [gp0] 
Goto SVM_stack.pop
ADD gp0 gp5
AND gp0 @65535
Load gp0 SVM.memory [gp0]
Goto SVM_stack.push
ADD SVM_PC @2
AND SVM_PC @65535
Load PC sVM.main_loop