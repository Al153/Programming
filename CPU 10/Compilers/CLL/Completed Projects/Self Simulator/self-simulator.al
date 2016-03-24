

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

byteArray CLL.array_of_string10 2 [10, 0]
int CLL.string10 CLL.array_of_string10
byteArray CLL.array_of_string11 24 [65, 68, 68, 82, 69, 83, 83, 32, 79, 86, 69, 82, 70, 76, 79, 87, 41, 32, 116, 104, 101, 110, 32, 0]
int CLL.string11 CLL.array_of_string11
byteArray CLL.array_of_string12 2 [10, 0]
int CLL.string12 CLL.array_of_string12
byteArray CLL.array_of_string13 24 [65, 68, 68, 82, 69, 83, 83, 32, 79, 86, 69, 82, 70, 76, 79, 87, 41, 32, 116, 104, 101, 110, 32, 0]
int CLL.string13 CLL.array_of_string13
byteArray CLL.array_of_string14 2 [10, 0]
int CLL.string14 CLL.array_of_string14
byteArray CLL.array_of_string15 24 [65, 68, 68, 82, 69, 83, 83, 32, 79, 86, 69, 82, 70, 76, 79, 87, 41, 32, 116, 104, 101, 110, 32, 0]
int CLL.string15 CLL.array_of_string15
byteArray CLL.array_of_string16 2 [10, 0]
int CLL.string16 CLL.array_of_string16
byteArray CLL.array_of_string17 2 [32, 0]
int CLL.string17 CLL.array_of_string17
byteArray CLL.array_of_string18 2 [9, 0]
int CLL.string18 CLL.array_of_string18
byteArray CLL.array_of_string19 2 [10, 0]
int CLL.string19 CLL.array_of_string19
char CLL.BYTE_FILTER 0
byteArray CLL.array_of_string8 2 [10, 0]
int CLL.string8 CLL.array_of_string8
byteArray CLL.array_of_string9 24 [65, 68, 68, 82, 69, 83, 83, 32, 79, 86, 69, 82, 70, 76, 79, 87, 41, 32, 116, 104, 101, 110, 32, 0]
int CLL.string9 CLL.array_of_string9
byteArray CLL.array_of_string6 2 [10, 0]
int CLL.string6 CLL.array_of_string6
byteArray CLL.array_of_string7 24 [65, 68, 68, 82, 69, 83, 83, 32, 79, 86, 69, 82, 70, 76, 79, 87, 41, 32, 116, 104, 101, 110, 32, 0]
int CLL.string7 CLL.array_of_string7
byteArray CLL.array_of_string4 15 [32, 73, 78, 83, 84, 82, 85, 67, 84, 73, 79, 78, 83, 10, 0]
int CLL.string4 CLL.array_of_string4
byteArray CLL.array_of_string5 24 [65, 68, 68, 82, 69, 83, 83, 32, 79, 86, 69, 82, 70, 76, 79, 87, 41, 32, 116, 104, 101, 110, 32, 0]
int CLL.string5 CLL.array_of_string5
byteArray CLL.array_of_string2 50 [10, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 32, 69, 78, 68, 69, 68, 32, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 10, 0]
int CLL.string2 CLL.array_of_string2
byteArray CLL.array_of_string3 10 [69, 88, 69, 67, 85, 84, 69, 68, 32, 0]
int CLL.string3 CLL.array_of_string3
byteArray CLL.array_of_string0 4 [10, 10, 10, 0]
int CLL.string0 CLL.array_of_string0
byteArray CLL.array_of_string1 51 [10, 10, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 32, 69, 88, 69, 67, 85, 84, 73, 78, 71, 32, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 10, 0]
int CLL.string1 CLL.array_of_string1
byteArray CLL.array_of_string21 2 [9, 0]
int CLL.string21 CLL.array_of_string21
byteArray CLL.array_of_string20 2 [32, 0]
int CLL.string20 CLL.array_of_string20
byteArray CLL.array_of_string22 2 [10, 0]
int CLL.string22 CLL.array_of_string22
array CLL.array_of_REGISTERS 16 []
int CLL.REGISTERS CLL.array_of_REGISTERS
byteArray CLL.array_of_MEMORY 1048576 []
int CLL.MEMORY CLL.array_of_MEMORY
																	Scope fetchInstruction
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:fetchInstruction
SUB Stack_pointer @12 									#OVERHEAD FOR FUNCTION fetchInstruction
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load gp6 @4
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 CLL.REGISTERS 											#LOAD GP0 GLOBAL RELATIVE
Load gp0 0 [gp6]									
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:read_memory 												#CALLING read_memory
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp6 @4
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 CLL.REGISTERS 											#LOAD GP0 GLOBAL RELATIVE
Load gp1 0 [gp6]									
Load gp0 @4
ADD gp0 gp1 														#ADD
Load gp6 @4
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 CLL.REGISTERS 											#STORE GP0 GLOBAL RELATIVE
Store gp0 0 [gp6]
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
																	Scope do_ALU_op
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:do_ALU_op
SUB Stack_pointer @33 									#OVERHEAD FOR FUNCTION do_ALU_op
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
StoreByte gp0 20 [Stack_pointer] 					#STORE GP0 (CHAR)
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 21 [Stack_pointer] 						#STORE GP0
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 25 [Stack_pointer] 						#STORE GP0
Move Stack_pointer gp0 											#GETTING POINTER
ADD gp0 @8
Store gp0 29 [Stack_pointer] 						#STORE GP0
LoadByte gp0 20 [Stack_pointer] 					#LOAD GP0 (CHAR)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @15
AND gp0 @255 													  #CASTING INT TO CHAR
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
AND gp0 gp1 														#AND (CHARS)
AND gp0 @255
StoreByte gp0 20 [Stack_pointer] 					#STORE GP0 (CHAR)
LoadByte gp0 20 [Stack_pointer] 					#LOAD GP0 (CHAR)
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @14
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifdo_ALU_op-3true 									#IF ELSE STATEMENT
LoadByte gp0 20 [Stack_pointer] 					#LOAD GP0 (CHAR)
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @15
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifdo_ALU_op-2endif
Load gp6 @5
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 CLL.REGISTERS 											#LOAD GP0 GLOBAL RELATIVE
Load gp1 0 [gp6]									
Load gp0 @8
AND gp0 gp1 														#AND
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														
if gp0 then Load PC ifdo_ALU_op-1true 									#IF ELSE STATEMENT
Load gp6 @5
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 CLL.REGISTERS 											#LOAD GP0 GLOBAL RELATIVE
Load gp1 0 [gp6]									
Load gp0 @4294967287
AND gp0 gp1 														#AND
Load gp6 @5
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 CLL.REGISTERS 											#STORE GP0 GLOBAL RELATIVE
Store gp0 0 [gp6]
Load PC ifdo_ALU_op-1endif
Pass 										%ifdo_ALU_op-1true
Load gp0 @1
AND gp0 @255 													  #CASTING INT TO CHAR
StoreByte gp0 20 [Stack_pointer] 					#STORE GP0 (CHAR)
Pass 										%ifdo_ALU_op-1endif           
Pass										%ifdo_ALU_op-2endif
Load PC ifdo_ALU_op-3endif
Pass 										%ifdo_ALU_op-3true
Load gp6 @5
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 CLL.REGISTERS 											#LOAD GP0 GLOBAL RELATIVE
Load gp1 0 [gp6]									
Load gp0 @16
AND gp0 gp1 														#AND
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														
if gp0 then Load PC ifdo_ALU_op-0true 									#IF ELSE STATEMENT
Load gp6 @5
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 CLL.REGISTERS 											#LOAD GP0 GLOBAL RELATIVE
Load gp1 0 [gp6]									
Load gp0 @4294967279
AND gp0 gp1 														#AND
Load gp6 @5
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 CLL.REGISTERS 											#STORE GP0 GLOBAL RELATIVE
Store gp0 0 [gp6]
Load PC ifdo_ALU_op-0endif
Pass 										%ifdo_ALU_op-0true
Load gp0 @0
AND gp0 @255 													  #CASTING INT TO CHAR
StoreByte gp0 20 [Stack_pointer] 					#STORE GP0 (CHAR)
Pass 										%ifdo_ALU_op-0endif           
Pass 										%ifdo_ALU_op-3endif           
Load gp0 29 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 25 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 21 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
LoadByte gp0 20 [Stack_pointer] 					#LOAD GP0 (CHAR)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:ALU_op 												#CALLING ALU_op
LoadByte gp0 20 [Stack_pointer] 					#LOAD GP0 (CHAR)
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @2
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifdo_ALU_op-4endif
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 29 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 CLL.REGISTERS 											#STORE GP0 GLOBAL RELATIVE
Store gp0 0 [gp6]
Pass										%ifdo_ALU_op-4endif
Load gp6 @5
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 CLL.REGISTERS 											#LOAD GP0 GLOBAL RELATIVE
Load gp0 0 [gp6]									
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 29 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
OR gp0 gp1 															#OR
Load gp6 @5
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 CLL.REGISTERS 											#STORE GP0 GLOBAL RELATIVE
Store gp0 0 [gp6]
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 29 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC

################## built in function char ##############################################

SUB gp7 @4 		 		 %function:char									#Pops into gp0
Load gp0 Expression_stack [gp7]  				
AND gp0 @255
Store gp0 Expression_stack [gp7] 
ADD gp7 @4
Move Jump PC 
#######################################################################################
																	Scope fetchAddress
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:fetchAddress
SUB Stack_pointer @12 									#OVERHEAD FOR FUNCTION fetchAddress
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
Load gp6 @4
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 CLL.REGISTERS 											#LOAD GP0 GLOBAL RELATIVE
Load gp0 0 [gp6]									
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:read_memory 												#CALLING read_memory
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load gp6 @4
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 CLL.REGISTERS 											#LOAD GP0 GLOBAL RELATIVE
Load gp1 0 [gp6]									
Load gp0 @4
ADD gp0 gp1 														#ADD
Load gp6 @4
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 CLL.REGISTERS 											#STORE GP0 GLOBAL RELATIVE
Store gp0 0 [gp6]
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC

