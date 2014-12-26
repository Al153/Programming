

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

int CLL.MALLOC_TREE 0
array CLL.array_of_MALLOC_TREE_PARTITION 56 []
int CLL.MALLOC_TREE_PARTITION CLL.array_of_MALLOC_TREE_PARTITION
byteArray CLL.array_of_string10 2 [10, 0]
int CLL.string10 CLL.array_of_string10
byteArray CLL.array_of_string11 2 [10, 0]
int CLL.string11 CLL.array_of_string11
array CLL.array_of_MALLOC_HEAP 64 []
int CLL.MALLOC_HEAP CLL.array_of_MALLOC_HEAP
byteArray CLL.array_of_string0 11 [48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 0]
int CLL.string0 CLL.array_of_string0
byteArray CLL.array_of_string8 2 [10, 0]
int CLL.string8 CLL.array_of_string8
byteArray CLL.array_of_string9 2 [10, 0]
int CLL.string9 CLL.array_of_string9
byteArray CLL.array_of_string6 45 [82, 85, 78, 84, 73, 77, 69, 32, 69, 82, 82, 79, 82, 58, 32, 114, 97, 110, 32, 111, 117, 116, 32, 111, 102, 32, 109, 97, 108, 108, 111, 99, 32, 116, 114, 101, 101, 32, 110, 111, 100, 101, 115, 10, 0]
int CLL.string6 CLL.array_of_string6
byteArray CLL.array_of_string7 2 [32, 0]
int CLL.string7 CLL.array_of_string7
byteArray CLL.array_of_string4 52 [82, 85, 78, 84, 73, 77, 69, 32, 69, 82, 82, 79, 82, 58, 32, 84, 114, 105, 101, 100, 32, 116, 111, 32, 100, 101, 97, 108, 108, 111, 99, 97, 116, 101, 32, 105, 110, 118, 97, 108, 105, 100, 32, 97, 100, 100, 114, 101, 115, 115, 10, 0]
int CLL.string4 CLL.array_of_string4
byteArray CLL.array_of_string5 51 [82, 85, 78, 84, 73, 77, 69, 32, 69, 82, 82, 79, 82, 58, 32, 97, 108, 108, 111, 99, 97, 116, 105, 111, 110, 32, 115, 105, 122, 101, 32, 116, 111, 111, 32, 98, 105, 103, 32, 102, 111, 114, 32, 109, 97, 108, 108, 111, 99, 10, 0]
int CLL.string5 CLL.array_of_string5
byteArray CLL.array_of_string2 43 [82, 85, 78, 84, 73, 77, 69, 32, 69, 82, 82, 79, 82, 58, 32, 117, 110, 97, 98, 108, 101, 32, 116, 111, 32, 97, 108, 108, 111, 99, 97, 116, 101, 32, 109, 101, 109, 111, 114, 121, 32, 10, 0]
int CLL.string2 CLL.array_of_string2
byteArray CLL.array_of_string3 44 [82, 85, 78, 84, 73, 77, 69, 32, 69, 82, 82, 79, 82, 58, 32, 99, 111, 117, 108, 100, 32, 110, 111, 116, 32, 100, 101, 97, 108, 108, 111, 99, 97, 116, 101, 32, 109, 101, 109, 111, 114, 121, 10, 0]
int CLL.string3 CLL.array_of_string3
int CLL.MALLOC_POOL 0
byteArray CLL.array_of_string1 17 [48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 65, 66, 67, 68, 69, 70, 0]
int CLL.string1 CLL.array_of_string1











																	Scope malloc
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5

Move Stack_pointer previous_stack_ptr								%malloc
SUB Stack_pointer @16 									#OVERHEAD FOR FUNCTION malloc
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 12 [Stack_pointer] 						#STORE GP0


 									

Load gp0 12 [Stack_pointer] 						#LOAD GP0
 														
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
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifmalloc0endif

Load gp0 @0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC

Pass %ifmalloc0endif



Load gp0 CLL.MALLOC_TREE 										#LOAD GP0 GLOBAL
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Load gp0 12 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Goto __malloc 												#CALLING __malloc

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 8 [Stack_pointer] 						#STORE GP0

 									

Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														
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
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifmalloc1endif


