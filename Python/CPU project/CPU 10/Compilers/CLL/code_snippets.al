

<< setup routines >>

#is run before main program, sets up stacks and global variables

def STACK_SIZE 65536   #makes stack sizes easy to change

#register reservations:

#Hardware register:	|				New Purpose
#Zero 				| 				Same
#One				|				Same
#Accumulator 		|				Same
#Jump 				|				Same - mostly for calling functions
#PC 				|				Same
#Flags_set 			|				Same
#Flags_reset 		| 				Same
#Stack_pointer 		| 				Same
#gp0 				|				Primary operations register
#gp1 				|				Secondary operations register
#gp2 				|		
#gp3				|
#gp4				|				Call-auxilary - holds important call information eg stack frame size
#gp5 				|				stack_pointer manipulation
#gp6				|				indexing register  for relative addressing whilst using stack frames
#gp7 				|				line_stack_ptr								




array Callstack	STACK_SIZE []  				#initialise stacks
array Expression_stack STACK_SIZE []

Load Stack_pointer $Callstack 				#creates a pointer to the start of the call stack
Load gp0 STACK_SIZE 						#modifies pointer to point to end of call stack - call stack  advances downwards
MUL gp0 @4
ADD Stack_pointer gp0



Load PC <main_program_name>

<< ADD >>
Pop gp0
Pop gp1
ADD gp0 gp1
Push gp0

<< SUB >>
Pop gp0
Pop gp0
Pop gp1
SUB gp0 gp1
Push gp0

<< MUL>>
Pop gp0
Pop gp0
Pop gp1
MUL gp0 gp1
Push gp0

<< DIV >>
Pop gp0
Pop gp1
DIV gp0 gp1
if DivByZero then Load PC DIV_BY_ZERO
Push gp0

<< MOD >>
Pop gp0
Pop gp1
MOD gp0 gp1
if DivByZero then Load PC DIV_BY_ZERO
Push gp0

<< AND >>
Pop gp0
Pop gp1
AND gp0 gp1
Push gp0

<< OR >
Pop gp0
Pop gp1
OR gp0 gp1
Push gp0

<< XOR >>
Pop gp0
Pop gp1
XOR gp0 gp1
Push gp0

<< NOT >>
Pop gp0
Pop gp1
NOT gp0 gp1
Push gp0



<< function call routine >>
<Push args> 				#compiled part
Goto <Call_address> 		#needs to sub in call address



<< function startup routine >>
#creates a stack frame and loads it with correct values 

Scope <function_name>

def length gp4
def line_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5


Load Flags_reset @4294967287 	%<function_name>			 #resets the borrow flag
Load length 4 [Stack_pointer]								 #gets length of current top stack_frame
Move Stack_pointer previous_stack_ptr						 #gets a copy of the current stack pointer
SUB Stack_pointer length 									 #shift stack pointer on
Compare Stack_pointer $Callstack  							 #checks for a stack overflow
Store ret_addr 0 [Stack_pointer] 							 #stores address to return to
Load gp0 @<new_length> 										 #gets the newlength (compiled in)
Store gp0 4 [Stack_pointer] 								 #gives new length
Store previous_stack_ptr 8 [Stack_pointer]					 #gives pointer to pop off of stack


(Goto Pop_gp0												 #get passed in parameters, repeated as many times as needed 
Store gp0 <index> [Stack_pointer])

