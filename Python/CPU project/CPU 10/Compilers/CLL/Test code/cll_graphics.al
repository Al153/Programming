

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

byteArray CLL.array_of_CLL_SCREEN 4000 []
int CLL.CLL_SCREEN CLL.array_of_CLL_SCREEN

Halt %function:quit
																	Scope displayScreen
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:displayScreen
SUB Stack_pointer @16 									#OVERHEAD FOR FUNCTION displayScreen
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
Load gp0 @0
Store gp0 8 [Stack_pointer] 						#STORE GP0
Pass 										%loopdisplayScreen-1entry 		#FOR LOOP
Load gp1 8 [Stack_pointer] 						#LOAD GP0
Load gp0 @50
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
NOT gp0
if gp0 then Load PC loopdisplayScreen-1exit
Load gp0 @0
Store gp0 12 [Stack_pointer] 						#STORE GP0
Pass 										%loopdisplayScreen-0entry 		#FOR LOOP
Load gp1 12 [Stack_pointer] 						#LOAD GP0
Load gp0 @80
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
NOT gp0
if gp0 then Load PC loopdisplayScreen-0exit
Load gp1 8 [Stack_pointer] 						#LOAD GP0
Load gp0 @80
MUL gp0 gp1 														#MULTIPLY
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 12 [Stack_pointer] 						#LOAD GP0
ADD gp0 gp1 														#ADD
Move gp0 gp6 						#PUSH gp0 POP gp6
ADD gp6 CLL.CLL_SCREEN 											#LOAD GP0 GLOBAL RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:putc 												#CALLING putc
Pass 										%loopdisplayScreen-0continue
Load gp1 12 [Stack_pointer] 						#LOAD GP0
Load gp0 @1
ADD gp0 gp1 														#ADD
Store gp0 12 [Stack_pointer] 						#STORE GP0
Load PC loopdisplayScreen-0entry
Pass 										%loopdisplayScreen-0exit
Pass 										%loopdisplayScreen-1continue
Load gp1 8 [Stack_pointer] 						#LOAD GP0
Load gp0 @1
ADD gp0 gp1 														#ADD
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load PC loopdisplayScreen-1entry
Pass 										%loopdisplayScreen-1exit
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC

#################################### Built in function print_al ####################################
SUB gp7 @4 		 		 %function:print_i										#Pops into gp0
Load gp0 Expression_stack [gp7]  				
Outd gp0
Move Jump PC  			#reads new top of stack from the stack frame
####################################################################################################


##################### GETC ###############################################
#returns a char
In gp0 %function:getc #gets a char without waiting (state of keyboard)
Store gp0 Expression_stack [gp7]
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Move Jump PC
##########################################################################

################## built in function char ##############################################

SUB gp7 @4 		 		 %function:char									#Pops into gp0
Load gp0 Expression_stack [gp7]  				
AND gp0 @255
Store gp0 Expression_stack [gp7] 
ADD gp7 @4
Move Jump PC  			#reads new top of stack from the stack frame
#######################################################################################