Load gp0 CLL.string2 										#LOAD GP0 GLOBAL
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Goto printf 												#CALLING printf



Goto quit 												#CALLING quit

Pass %ifmalloc1endif



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











																	Scope in
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5

Move Stack_pointer previous_stack_ptr								%in
SUB Stack_pointer @21 									#OVERHEAD FOR FUNCTION in
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]

				
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

Load gp0 @1
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 16 [Stack_pointer] 						#STORE GP0


Pass %loopin0entry

Load gp0 16 [Stack_pointer] 						#LOAD GP0
 														
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
if gp0 then Load PC loopin0exit 								#WHILE LOOP


Goto getw 												#CALLING getw

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

StoreByte gp0 20 [Stack_pointer] 					#STORE GP0 (CHAR)



LoadByte gp0 20 [Stack_pointer] 					#LOAD GP0 (CHAR)
 														
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

if gp0 then Load PC ifin0true 									#IF ELSE STATEMENT

LoadByte gp0 20 [Stack_pointer] 					#LOAD GP0 (CHAR)
 														
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

Load PC ifin0endif
Pass %ifin0true
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




Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


				
SUB gp7 @4 															#POP TO INDEX REGISTER
Load gp6 Expression_stack [gp7]


				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

ADD gp6 12 [Stack_pointer] 							#STORE GP0 RELATIVE (CHAR)
StoreByte gp0 0 [gp6]

Load gp0 @0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 16 [Stack_pointer] 						#STORE GP0
 
Pass %ifin0endif           

Load PC loopin0entry
Pass %loopin0exit



Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC











																	Scope printf_CLL
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5

Move Stack_pointer previous_stack_ptr								%printf_CLL
SUB Stack_pointer @21 									#OVERHEAD FOR FUNCTION printf_CLL
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]

				
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

Load gp0 @1
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 16 [Stack_pointer] 						#STORE GP0


Pass %loopprintf_CLL0entry

Load gp0 16 [Stack_pointer] 						#LOAD GP0
 														
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
if gp0 then Load PC loopprintf_CLL0exit 								#WHILE LOOP



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


				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

StoreByte gp0 20 [Stack_pointer] 					#STORE GP0 (CHAR)



LoadByte gp0 20 [Stack_pointer] 					#LOAD GP0 (CHAR)
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Goto putc 												#CALLING putc

 									

LoadByte gp0 20 [Stack_pointer] 					#LOAD GP0 (CHAR)
 														
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

NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifprintf_CLL0endif
Load gp0 @0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 16 [Stack_pointer] 						#STORE GP0

Pass %ifprintf_CLL0endif


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

Load PC loopprintf_CLL0entry
Pass %loopprintf_CLL0exit



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










																	Scope __dalloc
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5

Move Stack_pointer previous_stack_ptr								%__dalloc
SUB Stack_pointer @40 									#OVERHEAD FOR FUNCTION __dalloc
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 36 [Stack_pointer] 						#STORE GP0


				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 12 [Stack_pointer] 						#STORE GP0




Load gp0 @3
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

				
SUB gp7 @4 															#POP TO INDEX REGISTER
Load gp6 Expression_stack [gp7]

MUL gp6 @4 														   #INDEXING FOR @INT

ADD gp6 36 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 24 [Stack_pointer] 						#STORE GP0



Load gp0 @1
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

				
SUB gp7 @4 															#POP TO INDEX REGISTER
Load gp6 Expression_stack [gp7]

MUL gp6 @4 														   #INDEXING FOR @INT

ADD gp6 36 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 16 [Stack_pointer] 						#STORE GP0


Load gp0 24 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load gp0 @2
 														
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

Store gp0 28 [Stack_pointer] 						#STORE GP0



Load gp0 @4
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

				
SUB gp7 @4 															#POP TO INDEX REGISTER
Load gp6 Expression_stack [gp7]

MUL gp6 @4 														   #INDEXING FOR @INT

ADD gp6 36 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 32 [Stack_pointer] 						#STORE GP0



Load gp0 @5
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

				
SUB gp7 @4 															#POP TO INDEX REGISTER
Load gp6 Expression_stack [gp7]

MUL gp6 @4 														   #INDEXING FOR @INT

ADD gp6 36 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 8 [Stack_pointer] 						#STORE GP0



