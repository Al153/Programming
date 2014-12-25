

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

byteArray CLL.array_of_string0 2 [10, 0]
int CLL.string0 CLL.array_of_string0











																	Scope lchild
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5

Move Stack_pointer previous_stack_ptr								%lchild
SUB Stack_pointer @12 									#OVERHEAD FOR FUNCTION lchild
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 8 [Stack_pointer] 						#STORE GP0



Load gp0 @2
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														
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

SUB gp7 @4 		 		 %char									#Pops into gp0
Load gp0 Expression_stack [gp7]  				
AND gp0 @255
Store gp0 Expression_stack [gp7] 
ADD gp7 @4
Move Jump PC  			#reads new top of stack from the stack frame
#######################################################################################











																	Scope parent
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5

Move Stack_pointer previous_stack_ptr								%parent
SUB Stack_pointer @12 									#OVERHEAD FOR FUNCTION parent
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











																	Scope build_heap
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5

Move Stack_pointer previous_stack_ptr								%build_heap
SUB Stack_pointer @20 									#OVERHEAD FOR FUNCTION build_heap
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



Load gp0 @1
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 8 [Stack_pointer] 						#STORE GP0

Pass %loopbuild_heap0entry 											#FOR LOOP

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
if gp0 then Load PC loopbuild_heap0exit


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


Goto sift_up 												#CALLING sift_up


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

Load PC loopbuild_heap0entry
Pass %loopbuild_heap0exit



Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC











																	Scope heapsort
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5

Move Stack_pointer previous_stack_ptr								%heapsort
SUB Stack_pointer @16 									#OVERHEAD FOR FUNCTION heapsort
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 8 [Stack_pointer] 						#STORE GP0


				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 12 [Stack_pointer] 						#STORE GP0




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


Goto build_heap 												#CALLING build_heap



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


Goto sort_heap 												#CALLING sort_heap



Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC











																	Scope sort_heap
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5

Move Stack_pointer previous_stack_ptr								%sort_heap
SUB Stack_pointer @24 									#OVERHEAD FOR FUNCTION sort_heap
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


				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 8 [Stack_pointer] 						#STORE GP0

Pass %loopsort_heap0entry 											#FOR LOOP

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
if gp0 then Load PC loopsort_heap0exit


Load gp0 @0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

				
SUB gp7 @4 															#POP TO INDEX REGISTER
Load gp6 Expression_stack [gp7]

MUL gp6 @4 														   #INDEXING FOR @INT

ADD gp6 16 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 20 [Stack_pointer] 						#STORE GP0




Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


				
SUB gp7 @4 															#POP TO INDEX REGISTER
Load gp6 Expression_stack [gp7]

MUL gp6 @4 														   #INDEXING FOR @INT

ADD gp6 16 [Stack_pointer] 							#LOAD GP0 RELATIVE
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

				
SUB gp7 @4 															#POP TO INDEX REGISTER
Load gp6 Expression_stack [gp7]

MUL gp6 @4 														   #INDEXING FOR @INT

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

ADD gp6 16 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]


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


				
SUB gp7 @4 															#POP TO INDEX REGISTER
Load gp6 Expression_stack [gp7]

MUL gp6 @4 														   #INDEXING FOR @INT

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

ADD gp6 16 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]



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

Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Goto sift_down 												#CALLING sift_down


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

Store gp0 8 [Stack_pointer] 						#STORE GP0

Load PC loopsort_heap0entry
Pass %loopsort_heap0exit



Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC











																	Scope sift_up
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5

Move Stack_pointer previous_stack_ptr								%sift_up
SUB Stack_pointer @28 									#OVERHEAD FOR FUNCTION sift_up
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




Load gp0 12 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Goto parent 												#CALLING parent

				
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

MUL gp6 @4 														   #INDEXING FOR @INT

ADD gp6 20 [Stack_pointer] 							#LOAD GP0 RELATIVE
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

Store gp0 24 [Stack_pointer] 						#STORE GP0

 									

Load gp0 24 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														
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
if gp0 then Load PC ifsift_up0endif

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


				
SUB gp7 @4 															#POP TO INDEX REGISTER
Load gp6 Expression_stack [gp7]

MUL gp6 @4 														   #INDEXING FOR @INT

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

ADD gp6 20 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]


Load gp0 24 [Stack_pointer] 						#LOAD GP0
 														
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

MUL gp6 @4 														   #INDEXING FOR @INT

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

ADD gp6 20 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]



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


Goto sift_up 												#CALLING sift_up

Pass %ifsift_up0endif



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










																	Scope sift_down
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5

Move Stack_pointer previous_stack_ptr								%sift_down
SUB Stack_pointer @28 									#OVERHEAD FOR FUNCTION sift_down
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 20 [Stack_pointer] 						#STORE GP0


				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 8 [Stack_pointer] 						#STORE GP0


				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 24 [Stack_pointer] 						#STORE GP0


 									

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

NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifsift_down4endif


Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Goto lchild 												#CALLING lchild

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 16 [Stack_pointer] 						#STORE GP0



Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Goto rchild 												#CALLING rchild

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 12 [Stack_pointer] 						#STORE GP0



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

if gp0 then Load PC ifsift_down2true 									#IF ELSE STATEMENT
 									

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
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifsift_down1endif


Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC

Pass %ifsift_down1endif

Load PC ifsift_down2endif
Pass %ifsift_down2true
 									



Load gp0 16 [Stack_pointer] 						#LOAD GP0
 														
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




Load gp0 12 [Stack_pointer] 						#LOAD GP0
 														
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

NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifsift_down0endif

Load gp0 12 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 16 [Stack_pointer] 						#STORE GP0

Pass %ifsift_down0endif
 
Pass %ifsift_down2endif           

 									



Load gp0 16 [Stack_pointer] 						#LOAD GP0
 														
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




Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														
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
if gp0 then Load PC ifsift_down3endif



Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														
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

Store gp0 12 [Stack_pointer] 						#STORE GP0




Load gp0 16 [Stack_pointer] 						#LOAD GP0
 														
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

ADD gp6 24 [Stack_pointer] 							#STORE GP0 RELATIVE
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


				
SUB gp7 @4 															#POP TO INDEX REGISTER
Load gp6 Expression_stack [gp7]

MUL gp6 @4 														   #INDEXING FOR @INT

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

ADD gp6 24 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]



Load gp0 24 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


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


Goto sift_down 												#CALLING sift_down

Pass %ifsift_down3endif

Pass %ifsift_down4endif



Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC











																	Scope rchild
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5

Move Stack_pointer previous_stack_ptr								%rchild
SUB Stack_pointer @12 									#OVERHEAD FOR FUNCTION rchild
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 8 [Stack_pointer] 						#STORE GP0



Load gp0 @2
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														
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

Load gp0 @2
 														
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

Move Stack_pointer previous_stack_ptr								%main
SUB Stack_pointer @1040 									#OVERHEAD FOR FUNCTION main
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]


Move Stack_pointer gp0 											#GETTING POINTER
ADD gp0 @16
 														
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

Load gp0 @189
 														
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

Load gp0 @211
 														
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

Load gp0 @176
 														
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

Load gp0 @88
 														
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

Load gp0 @35
 														
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

Load gp0 @8
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @6
 														
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

Load gp0 @29
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @7
 														
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

Load gp0 @191
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @8
 														
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

Load gp0 @55
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @9
 														
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

Load gp0 @235
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @10
 														
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

Load gp0 @63
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @11
 														
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

Load gp0 @227
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @12
 														
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

Load gp0 @175
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @13
 														
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

Load gp0 @157
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @14
 														
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

Load gp0 @37
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @15
 														
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

Load gp0 @19
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @16
 														
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

Load gp0 @199
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @17
 														
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

Load gp0 @248
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @18
 														
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

Load gp0 @167
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @19
 														
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

Load gp0 @14
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @20
 														
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

Load gp0 @27
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @21
 														
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

Load gp0 @50
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @22
 														
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

Load gp0 @25
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @23
 														
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

Load gp0 @110
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @24
 														
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

Load gp0 @12
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @25
 														
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

Load gp0 @33
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @26
 														
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

Load gp0 @30
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @27
 														
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

Load gp0 @131
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @28
 														
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

Load gp0 @249
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @29
 														
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

Load gp0 @86
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @30
 														
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

Load gp0 @121
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @31
 														
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

Load gp0 @79
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @32
 														
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

Load gp0 @22
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @33
 														
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

Load gp0 @241
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @34
 														
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

Load gp0 @64
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @35
 														
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

Load gp0 @5
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @36
 														
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

Load gp0 @8
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @37
 														
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

Load gp0 @233
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @38
 														
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

Load gp0 @236
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @39
 														
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

Load gp0 @160
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @40
 														
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

Load gp0 @68
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @41
 														
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

Load gp0 @130
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @42
 														
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

Load gp0 @229
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @43
 														
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

Load gp0 @13
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @44
 														
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

Load gp0 @115
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @45
 														
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

Load gp0 @188
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @46
 														
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

Load gp0 @154
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @47
 														
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

Load gp0 @246
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @48
 														
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

Load gp0 @149
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @49
 														
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

Load gp0 @206
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @50
 														
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

Load gp0 @77
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @51
 														
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

Load gp0 @203
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @52
 														
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

Load gp0 @76
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @53
 														
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

Load gp0 @3
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @54
 														
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

Load gp0 @162
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @55
 														
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

Load gp0 @113
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @56
 														
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

