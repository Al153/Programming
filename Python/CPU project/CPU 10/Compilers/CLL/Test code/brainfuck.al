

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

byteArray CLL.array_of_string5 21 [69, 82, 82, 79, 82, 58, 32, 117, 110, 109, 97, 116, 99, 104, 101, 100, 32, 93, 32, 10, 0]
int CLL.string5 CLL.array_of_string5
array CLL.array_of_jump_lookup 65536 []
int CLL.jump_lookup CLL.array_of_jump_lookup
byteArray CLL.array_of_string6 21 [69, 82, 82, 79, 82, 58, 32, 117, 110, 109, 97, 116, 99, 104, 101, 100, 32, 91, 32, 10, 0]
int CLL.string6 CLL.array_of_string6
byteArray CLL.array_of_data_array 65536 []
int CLL.data_array CLL.array_of_data_array
byteArray CLL.array_of_string4 28 [69, 82, 82, 79, 82, 58, 32, 106, 117, 109, 112, 32, 115, 116, 97, 99, 107, 32, 111, 118, 101, 114, 102, 108, 111, 119, 10, 0]
int CLL.string4 CLL.array_of_string4
byteArray CLL.array_of_program_array 65536 []
int CLL.program_array CLL.array_of_program_array
byteArray CLL.array_of_string2 37 [80, 108, 101, 97, 115, 101, 32, 101, 110, 116, 101, 114, 32, 121, 111, 117, 114, 32, 98, 114, 97, 105, 110, 102, 42, 42, 42, 32, 112, 114, 111, 103, 114, 97, 109, 10, 0]
int CLL.string2 CLL.array_of_string2
byteArray CLL.array_of_string3 24 [10, 10, 99, 114, 101, 97, 116, 101, 100, 32, 106, 117, 109, 112, 32, 108, 111, 111, 107, 117, 112, 10, 10, 0]
int CLL.string3 CLL.array_of_string3
byteArray CLL.array_of_string0 11 [48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 0]
int CLL.string0 CLL.array_of_string0
byteArray CLL.array_of_string1 17 [48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 65, 66, 67, 68, 69, 70, 0]
int CLL.string1 CLL.array_of_string1
Halt %function:quit
########################## PUTC (char) ########################################
SUB gp7 @4 															%function:putc
Load gp0  Expression_stack [gp7]
Out gp0
Move Jump PC
################################################################################










																	Scope check_if_equal
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5

Move Stack_pointer previous_stack_ptr								%function:check_if_equal
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
 														

Store gp0 8 [Stack_pointer] 						#STORE GP0

Pass 										%loopcheck_if_equal-0entry 		#FOR LOOP

Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Load gp0 16 [Stack_pointer] 						#LOAD GP0
 														

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
if gp0 then Load PC loopcheck_if_equal-0exit
 									



Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 

ADD gp6 12 [Stack_pointer]							#LOAD GP0 RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error




Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 

ADD gp6 20 [Stack_pointer]							#LOAD GP0 RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
 														

SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]

Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
 														
NOT gp0 														

NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifcheck_if_equal-0endif

Load gp0 @0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC

Pass										%ifcheck_if_equal-0endif

Pass 										%loopcheck_if_equal-0continue

Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load gp0 @1
 														

SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]

ADD gp0 gp1 														#ADD
 														

Store gp0 8 [Stack_pointer] 						#STORE GP0
								
Load PC loopcheck_if_equal-0entry
Pass 										%loopcheck_if_equal-0exit


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











																	Scope interp
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5

Move Stack_pointer previous_stack_ptr								%function:interp
SUB Stack_pointer @29 									#OVERHEAD FOR FUNCTION interp
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 25 [Stack_pointer] 						#STORE GP0


				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 20 [Stack_pointer] 						#STORE GP0


				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 16 [Stack_pointer] 						#STORE GP0


Load gp0 @0
 														

Store gp0 8 [Stack_pointer] 						#STORE GP0

Load gp0 @0
 														

Store gp0 12 [Stack_pointer] 						#STORE GP0

Load gp0 @0
 														

AND gp0 @255 													  #CASTING INT TO CHAR
 														

StoreByte gp0 24 [Stack_pointer] 					#STORE GP0 (CHAR)


Pass 										%loopinterp-0entry
Load gp0 @1
 														

if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

									
				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

NOT gp0
if gp0 then Load PC loopinterp-0exit 								#WHILE LOOP



Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 

ADD gp6 16 [Stack_pointer]							#LOAD GP0 RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
 														