Load gp0 12 [Stack_pointer] 						#LOAD GP0
 														
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

MUL gp6 @4 														   #INDEXING FOR @INT

ADD gp6 36 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]

Load gp2 @4294967295  												#COMPARE (NOT LESS)
Compare gp1 gp0
if Less then Move Zero gp2
Move gp2 gp0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Load gp0 12 [Stack_pointer] 						#LOAD GP0
 														
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

MUL gp6 @4 														   #INDEXING FOR @INT

ADD gp6 36 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Load gp0 24 [Stack_pointer] 						#LOAD GP0
 														
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

SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]

MUL gp0 gp1 														#MULTIPLY
 														
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


SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]

AND gp0 gp1
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

if gp0 then Load PC if__dalloc4true 									#IF ELSE STATEMENT


Load gp0 CLL.string4 										#LOAD GP0 GLOBAL
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Goto printf 												#CALLING printf



Goto quit 												#CALLING quit

Load PC if__dalloc4endif
Pass %if__dalloc4true
 									

Load gp0 32 [Stack_pointer] 						#LOAD GP0
 														
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

Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Load gp0 12 [Stack_pointer] 						#LOAD GP0
 														
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

MUL gp6 @4 														   #INDEXING FOR @INT

ADD gp6 36 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
 														
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


SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]

AND gp0 gp1
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

NOT gp0 														    #IF STATEMENT
if gp0 then Load PC if__dalloc0endif
Load gp0 @0
 														
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

MUL gp6 @4 														   #INDEXING FOR @INT

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

ADD gp6 36 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]


Load gp0 @1
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC

Pass %if__dalloc0endif

 									

Load gp0 32 [Stack_pointer] 						#LOAD GP0
 														
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

Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Load gp0 12 [Stack_pointer] 						#LOAD GP0
 														
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

MUL gp6 @4 														   #INDEXING FOR @INT

ADD gp6 36 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
 														
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


SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]

AND gp0 gp1
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

NOT gp0 														    #IF STATEMENT
if gp0 then Load PC if__dalloc1endif

Load gp0 @0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC

Pass %if__dalloc1endif



Load gp0 12 [Stack_pointer] 						#LOAD GP0
 														
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

MUL gp6 @4 														   #INDEXING FOR @INT

ADD gp6 36 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Load gp0 28 [Stack_pointer] 						#LOAD GP0
 														
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

SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]

MUL gp0 gp1 														#MULTIPLY
 														
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

if gp0 then Load PC if__dalloc2true 									#IF ELSE STATEMENT


Load gp0 12 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Load gp0 32 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Goto __dalloc 												#CALLING __dalloc

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 20 [Stack_pointer] 						#STORE GP0

Load PC if__dalloc2endif
Pass %if__dalloc2true


Load gp0 12 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Load gp0 32 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Goto __dalloc 												#CALLING __dalloc

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 20 [Stack_pointer] 						#STORE GP0
 
Pass %if__dalloc2endif           

 									


Load gp0 @1
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

				
SUB gp7 @4 															#POP TO INDEX REGISTER
Load gp6 Expression_stack [gp7]

MUL gp6 @4 														   #INDEXING FOR @INT

ADD gp6 32 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
 														
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



Load gp0 @1
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

				
SUB gp7 @4 															#POP TO INDEX REGISTER
Load gp6 Expression_stack [gp7]

MUL gp6 @4 														   #INDEXING FOR @INT

ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
 														
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


SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]

OR gp0 gp1
 														
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
if gp0 then Load PC if__dalloc3endif


Load gp0 32 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Goto delete_tree_node 												#CALLING delete_tree_node



Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Goto delete_tree_node 												#CALLING delete_tree_node

Load gp0 @0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @4
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

				
SUB gp7 @4 															#POP TO INDEX REGISTER
Load gp6 Expression_stack [gp7]

MUL gp6 @4 														   #INDEXING FOR @INT

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

ADD gp6 36 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]

Load gp0 @5
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @5
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

				
SUB gp7 @4 															#POP TO INDEX REGISTER
Load gp6 Expression_stack [gp7]

MUL gp6 @4 														   #INDEXING FOR @INT

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

ADD gp6 36 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]

Pass %if__dalloc3endif