#################################### Built in function print_integer ####################################
SUB gp7 @4 		 		 %function:print_i										#Pops into gp0
Load gp0 Expression_stack [gp7]  				
Outd gp0
Move Jump PC  			
####################################################################################################


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
																	Scope readHex
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:readHex
SUB Stack_pointer @10 									#OVERHEAD FOR FUNCTION readHex
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
Load gp0 @0
AND gp0 @255 													  #CASTING INT TO CHAR
StoreByte gp0 9 [Stack_pointer] 					#STORE GP0 (CHAR)
Goto function:getw 												#CALLING getw
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
StoreByte gp0 8 [Stack_pointer] 					#STORE GP0 (CHAR)
LoadByte gp0 8 [Stack_pointer] 					#LOAD GP0 (CHAR)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:putc 												#CALLING putc
Pass 										%loopreadHex-0entry
LoadByte gp0 8 [Stack_pointer] 					#LOAD GP0 (CHAR)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @97
AND gp0 @255 													  #CASTING INT TO CHAR
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
LoadByte gp0 8 [Stack_pointer] 					#LOAD GP0 (CHAR)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @102
AND gp0 @255 													  #CASTING INT TO CHAR
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
Move Zero gp2 														#COMPARE (IS GREATER)
Compare gp1 gp0
if Greater then Load gp2 @4294967295
Move gp2 gp0
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
OR gp0 gp1
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
LoadByte gp0 8 [Stack_pointer] 					#LOAD GP0 (CHAR)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @48
AND gp0 @255 													  #CASTING INT TO CHAR
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
LoadByte gp0 8 [Stack_pointer] 					#LOAD GP0 (CHAR)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @57
AND gp0 @255 													  #CASTING INT TO CHAR
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
Move Zero gp2 														#COMPARE (IS GREATER)
Compare gp1 gp0
if Greater then Load gp2 @4294967295
Move gp2 gp0
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
OR gp0 gp1
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
AND gp0 gp1
NOT gp0
if gp0 then Load PC loopreadHex-0exit 								#WHILE LOOP
Goto function:getw 												#CALLING getw
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
StoreByte gp0 8 [Stack_pointer] 					#STORE GP0 (CHAR)
LoadByte gp0 8 [Stack_pointer] 					#LOAD GP0 (CHAR)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:putc 												#CALLING putc
Load PC loopreadHex-0entry					%loopreadHex-0continue
Pass 										%loopreadHex-0exit
LoadByte gp0 8 [Stack_pointer] 					#LOAD GP0 (CHAR)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @97
AND gp0 @255 													  #CASTING INT TO CHAR
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
Load gp2 @4294967295  												#COMPARE (NOT LESS)
Compare gp1 gp0
if Less then Move Zero gp2
Move gp2 gp0
if gp0 then Load PC ifreadHex-0true 									#IF ELSE STATEMENT
LoadByte gp0 8 [Stack_pointer] 					#LOAD GP0 (CHAR)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @48
AND gp0 @255 													  #CASTING INT TO CHAR
Move gp0 gp1 						#PUSH gp0 POP gp1
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
AND gp0 @255 														#SUBTRACT (CHARS)
AND gp1 @255
SUB gp0 gp1
AND gp0 @255
Load Flags_reset @4294967287  
StoreByte gp0 8 [Stack_pointer] 					#STORE GP0 (CHAR)
Load PC ifreadHex-0endif
Pass 										%ifreadHex-0true
LoadByte gp0 8 [Stack_pointer] 					#LOAD GP0 (CHAR)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @97
AND gp0 @255 													  #CASTING INT TO CHAR
Move gp0 gp1 						#PUSH gp0 POP gp1
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
AND gp0 @255 														#SUBTRACT (CHARS)
AND gp1 @255
SUB gp0 gp1
AND gp0 @255
Load Flags_reset @4294967287  
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @10
AND gp0 @255 													  #CASTING INT TO CHAR
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD (CHARS)
AND gp0 @255
StoreByte gp0 8 [Stack_pointer] 					#STORE GP0 (CHAR)
Pass 										%ifreadHex-0endif           
LoadByte gp0 8 [Stack_pointer] 					#LOAD GP0 (CHAR)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @4
AND gp0 @255 													  #CASTING INT TO CHAR
Move gp0 gp1 						#PUSH gp0 POP gp1
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
SHL gp0 gp1 														#SHIFT LEFT (CHARS)
AND gp0 @255
StoreByte gp0 9 [Stack_pointer] 					#STORE GP0 (CHAR)
Goto function:getw 												#CALLING getw
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
StoreByte gp0 8 [Stack_pointer] 					#STORE GP0 (CHAR)
LoadByte gp0 8 [Stack_pointer] 					#LOAD GP0 (CHAR)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:putc 												#CALLING putc
Pass 										%loopreadHex-1entry
LoadByte gp0 8 [Stack_pointer] 					#LOAD GP0 (CHAR)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @97
AND gp0 @255 													  #CASTING INT TO CHAR
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
LoadByte gp0 8 [Stack_pointer] 					#LOAD GP0 (CHAR)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @102
AND gp0 @255 													  #CASTING INT TO CHAR
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
Move Zero gp2 														#COMPARE (IS GREATER)
Compare gp1 gp0
if Greater then Load gp2 @4294967295
Move gp2 gp0
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
OR gp0 gp1
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
LoadByte gp0 8 [Stack_pointer] 					#LOAD GP0 (CHAR)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @48
AND gp0 @255 													  #CASTING INT TO CHAR
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
LoadByte gp0 8 [Stack_pointer] 					#LOAD GP0 (CHAR)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @57
AND gp0 @255 													  #CASTING INT TO CHAR
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
Move Zero gp2 														#COMPARE (IS GREATER)
Compare gp1 gp0
if Greater then Load gp2 @4294967295
Move gp2 gp0
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
OR gp0 gp1
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
AND gp0 gp1
NOT gp0
if gp0 then Load PC loopreadHex-1exit 								#WHILE LOOP
Goto function:getw 												#CALLING getw
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
StoreByte gp0 8 [Stack_pointer] 					#STORE GP0 (CHAR)
LoadByte gp0 8 [Stack_pointer] 					#LOAD GP0 (CHAR)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:putc 												#CALLING putc
Load PC loopreadHex-1entry					%loopreadHex-1continue
Pass 										%loopreadHex-1exit
LoadByte gp0 8 [Stack_pointer] 					#LOAD GP0 (CHAR)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @97
AND gp0 @255 													  #CASTING INT TO CHAR
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
Load gp2 @4294967295  												#COMPARE (NOT LESS)
Compare gp1 gp0
if Less then Move Zero gp2
Move gp2 gp0
if gp0 then Load PC ifreadHex-1true 									#IF ELSE STATEMENT
LoadByte gp0 8 [Stack_pointer] 					#LOAD GP0 (CHAR)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @48
AND gp0 @255 													  #CASTING INT TO CHAR
Move gp0 gp1 						#PUSH gp0 POP gp1
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
AND gp0 @255 														#SUBTRACT (CHARS)
AND gp1 @255
SUB gp0 gp1
AND gp0 @255
Load Flags_reset @4294967287  
StoreByte gp0 8 [Stack_pointer] 					#STORE GP0 (CHAR)
Load PC ifreadHex-1endif
Pass 										%ifreadHex-1true
LoadByte gp0 8 [Stack_pointer] 					#LOAD GP0 (CHAR)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @97
AND gp0 @255 													  #CASTING INT TO CHAR
Move gp0 gp1 						#PUSH gp0 POP gp1
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
AND gp0 @255 														#SUBTRACT (CHARS)
AND gp1 @255
SUB gp0 gp1
AND gp0 @255
Load Flags_reset @4294967287  
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @10
AND gp0 @255 													  #CASTING INT TO CHAR
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD (CHARS)
AND gp0 @255
StoreByte gp0 8 [Stack_pointer] 					#STORE GP0 (CHAR)
Pass 										%ifreadHex-1endif           
LoadByte gp0 9 [Stack_pointer] 					#LOAD GP0 (CHAR)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
LoadByte gp0 8 [Stack_pointer] 					#LOAD GP0 (CHAR)
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD (CHARS)
AND gp0 @255
StoreByte gp0 9 [Stack_pointer] 					#STORE GP0 (CHAR)
LoadByte gp0 9 [Stack_pointer] 					#LOAD GP0 (CHAR)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC

Halt %function:quit
																	Scope store_byte_memory
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:store_byte_memory
SUB Stack_pointer @16 									#OVERHEAD FOR FUNCTION store_byte_memory
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 8 [Stack_pointer] 						#STORE GP0
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 12 [Stack_pointer] 						#STORE GP0
Load gp1 12 [Stack_pointer] 						#LOAD GP0
Load gp0 @1048575
Move Zero gp2 														#COMPARE (IS GREATER)
Compare gp1 gp0
if Greater then Load gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifstore_byte_memory-0endif
Load gp0 CLL.string9 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:print_i 												#CALLING print_i
Load gp0 CLL.string10 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Pass										%ifstore_byte_memory-0endif
Load gp1 8 [Stack_pointer] 						#LOAD GP0
Load gp0 @255
AND gp0 gp1 														#AND
AND gp0 @255 													  #CASTING INT TO CHAR
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp1 12 [Stack_pointer] 						#LOAD GP0
Load gp0 @1048575
AND gp0 gp1 														#AND
Move gp0 gp6 						#PUSH gp0 POP gp6
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
ADD gp6 CLL.MEMORY 											#STORE GP0 GLOBAL RELATIVE (CHAR)
StoreByte gp0 0 [gp6]
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC

##################### GETC ###############################################
#returns a char
In gp0 %function:getc #gets a char without waiting (state of keyboard)
Store gp0 Expression_stack [gp7]
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Move Jump PC
##########################################################################
																	Scope read_byte_memory
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:read_byte_memory
SUB Stack_pointer @16 									#OVERHEAD FOR FUNCTION read_byte_memory
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 12 [Stack_pointer] 						#STORE GP0
Load gp1 12 [Stack_pointer] 						#LOAD GP0
Load gp0 @1048575
Move Zero gp2 														#COMPARE (IS GREATER)
Compare gp1 gp0
if Greater then Load gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifread_byte_memory-0endif
Load gp0 CLL.string15 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:print_i 												#CALLING print_i
Load gp0 CLL.string16 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Pass										%ifread_byte_memory-0endif
Load gp0 @0
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load gp1 12 [Stack_pointer] 						#LOAD GP0
Load gp0 @1048575
AND gp0 gp1 														#AND
Move gp0 gp6 						#PUSH gp0 POP gp6
ADD gp6 CLL.MEMORY 											#LOAD GP0 GLOBAL RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC

########################## PUTC (char) ########################################
SUB gp7 @4 															%function:putc
Load gp0  Expression_stack [gp7]
Out gp0
Move Jump PC
################################################################################																	Scope main
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:main
SUB Stack_pointer @12 									#OVERHEAD FOR FUNCTION main
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
Load gp0 @255
AND gp0 @255 													  #CASTING INT TO CHAR
StoreByte gp0 CLL.BYTE_FILTER 									#STORE GP0 GLOBAL (CHAR)
Goto function:prepareMemory 												#CALLING prepareMemory
Load gp0 CLL.string0 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Goto function:dumpMEMORY 												#CALLING dumpMEMORY
Load gp0 @0
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load gp0 CLL.string1 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Pass 										%loopmain-0entry
Goto function:step 												#CALLING step
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														
NOT gp0
if gp0 then Load PC loopmain-0exit 								#WHILE LOOP
Load gp1 8 [Stack_pointer] 						#LOAD GP0
Load gp0 @1
ADD gp0 gp1 														#ADD
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load PC loopmain-0entry					%loopmain-0continue
Pass 										%loopmain-0exit
Load gp0 CLL.string2 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 CLL.string3 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:print_i 												#CALLING print_i
Load gp0 CLL.string4 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
																	Scope store_word_memory
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:store_word_memory
SUB Stack_pointer @26 									#OVERHEAD FOR FUNCTION store_word_memory
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 14 [Stack_pointer] 						#STORE GP0
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 18 [Stack_pointer] 						#STORE GP0
Load gp0 18 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @1048575
Load gp1 @1
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
Move Zero gp2 														#COMPARE (IS GREATER)
Compare gp1 gp0
if Greater then Load gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifstore_word_memory-0endif
Load gp0 CLL.string7 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 18 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:print_i 												#CALLING print_i
Load gp0 CLL.string8 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Pass										%ifstore_word_memory-0endif
Move Stack_pointer gp0 											#GETTING POINTER
ADD gp0 @12
Store gp0 22 [Stack_pointer] 						#STORE GP0
Load gp1 14 [Stack_pointer] 						#LOAD GP0
Load gp0 @255
AND gp0 gp1 														#AND
AND gp0 @255 													  #CASTING INT TO CHAR
Load gp6 @1
ADD gp6 22 [Stack_pointer] 							#STORE GP0 RELATIVE (CHAR)
StoreByte gp0 0 [gp6]
Load gp0 14 [Stack_pointer] 						#LOAD GP0
Load gp1 @8
SHR gp0 gp1 														#SHIFT RIGHT
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @255
AND gp0 gp1 														#AND
AND gp0 @255 													  #CASTING INT TO CHAR
Load gp6 @0
ADD gp6 22 [Stack_pointer] 							#STORE GP0 RELATIVE (CHAR)
StoreByte gp0 0 [gp6]
Load gp0 @0
Store gp0 8 [Stack_pointer] 						#STORE GP0
Pass 										%loopstore_word_memory-0entry 		#FOR LOOP
Load gp1 8 [Stack_pointer] 						#LOAD GP0
Load gp0 @2
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
NOT gp0
if gp0 then Load PC loopstore_word_memory-0exit
Load gp6 8 [Stack_pointer] 						#LOAD GP0
ADD gp6 22 [Stack_pointer]							#LOAD GP0 RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp1 18 [Stack_pointer] 						#LOAD GP0
Load gp0 8 [Stack_pointer] 						#LOAD GP0
ADD gp0 gp1 														#ADD
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @1048575
AND gp0 gp1 														#AND
Move gp0 gp6 						#PUSH gp0 POP gp6
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
ADD gp6 CLL.MEMORY 											#STORE GP0 GLOBAL RELATIVE (CHAR)
StoreByte gp0 0 [gp6]
Pass 										%loopstore_word_memory-0continue
Load gp1 8 [Stack_pointer] 						#LOAD GP0
Load gp0 @1
ADD gp0 gp1 														#ADD
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load PC loopstore_word_memory-0entry
Pass 										%loopstore_word_memory-0exit
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
																	Scope dumpMEMORY
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:dumpMEMORY
SUB Stack_pointer @20 									#OVERHEAD FOR FUNCTION dumpMEMORY
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
Load gp1 CLL.MEMORY 										#LOAD GP0 GLOBAL
Load gp0 @4
ADD gp0 gp1 														#ADD
Store gp0 12 [Stack_pointer] 						#STORE GP0
Load gp0 @0
Store gp0 8 [Stack_pointer] 						#STORE GP0
Pass 										%loopdumpMEMORY-1entry 		#FOR LOOP
Load gp1 8 [Stack_pointer] 						#LOAD GP0
Load gp0 @100
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
NOT gp0
if gp0 then Load PC loopdumpMEMORY-1exit
Load gp0 @0
Store gp0 16 [Stack_pointer] 						#STORE GP0
Pass 										%loopdumpMEMORY-0entry 		#FOR LOOP
Load gp1 16 [Stack_pointer] 						#LOAD GP0
Load gp0 @4
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
NOT gp0
if gp0 then Load PC loopdumpMEMORY-0exit
Load gp1 8 [Stack_pointer] 						#LOAD GP0
Load gp0 @8
MUL gp0 gp1 														#MULTIPLY
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 16 [Stack_pointer] 						#LOAD GP0
ADD gp0 gp1 														#ADD
Move gp0 gp6 						#PUSH gp0 POP gp6
ADD gp6 CLL.MEMORY 											#LOAD GP0 GLOBAL RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:print_i 												#CALLING print_i
Load gp0 CLL.string17 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Pass 										%loopdumpMEMORY-0continue
Load gp1 16 [Stack_pointer] 						#LOAD GP0
Load gp0 @1
ADD gp0 gp1 														#ADD
Store gp0 16 [Stack_pointer] 						#STORE GP0
Load PC loopdumpMEMORY-0entry
Pass 										%loopdumpMEMORY-0exit
Load gp0 CLL.string18 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 12 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:print_i 												#CALLING print_i
Load gp0 CLL.string19 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp1 12 [Stack_pointer] 						#LOAD GP0
Load gp0 @8
ADD gp0 gp1 														#ADD
Store gp0 12 [Stack_pointer] 						#STORE GP0
Pass 										%loopdumpMEMORY-1continue
Load gp1 8 [Stack_pointer] 						#LOAD GP0
Load gp0 @1
ADD gp0 gp1 														#ADD
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load PC loopdumpMEMORY-1entry
Pass 										%loopdumpMEMORY-1exit
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
																	Scope get_conditional
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:get_conditional
SUB Stack_pointer @9 									#OVERHEAD FOR FUNCTION get_conditional
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
StoreByte gp0 8 [Stack_pointer] 					#STORE GP0 (CHAR)
LoadByte gp0 8 [Stack_pointer] 					#LOAD GP0 (CHAR)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @128
AND gp0 @255 													  #CASTING INT TO CHAR
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
AND gp0 gp1 														#AND (CHARS)
AND gp0 @255
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
if gp0 then Load PC ifget_conditional-5true 									#IF ELSE STATEMENT
Load gp0 @1
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Load PC ifget_conditional-5endif
Pass 										%ifget_conditional-5true
LoadByte gp0 8 [Stack_pointer] 					#LOAD GP0 (CHAR)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @64
AND gp0 @255 													  #CASTING INT TO CHAR
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
AND gp0 gp1 														#AND (CHARS)
AND gp0 @255
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														
if gp0 then Load PC ifget_conditional-4true 									#IF ELSE STATEMENT
LoadByte gp0 8 [Stack_pointer] 					#LOAD GP0 (CHAR)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @15
AND gp0 @255 													  #CASTING INT TO CHAR
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
AND gp0 gp1 														#AND (CHARS)
AND gp0 @255
Move gp0 gp6 						#PUSH gp0 POP gp6
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 CLL.REGISTERS 											#LOAD GP0 GLOBAL RELATIVE
Load gp0 0 [gp6]									
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
if gp0 then Load PC ifget_conditional-3true 									#IF ELSE STATEMENT
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Load PC ifget_conditional-3endif
Pass 										%ifget_conditional-3true
Load gp0 @1
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Pass 										%ifget_conditional-3endif           
Load PC ifget_conditional-4endif
Pass 										%ifget_conditional-4true
Load gp6 @5
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 CLL.REGISTERS 											#LOAD GP0 GLOBAL RELATIVE
Load gp0 0 [gp6]									
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @1
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @31
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
LoadByte gp0 8 [Stack_pointer] 					#LOAD GP0 (CHAR)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @31
AND gp0 @255 													  #CASTING INT TO CHAR
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
AND gp0 gp1 														#AND (CHARS)
AND gp0 @255
Move gp0 gp1 						#PUSH gp0 POP gp1
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Move gp0 gp1 						#PUSH gp0 POP gp1
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
SHL gp0 gp1 														#SHIFT LEFT
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
AND gp0 gp1 														#AND
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														
if gp0 then Load PC ifget_conditional-2true 									#IF ELSE STATEMENT
LoadByte gp0 8 [Stack_pointer] 					#LOAD GP0 (CHAR)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @31
AND gp0 @255 													  #CASTING INT TO CHAR
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
AND gp0 gp1 														#AND (CHARS)
AND gp0 @255
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @24
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
LoadByte gp0 8 [Stack_pointer] 					#LOAD GP0 (CHAR)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @31
AND gp0 @255 													  #CASTING INT TO CHAR
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
AND gp0 gp1 														#AND (CHARS)
AND gp0 @255
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @25
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
OR gp0 gp1
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
LoadByte gp0 8 [Stack_pointer] 					#LOAD GP0 (CHAR)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @31
AND gp0 @255 													  #CASTING INT TO CHAR
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
AND gp0 gp1 														#AND (CHARS)
AND gp0 @255
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @26
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
OR gp0 gp1
if gp0 then Load PC ifget_conditional-1true 									#IF ELSE STATEMENT
Load gp6 @5
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 CLL.REGISTERS 											#LOAD GP0 GLOBAL RELATIVE
Load gp0 0 [gp6]									
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @1
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @31
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
LoadByte gp0 8 [Stack_pointer] 					#LOAD GP0 (CHAR)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @31
AND gp0 @255 													  #CASTING INT TO CHAR
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
AND gp0 gp1 														#AND (CHARS)
AND gp0 @255
Move gp0 gp1 						#PUSH gp0 POP gp1
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Move gp0 gp1 						#PUSH gp0 POP gp1
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
SHL gp0 gp1 														#SHIFT LEFT
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
AND gp0 gp1 														#AND
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @4294967295
XOR gp0 gp1 														#XOR
Load gp6 @5
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 CLL.REGISTERS 											#STORE GP0 GLOBAL RELATIVE
Store gp0 0 [gp6]
Load PC ifget_conditional-1endif
Pass 										%ifget_conditional-1true
Load gp6 @5
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 CLL.REGISTERS 											#LOAD GP0 GLOBAL RELATIVE
Load gp1 0 [gp6]									
Load gp0 @4294967071
AND gp0 gp1 														#AND
Load gp6 @5
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 CLL.REGISTERS 											#STORE GP0 GLOBAL RELATIVE
Store gp0 0 [gp6]
Pass 										%ifget_conditional-1endif           
Load gp0 @1
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Load PC ifget_conditional-2endif
Pass 										%ifget_conditional-2true
LoadByte gp0 8 [Stack_pointer] 					#LOAD GP0 (CHAR)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @31
AND gp0 @255 													  #CASTING INT TO CHAR
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
AND gp0 gp1 														#AND (CHARS)
AND gp0 @255
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @24
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
LoadByte gp0 8 [Stack_pointer] 					#LOAD GP0 (CHAR)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @31
AND gp0 @255 													  #CASTING INT TO CHAR
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
AND gp0 gp1 														#AND (CHARS)
AND gp0 @255
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @25
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
OR gp0 gp1
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
LoadByte gp0 8 [Stack_pointer] 					#LOAD GP0 (CHAR)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @31
AND gp0 @255 													  #CASTING INT TO CHAR
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
AND gp0 gp1 														#AND (CHARS)
AND gp0 @255
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @26
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
OR gp0 gp1
if gp0 then Load PC ifget_conditional-0true 									#IF ELSE STATEMENT
Load gp6 @5
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 CLL.REGISTERS 											#LOAD GP0 GLOBAL RELATIVE
Load gp0 0 [gp6]									
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @1
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @31
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
LoadByte gp0 8 [Stack_pointer] 					#LOAD GP0 (CHAR)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @31
AND gp0 @255 													  #CASTING INT TO CHAR
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
AND gp0 gp1 														#AND (CHARS)
AND gp0 @255
Move gp0 gp1 						#PUSH gp0 POP gp1
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Move gp0 gp1 						#PUSH gp0 POP gp1
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
SHL gp0 gp1 														#SHIFT LEFT
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
AND gp0 gp1 														#AND
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @4294967295
XOR gp0 gp1 														#XOR
Load gp6 @5
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 CLL.REGISTERS 											#STORE GP0 GLOBAL RELATIVE
Store gp0 0 [gp6]
Load PC ifget_conditional-0endif
Pass 										%ifget_conditional-0true
Load gp6 @5
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 CLL.REGISTERS 											#LOAD GP0 GLOBAL RELATIVE
Load gp1 0 [gp6]									
Load gp0 @4294967071
AND gp0 gp1 														#AND
Load gp6 @5
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 CLL.REGISTERS 											#STORE GP0 GLOBAL RELATIVE
Store gp0 0 [gp6]
Pass 										%ifget_conditional-0endif           
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Pass 										%ifget_conditional-2endif           
Pass 										%ifget_conditional-4endif           
Pass 										%ifget_conditional-5endif           
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
																	Scope read_memory
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:read_memory
SUB Stack_pointer @20 									#OVERHEAD FOR FUNCTION read_memory
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 16 [Stack_pointer] 						#STORE GP0
Load gp0 16 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @1048575
Load gp1 @3
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
Move Zero gp2 														#COMPARE (IS GREATER)
Compare gp1 gp0
if Greater then Load gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifread_memory-0endif
Load gp0 CLL.string11 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 16 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:print_i 												#CALLING print_i
Load gp0 CLL.string12 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Pass										%ifread_memory-0endif
Load gp0 @0
Store gp0 12 [Stack_pointer] 						#STORE GP0
Load gp0 @0
Store gp0 8 [Stack_pointer] 						#STORE GP0
Pass 										%loopread_memory-0entry 		#FOR LOOP
Load gp1 8 [Stack_pointer] 						#LOAD GP0
Load gp0 @4
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
NOT gp0
if gp0 then Load PC loopread_memory-0exit
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Load gp1 @8
SHL gp0 gp1 														#SHIFT LEFT
Store gp0 12 [Stack_pointer] 						#STORE GP0
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp1 16 [Stack_pointer] 						#LOAD GP0
Load gp0 8 [Stack_pointer] 						#LOAD GP0
ADD gp0 gp1 														#ADD
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @1048575
AND gp0 gp1 														#AND
Move gp0 gp6 						#PUSH gp0 POP gp6
ADD gp6 CLL.MEMORY 											#LOAD GP0 GLOBAL RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Store gp0 12 [Stack_pointer] 						#STORE GP0
Pass 										%loopread_memory-0continue
Load gp1 8 [Stack_pointer] 						#LOAD GP0
Load gp0 @1
ADD gp0 gp1 														#ADD
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load PC loopread_memory-0entry
Pass 										%loopread_memory-0exit
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
																	Scope step
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:step
SUB Stack_pointer @20 									#OVERHEAD FOR FUNCTION step
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
Move Stack_pointer gp0 											#GETTING POINTER
ADD gp0 @12
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:fetchInstruction 												#CALLING fetchInstruction
Goto function:fetchAddress 												#CALLING fetchAddress
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 16 [Stack_pointer] 						#STORE GP0
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 16 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:executeInstruction 												#CALLING executeInstruction
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
																	Scope read_REGISTERS
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:read_REGISTERS
SUB Stack_pointer @9 									#OVERHEAD FOR FUNCTION read_REGISTERS
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
StoreByte gp0 8 [Stack_pointer] 					#STORE GP0 (CHAR)
LoadByte gp0 8 [Stack_pointer] 					#LOAD GP0 (CHAR)
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @6
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifread_REGISTERS-0endif
Load gp6 @5
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 CLL.REGISTERS 											#LOAD GP0 GLOBAL RELATIVE
Load gp0 0 [gp6]									
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Pass										%ifread_REGISTERS-0endif
LoadByte gp0 8 [Stack_pointer] 					#LOAD GP0 (CHAR)
Move gp0 gp6 						#PUSH gp0 POP gp6
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 CLL.REGISTERS 											#LOAD GP0 GLOBAL RELATIVE
Load gp0 0 [gp6]									
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
																	Scope ALU_op
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:ALU_op
SUB Stack_pointer @49 									#OVERHEAD FOR FUNCTION ALU_op
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
StoreByte gp0 48 [Stack_pointer] 					#STORE GP0 (CHAR)
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 24 [Stack_pointer] 						#STORE GP0
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 28 [Stack_pointer] 						#STORE GP0
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 44 [Stack_pointer] 						#STORE GP0
Load gp0 @0
Store gp0 36 [Stack_pointer] 						#STORE GP0
Load gp0 @0
Store gp0 40 [Stack_pointer] 						#STORE GP0
Load gp0 @0
Store gp0 32 [Stack_pointer] 						#STORE GP0
LoadByte gp0 48 [Stack_pointer] 					#LOAD GP0 (CHAR)
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @0
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifALU_op-21true 									#IF ELSE STATEMENT
LoadByte gp0 48 [Stack_pointer] 					#LOAD GP0 (CHAR)
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @1
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifALU_op-20true 									#IF ELSE STATEMENT
LoadByte gp0 48 [Stack_pointer] 					#LOAD GP0 (CHAR)
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @2
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifALU_op-19true 									#IF ELSE STATEMENT
LoadByte gp0 48 [Stack_pointer] 					#LOAD GP0 (CHAR)
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @3
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifALU_op-18true 									#IF ELSE STATEMENT
LoadByte gp0 48 [Stack_pointer] 					#LOAD GP0 (CHAR)
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @4
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifALU_op-17true 									#IF ELSE STATEMENT
LoadByte gp0 48 [Stack_pointer] 					#LOAD GP0 (CHAR)
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @5
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifALU_op-16true 									#IF ELSE STATEMENT
LoadByte gp0 48 [Stack_pointer] 					#LOAD GP0 (CHAR)
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @6
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifALU_op-15true 									#IF ELSE STATEMENT
LoadByte gp0 48 [Stack_pointer] 					#LOAD GP0 (CHAR)
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @7
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifALU_op-14true 									#IF ELSE STATEMENT
LoadByte gp0 48 [Stack_pointer] 					#LOAD GP0 (CHAR)
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @8
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifALU_op-13true 									#IF ELSE STATEMENT
LoadByte gp0 48 [Stack_pointer] 					#LOAD GP0 (CHAR)
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @9
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifALU_op-12true 									#IF ELSE STATEMENT
LoadByte gp0 48 [Stack_pointer] 					#LOAD GP0 (CHAR)
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @10
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifALU_op-11true 									#IF ELSE STATEMENT
LoadByte gp0 48 [Stack_pointer] 					#LOAD GP0 (CHAR)
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @11
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifALU_op-10true 									#IF ELSE STATEMENT
LoadByte gp0 48 [Stack_pointer] 					#LOAD GP0 (CHAR)
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @12
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifALU_op-9true 									#IF ELSE STATEMENT
LoadByte gp0 48 [Stack_pointer] 					#LOAD GP0 (CHAR)
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @13
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifALU_op-8true 									#IF ELSE STATEMENT
LoadByte gp0 48 [Stack_pointer] 					#LOAD GP0 (CHAR)
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @14
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifALU_op-7true 									#IF ELSE STATEMENT
LoadByte gp0 48 [Stack_pointer] 					#LOAD GP0 (CHAR)
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @15
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifALU_op-6endif
Load gp0 28 [Stack_pointer] 						#LOAD GP0
Load gp1 24 [Stack_pointer] 						#LOAD GP0
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Load gp1 @1
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Store gp0 36 [Stack_pointer] 						#STORE GP0
Load gp1 36 [Stack_pointer] 						#LOAD GP0
Load gp0 28 [Stack_pointer] 						#LOAD GP0
Move Zero gp2 														#COMPARE (IS GREATER)
Compare gp1 gp0
if Greater then Load gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifALU_op-5endif
Load gp0 @8
Store gp0 32 [Stack_pointer] 						#STORE GP0
Pass										%ifALU_op-5endif
Pass										%ifALU_op-6endif
Load PC ifALU_op-7endif
Pass 										%ifALU_op-7true
Load gp1 28 [Stack_pointer] 						#LOAD GP0
Load gp0 24 [Stack_pointer] 						#LOAD GP0
ADD gp0 gp1 														#ADD
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @1
ADD gp0 gp1 														#ADD
Store gp0 36 [Stack_pointer] 						#STORE GP0
Load gp1 36 [Stack_pointer] 						#LOAD GP0
Load gp0 28 [Stack_pointer] 						#LOAD GP0
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifALU_op-4endif
Load gp0 @16
Store gp0 32 [Stack_pointer] 						#STORE GP0
Pass										%ifALU_op-4endif
Pass 										%ifALU_op-7endif           
Load PC ifALU_op-8endif
Pass 										%ifALU_op-8true
Load gp0 28 [Stack_pointer] 						#LOAD GP0
Load gp1 24 [Stack_pointer] 						#LOAD GP0
SHR gp0 gp1 														#SHIFT RIGHT
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @4294967295
AND gp0 gp1 														#AND
Store gp0 36 [Stack_pointer] 						#STORE GP0
Pass 										%ifALU_op-8endif           
Load PC ifALU_op-9endif
Pass 										%ifALU_op-9true
Load gp0 28 [Stack_pointer] 						#LOAD GP0
Load gp1 24 [Stack_pointer] 						#LOAD GP0
SHL gp0 gp1 														#SHIFT LEFT
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @4294967295
AND gp0 gp1 														#AND
Store gp0 36 [Stack_pointer] 						#STORE GP0
Pass 										%ifALU_op-9endif           
Load PC ifALU_op-10endif
Pass 										%ifALU_op-10true
Load gp1 28 [Stack_pointer] 						#LOAD GP0
Load gp0 24 [Stack_pointer] 						#LOAD GP0
XOR gp0 gp1 														#XOR
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @4294967295
XOR gp0 gp1 														#XOR
Store gp0 36 [Stack_pointer] 						#STORE GP0
Pass 										%ifALU_op-10endif           
Load PC ifALU_op-11endif
Pass 										%ifALU_op-11true
Load gp1 28 [Stack_pointer] 						#LOAD GP0
Load gp0 24 [Stack_pointer] 						#LOAD GP0
OR gp0 gp1 															#OR
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @4294967295
XOR gp0 gp1 														#XOR
Store gp0 36 [Stack_pointer] 						#STORE GP0
Pass 										%ifALU_op-11endif           
Load PC ifALU_op-12endif
Pass 										%ifALU_op-12true
Load gp1 28 [Stack_pointer] 						#LOAD GP0
Load gp0 24 [Stack_pointer] 						#LOAD GP0
AND gp0 gp1 														#AND
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @4294967295
XOR gp0 gp1 														#XOR
Store gp0 36 [Stack_pointer] 						#STORE GP0
Pass 										%ifALU_op-12endif           
Load PC ifALU_op-13endif
Pass 										%ifALU_op-13true
Load gp1 28 [Stack_pointer] 						#LOAD GP0
Load gp0 @4294967295
XOR gp0 gp1 														#XOR
Store gp0 36 [Stack_pointer] 						#STORE GP0
Pass 										%ifALU_op-13endif           
Load PC ifALU_op-14endif
Pass 										%ifALU_op-14true
Load gp1 28 [Stack_pointer] 						#LOAD GP0
Load gp0 24 [Stack_pointer] 						#LOAD GP0
XOR gp0 gp1 														#XOR
Store gp0 36 [Stack_pointer] 						#STORE GP0
Pass 										%ifALU_op-14endif           
Load PC ifALU_op-15endif
Pass 										%ifALU_op-15true
Load gp1 28 [Stack_pointer] 						#LOAD GP0
Load gp0 24 [Stack_pointer] 						#LOAD GP0
OR gp0 gp1 															#OR
Store gp0 36 [Stack_pointer] 						#STORE GP0
Pass 										%ifALU_op-15endif           
Load PC ifALU_op-16endif
Pass 										%ifALU_op-16true
Load gp1 28 [Stack_pointer] 						#LOAD GP0
Load gp0 24 [Stack_pointer] 						#LOAD GP0
AND gp0 gp1 														#AND
Store gp0 36 [Stack_pointer] 						#STORE GP0
Pass 										%ifALU_op-16endif           
Load PC ifALU_op-17endif
Pass 										%ifALU_op-17true
Load gp1 24 [Stack_pointer] 						#LOAD GP0
Load gp0 @0
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifALU_op-3true 									#IF ELSE STATEMENT
Load gp0 28 [Stack_pointer] 						#LOAD GP0
Load gp1 24 [Stack_pointer] 						#LOAD GP0
MOD gp0 gp1 														#MODULO
if DivByZero then Load PC DIV_BY_ZERO
Store gp0 36 [Stack_pointer] 						#STORE GP0
Load PC ifALU_op-3endif
Pass 										%ifALU_op-3true
Load gp0 @4
Store gp0 32 [Stack_pointer] 						#STORE GP0
Load gp0 @0
Store gp0 36 [Stack_pointer] 						#STORE GP0
Pass 										%ifALU_op-3endif           
Pass 										%ifALU_op-17endif           
Load PC ifALU_op-18endif
Pass 										%ifALU_op-18true
Load gp1 24 [Stack_pointer] 						#LOAD GP0
Load gp0 @0
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifALU_op-2true 									#IF ELSE STATEMENT
Load gp0 28 [Stack_pointer] 						#LOAD GP0
Load gp1 24 [Stack_pointer] 						#LOAD GP0
DIV gp0 gp1 														#DIVIDE
if DivByZero then Load PC DIV_BY_ZERO
Store gp0 36 [Stack_pointer] 						#STORE GP0
Load PC ifALU_op-2endif
Pass 										%ifALU_op-2true
Load gp0 @4
Store gp0 32 [Stack_pointer] 						#STORE GP0
Load gp0 @4294967295
Store gp0 36 [Stack_pointer] 						#STORE GP0
Pass 										%ifALU_op-2endif           
Pass 										%ifALU_op-18endif           
Load PC ifALU_op-19endif
Pass 										%ifALU_op-19true
Load gp0 28 [Stack_pointer] 						#LOAD GP0
Load gp1 @16
SHR gp0 gp1 														#SHIFT RIGHT
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load gp1 28 [Stack_pointer] 						#LOAD GP0
Load gp0 @65535
AND gp0 gp1 														#AND
Store gp0 16 [Stack_pointer] 						#STORE GP0
Load gp0 24 [Stack_pointer] 						#LOAD GP0
Load gp1 @16
SHR gp0 gp1 														#SHIFT RIGHT
Store gp0 12 [Stack_pointer] 						#STORE GP0
Load gp1 24 [Stack_pointer] 						#LOAD GP0
Load gp0 @65535
AND gp0 gp1 														#AND
Store gp0 20 [Stack_pointer] 						#STORE GP0
Load gp1 8 [Stack_pointer] 						#LOAD GP0
Load gp0 12 [Stack_pointer] 						#LOAD GP0
MUL gp0 gp1 														#MULTIPLY
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp1 8 [Stack_pointer] 						#LOAD GP0
Load gp0 20 [Stack_pointer] 						#LOAD GP0
MUL gp0 gp1 														#MULTIPLY
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp1 16 [Stack_pointer] 						#LOAD GP0
Load gp0 12 [Stack_pointer] 						#LOAD GP0
MUL gp0 gp1 														#MULTIPLY
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Load gp1 @16
SHR gp0 gp1 														#SHIFT RIGHT
Store gp0 40 [Stack_pointer] 						#STORE GP0
Load gp1 16 [Stack_pointer] 						#LOAD GP0
Load gp0 20 [Stack_pointer] 						#LOAD GP0
MUL gp0 gp1 														#MULTIPLY
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp1 8 [Stack_pointer] 						#LOAD GP0
Load gp0 20 [Stack_pointer] 						#LOAD GP0
MUL gp0 gp1 														#MULTIPLY
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp1 16 [Stack_pointer] 						#LOAD GP0
Load gp0 12 [Stack_pointer] 						#LOAD GP0
MUL gp0 gp1 														#MULTIPLY
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Load gp1 @16
SHL gp0 gp1 														#SHIFT LEFT
Store gp0 36 [Stack_pointer] 						#STORE GP0
Pass 										%ifALU_op-19endif           
Load PC ifALU_op-20endif
Pass 										%ifALU_op-20true
Load gp0 28 [Stack_pointer] 						#LOAD GP0
Load gp1 24 [Stack_pointer] 						#LOAD GP0
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Store gp0 36 [Stack_pointer] 						#STORE GP0
Load gp1 36 [Stack_pointer] 						#LOAD GP0
Load gp0 28 [Stack_pointer] 						#LOAD GP0
Move Zero gp2 														#COMPARE (IS GREATER)
Compare gp1 gp0
if Greater then Load gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifALU_op-1endif
Load gp0 @8
Store gp0 32 [Stack_pointer] 						#STORE GP0
Pass										%ifALU_op-1endif
Pass 										%ifALU_op-20endif           
Load PC ifALU_op-21endif
Pass 										%ifALU_op-21true
Load gp1 28 [Stack_pointer] 						#LOAD GP0
Load gp0 24 [Stack_pointer] 						#LOAD GP0
ADD gp0 gp1 														#ADD
Store gp0 36 [Stack_pointer] 						#STORE GP0
Load gp1 36 [Stack_pointer] 						#LOAD GP0
Load gp0 28 [Stack_pointer] 						#LOAD GP0
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifALU_op-0endif
Load gp0 @16
Store gp0 32 [Stack_pointer] 						#STORE GP0
Pass										%ifALU_op-0endif
Pass 										%ifALU_op-21endif           
Load gp0 36 [Stack_pointer] 						#LOAD GP0
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 44 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 40 [Stack_pointer] 						#LOAD GP0
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 44 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 32 [Stack_pointer] 						#LOAD GP0
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 44 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
																	Scope prepareMemory
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:prepareMemory
SUB Stack_pointer @18 									#OVERHEAD FOR FUNCTION prepareMemory
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
Load gp0 @0
AND gp0 @255 													  #CASTING INT TO CHAR
StoreByte gp0 12 [Stack_pointer] 					#STORE GP0 (CHAR)
Load gp0 @0
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load gp0 @0
AND gp0 @255 													  #CASTING INT TO CHAR
StoreByte gp0 12 [Stack_pointer] 					#STORE GP0 (CHAR)
Pass 										%loopprepareMemory-0entry
LoadByte gp0 12 [Stack_pointer] 					#LOAD GP0 (CHAR)
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @6
Load  gp2 @4294967295 												#COMPARE (NOT EQUAL)
Compare gp1 gp0 
if Equal then Move Zero gp2
Move gp2 gp0
NOT gp0
if gp0 then Load PC loopprepareMemory-0exit 								#WHILE LOOP
Goto function:readHex 												#CALLING readHex
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
StoreByte gp0 13 [Stack_pointer] 					#STORE GP0 (CHAR)
LoadByte gp0 12 [Stack_pointer] 					#LOAD GP0 (CHAR)
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @0
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifprepareMemory-7true 									#IF ELSE STATEMENT
LoadByte gp0 12 [Stack_pointer] 					#LOAD GP0 (CHAR)
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @1
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifprepareMemory-6true 									#IF ELSE STATEMENT
LoadByte gp0 12 [Stack_pointer] 					#LOAD GP0 (CHAR)
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @2
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifprepareMemory-5true 									#IF ELSE STATEMENT
LoadByte gp0 12 [Stack_pointer] 					#LOAD GP0 (CHAR)
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @3
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifprepareMemory-4true 									#IF ELSE STATEMENT
LoadByte gp0 12 [Stack_pointer] 					#LOAD GP0 (CHAR)
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @4
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifprepareMemory-3true 									#IF ELSE STATEMENT
LoadByte gp0 12 [Stack_pointer] 					#LOAD GP0 (CHAR)
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @5
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifprepareMemory-2endif
LoadByte gp0 13 [Stack_pointer] 					#LOAD GP0 (CHAR)
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @1
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifprepareMemory-1true 									#IF ELSE STATEMENT
LoadByte gp0 13 [Stack_pointer] 					#LOAD GP0 (CHAR)
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @0
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifprepareMemory-0true 									#IF ELSE STATEMENT
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Load PC ifprepareMemory-0endif
Pass 										%ifprepareMemory-0true
Load gp0 @0
AND gp0 @255 													  #CASTING INT TO CHAR
StoreByte gp0 12 [Stack_pointer] 					#STORE GP0 (CHAR)
Pass 										%ifprepareMemory-0endif           
Load PC ifprepareMemory-1endif
Pass 										%ifprepareMemory-1true
Load gp0 @6
AND gp0 @255 													  #CASTING INT TO CHAR
StoreByte gp0 12 [Stack_pointer] 					#STORE GP0 (CHAR)
Pass 										%ifprepareMemory-1endif           
Pass										%ifprepareMemory-2endif
Load PC ifprepareMemory-3endif
Pass 										%ifprepareMemory-3true
Load gp0 @5
AND gp0 @255 													  #CASTING INT TO CHAR
StoreByte gp0 12 [Stack_pointer] 					#STORE GP0 (CHAR)
Load gp0 14 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
LoadByte gp0 13 [Stack_pointer] 					#LOAD GP0 (CHAR)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:store_byte_memory 												#CALLING store_byte_memory
Pass 										%ifprepareMemory-3endif           
Load PC ifprepareMemory-4endif
Pass 										%ifprepareMemory-4true
Load gp0 @4
AND gp0 @255 													  #CASTING INT TO CHAR
StoreByte gp0 12 [Stack_pointer] 					#STORE GP0 (CHAR)
Load gp0 14 [Stack_pointer] 						#LOAD GP0
Load gp1 @8
SHL gp0 gp1 														#SHIFT LEFT
Store gp0 14 [Stack_pointer] 						#STORE GP0
Load gp0 14 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
LoadByte gp0 13 [Stack_pointer] 					#LOAD GP0 (CHAR)
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Store gp0 14 [Stack_pointer] 						#STORE GP0
Pass 										%ifprepareMemory-4endif           
Load PC ifprepareMemory-5endif
Pass 										%ifprepareMemory-5true
Load gp0 @3
AND gp0 @255 													  #CASTING INT TO CHAR
StoreByte gp0 12 [Stack_pointer] 					#STORE GP0 (CHAR)
Load gp0 14 [Stack_pointer] 						#LOAD GP0
Load gp1 @8
SHL gp0 gp1 														#SHIFT LEFT
Store gp0 14 [Stack_pointer] 						#STORE GP0
Load gp0 14 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
LoadByte gp0 13 [Stack_pointer] 					#LOAD GP0 (CHAR)
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Store gp0 14 [Stack_pointer] 						#STORE GP0
Pass 										%ifprepareMemory-5endif           
Load PC ifprepareMemory-6endif
Pass 										%ifprepareMemory-6true
Load gp0 @2
AND gp0 @255 													  #CASTING INT TO CHAR
StoreByte gp0 12 [Stack_pointer] 					#STORE GP0 (CHAR)
Load gp0 14 [Stack_pointer] 						#LOAD GP0
Load gp1 @8
SHL gp0 gp1 														#SHIFT LEFT
Store gp0 14 [Stack_pointer] 						#STORE GP0
Load gp0 14 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
LoadByte gp0 13 [Stack_pointer] 					#LOAD GP0 (CHAR)
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Store gp0 14 [Stack_pointer] 						#STORE GP0
Pass 										%ifprepareMemory-6endif           
Load PC ifprepareMemory-7endif
Pass 										%ifprepareMemory-7true
Load gp0 @1
AND gp0 @255 													  #CASTING INT TO CHAR
StoreByte gp0 12 [Stack_pointer] 					#STORE GP0 (CHAR)
LoadByte gp0 13 [Stack_pointer] 					#LOAD GP0 (CHAR)
Store gp0 14 [Stack_pointer] 						#STORE GP0
Pass 										%ifprepareMemory-7endif           
Load PC loopprepareMemory-0entry					%loopprepareMemory-0continue
Pass 										%loopprepareMemory-0exit
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
																	Scope executeInstruction
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:executeInstruction
SUB Stack_pointer @27 									#OVERHEAD FOR FUNCTION executeInstruction
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 16 [Stack_pointer] 						#STORE GP0
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load gp6 @1
ADD gp6 8 [Stack_pointer]							#LOAD GP0 RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
StoreByte gp0 26 [Stack_pointer] 					#STORE GP0 (CHAR)
Load gp6 @2
ADD gp6 8 [Stack_pointer]							#LOAD GP0 RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
StoreByte gp0 25 [Stack_pointer] 					#STORE GP0 (CHAR)
Load gp6 @3
ADD gp6 8 [Stack_pointer]							#LOAD GP0 RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:get_conditional 												#CALLING get_conditional
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
if gp0 then Load PC ifexecuteInstruction-23true 									#IF ELSE STATEMENT
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Load PC ifexecuteInstruction-23endif
Pass 										%ifexecuteInstruction-23true
LoadByte gp0 26 [Stack_pointer] 					#LOAD GP0 (CHAR)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @15
AND gp0 @255 													  #CASTING INT TO CHAR
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
AND gp0 gp1 														#AND (CHARS)
AND gp0 @255
StoreByte gp0 26 [Stack_pointer] 					#STORE GP0 (CHAR)
LoadByte gp0 25 [Stack_pointer] 					#LOAD GP0 (CHAR)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @15
AND gp0 @255 													  #CASTING INT TO CHAR
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
AND gp0 gp1 														#AND (CHARS)
AND gp0 @255
StoreByte gp0 25 [Stack_pointer] 					#STORE GP0 (CHAR)
Load gp6 @0
ADD gp6 8 [Stack_pointer]							#LOAD GP0 RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
StoreByte gp0 20 [Stack_pointer] 					#STORE GP0 (CHAR)
LoadByte gp0 20 [Stack_pointer] 					#LOAD GP0 (CHAR)
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @0
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifexecuteInstruction-0endif
Load gp0 @1
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Pass										%ifexecuteInstruction-0endif
LoadByte gp0 20 [Stack_pointer] 					#LOAD GP0 (CHAR)
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @1
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifexecuteInstruction-1endif
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Pass										%ifexecuteInstruction-1endif
LoadByte gp0 20 [Stack_pointer] 					#LOAD GP0 (CHAR)
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @2
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifexecuteInstruction-2endif
LoadByte gp0 25 [Stack_pointer] 					#LOAD GP0 (CHAR)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
LoadByte gp0 26 [Stack_pointer] 					#LOAD GP0 (CHAR)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:read_REGISTERS 												#CALLING read_REGISTERS
Goto function:write_REGISTERS 												#CALLING write_REGISTERS
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Pass										%ifexecuteInstruction-2endif
LoadByte gp0 20 [Stack_pointer] 					#LOAD GP0 (CHAR)
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @3
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifexecuteInstruction-3endif
Load gp0 16 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
LoadByte gp0 25 [Stack_pointer] 					#LOAD GP0 (CHAR)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:read_REGISTERS 												#CALLING read_REGISTERS
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Store gp0 16 [Stack_pointer] 						#STORE GP0
LoadByte gp0 26 [Stack_pointer] 					#LOAD GP0 (CHAR)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 16 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:read_memory 												#CALLING read_memory
Goto function:write_REGISTERS 												#CALLING write_REGISTERS
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Pass										%ifexecuteInstruction-3endif
LoadByte gp0 20 [Stack_pointer] 					#LOAD GP0 (CHAR)
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @4
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifexecuteInstruction-4endif
Load gp0 16 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
LoadByte gp0 25 [Stack_pointer] 					#LOAD GP0 (CHAR)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:read_REGISTERS 												#CALLING read_REGISTERS
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Store gp0 16 [Stack_pointer] 						#STORE GP0
Load gp0 16 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
LoadByte gp0 26 [Stack_pointer] 					#LOAD GP0 (CHAR)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:read_REGISTERS 												#CALLING read_REGISTERS
Goto function:store_memory 												#CALLING store_memory
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Pass										%ifexecuteInstruction-4endif
LoadByte gp0 20 [Stack_pointer] 					#LOAD GP0 (CHAR)
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @5
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifexecuteInstruction-7endif
Load gp6 @5
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 CLL.REGISTERS 											#LOAD GP0 GLOBAL RELATIVE
Load gp1 0 [gp6]									
Load gp0 @4294967071
AND gp0 gp1 														#AND
Load gp6 @5
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 CLL.REGISTERS 											#STORE GP0 GLOBAL RELATIVE
Store gp0 0 [gp6]
LoadByte gp0 26 [Stack_pointer] 					#LOAD GP0 (CHAR)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:read_REGISTERS 												#CALLING read_REGISTERS
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 21 [Stack_pointer] 						#STORE GP0
LoadByte gp0 25 [Stack_pointer] 					#LOAD GP0 (CHAR)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:read_REGISTERS 												#CALLING read_REGISTERS
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 12 [Stack_pointer] 						#STORE GP0
Load gp1 21 [Stack_pointer] 						#LOAD GP0
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Move Zero gp2 														#COMPARE (IS GREATER)
Compare gp1 gp0
if Greater then Load gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifexecuteInstruction-6true 									#IF ELSE STATEMENT
Load gp1 21 [Stack_pointer] 						#LOAD GP0
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifexecuteInstruction-5true 									#IF ELSE STATEMENT
Load gp6 @5
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 CLL.REGISTERS 											#LOAD GP0 GLOBAL RELATIVE
Load gp1 0 [gp6]									
Load gp0 @32
OR gp0 gp1 															#OR
Load gp6 @5
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 CLL.REGISTERS 											#STORE GP0 GLOBAL RELATIVE
Store gp0 0 [gp6]
Load PC ifexecuteInstruction-5endif
Pass 										%ifexecuteInstruction-5true
Load gp6 @5
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 CLL.REGISTERS 											#LOAD GP0 GLOBAL RELATIVE
Load gp1 0 [gp6]									
Load gp0 @128
OR gp0 gp1 															#OR
Load gp6 @5
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 CLL.REGISTERS 											#STORE GP0 GLOBAL RELATIVE
Store gp0 0 [gp6]
Pass 										%ifexecuteInstruction-5endif           
Load PC ifexecuteInstruction-6endif
Pass 										%ifexecuteInstruction-6true
Load gp6 @5
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 CLL.REGISTERS 											#LOAD GP0 GLOBAL RELATIVE
Load gp1 0 [gp6]									
Load gp0 @64
OR gp0 gp1 															#OR
Load gp6 @5
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 CLL.REGISTERS 											#STORE GP0 GLOBAL RELATIVE
Store gp0 0 [gp6]
Pass 										%ifexecuteInstruction-6endif           
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Pass										%ifexecuteInstruction-7endif
LoadByte gp0 20 [Stack_pointer] 					#LOAD GP0 (CHAR)
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @6
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifexecuteInstruction-10endif
Load gp6 @5
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 CLL.REGISTERS 											#LOAD GP0 GLOBAL RELATIVE
Load gp1 0 [gp6]									
Load gp0 @4294967071
AND gp0 gp1 														#AND
Load gp6 @5
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 CLL.REGISTERS 											#STORE GP0 GLOBAL RELATIVE
Store gp0 0 [gp6]
Load gp0 16 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
LoadByte gp0 25 [Stack_pointer] 					#LOAD GP0 (CHAR)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:read_REGISTERS 												#CALLING read_REGISTERS
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Store gp0 16 [Stack_pointer] 						#STORE GP0
LoadByte gp0 26 [Stack_pointer] 					#LOAD GP0 (CHAR)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:read_REGISTERS 												#CALLING read_REGISTERS
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 21 [Stack_pointer] 						#STORE GP0
Load gp0 16 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:read_memory 												#CALLING read_memory
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 12 [Stack_pointer] 						#STORE GP0
Load gp1 21 [Stack_pointer] 						#LOAD GP0
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Move Zero gp2 														#COMPARE (IS GREATER)
Compare gp1 gp0
if Greater then Load gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifexecuteInstruction-9true 									#IF ELSE STATEMENT
Load gp1 21 [Stack_pointer] 						#LOAD GP0
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifexecuteInstruction-8true 									#IF ELSE STATEMENT
Load gp6 @5
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 CLL.REGISTERS 											#LOAD GP0 GLOBAL RELATIVE
Load gp1 0 [gp6]									
Load gp0 @32
OR gp0 gp1 															#OR
Load gp6 @5
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 CLL.REGISTERS 											#STORE GP0 GLOBAL RELATIVE
Store gp0 0 [gp6]
Load PC ifexecuteInstruction-8endif
Pass 										%ifexecuteInstruction-8true
Load gp6 @5
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 CLL.REGISTERS 											#LOAD GP0 GLOBAL RELATIVE
Load gp1 0 [gp6]									
Load gp0 @128
OR gp0 gp1 															#OR
Load gp6 @5
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 CLL.REGISTERS 											#STORE GP0 GLOBAL RELATIVE
Store gp0 0 [gp6]
Pass 										%ifexecuteInstruction-8endif           
Load PC ifexecuteInstruction-9endif
Pass 										%ifexecuteInstruction-9true
Load gp6 @5
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 CLL.REGISTERS 											#LOAD GP0 GLOBAL RELATIVE
Load gp1 0 [gp6]									
Load gp0 @64
OR gp0 gp1 															#OR
Load gp6 @5
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 CLL.REGISTERS 											#STORE GP0 GLOBAL RELATIVE
Store gp0 0 [gp6]
Pass 										%ifexecuteInstruction-9endif           
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Pass										%ifexecuteInstruction-10endif
LoadByte gp0 20 [Stack_pointer] 					#LOAD GP0 (CHAR)
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @7
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifexecuteInstruction-11endif
LoadByte gp0 26 [Stack_pointer] 					#LOAD GP0 (CHAR)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:read_REGISTERS 												#CALLING read_REGISTERS
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
AND gp0 @255 													  #CASTING INT TO CHAR
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:putc 												#CALLING putc
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Pass										%ifexecuteInstruction-11endif
LoadByte gp0 20 [Stack_pointer] 					#LOAD GP0 (CHAR)
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @8
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifexecuteInstruction-12endif
Load gp0 16 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
LoadByte gp0 25 [Stack_pointer] 					#LOAD GP0 (CHAR)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:read_REGISTERS 												#CALLING read_REGISTERS
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Store gp0 16 [Stack_pointer] 						#STORE GP0
Load gp0 16 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:read_memory 												#CALLING read_memory
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
AND gp0 @255 													  #CASTING INT TO CHAR
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:putc 												#CALLING putc
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Pass										%ifexecuteInstruction-12endif
LoadByte gp0 20 [Stack_pointer] 					#LOAD GP0 (CHAR)
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @9
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifexecuteInstruction-13endif
LoadByte gp0 26 [Stack_pointer] 					#LOAD GP0 (CHAR)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:read_REGISTERS 												#CALLING read_REGISTERS
Goto function:print_i 												#CALLING print_i
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Pass										%ifexecuteInstruction-13endif
LoadByte gp0 20 [Stack_pointer] 					#LOAD GP0 (CHAR)
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @10
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifexecuteInstruction-14endif
Load gp0 16 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
LoadByte gp0 25 [Stack_pointer] 					#LOAD GP0 (CHAR)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:read_REGISTERS 												#CALLING read_REGISTERS
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Store gp0 16 [Stack_pointer] 						#STORE GP0
Load gp0 16 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:read_memory 												#CALLING read_memory
Goto function:print_i 												#CALLING print_i
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Pass										%ifexecuteInstruction-14endif
LoadByte gp0 20 [Stack_pointer] 					#LOAD GP0 (CHAR)
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @11
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifexecuteInstruction-15endif
Load gp0 16 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
LoadByte gp0 25 [Stack_pointer] 					#LOAD GP0 (CHAR)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:read_REGISTERS 												#CALLING read_REGISTERS
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Store gp0 16 [Stack_pointer] 						#STORE GP0
LoadByte gp0 26 [Stack_pointer] 					#LOAD GP0 (CHAR)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 16 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:read_byte_memory 												#CALLING read_byte_memory
Goto function:write_REGISTERS 												#CALLING write_REGISTERS
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Pass										%ifexecuteInstruction-15endif
LoadByte gp0 20 [Stack_pointer] 					#LOAD GP0 (CHAR)
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @12
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifexecuteInstruction-16endif
Load gp0 16 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
LoadByte gp0 25 [Stack_pointer] 					#LOAD GP0 (CHAR)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:read_REGISTERS 												#CALLING read_REGISTERS
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Store gp0 16 [Stack_pointer] 						#STORE GP0
Load gp0 16 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
LoadByte gp0 26 [Stack_pointer] 					#LOAD GP0 (CHAR)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:read_REGISTERS 												#CALLING read_REGISTERS
Goto function:store_byte_memory 												#CALLING store_byte_memory
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Pass										%ifexecuteInstruction-16endif
LoadByte gp0 20 [Stack_pointer] 					#LOAD GP0 (CHAR)
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @13
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifexecuteInstruction-17endif
Load gp0 16 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
LoadByte gp0 25 [Stack_pointer] 					#LOAD GP0 (CHAR)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:read_REGISTERS 												#CALLING read_REGISTERS
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Store gp0 16 [Stack_pointer] 						#STORE GP0
LoadByte gp0 26 [Stack_pointer] 					#LOAD GP0 (CHAR)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 16 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:read_word_memory 												#CALLING read_word_memory
Goto function:write_REGISTERS 												#CALLING write_REGISTERS
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Pass										%ifexecuteInstruction-17endif
LoadByte gp0 20 [Stack_pointer] 					#LOAD GP0 (CHAR)
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @14
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifexecuteInstruction-18endif
Load gp0 16 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
LoadByte gp0 25 [Stack_pointer] 					#LOAD GP0 (CHAR)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:read_REGISTERS 												#CALLING read_REGISTERS
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Store gp0 16 [Stack_pointer] 						#STORE GP0
Load gp0 16 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
LoadByte gp0 26 [Stack_pointer] 					#LOAD GP0 (CHAR)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:read_REGISTERS 												#CALLING read_REGISTERS
Goto function:store_word_memory 												#CALLING store_word_memory
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Pass										%ifexecuteInstruction-18endif
LoadByte gp0 20 [Stack_pointer] 					#LOAD GP0 (CHAR)
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @48
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifexecuteInstruction-19endif
LoadByte gp0 26 [Stack_pointer] 					#LOAD GP0 (CHAR)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:getc 												#CALLING getc
Goto function:write_REGISTERS 												#CALLING write_REGISTERS
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Pass										%ifexecuteInstruction-19endif
LoadByte gp0 20 [Stack_pointer] 					#LOAD GP0 (CHAR)
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @49
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifexecuteInstruction-20endif
Load gp0 16 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
LoadByte gp0 25 [Stack_pointer] 					#LOAD GP0 (CHAR)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:read_REGISTERS 												#CALLING read_REGISTERS
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Store gp0 16 [Stack_pointer] 						#STORE GP0
Load gp0 16 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:getc 												#CALLING getc
Goto function:store_memory 												#CALLING store_memory
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Pass										%ifexecuteInstruction-20endif
Load gp0 @16
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
LoadByte gp0 20 [Stack_pointer] 					#LOAD GP0 (CHAR)
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
Load gp2 @4294967295 												#COMPARE (NOT GREATER)
Compare gp1 gp0
if Greater then Move Zero gp2
Move gp2 gp0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
LoadByte gp0 20 [Stack_pointer] 					#LOAD GP0 (CHAR)
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @48
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
AND gp0 gp1
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifexecuteInstruction-22endif
LoadByte gp0 20 [Stack_pointer] 					#LOAD GP0 (CHAR)
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @32
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifexecuteInstruction-21true 									#IF ELSE STATEMENT
Load gp0 16 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
LoadByte gp0 25 [Stack_pointer] 					#LOAD GP0 (CHAR)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:read_REGISTERS 												#CALLING read_REGISTERS
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Store gp0 16 [Stack_pointer] 						#STORE GP0
LoadByte gp0 26 [Stack_pointer] 					#LOAD GP0 (CHAR)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:read_REGISTERS 												#CALLING read_REGISTERS
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 21 [Stack_pointer] 						#STORE GP0
Load gp0 16 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:read_memory 												#CALLING read_memory
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 12 [Stack_pointer] 						#STORE GP0
Load gp0 21 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
LoadByte gp0 20 [Stack_pointer] 					#LOAD GP0 (CHAR)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:do_ALU_op 												#CALLING do_ALU_op
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 21 [Stack_pointer] 						#STORE GP0
LoadByte gp0 26 [Stack_pointer] 					#LOAD GP0 (CHAR)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 21 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:write_REGISTERS 												#CALLING write_REGISTERS
Load PC ifexecuteInstruction-21endif
Pass 										%ifexecuteInstruction-21true
LoadByte gp0 26 [Stack_pointer] 					#LOAD GP0 (CHAR)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:read_REGISTERS 												#CALLING read_REGISTERS
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 21 [Stack_pointer] 						#STORE GP0
LoadByte gp0 25 [Stack_pointer] 					#LOAD GP0 (CHAR)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:read_REGISTERS 												#CALLING read_REGISTERS
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 12 [Stack_pointer] 						#STORE GP0
Load gp0 21 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
LoadByte gp0 20 [Stack_pointer] 					#LOAD GP0 (CHAR)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:do_ALU_op 												#CALLING do_ALU_op
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 21 [Stack_pointer] 						#STORE GP0
LoadByte gp0 26 [Stack_pointer] 					#LOAD GP0 (CHAR)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 21 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:write_REGISTERS 												#CALLING write_REGISTERS
Pass 										%ifexecuteInstruction-21endif           
Pass										%ifexecuteInstruction-22endif
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Pass 										%ifexecuteInstruction-23endif           
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
																	Scope DumpInstruction
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:DumpInstruction
SUB Stack_pointer @20 									#OVERHEAD FOR FUNCTION DumpInstruction
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 16 [Stack_pointer] 						#STORE GP0
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 12 [Stack_pointer] 						#STORE GP0
Load gp0 @0
Store gp0 8 [Stack_pointer] 						#STORE GP0
Pass 										%loopDumpInstruction-0entry 		#FOR LOOP
Load gp1 8 [Stack_pointer] 						#LOAD GP0
Load gp0 @4
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
NOT gp0
if gp0 then Load PC loopDumpInstruction-0exit
Load gp6 8 [Stack_pointer] 						#LOAD GP0
ADD gp6 12 [Stack_pointer]							#LOAD GP0 RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:print_i 												#CALLING print_i
Load gp0 CLL.string20 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Pass 										%loopDumpInstruction-0continue
Load gp1 8 [Stack_pointer] 						#LOAD GP0
Load gp0 @1
ADD gp0 gp1 														#ADD
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load PC loopDumpInstruction-0entry
Pass 										%loopDumpInstruction-0exit
Load gp0 CLL.string21 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 16 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:print_i 												#CALLING print_i
Load gp0 CLL.string22 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
																	Scope write_REGISTERS
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:write_REGISTERS
SUB Stack_pointer @13 									#OVERHEAD FOR FUNCTION write_REGISTERS
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 8 [Stack_pointer] 						#STORE GP0
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
StoreByte gp0 12 [Stack_pointer] 					#STORE GP0 (CHAR)
LoadByte gp0 12 [Stack_pointer] 					#LOAD GP0 (CHAR)
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @1
Move Zero gp2 														#COMPARE (IS GREATER)
Compare gp1 gp0
if Greater then Load gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifwrite_REGISTERS-2endif
LoadByte gp0 12 [Stack_pointer] 					#LOAD GP0 (CHAR)
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @5
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifwrite_REGISTERS-1true 									#IF ELSE STATEMENT
LoadByte gp0 12 [Stack_pointer] 					#LOAD GP0 (CHAR)
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @6
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifwrite_REGISTERS-0true 									#IF ELSE STATEMENT
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
LoadByte gp0 12 [Stack_pointer] 					#LOAD GP0 (CHAR)
Move gp0 gp6 						#PUSH gp0 POP gp6
MUL gp6 @4 														   #INDEXING FOR @INT
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
ADD gp6 CLL.REGISTERS 											#STORE GP0 GLOBAL RELATIVE
Store gp0 0 [gp6]
Load PC ifwrite_REGISTERS-0endif
Pass 										%ifwrite_REGISTERS-0true
Load gp6 @5
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 CLL.REGISTERS 											#LOAD GP0 GLOBAL RELATIVE
Load gp1 0 [gp6]									
Load gp0 8 [Stack_pointer] 						#LOAD GP0
OR gp0 gp1 															#OR
Load gp6 @5
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 CLL.REGISTERS 											#STORE GP0 GLOBAL RELATIVE
Store gp0 0 [gp6]
Pass 										%ifwrite_REGISTERS-0endif           
Load PC ifwrite_REGISTERS-1endif
Pass 										%ifwrite_REGISTERS-1true
Load gp6 @5
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 CLL.REGISTERS 											#LOAD GP0 GLOBAL RELATIVE
Load gp1 0 [gp6]									
Load gp0 8 [Stack_pointer] 						#LOAD GP0
OR gp0 gp1 															#OR
Load gp6 @5
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 CLL.REGISTERS 											#STORE GP0 GLOBAL RELATIVE
Store gp0 0 [gp6]
Pass 										%ifwrite_REGISTERS-1endif           
Pass										%ifwrite_REGISTERS-2endif
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
																	Scope read_word_memory
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:read_word_memory
SUB Stack_pointer @20 									#OVERHEAD FOR FUNCTION read_word_memory
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 16 [Stack_pointer] 						#STORE GP0
Load gp0 16 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @1048575
Load gp1 @1
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
Move Zero gp2 														#COMPARE (IS GREATER)
Compare gp1 gp0
if Greater then Load gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifread_word_memory-0endif
Load gp0 CLL.string13 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 16 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:print_i 												#CALLING print_i
Load gp0 CLL.string14 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Pass										%ifread_word_memory-0endif
Load gp0 @0
Store gp0 12 [Stack_pointer] 						#STORE GP0
Load gp0 @0
Store gp0 8 [Stack_pointer] 						#STORE GP0
Pass 										%loopread_word_memory-0entry 		#FOR LOOP
Load gp1 8 [Stack_pointer] 						#LOAD GP0
Load gp0 @2
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
NOT gp0
if gp0 then Load PC loopread_word_memory-0exit
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Load gp1 @8
SHL gp0 gp1 														#SHIFT LEFT
Store gp0 12 [Stack_pointer] 						#STORE GP0
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp1 16 [Stack_pointer] 						#LOAD GP0
Load gp0 8 [Stack_pointer] 						#LOAD GP0
ADD gp0 gp1 														#ADD
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @1048575
AND gp0 gp1 														#AND
Move gp0 gp6 						#PUSH gp0 POP gp6
ADD gp6 CLL.MEMORY 											#LOAD GP0 GLOBAL RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Store gp0 12 [Stack_pointer] 						#STORE GP0
Pass 										%loopread_word_memory-0continue
Load gp1 8 [Stack_pointer] 						#LOAD GP0
Load gp0 @1
ADD gp0 gp1 														#ADD
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load PC loopread_word_memory-0entry
Pass 										%loopread_word_memory-0exit
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
																	Scope store_memory
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:store_memory
SUB Stack_pointer @28 									#OVERHEAD FOR FUNCTION store_memory
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 16 [Stack_pointer] 						#STORE GP0
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 20 [Stack_pointer] 						#STORE GP0
Move Stack_pointer gp0 											#GETTING POINTER
ADD gp0 @12
Store gp0 24 [Stack_pointer] 						#STORE GP0
Load gp0 20 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @1048575
Load gp1 @3
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
Move Zero gp2 														#COMPARE (IS GREATER)
Compare gp1 gp0
if Greater then Load gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifstore_memory-0endif
Load gp0 CLL.string5 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 20 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:print_i 												#CALLING print_i
Load gp0 CLL.string6 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Pass										%ifstore_memory-0endif
Load gp1 16 [Stack_pointer] 						#LOAD GP0
Load gp0 @255
AND gp0 gp1 														#AND
AND gp0 @255 													  #CASTING INT TO CHAR
Load gp6 @3
ADD gp6 24 [Stack_pointer] 							#STORE GP0 RELATIVE (CHAR)
StoreByte gp0 0 [gp6]
Load gp0 16 [Stack_pointer] 						#LOAD GP0
Load gp1 @8
SHR gp0 gp1 														#SHIFT RIGHT
Store gp0 16 [Stack_pointer] 						#STORE GP0
Load gp1 16 [Stack_pointer] 						#LOAD GP0
Load gp0 @255
AND gp0 gp1 														#AND
AND gp0 @255 													  #CASTING INT TO CHAR
Load gp6 @2
ADD gp6 24 [Stack_pointer] 							#STORE GP0 RELATIVE (CHAR)
StoreByte gp0 0 [gp6]
Load gp0 16 [Stack_pointer] 						#LOAD GP0
Load gp1 @8
SHR gp0 gp1 														#SHIFT RIGHT
Store gp0 16 [Stack_pointer] 						#STORE GP0
Load gp1 16 [Stack_pointer] 						#LOAD GP0
Load gp0 @255
AND gp0 gp1 														#AND
AND gp0 @255 													  #CASTING INT TO CHAR
Load gp6 @1
ADD gp6 24 [Stack_pointer] 							#STORE GP0 RELATIVE (CHAR)
StoreByte gp0 0 [gp6]
Load gp0 16 [Stack_pointer] 						#LOAD GP0
Load gp1 @8
SHR gp0 gp1 														#SHIFT RIGHT
Store gp0 16 [Stack_pointer] 						#STORE GP0
Load gp1 16 [Stack_pointer] 						#LOAD GP0
Load gp0 @255
AND gp0 gp1 														#AND
AND gp0 @255 													  #CASTING INT TO CHAR
Load gp6 @0
ADD gp6 24 [Stack_pointer] 							#STORE GP0 RELATIVE (CHAR)
StoreByte gp0 0 [gp6]
Load gp0 @0
Store gp0 8 [Stack_pointer] 						#STORE GP0
Pass 										%loopstore_memory-0entry 		#FOR LOOP
Load gp1 8 [Stack_pointer] 						#LOAD GP0
Load gp0 @4
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
NOT gp0
if gp0 then Load PC loopstore_memory-0exit
Load gp6 8 [Stack_pointer] 						#LOAD GP0
ADD gp6 24 [Stack_pointer]							#LOAD GP0 RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp1 20 [Stack_pointer] 						#LOAD GP0
Load gp0 8 [Stack_pointer] 						#LOAD GP0
ADD gp0 gp1 														#ADD
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @1048575
AND gp0 gp1 														#AND
Move gp0 gp6 						#PUSH gp0 POP gp6
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
ADD gp6 CLL.MEMORY 											#STORE GP0 GLOBAL RELATIVE (CHAR)
StoreByte gp0 0 [gp6]
Pass 										%loopstore_memory-0continue
Load gp1 8 [Stack_pointer] 						#LOAD GP0
Load gp0 @1
ADD gp0 gp1 														#ADD
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load PC loopstore_memory-0entry
Pass 										%loopstore_memory-0exit
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