StoreByte gp0 24 [Stack_pointer] 					#STORE GP0 (CHAR)



LoadByte gp0 24 [Stack_pointer] 					#LOAD GP0 (CHAR)
 														

if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
 														

if gp0 then Load PC ifinterp-10true 									#IF ELSE STATEMENT
Load PC loopinterp-0exit

Load PC ifinterp-10endif
Pass 										%ifinterp-10true


LoadByte gp0 24 [Stack_pointer] 					#LOAD GP0 (CHAR)
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load gp0 @43
 														

SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]

Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
 														

if gp0 then Load PC ifinterp-9true 									#IF ELSE STATEMENT


LoadByte gp0 24 [Stack_pointer] 					#LOAD GP0 (CHAR)
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load gp0 @45
 														

SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]

Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
 														

if gp0 then Load PC ifinterp-8true 									#IF ELSE STATEMENT


LoadByte gp0 24 [Stack_pointer] 					#LOAD GP0 (CHAR)
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load gp0 @60
 														

SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]

Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
 														

if gp0 then Load PC ifinterp-7true 									#IF ELSE STATEMENT


LoadByte gp0 24 [Stack_pointer] 					#LOAD GP0 (CHAR)
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load gp0 @62
 														

SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]

Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
 														

if gp0 then Load PC ifinterp-6true 									#IF ELSE STATEMENT


LoadByte gp0 24 [Stack_pointer] 					#LOAD GP0 (CHAR)
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load gp0 @91
 														

SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]

Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
 														

if gp0 then Load PC ifinterp-5true 									#IF ELSE STATEMENT


LoadByte gp0 24 [Stack_pointer] 					#LOAD GP0 (CHAR)
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load gp0 @93
 														

SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]

Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
 														

if gp0 then Load PC ifinterp-4true 									#IF ELSE STATEMENT


LoadByte gp0 24 [Stack_pointer] 					#LOAD GP0 (CHAR)
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load gp0 @46
 														

SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]

Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
 														

if gp0 then Load PC ifinterp-3true 									#IF ELSE STATEMENT
 									

LoadByte gp0 24 [Stack_pointer] 					#LOAD GP0 (CHAR)
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load gp0 @44
 														

SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]

Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
 														

NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifinterp-2endif


Goto function:getw 												#CALLING getw



Load gp0 12 [Stack_pointer] 						#LOAD GP0
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

ADD gp6 20 [Stack_pointer] 							#STORE GP0 RELATIVE (CHAR)
StoreByte gp0 0 [gp6]

Pass										%ifinterp-2endif

Load PC ifinterp-3endif
Pass 										%ifinterp-3true




Load gp0 12 [Stack_pointer] 						#LOAD GP0
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 

ADD gp6 20 [Stack_pointer]							#LOAD GP0 RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Goto function:putc 												#CALLING putc
 
Pass 										%ifinterp-3endif           

Load PC ifinterp-4endif
Pass 										%ifinterp-4true
 									



Load gp0 12 [Stack_pointer] 						#LOAD GP0
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 

ADD gp6 20 [Stack_pointer]							#LOAD GP0 RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
 														

if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
 														

NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifinterp-1endif



Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

ADD gp6 25 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
 														

Store gp0 8 [Stack_pointer] 						#STORE GP0

Pass										%ifinterp-1endif
 
Pass 										%ifinterp-4endif           

Load PC ifinterp-5endif
Pass 										%ifinterp-5true




Load gp0 12 [Stack_pointer] 						#LOAD GP0
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 

ADD gp6 20 [Stack_pointer]							#LOAD GP0 RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
 														

if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
 														

if gp0 then Load PC ifinterp-0true 									#IF ELSE STATEMENT



Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

ADD gp6 25 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
 														

Store gp0 8 [Stack_pointer] 						#STORE GP0

Load PC ifinterp-0endif
Pass 										%ifinterp-0true
 
Pass 										%ifinterp-0endif           
 
Pass 										%ifinterp-5endif           

Load PC ifinterp-6endif
Pass 										%ifinterp-6true

Load gp0 12 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load gp0 @1
 														

SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]

ADD gp0 gp1 														#ADD
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load gp0 @65535
 														

SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]

AND gp0 gp1 														#AND
 														

Store gp0 12 [Stack_pointer] 						#STORE GP0
 
Pass 										%ifinterp-6endif           

Load PC ifinterp-7endif
Pass 										%ifinterp-7true

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

Load gp0 @65535
 														

SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]

AND gp0 gp1 														#AND
 														

