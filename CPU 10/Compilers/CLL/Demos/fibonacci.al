

############################################################################
# 						SET UP ROUTINE
############################################################################
def STACK_SIZE 65536   						#makes stack sizes easy to change

array Callstack	STACK_SIZE []  				#initialise runtime variables
array Expression_stack STACK_SIZE []
int stack_length STACK_SIZE 				
int Callstack_ptr Callstack 				

Load Stack_pointer Callstack_ptr 				
Load gp0 stack_length 						
MUL gp0 @4
SUB gp0 @12 
ADD Stack_pointer gp0							

Goto function:main 										
Halt
	
Out @'E'	%Stack_overflow_error 					#Define error handling 
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

byteArray CLL.array_of_string2 20 [10, 78, 117, 109, 98, 101, 114, 32, 111, 102, 32, 99, 97, 108, 108, 115, 32, 61, 32, 0]
int CLL.string2 CLL.array_of_string2
byteArray CLL.array_of_string0 6 [10, 78, 32, 61, 32, 0]
int CLL.string0 CLL.array_of_string0
int CLL.calls 0
byteArray CLL.array_of_string1 9 [9, 70, 40, 110, 41, 32, 61, 32, 0]
int CLL.string1 CLL.array_of_string1

################## built in function char ##############################################

SUB gp7 @4 		 		 %function:char									#Pops into gp0
Load gp0 Expression_stack [gp7]  				
AND gp0 @255
Store gp0 Expression_stack [gp7] 
ADD gp7 @4
Move Jump PC 
#######################################################################################

#################################### Built in function print_integer ####################################
SUB gp7 @4 		 		 %function:print_i										#Pops into gp0
Load gp0 Expression_stack [gp7]  				
Outd gp0
Move Jump PC  			
####################################################################################################


Halt %function:quit

##################### built in function getc ###############################################
#returns a char
In gp0 %function:getc #gets a char without waiting (state of keyboard)
Store gp0 Expression_stack [gp7]
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Move Jump PC
##########################################################################
#########################################################################################################################
																	Scope fib
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
def Local.x 8
def @Local.x @8
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:fib
SUB Stack_pointer @12 									#OVERHEAD FOR FUNCTION fib
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION fib
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.x [Stack_pointer] 						#STORE GP0
Load gp1 CLL.calls 										#LOAD GP0 GLOBAL
Load gp0 @1
ADD gp0 gp1 														#ADD
Store gp0 CLL.calls 										#STORE GP0 GLOBAL
Load gp1 Local.x [Stack_pointer] 						#LOAD GP0
Load gp0 @0
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp1 Local.x [Stack_pointer] 						#LOAD GP0
Load gp0 @1
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
OR gp0 gp1
if gp0 then Load PC iffib-0true 									#IF ELSE STATEMENT
Load gp0 Local.x [Stack_pointer] 						#LOAD GP0
Load gp1 @1
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:fib 												#CALLING fib
Load gp0 Local.x [Stack_pointer] 						#LOAD GP0
Load gp1 @2
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:fib 												#CALLING fib
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Load PC iffib-0endif
Pass 										%iffib-0true
Load gp0 @1
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Pass 										%iffib-0endif           
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC

########################## built in function putc ########################################
SUB gp7 @4 															%function:putc
Load gp0  Expression_stack [gp7]
Out gp0
Move Jump PC
################################################################################
############################################## Built in function printf ####################################################################

#heavily optimised printf loop, avoids call stack use entirely

SUB gp7 @4 		 		 %function:printf										#Pops into gp0
Load gp0 Expression_stack [gp7]
						
					
																#increments through addresses printing out until a null char is found (0x0)
LoadByte gp1 0 [gp0] %PrintfLoop
Compare gp1 Zero
if Equal then Move Jump PC							#null char found
Out gp1
ADD gp0 One
Load PC PrintfLoop
############################################################################################################################################
#########################################################################################################################
																	Scope main
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
def Local.i 8
def @Local.i @8
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:main
SUB Stack_pointer @12 									#OVERHEAD FOR FUNCTION main
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION main
Load gp0 @0
Store gp0 Local.i [Stack_pointer] 						#STORE GP0
Pass 										%loopmain-0entry 		#FOR LOOP
Load gp1 Local.i [Stack_pointer] 						#LOAD GP0
Load gp0 @30
Load gp2 @4294967295 												#COMPARE (NOT GREATER)
Compare gp1 gp0
if Greater then Move Zero gp2
Move gp2 gp0
NOT gp0
if gp0 then Load PC loopmain-0exit
Load gp0 @0
Store gp0 CLL.calls 										#STORE GP0 GLOBAL
Load gp0 CLL.string0 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 Local.i [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:print_i 												#CALLING print_i
Load gp0 CLL.string1 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 Local.i [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:fib 												#CALLING fib
Goto function:print_i 												#CALLING print_i
Load gp0 CLL.string2 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 CLL.calls 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:print_i 												#CALLING print_i
Pass 										%loopmain-0continue
Load gp1 Local.i [Stack_pointer] 						#LOAD GP0
Load gp0 @10
ADD gp0 gp1 														#ADD
Store gp0 Local.i [Stack_pointer] 						#STORE GP0
Load PC loopmain-0entry
Pass 										%loopmain-0exit
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC

############################## built in function getw ################################
#returns a char
In gp0 %function:getw 				#waits for a user to press a key
Compare gp0 Zero
if Equal then Load PC function:getw
Store gp0 Expression_stack [gp7]

ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Move Jump PC
###################################################################
