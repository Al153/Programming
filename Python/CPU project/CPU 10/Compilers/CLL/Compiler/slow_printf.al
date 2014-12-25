Scope printf

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
# P = Previous top of stack - when returning from a function, the stack pointer is loaded from the PToS
# a lot of this start-up could be removed

Load length 4 [Stack_pointer]				%printf			 	#gets length of current top stack_frame
Move Stack_pointer previous_stack_ptr						 	#gets a copy of the current stack pointer
SUB Stack_pointer length 										#shift stack pointer on
Compare Stack_pointer $Callstack  								#checks for a stack overflow
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer] 								#stores address to return to
Load gp0 @12			 										#new_length := 12: 0-3 is ret_addr, 4-7 is the length of the block, 8-11 is the previous top of stack
Store gp0 4 [Stack_pointer] 									#gives new length
Store previous_stack_ptr 8 [Stack_pointer]						#gives pointer to pop off of stack

SUB gp7 @4 		 												#Pops into gp0
Load gp0 Expression_stack [gp7]  								
					
																#increments through addresses printing out until a null char is found (0x0)
Load gp1 0 [gp0] %PrintfLoop
Compare gp1 Zero
if Equal then Load PC returnFromPrintf 							#null char found
Out gp1
ADD gp0 One
Load PC PrintfLoop


				
 Load previous_stack_ptr 8 [Stack_pointer] 	%returnFromPrintf		#reads new top of stack from the stack frame
 Load return_addr 0 [Stack_pointer] 						 		#gets address to jump back to
 Move previous_stack_ptr Stack_pointer 								#sets new stack pointer
 Move return_addr PC 