Store gp0 12 [Stack_pointer] 						#STORE GP0
 
Pass 										%ifinterp-7endif           

Load PC ifinterp-8endif
Pass 										%ifinterp-8true



Load gp0 12 [Stack_pointer] 						#LOAD GP0
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 

ADD gp6 20 [Stack_pointer]							#LOAD GP0 RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load gp0 @1
 														

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




Load gp0 12 [Stack_pointer] 						#LOAD GP0
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

ADD gp6 20 [Stack_pointer] 							#STORE GP0 RELATIVE (CHAR)
StoreByte gp0 0 [gp6]
 
Pass 										%ifinterp-8endif           

Load PC ifinterp-9endif
Pass 										%ifinterp-9true



Load gp0 12 [Stack_pointer] 						#LOAD GP0
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 

ADD gp6 20 [Stack_pointer]							#LOAD GP0 RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load gp0 @1
 														

AND gp0 @255 													  #CASTING INT TO CHAR
 														

SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]

ADD gp0 gp1 														#ADD (CHARS)
AND gp0 @255
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error




Load gp0 12 [Stack_pointer] 						#LOAD GP0
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

ADD gp6 20 [Stack_pointer] 							#STORE GP0 RELATIVE (CHAR)
StoreByte gp0 0 [gp6]
 
Pass 										%ifinterp-9endif           
 
Pass 										%ifinterp-10endif           


Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load gp0 @1
 														

SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]

ADD gp0 gp1 														#ADD
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load gp0 @65535
 														

SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]

AND gp0 gp1 														#AND
 														

Store gp0 8 [Stack_pointer] 						#STORE GP0

Load PC loopinterp-0entry					%loopinterp-0continue
Pass 										%loopinterp-0exit



Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
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










																	Scope in_echo
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5

Move Stack_pointer previous_stack_ptr								%function:in_echo
SUB Stack_pointer @17 									#OVERHEAD FOR FUNCTION in_echo
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 12 [Stack_pointer] 						#STORE GP0


Load gp0 @0
 														

Store gp0 8 [Stack_pointer] 						#STORE GP0


Pass 										%loopin_echo-0entry
Load gp0 @1
 														

if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

									
				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

NOT gp0
if gp0 then Load PC loopin_echo-0exit 								#WHILE LOOP


Goto function:getw 												#CALLING getw

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

StoreByte gp0 16 [Stack_pointer] 					#STORE GP0 (CHAR)



LoadByte gp0 16 [Stack_pointer] 					#LOAD GP0 (CHAR)
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Goto function:putc 												#CALLING putc



LoadByte gp0 16 [Stack_pointer] 					#LOAD GP0 (CHAR)
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load gp0 @13
 														

SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]

Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
 														

if gp0 then Load PC ifin_echo-0true 									#IF ELSE STATEMENT

LoadByte gp0 16 [Stack_pointer] 					#LOAD GP0 (CHAR)
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error




Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

ADD gp6 12 [Stack_pointer] 							#STORE GP0 RELATIVE (CHAR)
StoreByte gp0 0 [gp6]


Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load gp0 @1
 														

SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]

ADD gp0 gp1 														#ADD
 														

Store gp0 8 [Stack_pointer] 						#STORE GP0

Load PC ifin_echo-0endif
Pass 										%ifin_echo-0true
Load gp0 @0
 														

AND gp0 @255 													  #CASTING INT TO CHAR
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error




Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

ADD gp6 12 [Stack_pointer] 							#STORE GP0 RELATIVE (CHAR)
StoreByte gp0 0 [gp6]

Load PC loopin_echo-0exit
 
Pass 										%ifin_echo-0endif           

Load PC loopin_echo-0entry					%loopin_echo-0continue
Pass 										%loopin_echo-0exit



Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC











																	Scope strcat
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5

Move Stack_pointer previous_stack_ptr								%function:strcat
SUB Stack_pointer @24 									#OVERHEAD FOR FUNCTION strcat
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 12 [Stack_pointer] 						#STORE GP0


				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 20 [Stack_pointer] 						#STORE GP0


Load gp0 @0
 														

Store gp0 8 [Stack_pointer] 						#STORE GP0

Load gp0 @0
 														

Store gp0 16 [Stack_pointer] 						#STORE GP0


Pass 										%loopstrcat-0entry
Load gp0 @1
 														

if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

									
				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

NOT gp0
if gp0 then Load PC loopstrcat-0exit 								#WHILE LOOP




Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 