Load gp0 20 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
 
Pass %if__dalloc4endif           


Load gp0 @0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Halt %quit










																	Scope malloc_init
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5

Move Stack_pointer previous_stack_ptr								%malloc_init
SUB Stack_pointer @16 									#OVERHEAD FOR FUNCTION malloc_init
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]


Load gp0 @0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 8 [Stack_pointer] 						#STORE GP0

Pass %loopmalloc_init0entry 											#FOR LOOP

Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load gp0 @56
 														
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
if gp0 then Load PC loopmalloc_init0exit


Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load gp0 @6
 														
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

Load gp0 @56
 														
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

if gp0 then Load PC ifmalloc_init0true 									#IF ELSE STATEMENT
Load gp0 @0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 12 [Stack_pointer] 						#STORE GP0

Load PC ifmalloc_init0endif
Pass %ifmalloc_init0true

Load gp0 CLL.MALLOC_TREE_PARTITION 										#LOAD GP0 GLOBAL
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load gp0 @6
 														
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

Load gp0 @4
 														
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
 
Pass %ifmalloc_init0endif           


Load gp0 12 [Stack_pointer] 						#LOAD GP0
 														
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

MUL gp6 @4 														   #INDEXING FOR @INT

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

ADD gp6 CLL.MALLOC_TREE_PARTITION 											#STORE GP0 GLOBAL RELATIVE
Store gp0 0 [gp6]


Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load gp0 @6
 														
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

Load PC loopmalloc_init0entry
Pass %loopmalloc_init0exit


Load gp0 @64
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load gp0 CLL.MALLOC_HEAP 										#LOAD GP0 GLOBAL
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load gp0 @0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Goto create_tree_node 												#CALLING create_tree_node

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 CLL.MALLOC_TREE 										#STORE GP0 GLOBAL



Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC











																	Scope create_tree_node
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5

Move Stack_pointer previous_stack_ptr								%create_tree_node
SUB Stack_pointer @24 									#OVERHEAD FOR FUNCTION create_tree_node
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 8 [Stack_pointer] 						#STORE GP0


				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 20 [Stack_pointer] 						#STORE GP0


				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 16 [Stack_pointer] 						#STORE GP0



Load gp0 CLL.MALLOC_POOL 										#LOAD GP0 GLOBAL
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 12 [Stack_pointer] 						#STORE GP0



Load gp0 12 [Stack_pointer] 						#LOAD GP0
 														
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

if gp0 then Load PC ifcreate_tree_node0true 									#IF ELSE STATEMENT


Load gp0 CLL.string6 										#LOAD GP0 GLOBAL
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Goto printf 												#CALLING printf



Goto quit 												#CALLING quit

Load PC ifcreate_tree_node0endif
Pass %ifcreate_tree_node0true


Load gp0 @0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

				
SUB gp7 @4 															#POP TO INDEX REGISTER
Load gp6 Expression_stack [gp7]

MUL gp6 @4 														   #INDEXING FOR @INT

ADD gp6 12 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 CLL.MALLOC_POOL 										#STORE GP0 GLOBAL


Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														
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

MUL gp6 @4 														   #INDEXING FOR @INT

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

ADD gp6 12 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]

Load gp0 @0
 														
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

MUL gp6 @4 														   #INDEXING FOR @INT

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

ADD gp6 12 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]


Load gp0 20 [Stack_pointer] 						#LOAD GP0
 														
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

MUL gp6 @4 														   #INDEXING FOR @INT

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

ADD gp6 12 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]


Load gp0 16 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

 

Load gp0 @3
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

				
SUB gp7 @4 															#POP TO INDEX REGISTER
Load gp6 Expression_stack [gp7]

MUL gp6 @4 														   #INDEXING FOR @INT

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

ADD gp6 12 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]

Load gp0 @0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @4
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

				
SUB gp7 @4 															#POP TO INDEX REGISTER
Load gp6 Expression_stack [gp7]

MUL gp6 @4 														   #INDEXING FOR @INT

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

ADD gp6 12 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]

Load gp0 @0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @5
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

				
SUB gp7 @4 															#POP TO INDEX REGISTER
Load gp6 Expression_stack [gp7]

MUL gp6 @4 														   #INDEXING FOR @INT

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