Load gp0 @184
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @57
 														
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

Load gp0 @28
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @58
 														
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

Load gp0 @18
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @59
 														
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

Load gp0 @141
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @60
 														
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

Load gp0 @180
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @61
 														
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

Load gp0 @226
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @62
 														
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

Load gp0 @207
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @63
 														
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

Load gp0 @62
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @64
 														
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

Load gp0 @85
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @65
 														
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

Load gp0 @250
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @66
 														
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

Load gp0 @190
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @67
 														
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

Load gp0 @70
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @68
 														
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

Load gp0 @230
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @69
 														
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

Load gp0 @100
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @70
 														
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

Load gp0 @231
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @71
 														
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

Load gp0 @67
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @72
 														
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

Load gp0 @31
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @73
 														
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

Load gp0 @90
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @74
 														
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

Load gp0 @144
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @75
 														
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

Load gp0 @170
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @76
 														
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

Load gp0 @223
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @77
 														
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

Load gp0 @216
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @78
 														
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

Load gp0 @97
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @79
 														
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

Load gp0 @179
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @80
 														
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

Load gp0 @132
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @81
 														
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

Load gp0 @143
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @82
 														
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

Load gp0 @9
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @83
 														
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

Load gp0 @243
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @84
 														
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

Load gp0 @91
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @85
 														
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

Load gp0 @222
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @86
 														
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

Load gp0 @98
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @87
 														
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

Load gp0 @80
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @88
 														
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

Load gp0 @139
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @89
 														
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

Load gp0 @92
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @90
 														
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

Load gp0 @102
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @91
 														
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

Load gp0 @173
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @92
 														
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

Load gp0 @156
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @93
 														
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

Load gp0 @145
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @94
 														
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

Load gp0 @177
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @95
 														
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

Load gp0 @87
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @96
 														
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

Load gp0 @151
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @97
 														
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

Load gp0 @237
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @98
 														
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

Load gp0 @239
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @99
 														
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

Load gp0 @56
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @100
 														
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

Load gp0 @228
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @101
 														
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

Load gp0 @134
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @102
 														
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

Load gp0 @84
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @103
 														
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

Load gp0 @210
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @104
 														
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

Load gp0 @251
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @105
 														
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

Load gp0 @127
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @106
 														
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

Load gp0 @103
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @107
 														
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

Load gp0 @163
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @108
 														
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

Load gp0 @126
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @109
 														
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

Load gp0 @39
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @110
 														
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

Load gp0 @153
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @111
 														
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

Load gp0 @135
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @112
 														
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

Load gp0 @150
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @113
 														
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

Load gp0 @205
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @114
 														
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

Load gp0 @142
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @115
 														
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

Load gp0 @219
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @116
 														
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

Load gp0 @152
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @117
 														
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

Load gp0 @53
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @118
 														
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

Load gp0 @17
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @119
 														
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

Load gp0 @38
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @120
 														
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

Load gp0 @74
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @121
 														
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

Load gp0 @95
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @122
 														
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

Load gp0 @220
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @123
 														
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

Load gp0 @24
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @124
 														
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

Load gp0 @60
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @125
 														
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

Load gp0 @137
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @126
 														
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

Load gp0 @166
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @127
 														
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

Load gp0 @66
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @128
 														
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

Load gp0 @47
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @129
 														
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

Load gp0 @75
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @130
 														
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

Load gp0 @7
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @131
 														
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

Load gp0 @174
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @132
 														
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

Load gp0 @105
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @133
 														
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

Load gp0 @140
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @134
 														
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

Load gp0 @106
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @135
 														
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

Load gp0 @169
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @136
 														
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

Load gp0 @185
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @137
 														
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

Load gp0 @161
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @138
 														
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

Load gp0 @146
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @139
 														
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

Load gp0 @234
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @140
 														
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

Load gp0 @59
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @141
 														
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

Load gp0 @197
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @142
 														
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

Load gp0 @116
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @143
 														
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

Load gp0 @224
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @144
 														
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

Load gp0 @254
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @145
 														
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

Load gp0 @73
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @146
 														
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

Load gp0 @214
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @147
 														
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

Load gp0 @165
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @148
 														
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

Load gp0 @253
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @149
 														
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

Load gp0 @196
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @150
 														
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

Load gp0 @10
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @151
 														
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

Load gp0 @171
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @152
 														
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

Load gp0 @61
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @153
 														
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

Load gp0 @182
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @154
 														
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

Load gp0 @57
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @155
 														
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

Load gp0 @192
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @156
 														
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

Load gp0 @208
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @157
 														
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

Load gp0 @194
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @158
 														
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

Load gp0 @218
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @159
 														
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

Load gp0 @48
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @160
 														
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

Load gp0 @128
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @161
 														
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