ADD gp6 20 [Stack_pointer]							#LOAD GP0 RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
 														

if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
 														

if gp0 then Load PC ifstrcat-0true 									#IF ELSE STATEMENT


Load gp0 20 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														

SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]

ADD gp0 gp1 														#ADD
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Load gp0 12 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Goto function:strcpy 												#CALLING strcpy

Load PC loopstrcat-0exit

Load PC ifstrcat-0endif
Pass 										%ifstrcat-0true
 
Pass 										%ifstrcat-0endif           


Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load gp0 @1
 														

SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]

ADD gp0 gp1 														#ADD
 														

Store gp0 8 [Stack_pointer] 						#STORE GP0

Load PC loopstrcat-0entry					%loopstrcat-0continue
Pass 										%loopstrcat-0exit



Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC











																	Scope print_hex
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5

Move Stack_pointer previous_stack_ptr								%function:print_hex
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
 														

Store gp0 20 [Stack_pointer] 						#STORE GP0


Move Stack_pointer gp0 											#GETTING POINTER
ADD gp0 @17
 														

Store gp0 25 [Stack_pointer] 						#STORE GP0

Load gp0 @0
 														

AND gp0 @255 													  #CASTING INT TO CHAR
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error



Load gp0 @0
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

ADD gp6 25 [Stack_pointer] 							#STORE GP0 RELATIVE (CHAR)
StoreByte gp0 0 [gp6]

Load gp0 @0
 														

AND gp0 @255 													  #CASTING INT TO CHAR
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error



Load gp0 @1
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

ADD gp6 25 [Stack_pointer] 							#STORE GP0 RELATIVE (CHAR)
StoreByte gp0 0 [gp6]

Load gp0 @0
 														

AND gp0 @255 													  #CASTING INT TO CHAR
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error



Load gp0 @2
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

ADD gp6 25 [Stack_pointer] 							#STORE GP0 RELATIVE (CHAR)
StoreByte gp0 0 [gp6]


Load gp0 @0
 														

Store gp0 12 [Stack_pointer] 						#STORE GP0

Pass 										%loopprint_hex-0entry 		#FOR LOOP

Load gp0 12 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Load gp0 29 [Stack_pointer] 						#LOAD GP0
 														

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
if gp0 then Load PC loopprint_hex-0exit



Load gp0 12 [Stack_pointer] 						#LOAD GP0
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 

ADD gp6 8 [Stack_pointer]							#LOAD GP0 RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load gp0 @4
 														

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
 														

StoreByte gp0 16 [Stack_pointer] 					#STORE GP0 (CHAR)




Load gp0 12 [Stack_pointer] 						#LOAD GP0
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 

ADD gp6 8 [Stack_pointer]							#LOAD GP0 RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
 														
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
 														

StoreByte gp0 24 [Stack_pointer] 					#STORE GP0 (CHAR)




LoadByte gp0 16 [Stack_pointer] 					#LOAD GP0 (CHAR)
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 

ADD gp6 20 [Stack_pointer]							#LOAD GP0 RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error



Load gp0 @0
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

ADD gp6 25 [Stack_pointer] 							#STORE GP0 RELATIVE (CHAR)
StoreByte gp0 0 [gp6]




LoadByte gp0 24 [Stack_pointer] 					#LOAD GP0 (CHAR)
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 

ADD gp6 20 [Stack_pointer]							#LOAD GP0 RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error



Load gp0 @1
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

ADD gp6 25 [Stack_pointer] 							#STORE GP0 RELATIVE (CHAR)
StoreByte gp0 0 [gp6]



Load gp0 25 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Goto function:printf 												#CALLING printf

Pass 										%loopprint_hex-0continue

Load gp0 12 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load gp0 @1
 														

SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]

ADD gp0 gp1 														#ADD
 														

Store gp0 12 [Stack_pointer] 						#STORE GP0
								
Load PC loopprint_hex-0entry
Pass 										%loopprint_hex-0exit



Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC











																	Scope printf_CLL
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5

Move Stack_pointer previous_stack_ptr								%function:printf_CLL
SUB Stack_pointer @17 									#OVERHEAD FOR FUNCTION printf_CLL
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 12 [Stack_pointer] 						#STORE GP0


Load gp0 @0
 														

Store gp0 8 [Stack_pointer] 						#STORE GP0


Pass 										%loopprintf_CLL-0entry
Load gp0 @1
 														

if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

									
				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

NOT gp0
if gp0 then Load PC loopprintf_CLL-0exit 								#WHILE LOOP



Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 