########################## PUTC (char) ########################################
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
																	Scope main
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:main
SUB Stack_pointer @17 									#OVERHEAD FOR FUNCTION main
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
Load gp0 @0
Store gp0 12 [Stack_pointer] 						#STORE GP0
Load gp0 @0
Store gp0 8 [Stack_pointer] 						#STORE GP0
Pass 										%loopmain-0entry
Load gp0 @1
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0
if gp0 then Load PC loopmain-0exit 								#WHILE LOOP
Load gp0 @0
AND gp0 @255 													  #CASTING INT TO CHAR
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp1 8 [Stack_pointer] 						#LOAD GP0
Load gp0 @80
MUL gp0 gp1 														#MULTIPLY
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 12 [Stack_pointer] 						#LOAD GP0
ADD gp0 gp1 														#ADD
Move gp0 gp6 						#PUSH gp0 POP gp6
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
ADD gp6 CLL.CLL_SCREEN 											#STORE GP0 GLOBAL RELATIVE (CHAR)
StoreByte gp0 0 [gp6]
Goto function:getw 												#CALLING getw
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
StoreByte gp0 16 [Stack_pointer] 					#STORE GP0 (CHAR)
LoadByte gp0 16 [Stack_pointer] 					#LOAD GP0 (CHAR)
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @120
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifmain-0endif
Load PC loopmain-0exit
Pass										%ifmain-0endif
LoadByte gp0 16 [Stack_pointer] 					#LOAD GP0 (CHAR)
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @97
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifmain-8true 									#IF ELSE STATEMENT
LoadByte gp0 16 [Stack_pointer] 					#LOAD GP0 (CHAR)
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @115
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifmain-7true 									#IF ELSE STATEMENT
LoadByte gp0 16 [Stack_pointer] 					#LOAD GP0 (CHAR)
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @100
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifmain-6true 									#IF ELSE STATEMENT
LoadByte gp0 16 [Stack_pointer] 					#LOAD GP0 (CHAR)
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @119
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifmain-5endif
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Load gp1 @1
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load gp1 8 [Stack_pointer] 						#LOAD GP0
Load gp0 @50
Move Zero gp2 														#COMPARE (IS GREATER)
Compare gp1 gp0
if Greater then Load gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifmain-4endif
Load gp0 @49
Store gp0 8 [Stack_pointer] 						#STORE GP0
Pass										%ifmain-4endif
Pass										%ifmain-5endif
Load PC ifmain-6endif
Pass 										%ifmain-6true
Load gp1 12 [Stack_pointer] 						#LOAD GP0
Load gp0 @1
ADD gp0 gp1 														#ADD
Store gp0 12 [Stack_pointer] 						#STORE GP0
Load gp1 12 [Stack_pointer] 						#LOAD GP0
Load gp0 @80
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifmain-3endif
Load gp0 @0
Store gp0 12 [Stack_pointer] 						#STORE GP0
Pass										%ifmain-3endif
Pass 										%ifmain-6endif           
Load PC ifmain-7endif
Pass 										%ifmain-7true
Load gp1 8 [Stack_pointer] 						#LOAD GP0
Load gp0 @1
ADD gp0 gp1 														#ADD
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load gp1 8 [Stack_pointer] 						#LOAD GP0
Load gp0 @50
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifmain-2endif
Load gp0 @0
Store gp0 8 [Stack_pointer] 						#STORE GP0
Pass										%ifmain-2endif
Pass 										%ifmain-7endif           
Load PC ifmain-8endif
Pass 										%ifmain-8true
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Load gp1 @1
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Store gp0 12 [Stack_pointer] 						#STORE GP0
Load gp1 12 [Stack_pointer] 						#LOAD GP0
Load gp0 @80
Move Zero gp2 														#COMPARE (IS GREATER)
Compare gp1 gp0
if Greater then Load gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifmain-1endif
Load gp0 @79
Store gp0 12 [Stack_pointer] 						#STORE GP0
Pass										%ifmain-1endif
Pass 										%ifmain-8endif           
Load gp0 @48
AND gp0 @255 													  #CASTING INT TO CHAR
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp1 8 [Stack_pointer] 						#LOAD GP0
Load gp0 @80
MUL gp0 gp1 														#MULTIPLY
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 12 [Stack_pointer] 						#LOAD GP0
ADD gp0 gp1 														#ADD
Move gp0 gp6 						#PUSH gp0 POP gp6
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
ADD gp6 CLL.CLL_SCREEN 											#STORE GP0 GLOBAL RELATIVE (CHAR)
StoreByte gp0 0 [gp6]
Goto function:displayScreen 												#CALLING displayScreen
Load PC loopmain-0entry					%loopmain-0continue
Pass 										%loopmain-0exit
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC

############################## GETW ################################
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
