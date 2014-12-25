

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

Goto main 										
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

byteArray CLL.array_of_string2 3 [49, 50, 0]
int CLL.string2 CLL.array_of_string2
byteArray CLL.array_of_string0 11 [48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 0]
int CLL.string0 CLL.array_of_string0
byteArray CLL.array_of_string1 17 [48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 65, 66, 67, 68, 69, 70, 0]
int CLL.string1 CLL.array_of_string1

																	Scope check_if_equal
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5

Move Stack_pointer previous_stack_ptr								%check_if_equal
SUB Stack_pointer @24 									#OVERHEAD FOR FUNCTION check_if_equal
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 16 [Stack_pointer] 						#STORE GP0


				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 20 [Stack_pointer] 						#STORE GP0


				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 12 [Stack_pointer] 						#STORE GP0



Load gp0 @0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 8 [Stack_pointer] 						#STORE GP0

Pass %loopcheck_if_equal0entry 											#FOR LOOP

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


				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

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


				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

NOT gp0
if gp0 then Load PC loopcheck_if_equal0exit
 									



Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


				
SUB gp7 @4 															#POP TO INDEX REGISTER
Load gp6 Expression_stack [gp7]


ADD gp6 12 [Stack_pointer]							#LOAD GP0 RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error




Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


				
SUB gp7 @4 															#POP TO INDEX REGISTER
Load gp6 Expression_stack [gp7]


ADD gp6 20 [Stack_pointer]							#LOAD GP0 RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]

Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]
NOT gp0 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifcheck_if_equal0endif

Load gp0 @0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC

Pass %ifcheck_if_equal0endif


Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load gp0 @1
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]

ADD gp0 gp1 														#ADD
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 8 [Stack_pointer] 						#STORE GP0

Load PC loopcheck_if_equal0entry
Pass %loopcheck_if_equal0exit


Load gp0 @1
 														
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

																	Scope print_hex
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5

Move Stack_pointer previous_stack_ptr								%print_hex
SUB Stack_pointer @33 									#OVERHEAD FOR FUNCTION print_hex
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 29 [Stack_pointer] 						#STORE GP0


				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 8 [Stack_pointer] 						#STORE GP0



Load gp0 CLL.string1 										#LOAD GP0 GLOBAL
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 20 [Stack_pointer] 						#STORE GP0


Move Stack_pointer gp0 											#GETTING POINTER
ADD gp0 @17
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 25 [Stack_pointer] 						#STORE GP0

Load gp0 @0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

AND gp0 @255 													  #CASTING INT TO CHAR
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error



Load gp0 @0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

				
SUB gp7 @4 															#POP TO INDEX REGISTER
Load gp6 Expression_stack [gp7]


				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

ADD gp6 25 [Stack_pointer] 							#STORE GP0 RELATIVE (CHAR)
StoreByte gp0 0 [gp6]

Load gp0 @0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

AND gp0 @255 													  #CASTING INT TO CHAR
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error



Load gp0 @1
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

				
SUB gp7 @4 															#POP TO INDEX REGISTER
Load gp6 Expression_stack [gp7]


				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

ADD gp6 25 [Stack_pointer] 							#STORE GP0 RELATIVE (CHAR)
StoreByte gp0 0 [gp6]

Load gp0 @0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

AND gp0 @255 													  #CASTING INT TO CHAR
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error



Load gp0 @2
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

				
SUB gp7 @4 															#POP TO INDEX REGISTER
Load gp6 Expression_stack [gp7]


				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

ADD gp6 25 [Stack_pointer] 							#STORE GP0 RELATIVE (CHAR)
StoreByte gp0 0 [gp6]


Load gp0 @0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 12 [Stack_pointer] 						#STORE GP0

Pass %loopprint_hex0entry 											#FOR LOOP

Load gp0 12 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Load gp0 29 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

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


				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

NOT gp0
if gp0 then Load PC loopprint_hex0exit



Load gp0 12 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


				
SUB gp7 @4 															#POP TO INDEX REGISTER
Load gp6 Expression_stack [gp7]


ADD gp6 8 [Stack_pointer]							#LOAD GP0 RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load gp0 @4
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

AND gp0 @255 													  #CASTING INT TO CHAR
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error



SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

AND gp0 @255 														#SHIFT RIGHT (CHARS)
SHR gp0 gp1
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

StoreByte gp0 16 [Stack_pointer] 					#STORE GP0 (CHAR)




Load gp0 12 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


				
SUB gp7 @4 															#POP TO INDEX REGISTER
Load gp6 Expression_stack [gp7]


ADD gp6 8 [Stack_pointer]							#LOAD GP0 RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load gp0 @15
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

AND gp0 @255 													  #CASTING INT TO CHAR
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]

AND gp0 gp1 														#AND (CHARS)
AND gp0 @255
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

StoreByte gp0 24 [Stack_pointer] 					#STORE GP0 (CHAR)




LoadByte gp0 16 [Stack_pointer] 					#LOAD GP0 (CHAR)
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


				
SUB gp7 @4 															#POP TO INDEX REGISTER
Load gp6 Expression_stack [gp7]


ADD gp6 20 [Stack_pointer]							#LOAD GP0 RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error



Load gp0 @0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

				
SUB gp7 @4 															#POP TO INDEX REGISTER
Load gp6 Expression_stack [gp7]


				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

ADD gp6 25 [Stack_pointer] 							#STORE GP0 RELATIVE (CHAR)
StoreByte gp0 0 [gp6]




LoadByte gp0 24 [Stack_pointer] 					#LOAD GP0 (CHAR)
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


				
SUB gp7 @4 															#POP TO INDEX REGISTER
Load gp6 Expression_stack [gp7]


ADD gp6 20 [Stack_pointer]							#LOAD GP0 RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error



Load gp0 @1
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

				
SUB gp7 @4 															#POP TO INDEX REGISTER
Load gp6 Expression_stack [gp7]


				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

ADD gp6 25 [Stack_pointer] 							#STORE GP0 RELATIVE (CHAR)
StoreByte gp0 0 [gp6]



Load gp0 25 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Goto printf 												#CALLING printf


Load gp0 12 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load gp0 @1
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]

ADD gp0 gp1 														#ADD
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 12 [Stack_pointer] 						#STORE GP0

Load PC loopprint_hex0entry
Pass %loopprint_hex0exit



Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
################## built in function char ##############################################

SUB gp7 @4 		 		 %char									#Pops into gp0
Load gp0 Expression_stack [gp7]  				
AND gp0 @255
Store gp0 Expression_stack [gp7] 
ADD gp7 @4
Move Jump PC  			#reads new top of stack from the stack frame
#######################################################################################

																	Scope int_to_string
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5

Move Stack_pointer previous_stack_ptr								%int_to_string
SUB Stack_pointer @46 									#OVERHEAD FOR FUNCTION int_to_string
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 28 [Stack_pointer] 						#STORE GP0


				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 20 [Stack_pointer] 						#STORE GP0



Load gp0 CLL.string0 										#LOAD GP0 GLOBAL
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 24 [Stack_pointer] 						#STORE GP0


Move Stack_pointer gp0 											#GETTING POINTER
ADD gp0 @36
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 8 [Stack_pointer] 						#STORE GP0

Load gp0 @0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 16 [Stack_pointer] 						#STORE GP0



Load gp0 20 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 20 [Stack_pointer] 						#STORE GP0

Pass %loopint_to_string0entry 											#FOR LOOP

Load gp0 20 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load gp0 @0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]

Move Zero gp2 														#COMPARE (IS GREATER)
Compare gp1 gp0
if Greater then Load gp2 @4294967295
Move gp2 gp0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

NOT gp0
if gp0 then Load PC loopint_to_string0exit

Load gp0 20 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load gp0 @10
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

DIV gp0 gp1 														#DIVIDE
if DivByZero then Load PC DIV_BY_ZERO
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 32 [Stack_pointer] 						#STORE GP0


Load gp0 32 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

AND gp0 @255 													  #CASTING INT TO CHAR
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error




Load gp0 16 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


				
SUB gp7 @4 															#POP TO INDEX REGISTER
Load gp6 Expression_stack [gp7]


				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

ADD gp6 8 [Stack_pointer] 							#STORE GP0 RELATIVE (CHAR)
StoreByte gp0 0 [gp6]