ADD gp6 12 [Stack_pointer]							#LOAD GP0 RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
 														

StoreByte gp0 16 [Stack_pointer] 					#STORE GP0 (CHAR)



LoadByte gp0 16 [Stack_pointer] 					#LOAD GP0 (CHAR)
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Goto function:putc 												#CALLING putc

 									

LoadByte gp0 16 [Stack_pointer] 					#LOAD GP0 (CHAR)
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load gp0 @0
 														

SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]

Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
 														

NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifprintf_CLL-0endif
Load PC loopprintf_CLL-0exit

Pass										%ifprintf_CLL-0endif


Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load gp0 @1
 														

SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]

ADD gp0 gp1 														#ADD
 														

Store gp0 8 [Stack_pointer] 						#STORE GP0

Load PC loopprintf_CLL-0entry					%loopprintf_CLL-0continue
Pass 										%loopprintf_CLL-0exit



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
Move Jump PC  			#reads new top of stack from the stack frame
#######################################################################################
##################### GETC ###############################################
#returns a char
In gp0 function:getc #gets a char without waiting (state of keyboard)
Store gp0 Expression_stack [gp7]
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Move Jump PC
##########################################################################










																	Scope strcpy
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5

Move Stack_pointer previous_stack_ptr								%function:strcpy
SUB Stack_pointer @20 									#OVERHEAD FOR FUNCTION strcpy
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 12 [Stack_pointer] 						#STORE GP0


				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 16 [Stack_pointer] 						#STORE GP0


Load gp0 @0
 														

Store gp0 8 [Stack_pointer] 						#STORE GP0


Pass 										%loopstrcpy-0entry
Load gp0 @1
 														

if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

									
				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

NOT gp0
if gp0 then Load PC loopstrcpy-0exit 								#WHILE LOOP



Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 

ADD gp6 12 [Stack_pointer]							#LOAD GP0 RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error




Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

ADD gp6 16 [Stack_pointer] 							#STORE GP0 RELATIVE (CHAR)
StoreByte gp0 0 [gp6]

 									



Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 

ADD gp6 12 [Stack_pointer]							#LOAD GP0 RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
 														

if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
 														
NOT gp0 														

NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifstrcpy-0endif
Load PC loopstrcpy-0exit

Pass										%ifstrcpy-0endif


Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load gp0 @1
 														

SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]

ADD gp0 gp1 														#ADD
 														

Store gp0 8 [Stack_pointer] 						#STORE GP0

Load PC loopstrcpy-0entry					%loopstrcpy-0continue
Pass 										%loopstrcpy-0exit



Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC











																	Scope get_bf_input
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5

Move Stack_pointer previous_stack_ptr								%function:get_bf_input
SUB Stack_pointer @21 									#OVERHEAD FOR FUNCTION get_bf_input
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 17 [Stack_pointer] 						#STORE GP0


Load gp0 @0
 														

Store gp0 13 [Stack_pointer] 						#STORE GP0

Load gp0 @0
 														

Store gp0 8 [Stack_pointer] 						#STORE GP0


Pass 										%loopget_bf_input-0entry
Load gp0 @1
 														

if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

									
				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

NOT gp0
if gp0 then Load PC loopget_bf_input-0exit 								#WHILE LOOP


Goto function:getw 												#CALLING getw

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

StoreByte gp0 12 [Stack_pointer] 					#STORE GP0 (CHAR)



LoadByte gp0 12 [Stack_pointer] 					#LOAD GP0 (CHAR)
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Goto function:putc 												#CALLING putc


LoadByte gp0 12 [Stack_pointer] 					#LOAD GP0 (CHAR)
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error




Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

ADD gp6 17 [Stack_pointer] 							#STORE GP0 RELATIVE (CHAR)
StoreByte gp0 0 [gp6]


Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load gp0 @1
 														

SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]

ADD gp0 gp1 														#ADD
 														

Store gp0 8 [Stack_pointer] 						#STORE GP0



Load gp0 13 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load gp0 @0
 														

SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]

Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
 														

if gp0 then Load PC ifget_bf_input-4true 									#IF ELSE STATEMENT


Load gp0 13 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load gp0 @1
 														

SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]

Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
 														

if gp0 then Load PC ifget_bf_input-3true 									#IF ELSE STATEMENT


LoadByte gp0 12 [Stack_pointer] 					#LOAD GP0 (CHAR)
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load gp0 @68
 														

SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]

Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
 														