ADD gp6 12 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]



Load gp0 12 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
 
Pass %ifcreate_tree_node0endif           


Load gp0 @0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
##################### GETC ###############################################
#returns a char
In gp0 %getc #gets a char without waiting (state of keyboard)
Store gp0 Expression_stack [gp7]
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Move Jump PC
##########################################################################










																	Scope in_echo
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5

Move Stack_pointer previous_stack_ptr								%in_echo
SUB Stack_pointer @21 									#OVERHEAD FOR FUNCTION in_echo
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]

				
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

Load gp0 @1
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 16 [Stack_pointer] 						#STORE GP0


Pass %loopin_echo0entry

Load gp0 16 [Stack_pointer] 						#LOAD GP0
 														
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
if gp0 then Load PC loopin_echo0exit 								#WHILE LOOP


Goto getw 												#CALLING getw

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

StoreByte gp0 20 [Stack_pointer] 					#STORE GP0 (CHAR)



LoadByte gp0 20 [Stack_pointer] 					#LOAD GP0 (CHAR)
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Goto putc 												#CALLING putc



LoadByte gp0 20 [Stack_pointer] 					#LOAD GP0 (CHAR)
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load gp0 @13
 														
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

if gp0 then Load PC ifin_echo0true 									#IF ELSE STATEMENT

LoadByte gp0 20 [Stack_pointer] 					#LOAD GP0 (CHAR)
 														
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

Load PC ifin_echo0endif
Pass %ifin_echo0true
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




Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


				
SUB gp7 @4 															#POP TO INDEX REGISTER
Load gp6 Expression_stack [gp7]


				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

ADD gp6 12 [Stack_pointer] 							#STORE GP0 RELATIVE (CHAR)
StoreByte gp0 0 [gp6]

Load gp0 @0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 16 [Stack_pointer] 						#STORE GP0
 
Pass %ifin_echo0endif           

Load PC loopin_echo0entry
Pass %loopin_echo0exit



Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
########################## PUTC (char) ########################################
SUB gp7 @4 															%putc
Load gp0  Expression_stack [gp7]
Out gp0
Move Jump PC
################################################################################










																	Scope print_pool
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5

Move Stack_pointer previous_stack_ptr								%print_pool
SUB Stack_pointer @12 									#OVERHEAD FOR FUNCTION print_pool
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 8 [Stack_pointer] 						#STORE GP0


 									

Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														
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

NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifprint_pool0endif


Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Goto print_i 												#CALLING print_i



Load gp0 CLL.string7 										#LOAD GP0 GLOBAL
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Goto printf 												#CALLING printf




Load gp0 @0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

				
SUB gp7 @4 															#POP TO INDEX REGISTER
Load gp6 Expression_stack [gp7]

MUL gp6 @4 														   #INDEXING FOR @INT

ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Goto print_i 												#CALLING print_i



Load gp0 CLL.string8 										#LOAD GP0 GLOBAL
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Goto printf 												#CALLING printf




Load gp0 @0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

				
SUB gp7 @4 															#POP TO INDEX REGISTER
Load gp6 Expression_stack [gp7]

MUL gp6 @4 														   #INDEXING FOR @INT

ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Goto print_pool 												#CALLING print_pool

Pass %ifprint_pool0endif



Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC











																	Scope main
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5

Move Stack_pointer previous_stack_ptr								%main
SUB Stack_pointer @24 									#OVERHEAD FOR FUNCTION main
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]


Load gp0 CLL.MALLOC_TREE_PARTITION 										#LOAD GP0 GLOBAL
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 CLL.MALLOC_POOL 										#STORE GP0 GLOBAL



Goto malloc_init 												#CALLING malloc_init


Load gp0 @10
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Goto malloc 												#CALLING malloc

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 8 [Stack_pointer] 						#STORE GP0



Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Goto print_i 												#CALLING print_i



Load gp0 CLL.string9 										#LOAD GP0 GLOBAL
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Goto printf 												#CALLING printf


Load gp0 @32
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Goto malloc 												#CALLING malloc

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 16 [Stack_pointer] 						#STORE GP0



Load gp0 16 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Goto print_i 												#CALLING print_i



Load gp0 CLL.string10 										#LOAD GP0 GLOBAL
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Goto printf 												#CALLING printf



Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Goto dalloc 												#CALLING dalloc