Load gp0 16 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load gp0 @1
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]

ADD gp0 gp1 														#ADD
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 16 [Stack_pointer] 						#STORE GP0


Load gp0 20 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load gp0 @10
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

DIV gp0 gp1 														#DIVIDE
if DivByZero then Load PC DIV_BY_ZERO
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 20 [Stack_pointer] 						#STORE GP0

Load PC loopint_to_string0entry
Pass %loopint_to_string0exit


Pass %loopint_to_string1entry

Load gp0 16 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load gp0 @0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]

Move Zero gp2 														#COMPARE (IS GREATER)
Compare gp1 gp0
if Greater then Load gp2 @4294967295
Move gp2 gp0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

									
				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

NOT gp0
if gp0 then Load PC loopint_to_string1exit 								#WHILE LOOP

Load gp0 16 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load gp0 @1
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 16 [Stack_pointer] 						#STORE GP0






Load gp0 16 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


				
SUB gp7 @4 															#POP TO INDEX REGISTER
Load gp6 Expression_stack [gp7]


ADD gp6 8 [Stack_pointer]							#LOAD GP0 RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


				
SUB gp7 @4 															#POP TO INDEX REGISTER
Load gp6 Expression_stack [gp7]


ADD gp6 24 [Stack_pointer]							#LOAD GP0 RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error




Load gp0 12 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


				
SUB gp7 @4 															#POP TO INDEX REGISTER
Load gp6 Expression_stack [gp7]


				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

ADD gp6 28 [Stack_pointer] 							#STORE GP0 RELATIVE (CHAR)
StoreByte gp0 0 [gp6]


Load gp0 12 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load gp0 @1
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]

ADD gp0 gp1 														#ADD
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 12 [Stack_pointer] 						#STORE GP0

Load PC loopint_to_string1entry
Pass %loopint_to_string1exit



Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC

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
																	Scope main
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5

Move Stack_pointer previous_stack_ptr								%main
SUB Stack_pointer @26 									#OVERHEAD FOR FUNCTION main
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]


Load gp0 CLL.string2 										#LOAD GP0 GLOBAL
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 22 [Stack_pointer] 						#STORE GP0




Load gp0 22 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Goto string_to_int 												#CALLING string_to_int

Goto print_i 												#CALLING print_i


Move Stack_pointer gp0 											#GETTING POINTER
ADD gp0 @12
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 8 [Stack_pointer] 						#STORE GP0


Load gp0 @123
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Goto int_to_string 												#CALLING int_to_string



Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Goto printf 												#CALLING printf



Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC

																	Scope string_to_int
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5

Move Stack_pointer previous_stack_ptr								%string_to_int
SUB Stack_pointer @20 									#OVERHEAD FOR FUNCTION string_to_int
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 16 [Stack_pointer] 						#STORE GP0


Load gp0 @0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 12 [Stack_pointer] 						#STORE GP0


Load gp0 @0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 8 [Stack_pointer] 						#STORE GP0

Pass %loopstring_to_int0entry 											#FOR LOOP



Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


				
SUB gp7 @4 															#POP TO INDEX REGISTER
Load gp6 Expression_stack [gp7]


ADD gp6 16 [Stack_pointer]							#LOAD GP0 RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

NOT gp0
if gp0 then Load PC loopstring_to_int0exit

Load gp0 12 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load gp0 @10
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]

MUL gp0 gp1 														#MULTIPLY
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error




Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


				
SUB gp7 @4 															#POP TO INDEX REGISTER
Load gp6 Expression_stack [gp7]


ADD gp6 16 [Stack_pointer]							#LOAD GP0 RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load gp0 @48
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

AND gp0 @255 													  #CASTING INT TO CHAR
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error



SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

AND gp0 @255 														#SUBTRACT (CHARS)
AND gp1 @255
SUB gp0 gp1
AND gp0 @255
Load Flags_reset @4294967287  
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]

ADD gp0 gp1 														#ADD
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 12 [Stack_pointer] 						#STORE GP0


Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load gp0 @1
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]

ADD gp0 gp1 														#ADD
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 8 [Stack_pointer] 						#STORE GP0

Load PC loopstring_to_int0entry
Pass %loopstring_to_int0exit



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