if gp0 then Load PC ifget_bf_input-2true 									#IF ELSE STATEMENT
Load gp0 @0
 														

Store gp0 13 [Stack_pointer] 						#STORE GP0

Load PC ifget_bf_input-2endif
Pass 										%ifget_bf_input-2true
Load PC loopget_bf_input-0exit
 
Pass 										%ifget_bf_input-2endif           

Load PC ifget_bf_input-3endif
Pass 										%ifget_bf_input-3true


LoadByte gp0 12 [Stack_pointer] 					#LOAD GP0 (CHAR)
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load gp0 @78
 														

SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]

Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
 														

if gp0 then Load PC ifget_bf_input-1true 									#IF ELSE STATEMENT
Load gp0 @0
 														

Store gp0 13 [Stack_pointer] 						#STORE GP0

Load PC ifget_bf_input-1endif
Pass 										%ifget_bf_input-1true
Load gp0 @2
 														

Store gp0 13 [Stack_pointer] 						#STORE GP0
 
Pass 										%ifget_bf_input-1endif           
 
Pass 										%ifget_bf_input-3endif           

Load PC ifget_bf_input-4endif
Pass 										%ifget_bf_input-4true
 									

LoadByte gp0 12 [Stack_pointer] 					#LOAD GP0 (CHAR)
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load gp0 @69
 														

SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]

Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
 														

NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifget_bf_input-0endif
Load gp0 @1
 														

Store gp0 13 [Stack_pointer] 						#STORE GP0

Pass										%ifget_bf_input-0endif
 
Pass 										%ifget_bf_input-4endif           

Load PC loopget_bf_input-0entry					%loopget_bf_input-0continue
Pass 										%loopget_bf_input-0exit



Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC











																	Scope int_to_string
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5

Move Stack_pointer previous_stack_ptr								%function:int_to_string
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
 														

Store gp0 24 [Stack_pointer] 						#STORE GP0


Move Stack_pointer gp0 											#GETTING POINTER
ADD gp0 @36
 														

Store gp0 8 [Stack_pointer] 						#STORE GP0

Load gp0 @0
 														

Store gp0 16 [Stack_pointer] 						#STORE GP0



Load gp0 20 [Stack_pointer] 						#LOAD GP0
 														

Store gp0 20 [Stack_pointer] 						#STORE GP0

Pass 										%loopint_to_string-0entry 		#FOR LOOP

Load gp0 20 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load gp0 @0
 														

SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]

Move Zero gp2 														#COMPARE (IS GREATER)
Compare gp1 gp0
if Greater then Load gp2 @4294967295
Move gp2 gp0
 														

NOT gp0
if gp0 then Load PC loopint_to_string-0exit

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
 														

Store gp0 32 [Stack_pointer] 						#STORE GP0


Load gp0 32 [Stack_pointer] 						#LOAD GP0
 														

AND gp0 @255 													  #CASTING INT TO CHAR
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error




Load gp0 16 [Stack_pointer] 						#LOAD GP0
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 

				
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
 														

SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]

ADD gp0 gp1 														#ADD
 														

Store gp0 16 [Stack_pointer] 						#STORE GP0

Pass 										%loopint_to_string-0continue

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
 														

Store gp0 20 [Stack_pointer] 						#STORE GP0
								
Load PC loopint_to_string-0entry
Pass 										%loopint_to_string-0exit


Pass 										%loopint_to_string-1entry

Load gp0 16 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load gp0 @0
 														

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
if gp0 then Load PC loopint_to_string-1exit 								#WHILE LOOP

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
 														

Store gp0 16 [Stack_pointer] 						#STORE GP0






Load gp0 16 [Stack_pointer] 						#LOAD GP0
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 

ADD gp6 8 [Stack_pointer]							#LOAD GP0 RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 

ADD gp6 24 [Stack_pointer]							#LOAD GP0 RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error




Load gp0 12 [Stack_pointer] 						#LOAD GP0
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 

				
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
 														

SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]

ADD gp0 gp1 														#ADD
 														

Store gp0 12 [Stack_pointer] 						#STORE GP0

Load PC loopint_to_string-1entry					%loopint_to_string-1continue
Pass 										%loopint_to_string-1exit



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












																	Scope in
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5

Move Stack_pointer previous_stack_ptr								%function:in
SUB Stack_pointer @17 									#OVERHEAD FOR FUNCTION in
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 12 [Stack_pointer] 						#STORE GP0


Load gp0 @0
 														

Store gp0 8 [Stack_pointer] 						#STORE GP0