Load gp0 @10
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Goto malloc 												#CALLING malloc

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 20 [Stack_pointer] 						#STORE GP0



Load gp0 20 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Goto print_i 												#CALLING print_i



Load gp0 CLL.string11 										#LOAD GP0 GLOBAL
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Goto printf 												#CALLING printf


Load gp0 @100
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Goto malloc 												#CALLING malloc

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 12 [Stack_pointer] 						#STORE GP0



Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC











																	Scope dalloc
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5

Move Stack_pointer previous_stack_ptr								%dalloc
SUB Stack_pointer @16 									#OVERHEAD FOR FUNCTION dalloc
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 12 [Stack_pointer] 						#STORE GP0




Load gp0 12 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Load gp0 CLL.MALLOC_TREE 										#LOAD GP0 GLOBAL
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Goto __dalloc 												#CALLING __dalloc

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 8 [Stack_pointer] 						#STORE GP0

 									

Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														
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
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifdalloc0endif


Load gp0 CLL.string3 										#LOAD GP0 GLOBAL
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Goto printf 												#CALLING printf



Goto quit 												#CALLING quit

Pass %ifdalloc0endif



Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
############################## GETW ################################
#returns a char
In gp0 %getw 				#waits for a user to press a key
Compare gp0 Zero
if Equal then Load PC getw
Store gp0 Expression_stack [gp7]

ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Move Jump PC
###################################################################










																	Scope __malloc
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5

Move Stack_pointer previous_stack_ptr								%__malloc
SUB Stack_pointer @32 									#OVERHEAD FOR FUNCTION __malloc
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 28 [Stack_pointer] 						#STORE GP0


				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 8 [Stack_pointer] 						#STORE GP0




Load gp0 @3
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

				
SUB gp7 @4 															#POP TO INDEX REGISTER
Load gp6 Expression_stack [gp7]

MUL gp6 @4 														   #INDEXING FOR @INT

ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 12 [Stack_pointer] 						#STORE GP0



Load gp0 28 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Load gp0 12 [Stack_pointer] 						#LOAD GP0
 														
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

if gp0 then Load PC if__malloc11true 									#IF ELSE STATEMENT
 									


Load gp0 @1
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

				
SUB gp7 @4 															#POP TO INDEX REGISTER
Load gp6 Expression_stack [gp7]

MUL gp6 @4 														   #INDEXING FOR @INT

ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
 														
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

NOT gp0 														    #IF STATEMENT
if gp0 then Load PC if__malloc0endif

Load gp0 @0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC

Pass %if__malloc0endif

 									

Load gp0 28 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Load gp0 12 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load gp0 @2
 														
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

NOT gp0 														    #IF STATEMENT
if gp0 then Load PC if__malloc2endif
 									


Load gp0 @4
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

				
SUB gp7 @4 															#POP TO INDEX REGISTER
Load gp6 Expression_stack [gp7]

MUL gp6 @4 														   #INDEXING FOR @INT

ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
 														
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
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

NOT gp0 														    #IF STATEMENT
if gp0 then Load PC if__malloc1endif
Load gp0 @1
 														
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

MUL gp6 @4 														   #INDEXING FOR @INT

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

ADD gp6 8 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]




Load gp0 @2
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

				
SUB gp7 @4 															#POP TO INDEX REGISTER
Load gp6 Expression_stack [gp7]

MUL gp6 @4 														   #INDEXING FOR @INT

ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC

Pass %if__malloc1endif


Load gp0 @0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC

Pass %if__malloc2endif

 									

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

NOT gp0 														    #IF STATEMENT
if gp0 then Load PC if__malloc10endif


Load gp0 @4
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

				
SUB gp7 @4 															#POP TO INDEX REGISTER
Load gp6 Expression_stack [gp7]

MUL gp6 @4 														   #INDEXING FOR @INT

ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 24 [Stack_pointer] 						#STORE GP0

 									

Load gp0 24 [Stack_pointer] 						#LOAD GP0
 														
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
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

NOT gp0 														    #IF STATEMENT
if gp0 then Load PC if__malloc3endif


Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Goto split_tree_node 												#CALLING split_tree_node