Load gp0 @159
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @162
 														
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

Load gp0 @1
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @163
 														
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

Load gp0 @6
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @164
 														
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

Load gp0 @46
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @165
 														
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

Load gp0 @247
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @166
 														
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

Load gp0 @43
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @167
 														
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

Load gp0 @118
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @168
 														
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

Load gp0 @240
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @169
 														
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

Load gp0 @5
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @170
 														
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

Load gp0 @107
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @171
 														
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

Load gp0 @212
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @172
 														
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

Load gp0 @204
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @173
 														
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

Load gp0 @181
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @174
 														
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

Load gp0 @172
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @175
 														
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

Load gp0 @238
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @176
 														
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

Load gp0 @242
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @177
 														
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

Load gp0 @26
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @178
 														
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

Load gp0 @200
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @179
 														
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

Load gp0 @20
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @180
 														
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

Load gp0 @96
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @181
 														
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

Load gp0 @11
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @182
 														
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

Load gp0 @112
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @183
 														
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

Load gp0 @213
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @184
 														
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

Load gp0 @120
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @185
 														
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

Load gp0 @99
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @186
 														
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

Load gp0 @71
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @187
 														
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

Load gp0 @104
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @188
 														
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

Load gp0 @201
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @189
 														
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

Load gp0 @111
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @190
 														
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

Load gp0 @2
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @191
 														
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

Load gp0 @168
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @192
 														
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

Load gp0 @148
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @193
 														
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

Load gp0 @195
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @194
 														
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

Load gp0 @209
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @195
 														
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

Load gp0 @4
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @196
 														
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

Load gp0 @81
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @197
 														
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

Load gp0 @16
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @198
 														
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

Load gp0 @245
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @199
 														
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

Load gp0 @108
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @200
 														
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

Load gp0 @123
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @201
 														
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

Load gp0 @41
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @202
 														
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

Load gp0 @217
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @203
 														
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

Load gp0 @232
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @204
 														
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

Load gp0 @198
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @205
 														
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

Load gp0 @34
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @206
 														
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

Load gp0 @114
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @207
 														
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

Load gp0 @21
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @208
 														
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

Load gp0 @94
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @209
 														
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

Load gp0 @255
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @210
 														
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

Load gp0 @133
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @211
 														
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

Load gp0 @89
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @212
 														
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

Load gp0 @36
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @213
 														
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

Load gp0 @117
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @214
 														
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

Load gp0 @225
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @215
 														
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

Load gp0 @136
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @216
 														
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

Load gp0 @78
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @217
 														
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

Load gp0 @52
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @218
 														
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

Load gp0 @252
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @219
 														
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

Load gp0 @83
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @220
 														
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

Load gp0 @65
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @221
 														
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

Load gp0 @202
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @222
 														
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

Load gp0 @147
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @223
 														
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

Load gp0 @124
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @224
 														
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

Load gp0 @49
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @225
 														
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

Load gp0 @93
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @226
 														
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

Load gp0 @82
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @227
 														
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

Load gp0 @187
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @228
 														
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

Load gp0 @101
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @229
 														
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

Load gp0 @215
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @230
 														
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

Load gp0 @186
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @231
 														
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

Load gp0 @72
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @232
 														
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

Load gp0 @109
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @233
 														
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

Load gp0 @122
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @234
 														
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

Load gp0 @42
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @235
 														
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

Load gp0 @51
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @236
 														
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

Load gp0 @138
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @237
 														
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

Load gp0 @193
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @238
 														
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

Load gp0 @129
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @239
 														
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

Load gp0 @69
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @240
 														
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

Load gp0 @23
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @241
 														
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

Load gp0 @178
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @242
 														
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

Load gp0 @44
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @243
 														
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

Load gp0 @158
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @244
 														
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

Load gp0 @221
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @245
 														
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

Load gp0 @40
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @246
 														
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

Load gp0 @32
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @247
 														
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

Load gp0 @183
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @248
 														
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

Load gp0 @15
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @249
 														
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

Load gp0 @155
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @250
 														
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

Load gp0 @45
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @251
 														
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

Load gp0 @244
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @252
 														
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

Load gp0 @54
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @253
 														
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

Load gp0 @119
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @254
 														
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

Load gp0 @125
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @255
 														
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

Load gp0 @16
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @256
 														
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

Load gp0 @256
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Goto heapsort 												#CALLING heapsort


Load gp0 @0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 8 [Stack_pointer] 						#STORE GP0

Pass %loopmain0entry 											#FOR LOOP

Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load gp0 @256
 														
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
if gp0 then Load PC loopmain0exit




Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														
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


Goto print_i 												#CALLING print_i



Load gp0 CLL.string0 										#LOAD GP0 GLOBAL
 														
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

Load PC loopmain0entry
Pass %loopmain0exit



Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