Pass 										%loopin-0entry
Load gp0 @1
 														

if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

									
				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

NOT gp0
if gp0 then Load PC loopin-0exit 								#WHILE LOOP


Goto function:getw 												#CALLING getw

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

StoreByte gp0 16 [Stack_pointer] 					#STORE GP0 (CHAR)



LoadByte gp0 16 [Stack_pointer] 					#LOAD GP0 (CHAR)
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load gp0 @10
 														

SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]

Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
 														

if gp0 then Load PC ifin-0true 									#IF ELSE STATEMENT

LoadByte gp0 16 [Stack_pointer] 					#LOAD GP0 (CHAR)
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error




Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

ADD gp6 12 [Stack_pointer] 							#STORE GP0 RELATIVE (CHAR)
StoreByte gp0 0 [gp6]


Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load gp0 @1
 														

SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]

ADD gp0 gp1 														#ADD
 														

Store gp0 8 [Stack_pointer] 						#STORE GP0

Load PC ifin-0endif
Pass 										%ifin-0true
Load gp0 @0
 														

AND gp0 @255 													  #CASTING INT TO CHAR
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error




Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

ADD gp6 12 [Stack_pointer] 							#STORE GP0 RELATIVE (CHAR)
StoreByte gp0 0 [gp6]

Load PC loopin-0exit
 
Pass 										%ifin-0endif           

Load PC loopin-0entry					%loopin-0continue
Pass 										%loopin-0exit



Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC











																	Scope get_response
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5

Move Stack_pointer previous_stack_ptr								%function:get_response
SUB Stack_pointer @16 									#OVERHEAD FOR FUNCTION get_response
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 12 [Stack_pointer] 						#STORE GP0


				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 8 [Stack_pointer] 						#STORE GP0




Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														
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


Goto function:in_echo 												#CALLING in_echo



Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC











																	Scope main
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5

Move Stack_pointer previous_stack_ptr								%function:main
SUB Stack_pointer @8 									#OVERHEAD FOR FUNCTION main
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]



Load gp0 CLL.string2 										#LOAD GP0 GLOBAL
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Goto function:printf 												#CALLING printf



Load gp0 CLL.program_array 										#LOAD GP0 GLOBAL
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Goto function:get_bf_input 												#CALLING get_bf_input



Load gp0 CLL.program_array 										#LOAD GP0 GLOBAL
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Load gp0 CLL.jump_lookup 										#LOAD GP0 GLOBAL
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Goto function:init_jump_lookup 												#CALLING init_jump_lookup



Load gp0 CLL.string3 										#LOAD GP0 GLOBAL
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Goto function:printf 												#CALLING printf



Load gp0 CLL.program_array 										#LOAD GP0 GLOBAL
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Load gp0 CLL.data_array 										#LOAD GP0 GLOBAL
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Load gp0 CLL.jump_lookup 										#LOAD GP0 GLOBAL
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Goto function:interp 												#CALLING interp



Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC











																	Scope init_jump_lookup
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5

Move Stack_pointer previous_stack_ptr								%function:init_jump_lookup
SUB Stack_pointer @40028 									#OVERHEAD FOR FUNCTION init_jump_lookup
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 40024 [Stack_pointer] 						#STORE GP0


				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 8 [Stack_pointer] 						#STORE GP0


Load gp0 @0
 														

Store gp0 40012 [Stack_pointer] 						#STORE GP0

Load gp0 @0
 														

Store gp0 40020 [Stack_pointer] 						#STORE GP0


Move Stack_pointer gp0 											#GETTING POINTER
ADD gp0 @12
 														

Store gp0 40016 [Stack_pointer] 						#STORE GP0


Pass 										%loopinit_jump_lookup-0entry
Load gp0 @1
 														

if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

									
				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

NOT gp0
if gp0 then Load PC loopinit_jump_lookup-0exit 								#WHILE LOOP




Load gp0 40012 [Stack_pointer] 						#LOAD GP0
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 

ADD gp6 8 [Stack_pointer]							#LOAD GP0 RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
 														

if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
 														

if gp0 then Load PC ifinit_jump_lookup-4true 									#IF ELSE STATEMENT
Load PC loopinit_jump_lookup-0exit

Load PC ifinit_jump_lookup-4endif
Pass 										%ifinit_jump_lookup-4true




Load gp0 40012 [Stack_pointer] 						#LOAD GP0
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 

ADD gp6 8 [Stack_pointer]							#LOAD GP0 RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load gp0 @91
 														

SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]

Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
 														