Load gp0 @4
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

				
SUB gp7 @4 															#POP TO INDEX REGISTER
Load gp6 Expression_stack [gp7]

MUL gp6 @4 														   #INDEXING FOR @INT

ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 24 [Stack_pointer] 						#STORE GP0

Pass %if__malloc3endif



Load gp0 @5
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

				
SUB gp7 @4 															#POP TO INDEX REGISTER
Load gp6 Expression_stack [gp7]

MUL gp6 @4 														   #INDEXING FOR @INT

ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 20 [Stack_pointer] 						#STORE GP0

 									


Load gp0 @1
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

				
SUB gp7 @4 															#POP TO INDEX REGISTER
Load gp6 Expression_stack [gp7]

MUL gp6 @4 														   #INDEXING FOR @INT

ADD gp6 24 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
 														
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
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

NOT gp0 														    #IF STATEMENT
if gp0 then Load PC if__malloc6endif


Load gp0 24 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Load gp0 28 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Goto __malloc 												#CALLING __malloc

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 16 [Stack_pointer] 						#STORE GP0

 									

Load gp0 16 [Stack_pointer] 						#LOAD GP0
 														
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

NOT gp0 														    #IF STATEMENT
if gp0 then Load PC if__malloc5endif
 									


Load gp0 @1
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

				
SUB gp7 @4 															#POP TO INDEX REGISTER
Load gp6 Expression_stack [gp7]

MUL gp6 @4 														   #INDEXING FOR @INT

ADD gp6 24 [Stack_pointer] 							#LOAD GP0 RELATIVE
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

				
SUB gp7 @4 															#POP TO INDEX REGISTER
Load gp6 Expression_stack [gp7]

MUL gp6 @4 														   #INDEXING FOR @INT

ADD gp6 20 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]

AND gp0 gp1 														#AND
 														
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

NOT gp0 														    #IF STATEMENT
if gp0 then Load PC if__malloc4endif
Load gp0 @1
 														
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

MUL gp6 @4 														   #INDEXING FOR @INT

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

ADD gp6 8 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]

Pass %if__malloc4endif



Load gp0 16 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC

Pass %if__malloc5endif

Pass %if__malloc6endif

 									


Load gp0 @1
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

				
SUB gp7 @4 															#POP TO INDEX REGISTER
Load gp6 Expression_stack [gp7]

MUL gp6 @4 														   #INDEXING FOR @INT

ADD gp6 20 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
 														
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
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

NOT gp0 														    #IF STATEMENT
if gp0 then Load PC if__malloc9endif


Load gp0 20 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Load gp0 28 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Goto __malloc 												#CALLING __malloc

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 16 [Stack_pointer] 						#STORE GP0

 									

Load gp0 16 [Stack_pointer] 						#LOAD GP0
 														
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

NOT gp0 														    #IF STATEMENT
if gp0 then Load PC if__malloc8endif
 									


Load gp0 @1
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

				
SUB gp7 @4 															#POP TO INDEX REGISTER
Load gp6 Expression_stack [gp7]

MUL gp6 @4 														   #INDEXING FOR @INT

ADD gp6 24 [Stack_pointer] 							#LOAD GP0 RELATIVE
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

				
SUB gp7 @4 															#POP TO INDEX REGISTER
Load gp6 Expression_stack [gp7]

MUL gp6 @4 														   #INDEXING FOR @INT

ADD gp6 20 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]

AND gp0 gp1 														#AND
 														
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

NOT gp0 														    #IF STATEMENT
if gp0 then Load PC if__malloc7endif
Load gp0 @1
 														
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

MUL gp6 @4 														   #INDEXING FOR @INT

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

ADD gp6 8 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]

Pass %if__malloc7endif



Load gp0 16 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC

Pass %if__malloc8endif

Pass %if__malloc9endif


Load gp0 @0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC

Pass %if__malloc10endif


Load gp0 @0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC

Load PC if__malloc11endif
Pass %if__malloc11true


Load gp0 CLL.string5 										#LOAD GP0 GLOBAL
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Goto printf 												#CALLING printf



Goto quit 												#CALLING quit
 
Pass %if__malloc11endif           


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











																	Scope get_response
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5

Move Stack_pointer previous_stack_ptr								%get_response
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


Goto printf 												#CALLING printf



