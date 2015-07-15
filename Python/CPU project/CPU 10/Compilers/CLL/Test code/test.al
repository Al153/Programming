

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

int CLL.MALLOC_TREE 0
byteArray CLL.array_of_string15 2 [9, 0]
int CLL.string15 CLL.array_of_string15
byteArray CLL.array_of_string16 3 [44, 10, 0]
int CLL.string16 CLL.array_of_string16
byteArray CLL.array_of_string12 17 [32, 78, 79, 84, 32, 65, 76, 76, 79, 67, 65, 84, 69, 68, 58, 32, 0]
int CLL.string12 CLL.array_of_string12
array CLL.array_of_MALLOC_TREE_PARTITION 61144 []
int CLL.MALLOC_TREE_PARTITION CLL.array_of_MALLOC_TREE_PARTITION
byteArray CLL.array_of_string10 2 [10, 0]
int CLL.string10 CLL.array_of_string10
byteArray CLL.array_of_string11 13 [32, 65, 76, 76, 79, 67, 65, 84, 69, 68, 58, 32, 0]
int CLL.string11 CLL.array_of_string11
array CLL.array_of_MALLOC_HEAP 65536 []
int CLL.MALLOC_HEAP CLL.array_of_MALLOC_HEAP
byteArray CLL.array_of_string13 2 [10, 0]
int CLL.string13 CLL.array_of_string13
byteArray CLL.array_of_string14 2 [10, 0]
int CLL.string14 CLL.array_of_string14
byteArray CLL.array_of_string0 6 [48, 32, 120, 69, 48, 0]
int CLL.string0 CLL.array_of_string0
byteArray CLL.array_of_string8 45 [82, 85, 78, 84, 73, 77, 69, 32, 69, 82, 82, 79, 82, 58, 32, 114, 97, 110, 32, 111, 117, 116, 32, 111, 102, 32, 109, 97, 108, 108, 111, 99, 32, 116, 114, 101, 101, 32, 110, 111, 100, 101, 115, 10, 0]
int CLL.string8 CLL.array_of_string8
byteArray CLL.array_of_string9 2 [32, 0]
int CLL.string9 CLL.array_of_string9
byteArray CLL.array_of_string6 51 [82, 85, 78, 84, 73, 77, 69, 32, 69, 82, 82, 79, 82, 58, 32, 97, 108, 108, 111, 99, 97, 116, 105, 111, 110, 32, 115, 105, 122, 101, 32, 116, 111, 111, 32, 98, 105, 103, 32, 102, 111, 114, 32, 109, 97, 108, 108, 111, 99, 10, 0]
int CLL.string6 CLL.array_of_string6
byteArray CLL.array_of_string7 52 [82, 85, 78, 84, 73, 77, 69, 32, 69, 82, 82, 79, 82, 58, 32, 84, 114, 105, 101, 100, 32, 116, 111, 32, 100, 101, 97, 108, 108, 111, 99, 97, 116, 101, 32, 105, 110, 118, 97, 108, 105, 100, 32, 97, 100, 100, 114, 101, 115, 115, 10, 0]
int CLL.string7 CLL.array_of_string7
byteArray CLL.array_of_string4 43 [82, 85, 78, 84, 73, 77, 69, 32, 69, 82, 82, 79, 82, 58, 32, 117, 110, 97, 98, 108, 101, 32, 116, 111, 32, 97, 108, 108, 111, 99, 97, 116, 101, 32, 109, 101, 109, 111, 114, 121, 32, 10, 0]
int CLL.string4 CLL.array_of_string4
byteArray CLL.array_of_string5 44 [82, 85, 78, 84, 73, 77, 69, 32, 69, 82, 82, 79, 82, 58, 32, 99, 111, 117, 108, 100, 32, 110, 111, 116, 32, 100, 101, 97, 108, 108, 111, 99, 97, 116, 101, 32, 109, 101, 109, 111, 114, 121, 10, 0]
int CLL.string5 CLL.array_of_string5
byteArray CLL.array_of_string2 4 [32, 43, 32, 0]
int CLL.string2 CLL.array_of_string2
byteArray CLL.array_of_string3 4 [32, 106, 41, 0]
int CLL.string3 CLL.array_of_string3
int CLL.MALLOC_POOL 0
byteArray CLL.array_of_string1 33 [82, 85, 78, 84, 73, 77, 69, 32, 69, 82, 82, 79, 82, 58, 32, 100, 105, 118, 105, 115, 105, 111, 110, 32, 98, 121, 32, 90, 69, 82, 79, 10, 0]
int CLL.string1 CLL.array_of_string1
																	Scope cDec
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:cDec
SUB Stack_pointer @16 									#OVERHEAD FOR FUNCTION cDec
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
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifcDec-0endif
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:dalloc 												#CALLING dalloc
Pass										%ifcDec-0endif
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 12 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:fSub 												#CALLING fSub
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 12 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 12 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:fSub 												#CALLING fSub
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 12 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
																	Scope malloc
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:malloc
SUB Stack_pointer @16 									#OVERHEAD FOR FUNCTION malloc
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 12 [Stack_pointer] 						#STORE GP0
Load gp0 12 [Stack_pointer] 						#LOAD GP0
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifmalloc-0endif
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Pass										%ifmalloc-0endif
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
Goto function:__malloc 												#CALLING __malloc
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load gp0 8 [Stack_pointer] 						#LOAD GP0
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifmalloc-1endif
Load gp0 CLL.string4 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Goto function:quit 												#CALLING quit
Pass										%ifmalloc-1endif
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

