

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
#gp7 				|				expression_stack_pointer								




array Callstack	STACK_SIZE []  				#initialise stacks
array Expression_stack STACK_SIZE []
int stack_length STACK_SIZE 				#creates a variable of size stack size

int Callstack_ptr Callstack 				#pointer to the Callstack

Load Stack_pointer Callstack_ptr 				#creates a pointer to the start of the call stack
Load gp0 stack_length 						#modifies pointer to point to end of call stack - call stack  advances downwards						
MUL gp0 @4
SUB gp0 @12 								#pointer cannot point to last value in the call stack, since then the first stack frame will spill over into the rest of the data
ADD Stack_pointer gp0

Goto main 										#starts main program
Halt
	
Out @'E'	%Stack_overflow_error 					#deal with an Expression_stack overflow  
Out @'R'
Out @'R'
Out @'O'
Out @'R'
Out @':'
Out @32
Out @'S'
Out @'T'
Out @'A'
Out @'C'
Out @'K'
Out @32
Out @'O'
Out @'V'
Out @'E'
Out @'R'
Out @'F'
Out @'L'
Out @'O'
Out @'W'
Halt

	
Out @'E' %Recursion_limit_reached 				#deal with a recursion error
Out @'R'
Out @'R'
Out @'O'
Out @'R'
Out @32
Out @'M'
Out @'A'
Out @'X'
Out @'I'
Out @'M'
Out @'U'
Out @'M'
Out @32
Out @'R'
Out @'E'
Out @'C'
Out @'U'
Out @'R'
Out @'S'
Out @'I'
Out @'O'
Out @'N'
Out @32
Out @'D'
Out @'E'
Out @'P'
Out @'T'
Out @'H'
Out @32
Out @'R'
Out @'E'
Out @'A'
Out @'C'
Out @'H'
Out @'E'
Out @'D'
Halt


Out @'E' %DIV_BY_ZERO
Out @'R'
Out @'R'
Out @'O'
Out @'R'
Out @':'
Out @32
Out @'D'
Out @'I'
Out @'V'
Out @'I'
Out @'S'
Out @'I'
Out @'O'
Out @'N'
Out @32
Out @'B'
Out @'Y'
Out @32
Out @'Z'
Out @'E'
Out @'R'
Out @'O'
Halt

byteArray CLL.array_of_string0 14 [72, 101, 108, 108, 111, 32, 119, 111, 114, 108, 100, 33, 10, 0]
int CLL.string0 CLL.array_of_string0
################## built in function char ##############################################

SUB gp7 @4 		 		 %char									#Pops into gp0
Load gp0 Expression_stack [gp7]  				
AND gp0 @255
Store gp0 Expression_stack [gp7] 
ADD gp7 @4
Move Jump PC  			#reads new top of stack from the stack frame
#######################################################################################

#creates a stack frame and loads it with correct  values 

Scope main

def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5

########################################
#byte map of stack frame
# 0,1,2,3,4,5,6,7,8,9,A,B,
# R|R|R|R|L|L|L|L|P|P|P|P|D.....D|

# R = Return address - place to return to at end of function
# L = Length of frame - allows allocation of more frames when called


Load length 4 [Stack_pointer]				%main 	#gets length of current top stack_frame
Move Stack_pointer previous_stack_ptr						 	#gets a copy of the current stack pointer
SUB Stack_pointer length 										#shift stack pointer on
Compare Stack_pointer Callstack_ptr  								#checks for a stack overflow
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer] 								#stores address to return to
Load gp0 @12 											#gets the newlength (compiled in)
Store gp0 4 [Stack_pointer] 									#gives new length
Store previous_stack_ptr 8 [Stack_pointer]						#gives pointer to pop off of stack
												#get passed in parameters, repeated as many times as needed 



Load gp0 CLL.string0  						#Recursion stack increments downwards
 														#Push routine
Store gp0 Expression_stack [gp7] 									#stores gp0 to top of stack
ADD gp7 @4 															#increment stack pointer
Compare gp7 stack_length 											#check for stack overflow
if Greater then Load PC Stack_overflow_error



 				#compiled part
Goto printf 		#needs to sub in call address





  								#calculates retun value, leaves on stack
 Load previous_stack_ptr 8 [Stack_pointer] 					#reads new top of stack from the stack frame
 Load ret_addr 0 [Stack_pointer] 						#gets address to jump back to
 Move previous_stack_ptr Stack_pointer 						#sets new stack pointer
 Move ret_addr PC 										#returns


 
#################################### Built in function print_al ####################################
SUB gp7 @4 		 		 %print_i										#Pops into gp0
Load gp0 Expression_stack [gp7]  				
Outd gp0
Move Jump PC  			#reads new top of stack from the stack frame
####################################################################################################

############################################## Built in function printf ####################################################################

#heavily optimised printf loop, avoids call stack use entirely

SUB gp7 @4 		 		 %printf										#Pops into gp0
Load gp0 Expression_stack [gp7]  								
					
																#increments through addresses printing out until a null char is found (0x0)
LoadByte gp1 0 [gp0] %PrintfLoop
Compare gp1 Zero
if Equal then Move Jump PC							#null char found
Out gp1
ADD gp0 One
Load PC PrintfLoop
############################################################################################################################################