if gp0 then Load PC ifinit_jump_lookup-3true 									#IF ELSE STATEMENT
 									



Load gp0 40012 [Stack_pointer] 						#LOAD GP0
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 

ADD gp6 8 [Stack_pointer]							#LOAD GP0 RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load gp0 @93
 														

SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]

Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
 														

NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifinit_jump_lookup-2endif

Load gp0 40020 [Stack_pointer] 						#LOAD GP0
 														
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
 														

Store gp0 40020 [Stack_pointer] 						#STORE GP0

 									

Load gp0 40020 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load gp0 @10000
 														

SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]

Move Zero gp2 														#COMPARE (IS GREATER)
Compare gp1 gp0
if Greater then Load gp2 @4294967295
Move gp2 gp0
 														

NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifinit_jump_lookup-1endif


Load gp0 CLL.string5 										#LOAD GP0 GLOBAL
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Goto function:printf 												#CALLING printf



Goto function:quit 												#CALLING quit

Pass										%ifinit_jump_lookup-1endif




Load gp0 40020 [Stack_pointer] 						#LOAD GP0
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

ADD gp6 40016 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

 


Load gp0 40012 [Stack_pointer] 						#LOAD GP0
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

ADD gp6 40024 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]


Load gp0 40012 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

 




Load gp0 40012 [Stack_pointer] 						#LOAD GP0
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

ADD gp6 40024 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

ADD gp6 40024 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]

Pass										%ifinit_jump_lookup-2endif

Load PC ifinit_jump_lookup-3endif
Pass 										%ifinit_jump_lookup-3true

Load gp0 40012 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

 


Load gp0 40020 [Stack_pointer] 						#LOAD GP0
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

ADD gp6 40016 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]


Load gp0 40020 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load gp0 @1
 														

SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]

ADD gp0 gp1 														#ADD
 														

Store gp0 40020 [Stack_pointer] 						#STORE GP0

 									

Load gp0 40020 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load gp0 @10000
 														

SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]

Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
 														

NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifinit_jump_lookup-0endif


Load gp0 CLL.string4 										#LOAD GP0 GLOBAL
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Goto function:printf 												#CALLING printf

Load PC loopinit_jump_lookup-0exit

Pass										%ifinit_jump_lookup-0endif
 
Pass 										%ifinit_jump_lookup-3endif           


Load gp0 40012 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load gp0 @1
 														

SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]

ADD gp0 gp1 														#ADD
 														

Store gp0 40012 [Stack_pointer] 						#STORE GP0
 
Pass 										%ifinit_jump_lookup-4endif           

Load PC loopinit_jump_lookup-0entry					%loopinit_jump_lookup-0continue
Pass 										%loopinit_jump_lookup-0exit

 									

Load gp0 40020 [Stack_pointer] 						#LOAD GP0
 														

if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
 														

NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifinit_jump_lookup-5endif


Load gp0 CLL.string6 										#LOAD GP0 GLOBAL
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Goto function:printf 												#CALLING printf



Goto function:quit 												#CALLING quit

Pass										%ifinit_jump_lookup-5endif



Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC











																	Scope string_to_int
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5

Move Stack_pointer previous_stack_ptr								%function:string_to_int
SUB Stack_pointer @20 									#OVERHEAD FOR FUNCTION string_to_int
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 16 [Stack_pointer] 						#STORE GP0


Load gp0 @0
 														

Store gp0 12 [Stack_pointer] 						#STORE GP0


Load gp0 @0
 														

Store gp0 8 [Stack_pointer] 						#STORE GP0

Pass 										%loopstring_to_int-0entry 		#FOR LOOP



Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 

ADD gp6 16 [Stack_pointer]							#LOAD GP0 RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
 														

if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
 														

NOT gp0
if gp0 then Load PC loopstring_to_int-0exit

Load gp0 12 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load gp0 @10
 														

SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]

MUL gp0 gp1 														#MULTIPLY
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error




Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 

ADD gp6 16 [Stack_pointer]							#LOAD GP0 RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load gp0 @48
 														

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
 														

SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]

ADD gp0 gp1 														#ADD
 														

Store gp0 12 [Stack_pointer] 						#STORE GP0

Pass 										%loopstring_to_int-0continue

Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load gp0 @1
 														

SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]

ADD gp0 gp1 														#ADD
 														

Store gp0 8 [Stack_pointer] 						#STORE GP0
								
Load PC loopstring_to_int-0entry
Pass 										%loopstring_to_int-0exit



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