##################### GETC ###############################################
#returns a char
In gp0 %function:getc #gets a char without waiting (state of keyboard)
Store gp0 Expression_stack [gp7]
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Move Jump PC
##########################################################################
																	Scope __dalloc
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:__dalloc
SUB Stack_pointer @40 									#OVERHEAD FOR FUNCTION __dalloc
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 36 [Stack_pointer] 						#STORE GP0
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 12 [Stack_pointer] 						#STORE GP0
Load gp6 @3
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 36 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 24 [Stack_pointer] 						#STORE GP0
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 36 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 16 [Stack_pointer] 						#STORE GP0
Load gp0 24 [Stack_pointer] 						#LOAD GP0
Load gp1 @2
DIV gp0 gp1 														#DIVIDE
if DivByZero then Load PC DIV_BY_ZERO
Store gp0 28 [Stack_pointer] 						#STORE GP0
Load gp6 @4
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 36 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 32 [Stack_pointer] 						#STORE GP0
Load gp6 @5
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 36 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 36 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
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
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 36 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp1 24 [Stack_pointer] 						#LOAD GP0
Load gp0 @4
MUL gp0 gp1 														#MULTIPLY
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
AND gp0 gp1
if gp0 then Load PC if__dalloc-5true 									#IF ELSE STATEMENT
Load gp0 CLL.string7 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Goto function:quit 												#CALLING quit
Load PC if__dalloc-5endif
Pass 										%if__dalloc-5true
Load gp1 32 [Stack_pointer] 						#LOAD GP0
Load gp0 @0
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC if__dalloc-1endif
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 36 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC if__dalloc-0true 									#IF ELSE STATEMENT
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Load PC if__dalloc-0endif
Pass 										%if__dalloc-0true
Load gp0 @0
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
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
Pass 										%if__dalloc-0endif           
Pass										%if__dalloc-1endif
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 36 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp1 28 [Stack_pointer] 						#LOAD GP0
Load gp0 @4
MUL gp0 gp1 														#MULTIPLY
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC if__dalloc-2true 									#IF ELSE STATEMENT
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
Goto function:__dalloc 												#CALLING __dalloc
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 20 [Stack_pointer] 						#STORE GP0
Load PC if__dalloc-2endif
Pass 										%if__dalloc-2true
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
Goto function:__dalloc 												#CALLING __dalloc
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 20 [Stack_pointer] 						#STORE GP0
Pass 										%if__dalloc-2endif           
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 32 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
OR gp0 gp1
NOT gp0 														
if gp0 then Load PC if__dalloc-4true 									#IF ELSE STATEMENT
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 32 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
AND gp0 gp1 														#AND
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 36 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load PC if__dalloc-4endif
Pass 										%if__dalloc-4true
Load gp6 @4
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 32 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp6 @4
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
OR gp0 gp1
NOT gp0 														
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC if__dalloc-3endif
Load gp0 32 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:delete_tree_node 												#CALLING delete_tree_node
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:delete_tree_node 												#CALLING delete_tree_node
Load gp0 @0
Load gp6 @4
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 36 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @0
Load gp6 @5
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 36 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @0
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 36 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Pass										%if__dalloc-3endif
Pass 										%if__dalloc-4endif           
Load gp0 20 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Pass 										%if__dalloc-5endif           
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
																	Scope cReciprocal
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:cReciprocal
SUB Stack_pointer @28 									#OVERHEAD FOR FUNCTION cReciprocal
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 24 [Stack_pointer] 						#STORE GP0
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 16 [Stack_pointer] 						#STORE GP0
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 24 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifcReciprocal-0endif
Load gp0 24 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:dalloc 												#CALLING dalloc
Pass										%ifcReciprocal-0endif
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 24 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 24 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:fMul 												#CALLING fMul
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 24 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 24 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:fMul 												#CALLING fMul
Goto function:fAdd 												#CALLING fAdd
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 16 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 24 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:fMul 												#CALLING fMul
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 16 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 24 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:fMul 												#CALLING fMul
Goto function:fAdd 												#CALLING fAdd
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:fDiv 												#CALLING fDiv
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 12 [Stack_pointer] 						#STORE GP0
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 16 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 24 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:fMul 												#CALLING fMul
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 16 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 24 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:fMul 												#CALLING fMul
Goto function:fSub 												#CALLING fSub
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:fDiv 												#CALLING fDiv
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 20 [Stack_pointer] 						#STORE GP0
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 16 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 20 [Stack_pointer] 						#LOAD GP0
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 16 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
																	Scope readf
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:readf
SUB Stack_pointer @12 									#OVERHEAD FOR FUNCTION readf
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
																	Scope arccosec
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:arccosec
SUB Stack_pointer @12 									#OVERHEAD FOR FUNCTION arccosec
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load gp0 @1065353216
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:fDiv 												#CALLING fDiv
Goto function:arcsin 												#CALLING arcsin
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
																	Scope float
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:float
SUB Stack_pointer @20 									#OVERHEAD FOR FUNCTION float
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load gp1 @127
Load gp0 @23
ADD gp0 gp1 														#ADD
Store gp0 12 [Stack_pointer] 						#STORE GP0
Load gp0 @0
Store gp0 16 [Stack_pointer] 						#STORE GP0
Load gp1 8 [Stack_pointer] 						#LOAD GP0
Load gp0 @0
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC iffloat-0endif
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Pass										%iffloat-0endif
Pass 										%loopfloat-0entry
Load gp1 8 [Stack_pointer] 						#LOAD GP0
Load gp0 @16777216
Load gp2 @4294967295  												#COMPARE (NOT LESS)
Compare gp1 gp0
if Less then Move Zero gp2
Move gp2 gp0
NOT gp0
if gp0 then Load PC loopfloat-0exit 								#WHILE LOOP
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Load gp1 @1
SHR gp0 gp1 														#SHIFT RIGHT
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load gp1 12 [Stack_pointer] 						#LOAD GP0
Load gp0 @1
ADD gp0 gp1 														#ADD
Store gp0 12 [Stack_pointer] 						#STORE GP0
Load PC loopfloat-0entry					%loopfloat-0continue
Pass 										%loopfloat-0exit
Pass 										%loopfloat-1entry
Load gp1 8 [Stack_pointer] 						#LOAD GP0
Load gp0 @8388608
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
NOT gp0
if gp0 then Load PC loopfloat-1exit 								#WHILE LOOP
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Load gp1 @1
SHL gp0 gp1 														#SHIFT LEFT
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Load gp1 @1
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Store gp0 12 [Stack_pointer] 						#STORE GP0
Load PC loopfloat-1entry					%loopfloat-1continue
Pass 										%loopfloat-1exit
Load gp1 8 [Stack_pointer] 						#LOAD GP0
Load gp0 @8388607
AND gp0 gp1 														#AND
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 16 [Stack_pointer] 						#LOAD GP0
Load gp1 @31
SHL gp0 gp1 														#SHIFT LEFT
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
OR gp0 gp1 															#OR
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Load gp1 @23
SHL gp0 gp1 														#SHIFT LEFT
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
																	Scope isAllocated
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:isAllocated
SUB Stack_pointer @12 									#OVERHEAD FOR FUNCTION isAllocated
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 CLL.MALLOC_TREE 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:__isAllocated 												#CALLING __isAllocated
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
																	Scope fDiv
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:fDiv
SUB Stack_pointer @56 									#OVERHEAD FOR FUNCTION fDiv
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 48 [Stack_pointer] 						#STORE GP0
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 44 [Stack_pointer] 						#STORE GP0
Load gp1 48 [Stack_pointer] 						#LOAD GP0
Load gp0 @0
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC iffDiv-0endif
Load gp0 CLL.string1 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 @4294967295
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Pass										%iffDiv-0endif
Load gp1 44 [Stack_pointer] 						#LOAD GP0
Load gp0 @2147483648
AND gp0 gp1 														#AND
Store gp0 24 [Stack_pointer] 						#STORE GP0
Load gp1 48 [Stack_pointer] 						#LOAD GP0
Load gp0 @2147483648
AND gp0 gp1 														#AND
Store gp0 28 [Stack_pointer] 						#STORE GP0
Load gp1 44 [Stack_pointer] 						#LOAD GP0
Load gp0 @2139095040
AND gp0 gp1 														#AND
Store gp0 52 [Stack_pointer] 						#STORE GP0
Load gp1 48 [Stack_pointer] 						#LOAD GP0
Load gp0 @2139095040
AND gp0 gp1 														#AND
Store gp0 40 [Stack_pointer] 						#STORE GP0
Load gp1 44 [Stack_pointer] 						#LOAD GP0
Load gp0 @8388607
AND gp0 gp1 														#AND
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @8388608
OR gp0 gp1 															#OR
Store gp0 32 [Stack_pointer] 						#STORE GP0
Load gp1 48 [Stack_pointer] 						#LOAD GP0
Load gp0 @8388607
AND gp0 gp1 														#AND
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @8388608
OR gp0 gp1 															#OR
Store gp0 36 [Stack_pointer] 						#STORE GP0
Load gp1 24 [Stack_pointer] 						#LOAD GP0
Load gp0 28 [Stack_pointer] 						#LOAD GP0
XOR gp0 gp1 														#XOR
Store gp0 12 [Stack_pointer] 						#STORE GP0
Load gp1 52 [Stack_pointer] 						#LOAD GP0
Load gp0 @1065353216
ADD gp0 gp1 														#ADD
Store gp0 20 [Stack_pointer] 						#STORE GP0
Load gp1 20 [Stack_pointer] 						#LOAD GP0
Load gp0 40 [Stack_pointer] 						#LOAD GP0
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC iffDiv-1endif
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Pass										%iffDiv-1endif
Load gp0 20 [Stack_pointer] 						#LOAD GP0
Load gp1 40 [Stack_pointer] 						#LOAD GP0
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Store gp0 20 [Stack_pointer] 						#STORE GP0
Load gp0 32 [Stack_pointer] 						#LOAD GP0
Load gp1 @8
SHL gp0 gp1 														#SHIFT LEFT
Load gp1 36 [Stack_pointer] 						#LOAD GP0
DIV gp0 gp1 														#DIVIDE
if DivByZero then Load PC DIV_BY_ZERO
Load gp1 @15
SHL gp0 gp1 														#SHIFT LEFT
Store gp0 16 [Stack_pointer] 						#STORE GP0
Load gp0 32 [Stack_pointer] 						#LOAD GP0
Load gp1 @8
SHL gp0 gp1 														#SHIFT LEFT
Load gp1 36 [Stack_pointer] 						#LOAD GP0
MOD gp0 gp1 														#MODULO
if DivByZero then Load PC DIV_BY_ZERO
Load gp1 @8
SHL gp0 gp1 														#SHIFT LEFT
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load gp0 16 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Load gp1 36 [Stack_pointer] 						#LOAD GP0
DIV gp0 gp1 														#DIVIDE
if DivByZero then Load PC DIV_BY_ZERO
Load gp1 @7
SHL gp0 gp1 														#SHIFT LEFT
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Store gp0 16 [Stack_pointer] 						#STORE GP0
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Load gp1 36 [Stack_pointer] 						#LOAD GP0
MOD gp0 gp1 														#MODULO
if DivByZero then Load PC DIV_BY_ZERO
Load gp1 @7
SHL gp0 gp1 														#SHIFT LEFT
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load gp0 16 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Load gp1 36 [Stack_pointer] 						#LOAD GP0
DIV gp0 gp1 														#DIVIDE
if DivByZero then Load PC DIV_BY_ZERO
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Store gp0 16 [Stack_pointer] 						#STORE GP0
Pass 										%loopfDiv-0entry
Load gp1 16 [Stack_pointer] 						#LOAD GP0
Load gp0 @16777216
Load gp2 @4294967295  												#COMPARE (NOT LESS)
Compare gp1 gp0
if Less then Move Zero gp2
Move gp2 gp0
NOT gp0
if gp0 then Load PC loopfDiv-0exit 								#WHILE LOOP
Load gp0 16 [Stack_pointer] 						#LOAD GP0
Load gp1 @1
SHR gp0 gp1 														#SHIFT RIGHT
Store gp0 16 [Stack_pointer] 						#STORE GP0
Load gp1 20 [Stack_pointer] 						#LOAD GP0
Load gp0 @8388608
ADD gp0 gp1 														#ADD
Store gp0 20 [Stack_pointer] 						#STORE GP0
Load PC loopfDiv-0entry					%loopfDiv-0continue
Pass 										%loopfDiv-0exit
Pass 										%loopfDiv-1entry
Load gp1 16 [Stack_pointer] 						#LOAD GP0
Load gp0 @8388608
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
NOT gp0
if gp0 then Load PC loopfDiv-1exit 								#WHILE LOOP
Load gp0 16 [Stack_pointer] 						#LOAD GP0
Load gp1 @1
SHL gp0 gp1 														#SHIFT LEFT
Store gp0 16 [Stack_pointer] 						#STORE GP0
Load gp0 20 [Stack_pointer] 						#LOAD GP0
Load gp1 @8388608
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Store gp0 20 [Stack_pointer] 						#STORE GP0
Load PC loopfDiv-1entry					%loopfDiv-1continue
Pass 										%loopfDiv-1exit
Load gp1 20 [Stack_pointer] 						#LOAD GP0
Load gp0 @2147483648
Load gp2 @4294967295  												#COMPARE (NOT LESS)
Compare gp1 gp0
if Less then Move Zero gp2
Move gp2 gp0
if gp0 then Load PC iffDiv-3true 									#IF ELSE STATEMENT
Load gp1 20 [Stack_pointer] 						#LOAD GP0
Load gp0 @8388608
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC iffDiv-2endif
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Pass										%iffDiv-2endif
Load PC iffDiv-3endif
Pass 										%iffDiv-3true
Load gp0 @2139095040
Store gp0 20 [Stack_pointer] 						#STORE GP0
Load gp0 @16777215
Store gp0 16 [Stack_pointer] 						#STORE GP0
Pass 										%iffDiv-3endif           
Load gp1 12 [Stack_pointer] 						#LOAD GP0
Load gp0 20 [Stack_pointer] 						#LOAD GP0
OR gp0 gp1 															#OR
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp1 16 [Stack_pointer] 						#LOAD GP0
Load gp0 @8388607
AND gp0 gp1 														#AND
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
																	Scope put_digit
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:put_digit
SUB Stack_pointer @12 									#OVERHEAD FOR FUNCTION put_digit
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @1086324736
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:fLess 												#CALLING fLess
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														
if gp0 then Load PC ifput_digit-8true 									#IF ELSE STATEMENT
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @1082130432
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:fLess 												#CALLING fLess
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														
if gp0 then Load PC ifput_digit-7true 									#IF ELSE STATEMENT
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @1073741824
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:fLess 												#CALLING fLess
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														
if gp0 then Load PC ifput_digit-6true 									#IF ELSE STATEMENT
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @1065353216
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:fLess 												#CALLING fLess
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														
if gp0 then Load PC ifput_digit-5true 									#IF ELSE STATEMENT
Load gp0 @48
AND gp0 @255 													  #CASTING INT TO CHAR
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:putc 												#CALLING putc
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Load PC ifput_digit-5endif
Pass 										%ifput_digit-5true
Load gp0 @49
AND gp0 @255 													  #CASTING INT TO CHAR
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:putc 												#CALLING putc
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @1065353216
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:fSub 												#CALLING fSub
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Pass 										%ifput_digit-5endif           
Load PC ifput_digit-6endif
Pass 										%ifput_digit-6true
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @1077936128
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:fLess 												#CALLING fLess
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														
if gp0 then Load PC ifput_digit-4true 									#IF ELSE STATEMENT
Load gp0 @50
AND gp0 @255 													  #CASTING INT TO CHAR
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:putc 												#CALLING putc
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @1073741824
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:fSub 												#CALLING fSub
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Load PC ifput_digit-4endif
Pass 										%ifput_digit-4true
Load gp0 @51
AND gp0 @255 													  #CASTING INT TO CHAR
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:putc 												#CALLING putc
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @1077936128
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:fSub 												#CALLING fSub
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Pass 										%ifput_digit-4endif           
Pass 										%ifput_digit-6endif           
Load PC ifput_digit-7endif
Pass 										%ifput_digit-7true
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @1084227584
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:fLess 												#CALLING fLess
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														
if gp0 then Load PC ifput_digit-3true 									#IF ELSE STATEMENT
Load gp0 @52
AND gp0 @255 													  #CASTING INT TO CHAR
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:putc 												#CALLING putc
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @1082130432
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:fSub 												#CALLING fSub
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Load PC ifput_digit-3endif
Pass 										%ifput_digit-3true
Load gp0 @53
AND gp0 @255 													  #CASTING INT TO CHAR
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:putc 												#CALLING putc
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @1084227584
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:fSub 												#CALLING fSub
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Pass 										%ifput_digit-3endif           
Pass 										%ifput_digit-7endif           
Load PC ifput_digit-8endif
Pass 										%ifput_digit-8true
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @1090519040
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:fLess 												#CALLING fLess
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														
if gp0 then Load PC ifput_digit-2true 									#IF ELSE STATEMENT
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @1088421888
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:fLess 												#CALLING fLess
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														
if gp0 then Load PC ifput_digit-1true 									#IF ELSE STATEMENT
Load gp0 @54
AND gp0 @255 													  #CASTING INT TO CHAR
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:putc 												#CALLING putc
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @1086324736
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:fSub 												#CALLING fSub
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Load PC ifput_digit-1endif
Pass 										%ifput_digit-1true
Load gp0 @55
AND gp0 @255 													  #CASTING INT TO CHAR
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:putc 												#CALLING putc
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @1088421888
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:fSub 												#CALLING fSub
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Pass 										%ifput_digit-1endif           
Load PC ifput_digit-2endif
Pass 										%ifput_digit-2true
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @1091567616
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:fLess 												#CALLING fLess
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														
if gp0 then Load PC ifput_digit-0true 									#IF ELSE STATEMENT
Load gp0 @56
AND gp0 @255 													  #CASTING INT TO CHAR
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:putc 												#CALLING putc
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @1090519040
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:fSub 												#CALLING fSub
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Load PC ifput_digit-0endif
Pass 										%ifput_digit-0true
Load gp0 @57
AND gp0 @255 													  #CASTING INT TO CHAR
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:putc 												#CALLING putc
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @1091567616
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:fSub 												#CALLING fSub
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Pass 										%ifput_digit-0endif           
Pass 										%ifput_digit-2endif           
Pass 										%ifput_digit-8endif           
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
																	Scope vComplex
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:vComplex
SUB Stack_pointer @20 									#OVERHEAD FOR FUNCTION vComplex
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 12 [Stack_pointer] 						#STORE GP0
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 16 [Stack_pointer] 						#STORE GP0
Load gp0 @3
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:malloc 												#CALLING malloc
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load gp0 @1
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 16 [Stack_pointer] 						#LOAD GP0
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#STORE GP0 RELATIVE
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
																	Scope print_f
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:print_f
SUB Stack_pointer @28 									#OVERHEAD FOR FUNCTION print_f
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 24 [Stack_pointer] 						#STORE GP0
Load gp1 24 [Stack_pointer] 						#LOAD GP0
Load gp0 @0
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifprint_f-0endif
Load gp0 CLL.string0 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Pass										%ifprint_f-0endif
Load gp1 24 [Stack_pointer] 						#LOAD GP0
Load gp0 @2147483648
AND gp0 gp1 														#AND
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifprint_f-1endif
Load gp0 @45
AND gp0 @255 													  #CASTING INT TO CHAR
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:putc 												#CALLING putc
Load gp1 24 [Stack_pointer] 						#LOAD GP0
Load gp0 @2147483648
XOR gp0 gp1 														#XOR
Store gp0 24 [Stack_pointer] 						#STORE GP0
Pass										%ifprint_f-1endif
Load gp0 24 [Stack_pointer] 						#LOAD GP0
Store gp0 16 [Stack_pointer] 						#STORE GP0
Load gp0 @40
Store gp0 20 [Stack_pointer] 						#STORE GP0
Pass 										%loopprint_f-0entry
Load gp0 16 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @1092616192
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:fLess 												#CALLING fLess
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														
NOT gp0
if gp0 then Load PC loopprint_f-0exit 								#WHILE LOOP
Load gp0 16 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @1092616192
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:fDiv 												#CALLING fDiv
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 16 [Stack_pointer] 						#STORE GP0
Load gp1 20 [Stack_pointer] 						#LOAD GP0
Load gp0 @1
ADD gp0 gp1 														#ADD
Store gp0 20 [Stack_pointer] 						#STORE GP0
Load PC loopprint_f-0entry					%loopprint_f-0continue
Pass 										%loopprint_f-0exit
Pass 										%loopprint_f-1entry
Load gp0 16 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @1065353216
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:fLess 												#CALLING fLess
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0
if gp0 then Load PC loopprint_f-1exit 								#WHILE LOOP
Load gp0 16 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @1092616192
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:fMul 												#CALLING fMul
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 16 [Stack_pointer] 						#STORE GP0
Load gp0 20 [Stack_pointer] 						#LOAD GP0
Load gp1 @1
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Store gp0 20 [Stack_pointer] 						#STORE GP0
Load PC loopprint_f-1entry					%loopprint_f-1continue
Pass 										%loopprint_f-1exit
Load gp0 16 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:put_digit 												#CALLING put_digit
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 16 [Stack_pointer] 						#STORE GP0
Load gp0 16 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @1092616192
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:fMul 												#CALLING fMul
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 16 [Stack_pointer] 						#STORE GP0
Load gp0 @46
AND gp0 @255 													  #CASTING INT TO CHAR
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:putc 												#CALLING putc
Load gp0 @0
Store gp0 8 [Stack_pointer] 						#STORE GP0
Pass 										%loopprint_f-2entry 		#FOR LOOP
Load gp1 8 [Stack_pointer] 						#LOAD GP0
Load gp0 @7
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
NOT gp0
if gp0 then Load PC loopprint_f-2exit
Load gp0 16 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:put_digit 												#CALLING put_digit
Load gp0 @1092616192
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:fMul 												#CALLING fMul
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 16 [Stack_pointer] 						#STORE GP0
Pass 										%loopprint_f-2continue
Load gp1 8 [Stack_pointer] 						#LOAD GP0
Load gp0 @1
ADD gp0 gp1 														#ADD
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load PC loopprint_f-2entry
Pass 										%loopprint_f-2exit
Load gp0 @32
AND gp0 @255 													  #CASTING INT TO CHAR
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:putc 												#CALLING putc
Load gp0 @120
AND gp0 @255 													  #CASTING INT TO CHAR
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:putc 												#CALLING putc
Load gp0 @69
AND gp0 @255 													  #CASTING INT TO CHAR
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:putc 												#CALLING putc
Load gp1 20 [Stack_pointer] 						#LOAD GP0
Load gp0 @40
Load gp2 @4294967295  												#COMPARE (NOT LESS)
Compare gp1 gp0
if Less then Move Zero gp2
Move gp2 gp0
if gp0 then Load PC ifprint_f-2true 									#IF ELSE STATEMENT
Load gp0 @45
AND gp0 @255 													  #CASTING INT TO CHAR
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:putc 												#CALLING putc
Load gp0 @40
Load gp1 20 [Stack_pointer] 						#LOAD GP0
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:print_i 												#CALLING print_i
Load PC ifprint_f-2endif
Pass 										%ifprint_f-2true
Load gp0 20 [Stack_pointer] 						#LOAD GP0
Load gp1 @40
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:print_i 												#CALLING print_i
Pass 										%ifprint_f-2endif           
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
																	Scope tan
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:tan
SUB Stack_pointer @12 									#OVERHEAD FOR FUNCTION tan
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:sin 												#CALLING sin
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:cos 												#CALLING cos
Goto function:fDiv 												#CALLING fDiv
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
																	Scope print_c
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:print_c
SUB Stack_pointer @12 									#OVERHEAD FOR FUNCTION print_c
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load gp0 @40
AND gp0 @255 													  #CASTING INT TO CHAR
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:putc 												#CALLING putc
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:print_f 												#CALLING print_f
Load gp0 CLL.string2 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:print_f 												#CALLING print_f
Load gp0 CLL.string3 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifprint_c-0endif
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:dalloc 												#CALLING dalloc
Pass										%ifprint_c-0endif
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
																	Scope __fSub
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:__fSub
SUB Stack_pointer @40 									#OVERHEAD FOR FUNCTION __fSub
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 32 [Stack_pointer] 						#STORE GP0
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 28 [Stack_pointer] 						#STORE GP0
Load gp1 28 [Stack_pointer] 						#LOAD GP0
Load gp0 @2139095040
AND gp0 gp1 														#AND
Store gp0 36 [Stack_pointer] 						#STORE GP0
Load gp1 32 [Stack_pointer] 						#LOAD GP0
Load gp0 @2139095040
AND gp0 gp1 														#AND
Store gp0 24 [Stack_pointer] 						#STORE GP0
Load gp1 24 [Stack_pointer] 						#LOAD GP0
Load gp0 36 [Stack_pointer] 						#LOAD GP0
Move Zero gp2 														#COMPARE (IS GREATER)
Compare gp1 gp0
if Greater then Load gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC if__fSub-0endif
Load gp0 28 [Stack_pointer] 						#LOAD GP0
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load gp0 32 [Stack_pointer] 						#LOAD GP0
Store gp0 28 [Stack_pointer] 						#STORE GP0
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Store gp0 32 [Stack_pointer] 						#STORE GP0
Load gp1 28 [Stack_pointer] 						#LOAD GP0
Load gp0 @2139095040
AND gp0 gp1 														#AND
Store gp0 36 [Stack_pointer] 						#STORE GP0
Load gp1 32 [Stack_pointer] 						#LOAD GP0
Load gp0 @2139095040
AND gp0 gp1 														#AND
Store gp0 24 [Stack_pointer] 						#STORE GP0
Pass										%if__fSub-0endif
Load gp0 36 [Stack_pointer] 						#LOAD GP0
Load gp1 24 [Stack_pointer] 						#LOAD GP0
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Load gp1 @23
SHR gp0 gp1 														#SHIFT RIGHT
Store gp0 16 [Stack_pointer] 						#STORE GP0
Load gp1 28 [Stack_pointer] 						#LOAD GP0
Load gp0 @8388607
AND gp0 gp1 														#AND
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @8388608
OR gp0 gp1 															#OR
Store gp0 12 [Stack_pointer] 						#STORE GP0
Load gp1 32 [Stack_pointer] 						#LOAD GP0
Load gp0 @8388607
AND gp0 gp1 														#AND
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @8388608
OR gp0 gp1 															#OR
Load gp1 16 [Stack_pointer] 						#LOAD GP0
SHR gp0 gp1 														#SHIFT RIGHT
Store gp0 20 [Stack_pointer] 						#STORE GP0
Load gp1 20 [Stack_pointer] 						#LOAD GP0
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC if__fSub-1true 									#IF ELSE STATEMENT
Load gp0 20 [Stack_pointer] 						#LOAD GP0
Load gp1 12 [Stack_pointer] 						#LOAD GP0
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Store gp0 12 [Stack_pointer] 						#STORE GP0
Load gp1 28 [Stack_pointer] 						#LOAD GP0
Load gp0 @2147483648
XOR gp0 gp1 														#XOR
Store gp0 28 [Stack_pointer] 						#STORE GP0
Load PC if__fSub-1endif
Pass 										%if__fSub-1true
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Load gp1 20 [Stack_pointer] 						#LOAD GP0
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Store gp0 12 [Stack_pointer] 						#STORE GP0
Pass 										%if__fSub-1endif           
Pass 										%loop__fSub-0entry
Load gp1 12 [Stack_pointer] 						#LOAD GP0
Load gp0 @16777216
Load gp2 @4294967295  												#COMPARE (NOT LESS)
Compare gp1 gp0
if Less then Move Zero gp2
Move gp2 gp0
NOT gp0
if gp0 then Load PC loop__fSub-0exit 								#WHILE LOOP
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Load gp1 @1
SHR gp0 gp1 														#SHIFT RIGHT
Store gp0 12 [Stack_pointer] 						#STORE GP0
Load gp1 36 [Stack_pointer] 						#LOAD GP0
Load gp0 @8388608
ADD gp0 gp1 														#ADD
Store gp0 36 [Stack_pointer] 						#STORE GP0
Load gp1 36 [Stack_pointer] 						#LOAD GP0
Load gp0 @2147483648
Load gp2 @4294967295  												#COMPARE (NOT LESS)
Compare gp1 gp0
if Less then Move Zero gp2
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC if__fSub-2endif
Load gp0 @16777215
Store gp0 12 [Stack_pointer] 						#STORE GP0
Load gp0 @2139095040
Store gp0 36 [Stack_pointer] 						#STORE GP0
Load PC loop__fSub-0exit
Pass										%if__fSub-2endif
Load PC loop__fSub-0entry					%loop__fSub-0continue
Pass 										%loop__fSub-0exit
Pass 										%loop__fSub-1entry
Load gp1 12 [Stack_pointer] 						#LOAD GP0
Load gp0 @8388608
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
NOT gp0
if gp0 then Load PC loop__fSub-1exit 								#WHILE LOOP
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Load gp1 @1
SHL gp0 gp1 														#SHIFT LEFT
Store gp0 12 [Stack_pointer] 						#STORE GP0
Load gp0 36 [Stack_pointer] 						#LOAD GP0
Load gp1 @8388608
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Store gp0 36 [Stack_pointer] 						#STORE GP0
Load gp1 36 [Stack_pointer] 						#LOAD GP0
Load gp0 @8388608
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC if__fSub-3endif
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Pass										%if__fSub-3endif
Load PC loop__fSub-1entry					%loop__fSub-1continue
Pass 										%loop__fSub-1exit
Load gp1 36 [Stack_pointer] 						#LOAD GP0
Load gp0 @2147483648
Load gp2 @4294967295  												#COMPARE (NOT LESS)
Compare gp1 gp0
if Less then Move Zero gp2
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC if__fSub-4endif
Load gp0 @2139095040
Store gp0 36 [Stack_pointer] 						#STORE GP0
Load gp0 @16777215
Store gp0 12 [Stack_pointer] 						#STORE GP0
Pass										%if__fSub-4endif
Load gp1 28 [Stack_pointer] 						#LOAD GP0
Load gp0 @2147483648
AND gp0 gp1 														#AND
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 36 [Stack_pointer] 						#LOAD GP0
OR gp0 gp1 															#OR
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp1 12 [Stack_pointer] 						#LOAD GP0
Load gp0 @8388607
AND gp0 gp1 														#AND
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
																	Scope arcsec
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:arcsec
SUB Stack_pointer @12 									#OVERHEAD FOR FUNCTION arcsec
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load gp0 @1065353216
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:fDiv 												#CALLING fDiv
Goto function:arccos 												#CALLING arccos
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
																	Scope fSub
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:fSub
SUB Stack_pointer @24 									#OVERHEAD FOR FUNCTION fSub
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 8 [Stack_pointer] 						#STORE GP0
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 20 [Stack_pointer] 						#STORE GP0
Load gp1 20 [Stack_pointer] 						#LOAD GP0
Load gp0 @2147483648
AND gp0 gp1 														#AND
Store gp0 12 [Stack_pointer] 						#STORE GP0
Load gp1 8 [Stack_pointer] 						#LOAD GP0
Load gp0 @2147483648
XOR gp0 gp1 														#XOR
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load gp1 8 [Stack_pointer] 						#LOAD GP0
Load gp0 @2147483648
AND gp0 gp1 														#AND
Store gp0 16 [Stack_pointer] 						#STORE GP0
Load gp1 12 [Stack_pointer] 						#LOAD GP0
Load gp0 16 [Stack_pointer] 						#LOAD GP0
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC iffSub-0true 									#IF ELSE STATEMENT
Load gp0 20 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:__fSub 												#CALLING __fSub
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Load PC iffSub-0endif
Pass 										%iffSub-0true
Load gp0 20 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:__fAdd 												#CALLING __fAdd
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Pass 										%iffSub-0endif           
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
																	Scope malloc_init
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:malloc_init
SUB Stack_pointer @16 									#OVERHEAD FOR FUNCTION malloc_init
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
Load gp0 @0
Store gp0 8 [Stack_pointer] 						#STORE GP0
Pass 										%loopmalloc_init-0entry 		#FOR LOOP
Load gp1 8 [Stack_pointer] 						#LOAD GP0
Load gp0 @61144
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
NOT gp0
if gp0 then Load PC loopmalloc_init-0exit
Load gp1 8 [Stack_pointer] 						#LOAD GP0
Load gp0 @6
ADD gp0 gp1 														#ADD
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @61144
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifmalloc_init-0true 									#IF ELSE STATEMENT
Load gp0 @0
Store gp0 12 [Stack_pointer] 						#STORE GP0
Load PC ifmalloc_init-0endif
Pass 										%ifmalloc_init-0true
Load gp0 CLL.MALLOC_TREE_PARTITION 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp1 8 [Stack_pointer] 						#LOAD GP0
Load gp0 @6
ADD gp0 gp1 														#ADD
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @4
MUL gp0 gp1 														#MULTIPLY
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Store gp0 12 [Stack_pointer] 						#STORE GP0
Pass 										%ifmalloc_init-0endif           
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Load gp6 8 [Stack_pointer] 						#LOAD GP0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 CLL.MALLOC_TREE_PARTITION 											#STORE GP0 GLOBAL RELATIVE
Store gp0 0 [gp6]
Pass 										%loopmalloc_init-0continue
Load gp1 8 [Stack_pointer] 						#LOAD GP0
Load gp0 @6
ADD gp0 gp1 														#ADD
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load PC loopmalloc_init-0entry
Pass 										%loopmalloc_init-0exit
Load gp0 @65536
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
Goto function:create_tree_node 												#CALLING create_tree_node
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 CLL.MALLOC_TREE 										#STORE GP0 GLOBAL
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
																	Scope vPolar
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:vPolar
SUB Stack_pointer @20 									#OVERHEAD FOR FUNCTION vPolar
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
Load gp0 @3
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:malloc 												#CALLING malloc
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load gp0 @1
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 16 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:cos 												#CALLING cos
Goto function:fMul 												#CALLING fMul
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 16 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:sin 												#CALLING sin
Goto function:fMul 												#CALLING fMul
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#STORE GP0 RELATIVE
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
																	Scope create_tree_node
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:create_tree_node
SUB Stack_pointer @24 									#OVERHEAD FOR FUNCTION create_tree_node
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 8 [Stack_pointer] 						#STORE GP0
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 20 [Stack_pointer] 						#STORE GP0
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 16 [Stack_pointer] 						#STORE GP0
Load gp0 CLL.MALLOC_POOL 										#LOAD GP0 GLOBAL
Store gp0 12 [Stack_pointer] 						#STORE GP0
Load gp0 12 [Stack_pointer] 						#LOAD GP0
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
if gp0 then Load PC ifcreate_tree_node-0true 									#IF ELSE STATEMENT
Load gp0 CLL.string8 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Goto function:quit 												#CALLING quit
Load PC ifcreate_tree_node-0endif
Pass 										%ifcreate_tree_node-0true
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 12 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 CLL.MALLOC_POOL 										#STORE GP0 GLOBAL
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 12 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @0
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 12 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 20 [Stack_pointer] 						#LOAD GP0
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 12 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 16 [Stack_pointer] 						#LOAD GP0
Load gp6 @3
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 12 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @0
Load gp6 @4
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 12 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @0
Load gp6 @5
MUL gp6 @4 														   #INDEXING FOR @INT
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
Pass 										%ifcreate_tree_node-0endif           
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
																	Scope show
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:show
SUB Stack_pointer @20 									#OVERHEAD FOR FUNCTION show
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
Load gp0 @91
AND gp0 @255 													  #CASTING INT TO CHAR
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:putc 												#CALLING putc
Load gp0 @0
Store gp0 8 [Stack_pointer] 						#STORE GP0
Pass 										%loopshow-0entry 		#FOR LOOP
Load gp1 8 [Stack_pointer] 						#LOAD GP0
Load gp0 16 [Stack_pointer] 						#LOAD GP0
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
NOT gp0
if gp0 then Load PC loopshow-0exit
Load gp6 8 [Stack_pointer] 						#LOAD GP0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 12 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:print_c 												#CALLING print_c
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 16 [Stack_pointer] 						#LOAD GP0
Load gp1 @1
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifshow-0endif
Load gp0 CLL.string16 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Pass										%ifshow-0endif
Pass 										%loopshow-0continue
Load gp1 8 [Stack_pointer] 						#LOAD GP0
Load gp0 @1
ADD gp0 gp1 														#ADD
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load PC loopshow-0entry
Pass 										%loopshow-0exit
Load gp0 @93
AND gp0 @255 													  #CASTING INT TO CHAR
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:putc 												#CALLING putc
Load gp0 @10
AND gp0 @255 													  #CASTING INT TO CHAR
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:putc 												#CALLING putc
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
																	Scope sqrt
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:sqrt
SUB Stack_pointer @20 									#OVERHEAD FOR FUNCTION sqrt
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 12 [Stack_pointer] 						#STORE GP0
Load gp0 @1073741824
Store gp0 16 [Stack_pointer] 						#STORE GP0
Load gp0 @0
Store gp0 8 [Stack_pointer] 						#STORE GP0
Pass 										%loopsqrt-0entry 		#FOR LOOP
Load gp1 8 [Stack_pointer] 						#LOAD GP0
Load gp0 @20
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
NOT gp0
if gp0 then Load PC loopsqrt-0exit
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 16 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:fDiv 												#CALLING fDiv
Load gp0 16 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:fAdd 												#CALLING fAdd
Load gp0 @1073741824
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:fDiv 												#CALLING fDiv
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 16 [Stack_pointer] 						#STORE GP0
Pass 										%loopsqrt-0continue
Load gp1 8 [Stack_pointer] 						#LOAD GP0
Load gp0 @1
ADD gp0 gp1 														#ADD
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load PC loopsqrt-0entry
Pass 										%loopsqrt-0exit
Load gp0 16 [Stack_pointer] 						#LOAD GP0
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
																	Scope arctan
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:arctan
SUB Stack_pointer @32 									#OVERHEAD FOR FUNCTION arctan
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 20 [Stack_pointer] 						#STORE GP0
Load gp1 20 [Stack_pointer] 						#LOAD GP0
Load gp0 @0
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifarctan-0endif
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Pass										%ifarctan-0endif
Load gp0 @1065353216
Store gp0 28 [Stack_pointer] 						#STORE GP0
Load gp0 20 [Stack_pointer] 						#LOAD GP0
Store gp0 12 [Stack_pointer] 						#STORE GP0
Load gp0 20 [Stack_pointer] 						#LOAD GP0
Store gp0 24 [Stack_pointer] 						#STORE GP0
Load gp0 20 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 20 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:fMul 												#CALLING fMul
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load gp0 @3
Store gp0 16 [Stack_pointer] 						#STORE GP0
Pass 										%looparctan-0entry 		#FOR LOOP
Load gp1 16 [Stack_pointer] 						#LOAD GP0
Load gp0 @20
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
NOT gp0
if gp0 then Load PC looparctan-0exit
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:fMul 												#CALLING fMul
Goto function:fNegate 												#CALLING fNegate
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 12 [Stack_pointer] 						#STORE GP0
Load gp0 28 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:float 												#CALLING float
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 28 [Stack_pointer] 						#STORE GP0
Load gp0 24 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 28 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:fDiv 												#CALLING fDiv
Goto function:fAdd 												#CALLING fAdd
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 24 [Stack_pointer] 						#STORE GP0
Pass 										%looparctan-0continue
Load gp1 16 [Stack_pointer] 						#LOAD GP0
Load gp0 @2
ADD gp0 gp1 														#ADD
Store gp0 16 [Stack_pointer] 						#STORE GP0
Load PC looparctan-0entry
Pass 										%looparctan-0exit
Load gp0 28 [Stack_pointer] 						#LOAD GP0
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
																	Scope fMul
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:fMul
SUB Stack_pointer @52 									#OVERHEAD FOR FUNCTION fMul
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 44 [Stack_pointer] 						#STORE GP0
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 40 [Stack_pointer] 						#STORE GP0
Load gp1 40 [Stack_pointer] 						#LOAD GP0
Load gp0 @2147483648
AND gp0 gp1 														#AND
Store gp0 20 [Stack_pointer] 						#STORE GP0
Load gp1 44 [Stack_pointer] 						#LOAD GP0
Load gp0 @2147483648
AND gp0 gp1 														#AND
Store gp0 24 [Stack_pointer] 						#STORE GP0
Load gp1 40 [Stack_pointer] 						#LOAD GP0
Load gp0 @2139095040
AND gp0 gp1 														#AND
Store gp0 48 [Stack_pointer] 						#STORE GP0
Load gp1 44 [Stack_pointer] 						#LOAD GP0
Load gp0 @2139095040
AND gp0 gp1 														#AND
Store gp0 36 [Stack_pointer] 						#STORE GP0
Load gp1 40 [Stack_pointer] 						#LOAD GP0
Load gp0 @8388607
AND gp0 gp1 														#AND
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @8388608
OR gp0 gp1 															#OR
Store gp0 28 [Stack_pointer] 						#STORE GP0
Load gp1 44 [Stack_pointer] 						#LOAD GP0
Load gp0 @8388607
AND gp0 gp1 														#AND
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @8388608
OR gp0 gp1 															#OR
Store gp0 32 [Stack_pointer] 						#STORE GP0
Load gp1 20 [Stack_pointer] 						#LOAD GP0
Load gp0 24 [Stack_pointer] 						#LOAD GP0
XOR gp0 gp1 														#XOR
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load gp1 48 [Stack_pointer] 						#LOAD GP0
Load gp0 36 [Stack_pointer] 						#LOAD GP0
ADD gp0 gp1 														#ADD
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @3204448256
Move Zero gp2 														#COMPARE (IS GREATER)
Compare gp1 gp0
if Greater then Load gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC iffMul-0endif
Load gp1 8 [Stack_pointer] 						#LOAD GP0
Load gp0 @2147483647
OR gp0 gp1 															#OR
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Pass										%iffMul-0endif
Load gp1 48 [Stack_pointer] 						#LOAD GP0
Load gp0 36 [Stack_pointer] 						#LOAD GP0
ADD gp0 gp1 														#ADD
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @1065353216
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC iffMul-1endif
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Pass										%iffMul-1endif
Load gp1 48 [Stack_pointer] 						#LOAD GP0
Load gp0 36 [Stack_pointer] 						#LOAD GP0
ADD gp0 gp1 														#ADD
Load gp1 @1065353216
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Store gp0 16 [Stack_pointer] 						#STORE GP0
Load gp0 28 [Stack_pointer] 						#LOAD GP0
Load gp1 @12
SHR gp0 gp1 														#SHIFT RIGHT
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 32 [Stack_pointer] 						#LOAD GP0
Load gp1 @12
SHR gp0 gp1 														#SHIFT RIGHT
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
MUL gp0 gp1 														#MULTIPLY
Load gp1 @1
SHL gp0 gp1 														#SHIFT LEFT
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 28 [Stack_pointer] 						#LOAD GP0
Load gp1 @12
SHR gp0 gp1 														#SHIFT RIGHT
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp1 32 [Stack_pointer] 						#LOAD GP0
Load gp0 @4095
AND gp0 gp1 														#AND
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
MUL gp0 gp1 														#MULTIPLY
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 32 [Stack_pointer] 						#LOAD GP0
Load gp1 @12
SHR gp0 gp1 														#SHIFT RIGHT
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp1 28 [Stack_pointer] 						#LOAD GP0
Load gp0 @4095
AND gp0 gp1 														#AND
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
MUL gp0 gp1 														#MULTIPLY
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Load gp1 @11
SHR gp0 gp1 														#SHIFT RIGHT
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Store gp0 12 [Stack_pointer] 						#STORE GP0
Load gp1 12 [Stack_pointer] 						#LOAD GP0
Load gp0 @16777216
Load gp2 @4294967295  												#COMPARE (NOT LESS)
Compare gp1 gp0
if Less then Move Zero gp2
Move gp2 gp0
if gp0 then Load PC iffMul-3true 									#IF ELSE STATEMENT
Load gp1 12 [Stack_pointer] 						#LOAD GP0
Load gp0 @8388608
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC iffMul-2endif
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Load gp1 @1
SHL gp0 gp1 														#SHIFT LEFT
Store gp0 12 [Stack_pointer] 						#STORE GP0
Load gp0 16 [Stack_pointer] 						#LOAD GP0
Load gp1 @8388608
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Store gp0 16 [Stack_pointer] 						#STORE GP0
Pass										%iffMul-2endif
Load PC iffMul-3endif
Pass 										%iffMul-3true
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Load gp1 @1
SHR gp0 gp1 														#SHIFT RIGHT
Store gp0 12 [Stack_pointer] 						#STORE GP0
Load gp1 16 [Stack_pointer] 						#LOAD GP0
Load gp0 @8388608
ADD gp0 gp1 														#ADD
Store gp0 16 [Stack_pointer] 						#STORE GP0
Pass 										%iffMul-3endif           
Load gp1 16 [Stack_pointer] 						#LOAD GP0
Load gp0 @2147483648
Load gp2 @4294967295  												#COMPARE (NOT LESS)
Compare gp1 gp0
if Less then Move Zero gp2
Move gp2 gp0
if gp0 then Load PC iffMul-5true 									#IF ELSE STATEMENT
Load gp1 16 [Stack_pointer] 						#LOAD GP0
Load gp0 @8388608
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC iffMul-4endif
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Pass										%iffMul-4endif
Load PC iffMul-5endif
Pass 										%iffMul-5true
Load gp0 @2139095040
Store gp0 16 [Stack_pointer] 						#STORE GP0
Load gp0 @16777215
Store gp0 12 [Stack_pointer] 						#STORE GP0
Pass 										%iffMul-5endif           
Load gp1 8 [Stack_pointer] 						#LOAD GP0
Load gp0 16 [Stack_pointer] 						#LOAD GP0
OR gp0 gp1 															#OR
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp1 12 [Stack_pointer] 						#LOAD GP0
Load gp0 @8388607
AND gp0 gp1 														#AND
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
																	Scope init
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:init
SUB Stack_pointer @28 									#OVERHEAD FOR FUNCTION init
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 24 [Stack_pointer] 						#STORE GP0
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 12 [Stack_pointer] 						#STORE GP0
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 16 [Stack_pointer] 						#STORE GP0
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 20 [Stack_pointer] 						#STORE GP0
Load gp0 @0
Store gp0 8 [Stack_pointer] 						#STORE GP0
Pass 										%loopinit-0entry 		#FOR LOOP
Load gp1 8 [Stack_pointer] 						#LOAD GP0
Load gp0 24 [Stack_pointer] 						#LOAD GP0
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
NOT gp0
if gp0 then Load PC loopinit-0exit
Load gp6 8 [Stack_pointer] 						#LOAD GP0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 20 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:complex 												#CALLING complex
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Load gp6 8 [Stack_pointer] 						#LOAD GP0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 16 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:complex 												#CALLING complex
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Load gp6 8 [Stack_pointer] 						#LOAD GP0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 12 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Pass 										%loopinit-0continue
Load gp1 8 [Stack_pointer] 						#LOAD GP0
Load gp0 @1
ADD gp0 gp1 														#ADD
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load PC loopinit-0entry
Pass 										%loopinit-0exit
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
																	Scope complex
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:complex
SUB Stack_pointer @20 									#OVERHEAD FOR FUNCTION complex
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 12 [Stack_pointer] 						#STORE GP0
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 16 [Stack_pointer] 						#STORE GP0
Load gp0 @3
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:malloc 												#CALLING malloc
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load gp0 @0
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 16 [Stack_pointer] 						#LOAD GP0
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#STORE GP0 RELATIVE
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
																	Scope cAdd
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:cAdd
SUB Stack_pointer @16 									#OVERHEAD FOR FUNCTION cAdd
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
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 12 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifcAdd-0endif
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:dalloc 												#CALLING dalloc
Pass										%ifcAdd-0endif
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifcAdd-1endif
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:dalloc 												#CALLING dalloc
Pass										%ifcAdd-1endif
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 12 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
AND gp0 gp1
if gp0 then Load PC ifcAdd-2true 									#IF ELSE STATEMENT
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 12 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:fAdd 												#CALLING fAdd
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 12 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:fAdd 												#CALLING fAdd
Goto function:complex 												#CALLING complex
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Load PC ifcAdd-2endif
Pass 										%ifcAdd-2true
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 12 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:fAdd 												#CALLING fAdd
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 12 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:fAdd 												#CALLING fAdd
Goto function:vComplex 												#CALLING vComplex
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Pass 										%ifcAdd-2endif           
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
																	Scope cCopy
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:cCopy
SUB Stack_pointer @16 									#OVERHEAD FOR FUNCTION cCopy
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 12 [Stack_pointer] 						#STORE GP0
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 12 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 12 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 12 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 12 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifcCopy-0endif
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:dalloc 												#CALLING dalloc
Pass										%ifcCopy-0endif
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC

########################## PUTC (char) ########################################
SUB gp7 @4 															%function:putc
Load gp0  Expression_stack [gp7]
Out gp0
Move Jump PC
################################################################################																	Scope __fAdd
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:__fAdd
SUB Stack_pointer @40 									#OVERHEAD FOR FUNCTION __fAdd
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 32 [Stack_pointer] 						#STORE GP0
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 28 [Stack_pointer] 						#STORE GP0
Load gp1 28 [Stack_pointer] 						#LOAD GP0
Load gp0 @2139095040
AND gp0 gp1 														#AND
Store gp0 36 [Stack_pointer] 						#STORE GP0
Load gp1 32 [Stack_pointer] 						#LOAD GP0
Load gp0 @2139095040
AND gp0 gp1 														#AND
Store gp0 24 [Stack_pointer] 						#STORE GP0
Load gp1 24 [Stack_pointer] 						#LOAD GP0
Load gp0 36 [Stack_pointer] 						#LOAD GP0
Move Zero gp2 														#COMPARE (IS GREATER)
Compare gp1 gp0
if Greater then Load gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC if__fAdd-0endif
Load gp0 28 [Stack_pointer] 						#LOAD GP0
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load gp0 32 [Stack_pointer] 						#LOAD GP0
Store gp0 28 [Stack_pointer] 						#STORE GP0
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Store gp0 32 [Stack_pointer] 						#STORE GP0
Load gp1 28 [Stack_pointer] 						#LOAD GP0
Load gp0 @2139095040
AND gp0 gp1 														#AND
Store gp0 36 [Stack_pointer] 						#STORE GP0
Load gp1 32 [Stack_pointer] 						#LOAD GP0
Load gp0 @2139095040
AND gp0 gp1 														#AND
Store gp0 24 [Stack_pointer] 						#STORE GP0
Pass										%if__fAdd-0endif
Load gp0 36 [Stack_pointer] 						#LOAD GP0
Load gp1 24 [Stack_pointer] 						#LOAD GP0
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Load gp1 @23
SHR gp0 gp1 														#SHIFT RIGHT
Store gp0 16 [Stack_pointer] 						#STORE GP0
Load gp1 28 [Stack_pointer] 						#LOAD GP0
Load gp0 @8388607
AND gp0 gp1 														#AND
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @8388608
OR gp0 gp1 															#OR
Store gp0 12 [Stack_pointer] 						#STORE GP0
Load gp1 32 [Stack_pointer] 						#LOAD GP0
Load gp0 @8388607
AND gp0 gp1 														#AND
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @8388608
OR gp0 gp1 															#OR
Load gp1 16 [Stack_pointer] 						#LOAD GP0
SHR gp0 gp1 														#SHIFT RIGHT
Store gp0 20 [Stack_pointer] 						#STORE GP0
Load gp1 12 [Stack_pointer] 						#LOAD GP0
Load gp0 20 [Stack_pointer] 						#LOAD GP0
ADD gp0 gp1 														#ADD
Store gp0 12 [Stack_pointer] 						#STORE GP0
Pass 										%loop__fAdd-0entry
Load gp1 12 [Stack_pointer] 						#LOAD GP0
Load gp0 @16777216
Load gp2 @4294967295  												#COMPARE (NOT LESS)
Compare gp1 gp0
if Less then Move Zero gp2
Move gp2 gp0
NOT gp0
if gp0 then Load PC loop__fAdd-0exit 								#WHILE LOOP
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Load gp1 @1
SHR gp0 gp1 														#SHIFT RIGHT
Store gp0 12 [Stack_pointer] 						#STORE GP0
Load gp1 36 [Stack_pointer] 						#LOAD GP0
Load gp0 @8388608
ADD gp0 gp1 														#ADD
Store gp0 36 [Stack_pointer] 						#STORE GP0
Load PC loop__fAdd-0entry					%loop__fAdd-0continue
Pass 										%loop__fAdd-0exit
Load gp1 36 [Stack_pointer] 						#LOAD GP0
Load gp0 @2147483648
Load gp2 @4294967295  												#COMPARE (NOT LESS)
Compare gp1 gp0
if Less then Move Zero gp2
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC if__fAdd-1endif
Load gp0 @2139095040
Store gp0 36 [Stack_pointer] 						#STORE GP0
Load gp0 @16777215
Store gp0 12 [Stack_pointer] 						#STORE GP0
Pass										%if__fAdd-1endif
Load gp1 28 [Stack_pointer] 						#LOAD GP0
Load gp0 @2147483648
AND gp0 gp1 														#AND
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 36 [Stack_pointer] 						#LOAD GP0
OR gp0 gp1 															#OR
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp1 12 [Stack_pointer] 						#LOAD GP0
Load gp0 @8388607
AND gp0 gp1 														#AND
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
																	Scope print_pool
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:print_pool
SUB Stack_pointer @12 									#OVERHEAD FOR FUNCTION print_pool
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load gp0 8 [Stack_pointer] 						#LOAD GP0
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifprint_pool-0endif
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:print_i 												#CALLING print_i
Load gp0 CLL.string9 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
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
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:print_pool 												#CALLING print_pool
Pass										%ifprint_pool-0endif
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
																	Scope cMov
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:cMov
SUB Stack_pointer @16 									#OVERHEAD FOR FUNCTION cMov
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 12 [Stack_pointer] 						#STORE GP0
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 12 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 12 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 12 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:dalloc 												#CALLING dalloc
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
																	Scope fLess
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:fLess
SUB Stack_pointer @40 									#OVERHEAD FOR FUNCTION fLess
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 32 [Stack_pointer] 						#STORE GP0
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 28 [Stack_pointer] 						#STORE GP0
Load gp1 28 [Stack_pointer] 						#LOAD GP0
Load gp0 @2147483648
AND gp0 gp1 														#AND
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load gp1 32 [Stack_pointer] 						#LOAD GP0
Load gp0 @2147483648
AND gp0 gp1 														#AND
Store gp0 12 [Stack_pointer] 						#STORE GP0
Load gp1 28 [Stack_pointer] 						#LOAD GP0
Load gp0 @2139095040
AND gp0 gp1 														#AND
Store gp0 36 [Stack_pointer] 						#STORE GP0
Load gp1 32 [Stack_pointer] 						#LOAD GP0
Load gp0 @2139095040
AND gp0 gp1 														#AND
Store gp0 24 [Stack_pointer] 						#STORE GP0
Load gp1 28 [Stack_pointer] 						#LOAD GP0
Load gp0 @8388607
AND gp0 gp1 														#AND
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @8388608
OR gp0 gp1 															#OR
Store gp0 16 [Stack_pointer] 						#STORE GP0
Load gp1 32 [Stack_pointer] 						#LOAD GP0
Load gp0 @8388607
AND gp0 gp1 														#AND
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @8388608
OR gp0 gp1 															#OR
Store gp0 20 [Stack_pointer] 						#STORE GP0
Load gp1 8 [Stack_pointer] 						#LOAD GP0
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Move Zero gp2 														#COMPARE (IS GREATER)
Compare gp1 gp0
if Greater then Load gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC iffLess-0endif
Load gp0 @1
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Pass										%iffLess-0endif
Load gp1 12 [Stack_pointer] 						#LOAD GP0
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Move Zero gp2 														#COMPARE (IS GREATER)
Compare gp1 gp0
if Greater then Load gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC iffLess-1endif
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Pass										%iffLess-1endif
Load gp0 8 [Stack_pointer] 						#LOAD GP0
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
if gp0 then Load PC iffLess-8true 									#IF ELSE STATEMENT
Load gp1 36 [Stack_pointer] 						#LOAD GP0
Load gp0 24 [Stack_pointer] 						#LOAD GP0
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC iffLess-5endif
Load gp0 @1
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Pass										%iffLess-5endif
Load gp1 24 [Stack_pointer] 						#LOAD GP0
Load gp0 36 [Stack_pointer] 						#LOAD GP0
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC iffLess-6endif
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Pass										%iffLess-6endif
Load gp1 16 [Stack_pointer] 						#LOAD GP0
Load gp0 20 [Stack_pointer] 						#LOAD GP0
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC iffLess-7endif
Load gp0 @1
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Pass										%iffLess-7endif
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Load PC iffLess-8endif
Pass 										%iffLess-8true
Load gp1 36 [Stack_pointer] 						#LOAD GP0
Load gp0 24 [Stack_pointer] 						#LOAD GP0
Move Zero gp2 														#COMPARE (IS GREATER)
Compare gp1 gp0
if Greater then Load gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC iffLess-2endif
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Pass										%iffLess-2endif
Load gp1 24 [Stack_pointer] 						#LOAD GP0
Load gp0 36 [Stack_pointer] 						#LOAD GP0
Move Zero gp2 														#COMPARE (IS GREATER)
Compare gp1 gp0
if Greater then Load gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC iffLess-3endif
Load gp0 @1
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Pass										%iffLess-3endif
Load gp1 16 [Stack_pointer] 						#LOAD GP0
Load gp0 20 [Stack_pointer] 						#LOAD GP0
Move Zero gp2 														#COMPARE (IS GREATER)
Compare gp1 gp0
if Greater then Load gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC iffLess-4endif
Load gp0 @1
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Pass										%iffLess-4endif
Pass 										%iffLess-8endif           
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
																	Scope sin
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:sin
SUB Stack_pointer @32 									#OVERHEAD FOR FUNCTION sin
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 20 [Stack_pointer] 						#STORE GP0
Load gp1 20 [Stack_pointer] 						#LOAD GP0
Load gp0 @0
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifsin-0endif
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Pass										%ifsin-0endif
Load gp0 20 [Stack_pointer] 						#LOAD GP0
Store gp0 28 [Stack_pointer] 						#STORE GP0
Load gp0 @1065353216
Store gp0 12 [Stack_pointer] 						#STORE GP0
Load gp0 20 [Stack_pointer] 						#LOAD GP0
Store gp0 24 [Stack_pointer] 						#STORE GP0
Load gp0 @2
Store gp0 16 [Stack_pointer] 						#STORE GP0
Pass 										%loopsin-0entry 		#FOR LOOP
Load gp1 16 [Stack_pointer] 						#LOAD GP0
Load gp0 @20
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
NOT gp0
if gp0 then Load PC loopsin-0exit
Load gp0 16 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp1 16 [Stack_pointer] 						#LOAD GP0
Load gp0 @1
ADD gp0 gp1 														#ADD
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
MUL gp0 gp1 														#MULTIPLY
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:float 												#CALLING float
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load gp0 20 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
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
Goto function:fMul 												#CALLING fMul
Goto function:fMul 												#CALLING fMul
Goto function:fNegate 												#CALLING fNegate
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 28 [Stack_pointer] 						#STORE GP0
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
Goto function:fMul 												#CALLING fMul
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 12 [Stack_pointer] 						#STORE GP0
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
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:fDiv 												#CALLING fDiv
Goto function:fAdd 												#CALLING fAdd
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 24 [Stack_pointer] 						#STORE GP0
Pass 										%loopsin-0continue
Load gp1 16 [Stack_pointer] 						#LOAD GP0
Load gp0 @2
ADD gp0 gp1 														#ADD
Store gp0 16 [Stack_pointer] 						#STORE GP0
Load PC loopsin-0entry
Pass 										%loopsin-0exit
Load gp0 24 [Stack_pointer] 						#LOAD GP0
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
																	Scope __dump_malloc
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:__dump_malloc
SUB Stack_pointer @16 									#OVERHEAD FOR FUNCTION __dump_malloc
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 12 [Stack_pointer] 						#STORE GP0
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:ntab 												#CALLING ntab
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:print_i 												#CALLING print_i
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
if gp0 then Load PC if__dump_malloc-0true 									#IF ELSE STATEMENT
Load gp0 CLL.string12 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load PC if__dump_malloc-0endif
Pass 										%if__dump_malloc-0true
Load gp0 CLL.string11 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Pass 										%if__dump_malloc-0endif           
Load gp6 @4
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
if gp0 then Load PC if__dump_malloc-1true 									#IF ELSE STATEMENT
Load gp6 @3
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:print_i 												#CALLING print_i
Load PC if__dump_malloc-1endif
Pass 										%if__dump_malloc-1true
Load gp0 CLL.string13 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp6 @4
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp1 12 [Stack_pointer] 						#LOAD GP0
Load gp0 @1
ADD gp0 gp1 														#ADD
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:__dump_malloc 												#CALLING __dump_malloc
Load gp0 CLL.string14 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp6 @5
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp1 12 [Stack_pointer] 						#LOAD GP0
Load gp0 @1
ADD gp0 gp1 														#ADD
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:__dump_malloc 												#CALLING __dump_malloc
Pass 										%if__dump_malloc-1endif           
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
																	Scope polar
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:polar
SUB Stack_pointer @20 									#OVERHEAD FOR FUNCTION polar
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
Load gp0 @3
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:malloc 												#CALLING malloc
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load gp0 @0
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 16 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:cos 												#CALLING cos
Goto function:fMul 												#CALLING fMul
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 16 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:sin 												#CALLING sin
Goto function:fMul 												#CALLING fMul
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#STORE GP0 RELATIVE
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
																	Scope fft
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:fft
SUB Stack_pointer @24 									#OVERHEAD FOR FUNCTION fft
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 20 [Stack_pointer] 						#STORE GP0
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 12 [Stack_pointer] 						#STORE GP0
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 16 [Stack_pointer] 						#STORE GP0
Load gp0 @0
Store gp0 8 [Stack_pointer] 						#STORE GP0
Pass 										%loopfft-0entry 		#FOR LOOP
Load gp1 8 [Stack_pointer] 						#LOAD GP0
Load gp0 20 [Stack_pointer] 						#LOAD GP0
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
NOT gp0
if gp0 then Load PC loopfft-0exit
Load gp6 8 [Stack_pointer] 						#LOAD GP0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 12 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp6 8 [Stack_pointer] 						#LOAD GP0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 16 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:cCopy 												#CALLING cCopy
Pass 										%loopfft-0continue
Load gp1 8 [Stack_pointer] 						#LOAD GP0
Load gp0 @1
ADD gp0 gp1 														#ADD
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load PC loopfft-0entry
Pass 										%loopfft-0exit
Load gp0 16 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 20 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @1
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:_fft 												#CALLING _fft
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
																	Scope fEqual
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:fEqual
SUB Stack_pointer @16 									#OVERHEAD FOR FUNCTION fEqual
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 12 [Stack_pointer] 						#STORE GP0
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load gp1 8 [Stack_pointer] 						#LOAD GP0
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC iffEqual-0true 									#IF ELSE STATEMENT
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load PC iffEqual-0endif
Pass 										%iffEqual-0true
Load gp0 @1
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Pass 										%iffEqual-0endif           
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
																	Scope main
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:main
SUB Stack_pointer @116 									#OVERHEAD FOR FUNCTION main
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
Load gp0 CLL.MALLOC_TREE_PARTITION 										#LOAD GP0 GLOBAL
Store gp0 CLL.MALLOC_POOL 										#STORE GP0 GLOBAL
Goto function:malloc_init 												#CALLING malloc_init
Move Stack_pointer gp0 											#GETTING POINTER
ADD gp0 @76
Store gp0 112 [Stack_pointer] 						#STORE GP0
Load gp0 @1065353216
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 112 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @1065353216
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 112 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @1065353216
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 112 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @1065353216
Load gp6 @3
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 112 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @0
Load gp6 @4
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 112 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @0
Load gp6 @5
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 112 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @0
Load gp6 @6
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 112 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @0
Load gp6 @7
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 112 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Move Stack_pointer gp0 											#GETTING POINTER
ADD gp0 @40
Store gp0 108 [Stack_pointer] 						#STORE GP0
Move Stack_pointer gp0 											#GETTING POINTER
ADD gp0 @8
Store gp0 72 [Stack_pointer] 						#STORE GP0
Load gp0 112 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 108 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 72 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @8
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:init 												#CALLING init
Load gp0 108 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @8
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:show 												#CALLING show
Load gp0 @10
AND gp0 @255 													  #CASTING INT TO CHAR
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:putc 												#CALLING putc
Load gp0 72 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @8
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:show 												#CALLING show
Load gp0 @10
AND gp0 @255 													  #CASTING INT TO CHAR
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:putc 												#CALLING putc
Load gp0 108 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 72 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @8
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:fft 												#CALLING fft
Load gp0 72 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @8
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:show 												#CALLING show
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
																	Scope arcsin
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:arcsin
SUB Stack_pointer @40 									#OVERHEAD FOR FUNCTION arcsin
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 32 [Stack_pointer] 						#STORE GP0
Load gp1 32 [Stack_pointer] 						#LOAD GP0
Load gp0 @0
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifarcsin-0endif
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Pass										%ifarcsin-0endif
Load gp0 32 [Stack_pointer] 						#LOAD GP0
Store gp0 20 [Stack_pointer] 						#STORE GP0
Load gp0 @1065353216
Store gp0 16 [Stack_pointer] 						#STORE GP0
Load gp0 @1065353216
Store gp0 28 [Stack_pointer] 						#STORE GP0
Load gp0 32 [Stack_pointer] 						#LOAD GP0
Store gp0 36 [Stack_pointer] 						#STORE GP0
Load gp0 32 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 32 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:fMul 												#CALLING fMul
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load gp0 @3
Store gp0 12 [Stack_pointer] 						#STORE GP0
Pass 										%looparcsin-0entry 		#FOR LOOP
Load gp1 12 [Stack_pointer] 						#LOAD GP0
Load gp0 @20
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
NOT gp0
if gp0 then Load PC looparcsin-0exit
Load gp0 28 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Load gp1 @2
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:float 												#CALLING float
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Load gp1 @2
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:float 												#CALLING float
Goto function:fDiv 												#CALLING fDiv
Goto function:fMul 												#CALLING fMul
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 28 [Stack_pointer] 						#STORE GP0
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:float 												#CALLING float
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 16 [Stack_pointer] 						#STORE GP0
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 20 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:fMul 												#CALLING fMul
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 20 [Stack_pointer] 						#STORE GP0
Load gp0 36 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 28 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
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
Goto function:fDiv 												#CALLING fDiv
Goto function:fMul 												#CALLING fMul
Goto function:fAdd 												#CALLING fAdd
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 36 [Stack_pointer] 						#STORE GP0
Pass 										%looparcsin-0continue
Load gp1 12 [Stack_pointer] 						#LOAD GP0
Load gp0 @2
ADD gp0 gp1 														#ADD
Store gp0 12 [Stack_pointer] 						#STORE GP0
Load PC looparcsin-0entry
Pass 										%looparcsin-0exit
Load gp0 36 [Stack_pointer] 						#LOAD GP0
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
																	Scope fNegate
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:fNegate
SUB Stack_pointer @12 									#OVERHEAD FOR FUNCTION fNegate
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load gp1 8 [Stack_pointer] 						#LOAD GP0
Load gp0 @2147483648
XOR gp0 gp1 														#XOR
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
																	Scope cInc
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:cInc
SUB Stack_pointer @16 									#OVERHEAD FOR FUNCTION cInc
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
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifcInc-0endif
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:dalloc 												#CALLING dalloc
Pass										%ifcInc-0endif
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 12 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:fAdd 												#CALLING fAdd
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 12 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 12 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:fAdd 												#CALLING fAdd
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 12 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
																	Scope __malloc
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:__malloc
SUB Stack_pointer @32 									#OVERHEAD FOR FUNCTION __malloc
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 28 [Stack_pointer] 						#STORE GP0
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load gp6 @3
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 12 [Stack_pointer] 						#STORE GP0
Load gp1 28 [Stack_pointer] 						#LOAD GP0
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Move Zero gp2 														#COMPARE (IS GREATER)
Compare gp1 gp0
if Greater then Load gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC if__malloc-11true 									#IF ELSE STATEMENT
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC if__malloc-0endif
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Pass										%if__malloc-0endif
Load gp0 28 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Load gp1 @2
DIV gp0 gp1 														#DIVIDE
if DivByZero then Load PC DIV_BY_ZERO
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
Move Zero gp2 														#COMPARE (IS GREATER)
Compare gp1 gp0
if Greater then Load gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC if__malloc-2endif
Load gp6 @4
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC if__malloc-1endif
Load gp0 @1
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp6 @2
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
Pass										%if__malloc-1endif
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Pass										%if__malloc-2endif
Load gp1 12 [Stack_pointer] 						#LOAD GP0
Load gp0 @1
Move Zero gp2 														#COMPARE (IS GREATER)
Compare gp1 gp0
if Greater then Load gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC if__malloc-10endif
Load gp6 @4
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 24 [Stack_pointer] 						#STORE GP0
Load gp0 24 [Stack_pointer] 						#LOAD GP0
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC if__malloc-3endif
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:split_tree_node 												#CALLING split_tree_node
Load gp6 @4
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 24 [Stack_pointer] 						#STORE GP0
Pass										%if__malloc-3endif
Load gp6 @5
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 20 [Stack_pointer] 						#STORE GP0
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 24 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC if__malloc-6endif
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
Goto function:__malloc 												#CALLING __malloc
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 16 [Stack_pointer] 						#STORE GP0
Load gp0 16 [Stack_pointer] 						#LOAD GP0
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC if__malloc-5endif
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 24 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 20 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
AND gp0 gp1 														#AND
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC if__malloc-4endif
Load gp0 @1
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Pass										%if__malloc-4endif
Load gp0 16 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Pass										%if__malloc-5endif
Pass										%if__malloc-6endif
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 20 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC if__malloc-9endif
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
Goto function:__malloc 												#CALLING __malloc
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 16 [Stack_pointer] 						#STORE GP0
Load gp0 16 [Stack_pointer] 						#LOAD GP0
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC if__malloc-8endif
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 24 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 20 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
AND gp0 gp1 														#AND
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC if__malloc-7endif
Load gp0 @1
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Pass										%if__malloc-7endif
Load gp0 16 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Pass										%if__malloc-8endif
Pass										%if__malloc-9endif
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Pass										%if__malloc-10endif
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Load PC if__malloc-11endif
Pass 										%if__malloc-11true
Load gp0 CLL.string6 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Goto function:quit 												#CALLING quit
Pass 										%if__malloc-11endif           
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
																	Scope __isAllocated
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:__isAllocated
SUB Stack_pointer @36 									#OVERHEAD FOR FUNCTION __isAllocated
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 32 [Stack_pointer] 						#STORE GP0
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 28 [Stack_pointer] 						#STORE GP0
Load gp6 @3
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 32 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 20 [Stack_pointer] 						#STORE GP0
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 32 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load gp0 20 [Stack_pointer] 						#LOAD GP0
Load gp1 @2
DIV gp0 gp1 														#DIVIDE
if DivByZero then Load PC DIV_BY_ZERO
Store gp0 12 [Stack_pointer] 						#STORE GP0
Load gp6 @4
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 32 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 24 [Stack_pointer] 						#STORE GP0
Load gp6 @5
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 32 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 16 [Stack_pointer] 						#STORE GP0
Load gp0 28 [Stack_pointer] 						#LOAD GP0
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 32 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Load gp2 @4294967295  												#COMPARE (NOT LESS)
Compare gp1 gp0
if Less then Move Zero gp2
Move gp2 gp0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 28 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 32 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp1 20 [Stack_pointer] 						#LOAD GP0
Load gp0 @4
MUL gp0 gp1 														#MULTIPLY
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
AND gp0 gp1
if gp0 then Load PC if__isAllocated-3true 									#IF ELSE STATEMENT
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Load PC if__isAllocated-3endif
Pass 										%if__isAllocated-3true
Load gp1 24 [Stack_pointer] 						#LOAD GP0
Load gp0 @0
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC if__isAllocated-1endif
Load gp0 28 [Stack_pointer] 						#LOAD GP0
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 32 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC if__isAllocated-0true 									#IF ELSE STATEMENT
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Load PC if__isAllocated-0endif
Pass 										%if__isAllocated-0true
Load gp0 @1
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Pass 										%if__isAllocated-0endif           
Pass										%if__isAllocated-1endif
Load gp0 28 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 32 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp1 12 [Stack_pointer] 						#LOAD GP0
Load gp0 @4
MUL gp0 gp1 														#MULTIPLY
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC if__isAllocated-2true 									#IF ELSE STATEMENT
Load gp0 28 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 16 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:__dalloc 												#CALLING __dalloc
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Load PC if__isAllocated-2endif
Pass 										%if__isAllocated-2true
Load gp0 28 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 24 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:__isAllocated 												#CALLING __isAllocated
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Pass 										%if__isAllocated-2endif           
Pass 										%if__isAllocated-3endif           
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
																	Scope cotan
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:cotan
SUB Stack_pointer @12 									#OVERHEAD FOR FUNCTION cotan
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:cos 												#CALLING cos
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:sin 												#CALLING sin
Goto function:fDiv 												#CALLING fDiv
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
																	Scope dump_malloc_partition
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:dump_malloc_partition
SUB Stack_pointer @8 									#OVERHEAD FOR FUNCTION dump_malloc_partition
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
Load gp0 CLL.MALLOC_TREE 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:__dump_malloc 												#CALLING __dump_malloc
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
																	Scope cSub
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:cSub
SUB Stack_pointer @16 									#OVERHEAD FOR FUNCTION cSub
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
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 12 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifcSub-0endif
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:dalloc 												#CALLING dalloc
Pass										%ifcSub-0endif
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifcSub-1endif
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:dalloc 												#CALLING dalloc
Pass										%ifcSub-1endif
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 12 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
AND gp0 gp1
if gp0 then Load PC ifcSub-2true 									#IF ELSE STATEMENT
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 12 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:fSub 												#CALLING fSub
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 12 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:fSub 												#CALLING fSub
Goto function:complex 												#CALLING complex
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Load PC ifcSub-2endif
Pass 										%ifcSub-2true
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 12 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:fSub 												#CALLING fSub
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 12 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:fSub 												#CALLING fSub
Goto function:vComplex 												#CALLING vComplex
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Pass 										%ifcSub-2endif           
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
																	Scope fAdd
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:fAdd
SUB Stack_pointer @24 									#OVERHEAD FOR FUNCTION fAdd
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 8 [Stack_pointer] 						#STORE GP0
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 20 [Stack_pointer] 						#STORE GP0
Load gp1 20 [Stack_pointer] 						#LOAD GP0
Load gp0 @2147483648
AND gp0 gp1 														#AND
Store gp0 12 [Stack_pointer] 						#STORE GP0
Load gp1 8 [Stack_pointer] 						#LOAD GP0
Load gp0 @2147483648
AND gp0 gp1 														#AND
Store gp0 16 [Stack_pointer] 						#STORE GP0
Load gp1 12 [Stack_pointer] 						#LOAD GP0
Load gp0 16 [Stack_pointer] 						#LOAD GP0
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC iffAdd-0true 									#IF ELSE STATEMENT
Load gp0 20 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:__fSub 												#CALLING __fSub
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Load PC iffAdd-0endif
Pass 										%iffAdd-0true
Load gp0 20 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:__fAdd 												#CALLING __fAdd
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Pass 										%iffAdd-0endif           
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
																	Scope cScale
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:cScale
SUB Stack_pointer @24 									#OVERHEAD FOR FUNCTION cScale
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 20 [Stack_pointer] 						#STORE GP0
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 12 [Stack_pointer] 						#STORE GP0
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 20 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifcScale-0endif
Load gp0 20 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:dalloc 												#CALLING dalloc
Pass										%ifcScale-0endif
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 12 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 20 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:fMul 												#CALLING fMul
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 12 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 20 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:fMul 												#CALLING fMul
Goto function:fSub 												#CALLING fSub
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 12 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 20 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:fMul 												#CALLING fMul
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 12 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 20 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:fMul 												#CALLING fMul
Goto function:fAdd 												#CALLING fAdd
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 16 [Stack_pointer] 						#STORE GP0
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 12 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 16 [Stack_pointer] 						#LOAD GP0
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 12 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
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
																	Scope cos
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:cos
SUB Stack_pointer @32 									#OVERHEAD FOR FUNCTION cos
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 20 [Stack_pointer] 						#STORE GP0
Load gp1 20 [Stack_pointer] 						#LOAD GP0
Load gp0 @0
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifcos-0endif
Load gp0 @1065353216
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Pass										%ifcos-0endif
Load gp0 @1065353216
Store gp0 28 [Stack_pointer] 						#STORE GP0
Load gp0 @1065353216
Store gp0 12 [Stack_pointer] 						#STORE GP0
Load gp0 @1065353216
Store gp0 24 [Stack_pointer] 						#STORE GP0
Load gp0 @2
Store gp0 16 [Stack_pointer] 						#STORE GP0
Pass 										%loopcos-0entry 		#FOR LOOP
Load gp1 16 [Stack_pointer] 						#LOAD GP0
Load gp0 @20
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
NOT gp0
if gp0 then Load PC loopcos-0exit
Load gp0 16 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 16 [Stack_pointer] 						#LOAD GP0
Load gp1 @1
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
MUL gp0 gp1 														#MULTIPLY
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:float 												#CALLING float
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load gp0 20 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
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
Goto function:fMul 												#CALLING fMul
Goto function:fMul 												#CALLING fMul
Goto function:fNegate 												#CALLING fNegate
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 28 [Stack_pointer] 						#STORE GP0
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
Goto function:fMul 												#CALLING fMul
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 12 [Stack_pointer] 						#STORE GP0
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
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:fDiv 												#CALLING fDiv
Goto function:fAdd 												#CALLING fAdd
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 24 [Stack_pointer] 						#STORE GP0
Pass 										%loopcos-0continue
Load gp1 16 [Stack_pointer] 						#LOAD GP0
Load gp0 @2
ADD gp0 gp1 														#ADD
Store gp0 16 [Stack_pointer] 						#STORE GP0
Load PC loopcos-0entry
Pass 										%loopcos-0exit
Load gp0 24 [Stack_pointer] 						#LOAD GP0
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
																	Scope cMul
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:cMul
SUB Stack_pointer @24 									#OVERHEAD FOR FUNCTION cMul
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 20 [Stack_pointer] 						#STORE GP0
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 12 [Stack_pointer] 						#STORE GP0
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 12 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifcMul-0endif
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:dalloc 												#CALLING dalloc
Pass										%ifcMul-0endif
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 20 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifcMul-1endif
Load gp0 20 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:dalloc 												#CALLING dalloc
Pass										%ifcMul-1endif
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 12 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 20 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:fMul 												#CALLING fMul
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 12 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 20 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:fMul 												#CALLING fMul
Goto function:fSub 												#CALLING fSub
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 12 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 20 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:fMul 												#CALLING fMul
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 12 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 20 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:fMul 												#CALLING fMul
Goto function:fAdd 												#CALLING fAdd
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 16 [Stack_pointer] 						#STORE GP0
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 12 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 20 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
AND gp0 gp1
if gp0 then Load PC ifcMul-2true 									#IF ELSE STATEMENT
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
Goto function:complex 												#CALLING complex
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Load PC ifcMul-2endif
Pass 										%ifcMul-2true
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
Goto function:vComplex 												#CALLING vComplex
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Pass 										%ifcMul-2endif           
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
Move Stack_pointer previous_stack_ptr								%function:split_tree_node
SUB Stack_pointer @28 									#OVERHEAD FOR FUNCTION split_tree_node
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load gp6 @3
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 24 [Stack_pointer] 						#STORE GP0
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 16 [Stack_pointer] 						#STORE GP0
Load gp0 24 [Stack_pointer] 						#LOAD GP0
Load gp1 @2
DIV gp0 gp1 														#DIVIDE
if DivByZero then Load PC DIV_BY_ZERO
Store gp0 20 [Stack_pointer] 						#STORE GP0
Load gp0 16 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp1 20 [Stack_pointer] 						#LOAD GP0
Load gp0 @4
MUL gp0 gp1 														#MULTIPLY
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
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
Goto function:create_tree_node 												#CALLING create_tree_node
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Load gp6 @4
MUL gp6 @4 														   #INDEXING FOR @INT
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
Goto function:create_tree_node 												#CALLING create_tree_node
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Load gp6 @5
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
																	Scope fGreater
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:fGreater
SUB Stack_pointer @40 									#OVERHEAD FOR FUNCTION fGreater
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 32 [Stack_pointer] 						#STORE GP0
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 28 [Stack_pointer] 						#STORE GP0
Load gp1 28 [Stack_pointer] 						#LOAD GP0
Load gp0 @2147483648
AND gp0 gp1 														#AND
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load gp1 32 [Stack_pointer] 						#LOAD GP0
Load gp0 @2147483648
AND gp0 gp1 														#AND
Store gp0 12 [Stack_pointer] 						#STORE GP0
Load gp1 28 [Stack_pointer] 						#LOAD GP0
Load gp0 @2139095040
AND gp0 gp1 														#AND
Store gp0 36 [Stack_pointer] 						#STORE GP0
Load gp1 32 [Stack_pointer] 						#LOAD GP0
Load gp0 @2139095040
AND gp0 gp1 														#AND
Store gp0 24 [Stack_pointer] 						#STORE GP0
Load gp1 28 [Stack_pointer] 						#LOAD GP0
Load gp0 @8388607
AND gp0 gp1 														#AND
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @8388608
OR gp0 gp1 															#OR
Store gp0 16 [Stack_pointer] 						#STORE GP0
Load gp1 32 [Stack_pointer] 						#LOAD GP0
Load gp0 @8388607
AND gp0 gp1 														#AND
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @8388608
OR gp0 gp1 															#OR
Store gp0 20 [Stack_pointer] 						#STORE GP0
Load gp1 8 [Stack_pointer] 						#LOAD GP0
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Move Zero gp2 														#COMPARE (IS GREATER)
Compare gp1 gp0
if Greater then Load gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC iffGreater-0endif
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Pass										%iffGreater-0endif
Load gp1 12 [Stack_pointer] 						#LOAD GP0
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Move Zero gp2 														#COMPARE (IS GREATER)
Compare gp1 gp0
if Greater then Load gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC iffGreater-1endif
Load gp0 @1
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Pass										%iffGreater-1endif
Load gp0 8 [Stack_pointer] 						#LOAD GP0
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
if gp0 then Load PC iffGreater-8true 									#IF ELSE STATEMENT
Load gp1 36 [Stack_pointer] 						#LOAD GP0
Load gp0 24 [Stack_pointer] 						#LOAD GP0
Move Zero gp2 														#COMPARE (IS GREATER)
Compare gp1 gp0
if Greater then Load gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC iffGreater-5endif
Load gp0 @1
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Pass										%iffGreater-5endif
Load gp1 24 [Stack_pointer] 						#LOAD GP0
Load gp0 36 [Stack_pointer] 						#LOAD GP0
Move Zero gp2 														#COMPARE (IS GREATER)
Compare gp1 gp0
if Greater then Load gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC iffGreater-6endif
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Pass										%iffGreater-6endif
Load gp1 16 [Stack_pointer] 						#LOAD GP0
Load gp0 20 [Stack_pointer] 						#LOAD GP0
Move Zero gp2 														#COMPARE (IS GREATER)
Compare gp1 gp0
if Greater then Load gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC iffGreater-7endif
Load gp0 @1
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Pass										%iffGreater-7endif
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Load PC iffGreater-8endif
Pass 										%iffGreater-8true
Load gp1 36 [Stack_pointer] 						#LOAD GP0
Load gp0 24 [Stack_pointer] 						#LOAD GP0
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC iffGreater-2endif
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Pass										%iffGreater-2endif
Load gp1 24 [Stack_pointer] 						#LOAD GP0
Load gp0 36 [Stack_pointer] 						#LOAD GP0
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC iffGreater-3endif
Load gp0 @1
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Pass										%iffGreater-3endif
Load gp1 16 [Stack_pointer] 						#LOAD GP0
Load gp0 20 [Stack_pointer] 						#LOAD GP0
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC iffGreater-4endif
Load gp0 @1
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Pass										%iffGreater-4endif
Pass 										%iffGreater-8endif           
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
																	Scope ntab
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:ntab
SUB Stack_pointer @16 									#OVERHEAD FOR FUNCTION ntab
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 12 [Stack_pointer] 						#STORE GP0
Load gp0 @0
Store gp0 8 [Stack_pointer] 						#STORE GP0
Pass 										%loopntab-0entry 		#FOR LOOP
Load gp1 8 [Stack_pointer] 						#LOAD GP0
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
NOT gp0
if gp0 then Load PC loopntab-0exit
Load gp0 CLL.string15 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Pass 										%loopntab-0continue
Load gp1 8 [Stack_pointer] 						#LOAD GP0
Load gp0 @1
ADD gp0 gp1 														#ADD
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load PC loopntab-0entry
Pass 										%loopntab-0exit
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
																	Scope delete_tree_node
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:delete_tree_node
SUB Stack_pointer @12 									#OVERHEAD FOR FUNCTION delete_tree_node
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load gp0 CLL.MALLOC_POOL 										#LOAD GP0 GLOBAL
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Store gp0 CLL.MALLOC_POOL 										#STORE GP0 GLOBAL
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
																	Scope dalloc
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:dalloc
SUB Stack_pointer @16 									#OVERHEAD FOR FUNCTION dalloc
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
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
Goto function:__dalloc 												#CALLING __dalloc
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load gp0 8 [Stack_pointer] 						#LOAD GP0
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifdalloc-0endif
Load gp0 CLL.string5 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Goto function:quit 												#CALLING quit
Pass										%ifdalloc-0endif
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
																	Scope cosec
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:cosec
SUB Stack_pointer @12 									#OVERHEAD FOR FUNCTION cosec
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load gp0 @1065353216
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:sin 												#CALLING sin
Goto function:fDiv 												#CALLING fDiv
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
																	Scope _fft
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:_fft
SUB Stack_pointer @32 									#OVERHEAD FOR FUNCTION _fft
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 8 [Stack_pointer] 						#STORE GP0
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 28 [Stack_pointer] 						#STORE GP0
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 20 [Stack_pointer] 						#STORE GP0
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 24 [Stack_pointer] 						#STORE GP0
Load gp1 8 [Stack_pointer] 						#LOAD GP0
Load gp0 28 [Stack_pointer] 						#LOAD GP0
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC if_fft-0endif
Load gp0 20 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
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
Load gp1 8 [Stack_pointer] 						#LOAD GP0
Load gp0 @2
MUL gp0 gp1 														#MULTIPLY
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:_fft 												#CALLING _fft
Load gp0 20 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp1 @4
Load gp0 8 [Stack_pointer] 						#LOAD GP0
MUL gp0 gp1 														#MULTIPLY
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 24 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp1 @4
Load gp0 8 [Stack_pointer] 						#LOAD GP0
MUL gp0 gp1 														#MULTIPLY
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 28 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp1 8 [Stack_pointer] 						#LOAD GP0
Load gp0 @2
MUL gp0 gp1 														#MULTIPLY
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:_fft 												#CALLING _fft
Load gp0 @0
Store gp0 16 [Stack_pointer] 						#STORE GP0
Pass 										%loop_fft-0entry 		#FOR LOOP
Load gp1 16 [Stack_pointer] 						#LOAD GP0
Load gp0 28 [Stack_pointer] 						#LOAD GP0
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
NOT gp0
if gp0 then Load PC loop_fft-0exit
Load gp0 @1065353216
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @1078530011
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 16 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:float 												#CALLING float
Load gp0 28 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:float 												#CALLING float
Goto function:fDiv 												#CALLING fDiv
Goto function:fMul 												#CALLING fMul
Goto function:vPolar 												#CALLING vPolar
Load gp1 16 [Stack_pointer] 						#LOAD GP0
Load gp0 8 [Stack_pointer] 						#LOAD GP0
ADD gp0 gp1 														#ADD
Move gp0 gp6 						#PUSH gp0 POP gp6
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 20 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:cMul 												#CALLING cMul
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 12 [Stack_pointer] 						#STORE GP0
Load gp0 16 [Stack_pointer] 						#LOAD GP0
Load gp1 @2
DIV gp0 gp1 														#DIVIDE
if DivByZero then Load PC DIV_BY_ZERO
Move gp0 gp6 						#PUSH gp0 POP gp6
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 24 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp6 16 [Stack_pointer] 						#LOAD GP0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 20 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:cAdd 												#CALLING cAdd
Goto function:cMov 												#CALLING cMov
Load gp1 16 [Stack_pointer] 						#LOAD GP0
Load gp0 28 [Stack_pointer] 						#LOAD GP0
ADD gp0 gp1 														#ADD
Load gp1 @2
DIV gp0 gp1 														#DIVIDE
if DivByZero then Load PC DIV_BY_ZERO
Move gp0 gp6 						#PUSH gp0 POP gp6
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 24 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp6 16 [Stack_pointer] 						#LOAD GP0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 20 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:cSub 												#CALLING cSub
Goto function:cMov 												#CALLING cMov
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:dalloc 												#CALLING dalloc
Pass 										%loop_fft-0continue
Load gp0 16 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp1 @2
Load gp0 8 [Stack_pointer] 						#LOAD GP0
MUL gp0 gp1 														#MULTIPLY
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Store gp0 16 [Stack_pointer] 						#STORE GP0
Load PC loop_fft-0entry
Pass 										%loop_fft-0exit
Pass										%if_fft-0endif
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
																	Scope exp
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:exp
SUB Stack_pointer @32 									#OVERHEAD FOR FUNCTION exp
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 20 [Stack_pointer] 						#STORE GP0
Load gp1 20 [Stack_pointer] 						#LOAD GP0
Load gp0 @0
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifexp-0endif
Load gp0 @1065353216
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Pass										%ifexp-0endif
Load gp0 @1065353216
Store gp0 28 [Stack_pointer] 						#STORE GP0
Load gp0 @1065353216
Store gp0 12 [Stack_pointer] 						#STORE GP0
Load gp0 @1065353216
Store gp0 24 [Stack_pointer] 						#STORE GP0
Load gp0 @1
Store gp0 16 [Stack_pointer] 						#STORE GP0
Pass 										%loopexp-0entry 		#FOR LOOP
Load gp1 16 [Stack_pointer] 						#LOAD GP0
Load gp0 @20
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
NOT gp0
if gp0 then Load PC loopexp-0exit
Load gp0 16 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:float 												#CALLING float
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load gp0 28 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 20 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:fMul 												#CALLING fMul
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 28 [Stack_pointer] 						#STORE GP0
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
Goto function:fMul 												#CALLING fMul
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 12 [Stack_pointer] 						#STORE GP0
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
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:fDiv 												#CALLING fDiv
Goto function:fAdd 												#CALLING fAdd
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 24 [Stack_pointer] 						#STORE GP0
Pass 										%loopexp-0continue
Load gp1 16 [Stack_pointer] 						#LOAD GP0
Load gp0 @1
ADD gp0 gp1 														#ADD
Store gp0 16 [Stack_pointer] 						#STORE GP0
Load PC loopexp-0entry
Pass 										%loopexp-0exit
Load gp0 24 [Stack_pointer] 						#LOAD GP0
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
																	Scope arccos
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:arccos
SUB Stack_pointer @12 									#OVERHEAD FOR FUNCTION arccos
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load gp0 @1070141403
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:arcsin 												#CALLING arcsin
Goto function:fSub 												#CALLING fSub
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
																	Scope cDiv
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:cDiv
SUB Stack_pointer @28 									#OVERHEAD FOR FUNCTION cDiv
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 24 [Stack_pointer] 						#STORE GP0
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 16 [Stack_pointer] 						#STORE GP0
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 16 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifcDiv-0endif
Load gp0 16 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:dalloc 												#CALLING dalloc
Pass										%ifcDiv-0endif
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 24 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifcDiv-1endif
Load gp0 24 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:dalloc 												#CALLING dalloc
Pass										%ifcDiv-1endif
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 24 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 24 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:fMul 												#CALLING fMul
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 24 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 24 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:fMul 												#CALLING fMul
Goto function:fAdd 												#CALLING fAdd
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 16 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 24 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:fMul 												#CALLING fMul
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 16 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 24 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:fMul 												#CALLING fMul
Goto function:fAdd 												#CALLING fAdd
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:fDiv 												#CALLING fDiv
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 12 [Stack_pointer] 						#STORE GP0
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 16 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 24 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:fMul 												#CALLING fMul
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 16 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 24 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:fMul 												#CALLING fMul
Goto function:fSub 												#CALLING fSub
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:fDiv 												#CALLING fDiv
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 20 [Stack_pointer] 						#STORE GP0
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 16 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 24 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
AND gp0 gp1
if gp0 then Load PC ifcDiv-2true 									#IF ELSE STATEMENT
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 20 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:complex 												#CALLING complex
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Load PC ifcDiv-2endif
Pass 										%ifcDiv-2true
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 20 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:vComplex 												#CALLING vComplex
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Pass 										%ifcDiv-2endif           
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
																	Scope sec
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:sec
SUB Stack_pointer @12 									#OVERHEAD FOR FUNCTION sec
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load gp0 @1065353216
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:cos 												#CALLING cos
Goto function:fDiv 												#CALLING fDiv
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


Halt %function:quit