Load gp0 12 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Goto in_echo 												#CALLING in_echo



Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC











																	Scope delete_tree_node
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5

Move Stack_pointer previous_stack_ptr								%delete_tree_node
SUB Stack_pointer @12 									#OVERHEAD FOR FUNCTION delete_tree_node
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 8 [Stack_pointer] 						#STORE GP0



Load gp0 CLL.MALLOC_POOL 										#LOAD GP0 GLOBAL
 														
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

MUL gp6 @4 														   #INDEXING FOR @INT

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

ADD gp6 8 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]


Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 CLL.MALLOC_POOL 										#STORE GP0 GLOBAL



Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC











																	Scope check_allocation
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5

Move Stack_pointer previous_stack_ptr								%check_allocation
SUB Stack_pointer @20 									#OVERHEAD FOR FUNCTION check_allocation
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 8 [Stack_pointer] 						#STORE GP0


 									


Load gp0 @4
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

				
SUB gp7 @4 															#POP TO INDEX REGISTER
Load gp6 Expression_stack [gp7]

MUL gp6 @4 														   #INDEXING FOR @INT

ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
 														
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
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifcheck_allocation0endif



Load gp0 @1
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

				
SUB gp7 @4 															#POP TO INDEX REGISTER
Load gp6 Expression_stack [gp7]

MUL gp6 @4 														   #INDEXING FOR @INT

ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC

Pass %ifcheck_allocation0endif

 									


Load gp0 @1
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

				
SUB gp7 @4 															#POP TO INDEX REGISTER
Load gp6 Expression_stack [gp7]

MUL gp6 @4 														   #INDEXING FOR @INT

ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
 														
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

NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifcheck_allocation1endif

Load gp0 @1
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC

Pass %ifcheck_allocation1endif



Load gp0 @4
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

				
SUB gp7 @4 															#POP TO INDEX REGISTER
Load gp6 Expression_stack [gp7]

MUL gp6 @4 														   #INDEXING FOR @INT

ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 12 [Stack_pointer] 						#STORE GP0



Load gp0 @5
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

				
SUB gp7 @4 															#POP TO INDEX REGISTER
Load gp6 Expression_stack [gp7]

MUL gp6 @4 														   #INDEXING FOR @INT

ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 16 [Stack_pointer] 						#STORE GP0




Load gp0 12 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Goto check_allocation 												#CALLING check_allocation


Load gp0 16 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Goto check_allocation 												#CALLING check_allocation

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]

OR gp0 gp1 															#OR
 														
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











																	Scope split_tree_node
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5

Move Stack_pointer previous_stack_ptr								%split_tree_node
SUB Stack_pointer @28 									#OVERHEAD FOR FUNCTION split_tree_node
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 8 [Stack_pointer] 						#STORE GP0




Load gp0 @3
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

				
SUB gp7 @4 															#POP TO INDEX REGISTER
Load gp6 Expression_stack [gp7]

MUL gp6 @4 														   #INDEXING FOR @INT

ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 24 [Stack_pointer] 						#STORE GP0



Load gp0 @2
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

				
SUB gp7 @4 															#POP TO INDEX REGISTER
Load gp6 Expression_stack [gp7]

MUL gp6 @4 														   #INDEXING FOR @INT

ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 16 [Stack_pointer] 						#STORE GP0


Load gp0 24 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load gp0 @2
 														
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


Load gp0 16 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Load gp0 20 [Stack_pointer] 						#LOAD GP0
 														
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

SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]

MUL gp0 gp1 														#MULTIPLY
 														
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



Load gp0 20 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Load gp0 16 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Goto create_tree_node 												#CALLING create_tree_node
 

Load gp0 @4
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

				
SUB gp7 @4 															#POP TO INDEX REGISTER
Load gp6 Expression_stack [gp7]

MUL gp6 @4 														   #INDEXING FOR @INT

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

ADD gp6 8 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]



Load gp0 20 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Load gp0 12 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Goto create_tree_node 												#CALLING create_tree_node
 

Load gp0 @5
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

				
SUB gp7 @4 															#POP TO INDEX REGISTER
Load gp6 Expression_stack [gp7]

MUL gp6 @4 														   #INDEXING FOR @INT

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

ADD gp6 8 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]



Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC











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
