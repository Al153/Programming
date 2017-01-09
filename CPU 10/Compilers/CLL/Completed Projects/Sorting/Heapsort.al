

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
Out @32
Outd Jump
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
#########################################################################################################################
																	Scope lchild
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
def Local.index 8
def @Local.index @8
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:lchild
SUB Stack_pointer @12 									#OVERHEAD FOR FUNCTION lchild
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION lchild
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.index [Stack_pointer] 						#STORE GP0
Load gp1 @2
Load gp0 Local.index [Stack_pointer] 						#LOAD GP0
MUL gp0 gp1 														#MULTIPLY
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @1
ADD gp0 gp1 														#ADD
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC

################## built in function char ##############################################

SUB gp7 @4 		 		 %function:char									#Pops into gp0
Load gp0 Expression_stack [gp7]  				
AND gp0 @255
Store gp0 Expression_stack [gp7] 
ADD gp7 @4
Move Jump PC 
#######################################################################################

########################## built in function putc ########################################
SUB gp7 @4 															%function:putc
Load gp0  Expression_stack [gp7]
Out gp0
Move Jump PC
#########################################################################################################################################################################################################
																	Scope parent
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
def Local.index 8
def @Local.index @8
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:parent
SUB Stack_pointer @12 									#OVERHEAD FOR FUNCTION parent
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION parent
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.index [Stack_pointer] 						#STORE GP0
Load gp0 Local.index [Stack_pointer] 						#LOAD GP0
Load gp1 @1
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Load gp1 @2
DIV gp0 gp1 														#DIVIDE
if DivByZero then Load PC DIV_BY_ZERO
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
#########################################################################################################################
																	Scope build_heap
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
def Local.i 8
def @Local.i @8
def Local.length 12
def @Local.length @12
def Local.ptr 16
def @Local.ptr @16
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:build_heap
SUB Stack_pointer @20 									#OVERHEAD FOR FUNCTION build_heap
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION build_heap
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.length [Stack_pointer] 						#STORE GP0
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.ptr [Stack_pointer] 						#STORE GP0
Load gp0 @1
Store gp0 Local.i [Stack_pointer] 						#STORE GP0
Pass 										%loopbuild_heap-0entry 		#FOR LOOP
Load gp1 Local.i [Stack_pointer] 						#LOAD GP0
Load gp0 Local.length [Stack_pointer] 						#LOAD GP0
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
NOT gp0
if gp0 then Load PC loopbuild_heap-0exit
Load gp0 Local.ptr [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 Local.i [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:sift_up 												#CALLING sift_up
Pass 										%loopbuild_heap-0continue
Load gp1 Local.i [Stack_pointer] 						#LOAD GP0
Load gp0 @1
ADD gp0 gp1 														#ADD
Store gp0 Local.i [Stack_pointer] 						#STORE GP0
Load PC loopbuild_heap-0entry
Pass 										%loopbuild_heap-0exit
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
#########################################################################################################################
																	Scope heapsort
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
def Local.length 8
def @Local.length @8
def Local.ptr 12
def @Local.ptr @12
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:heapsort
SUB Stack_pointer @16 									#OVERHEAD FOR FUNCTION heapsort
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION heapsort
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.length [Stack_pointer] 						#STORE GP0
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.ptr [Stack_pointer] 						#STORE GP0
Load gp0 Local.ptr [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 Local.length [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:build_heap 												#CALLING build_heap
Load gp0 Local.ptr [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 Local.length [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:sort_heap 												#CALLING sort_heap
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC

##################### built in function getc ###############################################
#returns a char
In gp0 %function:getc #gets a char without waiting (state of keyboard)
Store gp0 Expression_stack [gp7]
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Move Jump PC
##########################################################################

Halt %function:quit
#########################################################################################################################
																	Scope sort_heap
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
def Local.i 8
def @Local.i @8
def Local.length 12
def @Local.length @12
def Local.ptr 16
def @Local.ptr @16
def Local.temp 20
def @Local.temp @20
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:sort_heap
SUB Stack_pointer @24 									#OVERHEAD FOR FUNCTION sort_heap
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION sort_heap
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.length [Stack_pointer] 						#STORE GP0
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.ptr [Stack_pointer] 						#STORE GP0
Load gp0 Local.length [Stack_pointer] 						#LOAD GP0
Load gp1 @1
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Store gp0 Local.i [Stack_pointer] 						#STORE GP0
Pass 										%loopsort_heap-0entry 		#FOR LOOP
Load gp1 Local.i [Stack_pointer] 						#LOAD GP0
Load gp0 @0
Move Zero gp2 														#COMPARE (IS GREATER)
Compare gp1 gp0
if Greater then Load gp2 @4294967295
Move gp2 gp0
NOT gp0
if gp0 then Load PC loopsort_heap-0exit
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.ptr [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Local.temp [Stack_pointer] 						#STORE GP0
Load gp6 Local.i [Stack_pointer] 						#LOAD GP0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.ptr [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.ptr [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 Local.temp [Stack_pointer] 						#LOAD GP0
Load gp6 Local.i [Stack_pointer] 						#LOAD GP0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.ptr [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 Local.ptr [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 Local.i [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:sift_down 												#CALLING sift_down
Pass 										%loopsort_heap-0continue
Load gp0 Local.i [Stack_pointer] 						#LOAD GP0
Load gp1 @1
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Store gp0 Local.i [Stack_pointer] 						#STORE GP0
Load PC loopsort_heap-0entry
Pass 										%loopsort_heap-0exit
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
#########################################################################################################################
																	Scope sift_up
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
def Local.i 12
def @Local.i @12
def Local.jvalue 8
def @Local.jvalue @8
def Local.ptr 20
def @Local.ptr @20
def Local.ivalue 24
def @Local.ivalue @24
def Local.j 16
def @Local.j @16
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:sift_up
SUB Stack_pointer @28 									#OVERHEAD FOR FUNCTION sift_up
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION sift_up
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.i [Stack_pointer] 						#STORE GP0
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.ptr [Stack_pointer] 						#STORE GP0
Load gp0 Local.i [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:parent 												#CALLING parent
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.j [Stack_pointer] 						#STORE GP0
Load gp6 Local.j [Stack_pointer] 						#LOAD GP0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.ptr [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Local.jvalue [Stack_pointer] 						#STORE GP0
Load gp6 Local.i [Stack_pointer] 						#LOAD GP0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.ptr [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Local.ivalue [Stack_pointer] 						#STORE GP0
Load gp1 Local.ivalue [Stack_pointer] 						#LOAD GP0
Load gp0 Local.jvalue [Stack_pointer] 						#LOAD GP0
Move Zero gp2 														#COMPARE (IS GREATER)
Compare gp1 gp0
if Greater then Load gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifsift_up-0endif
Load gp0 Local.jvalue [Stack_pointer] 						#LOAD GP0
Load gp6 Local.i [Stack_pointer] 						#LOAD GP0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.ptr [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 Local.ivalue [Stack_pointer] 						#LOAD GP0
Load gp6 Local.j [Stack_pointer] 						#LOAD GP0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.ptr [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 Local.ptr [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 Local.j [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:sift_up 												#CALLING sift_up
Pass										%ifsift_up-0endif
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
################## built in function dWrite ##############################################

SUB gp7 @4 		 		 %function:dWrite									
								# disk addr, start, length ==> success?
Load gp3 Expression_stack [gp7] #len
SUB gp7 @4
Load gp2 Expression_stack [gp7] #start
SUB gp7 @4						
Load gp1 Expression_stack [gp7] #addr
HDScan gp1 						#scan to the right position
HDWrite gp3 gp2 0 				# write l characters from memory at addr s
Move Zero gp0 		
if EOF then Move One gp0 			#test for EOF
Store gp0 Expression_stack [gp7]  #push flag
ADD gp7 @4
Move Jump PC 
######################################################################################################### built in function dRead ##############################################

SUB gp7 @4 		 		 %function:dRead									
								# disk addr, start, length ==> success?
Load gp3 Expression_stack [gp7] #len
SUB gp7 @4
Load gp2 Expression_stack [gp7] #start
SUB gp7 @4						
Load gp1 Expression_stack [gp7] #addr
HDScan gp1 						#scan to the right position
HDRead gp3 gp2 0 				# read l characters to memory at addr s
Move Zero gp0 		
if EOF then Move One gp0 			#test for EOF
Store gp0 Expression_stack [gp7]  #push flag
ADD gp7 @4
Move Jump PC 
#######################################################################################
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
#########################################################################################################################
																	Scope sift_down
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
def Local.start 8
def @Local.start @8
def Local.k 12
def @Local.k @12
def Local.j 16
def @Local.j @16
def Local.limit 20
def @Local.limit @20
def Local.ptr 24
def @Local.ptr @24
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:sift_down
SUB Stack_pointer @28 									#OVERHEAD FOR FUNCTION sift_down
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION sift_down
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.limit [Stack_pointer] 						#STORE GP0
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.start [Stack_pointer] 						#STORE GP0
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.ptr [Stack_pointer] 						#STORE GP0
Load gp1 Local.start [Stack_pointer] 						#LOAD GP0
Load gp0 Local.limit [Stack_pointer] 						#LOAD GP0
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifsift_down-4endif
Load gp0 Local.start [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:lchild 												#CALLING lchild
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.j [Stack_pointer] 						#STORE GP0
Load gp0 Local.start [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:rchild 												#CALLING rchild
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.k [Stack_pointer] 						#STORE GP0
Load gp1 Local.k [Stack_pointer] 						#LOAD GP0
Load gp0 Local.limit [Stack_pointer] 						#LOAD GP0
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifsift_down-2true 									#IF ELSE STATEMENT
Load gp1 Local.j [Stack_pointer] 						#LOAD GP0
Load gp0 Local.limit [Stack_pointer] 						#LOAD GP0
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifsift_down-1endif
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Pass										%ifsift_down-1endif
Load PC ifsift_down-2endif
Pass 										%ifsift_down-2true
Load gp6 Local.j [Stack_pointer] 						#LOAD GP0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.ptr [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp6 Local.k [Stack_pointer] 						#LOAD GP0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.ptr [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifsift_down-0endif
Load gp0 Local.k [Stack_pointer] 						#LOAD GP0
Store gp0 Local.j [Stack_pointer] 						#STORE GP0
Pass										%ifsift_down-0endif
Pass 										%ifsift_down-2endif           
Load gp6 Local.j [Stack_pointer] 						#LOAD GP0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.ptr [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp6 Local.start [Stack_pointer] 						#LOAD GP0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.ptr [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Move Zero gp2 														#COMPARE (IS GREATER)
Compare gp1 gp0
if Greater then Load gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifsift_down-3endif
Load gp6 Local.start [Stack_pointer] 						#LOAD GP0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.ptr [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Local.k [Stack_pointer] 						#STORE GP0
Load gp6 Local.j [Stack_pointer] 						#LOAD GP0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.ptr [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Load gp6 Local.start [Stack_pointer] 						#LOAD GP0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.ptr [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 Local.k [Stack_pointer] 						#LOAD GP0
Load gp6 Local.j [Stack_pointer] 						#LOAD GP0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.ptr [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 Local.ptr [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 Local.j [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 Local.limit [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:sift_down 												#CALLING sift_down
Pass										%ifsift_down-3endif
Pass										%ifsift_down-4endif
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
#########################################################################################################################
																	Scope rchild
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
def Local.index 8
def @Local.index @8
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:rchild
SUB Stack_pointer @12 									#OVERHEAD FOR FUNCTION rchild
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION rchild
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.index [Stack_pointer] 						#STORE GP0
Load gp1 @2
Load gp0 Local.index [Stack_pointer] 						#LOAD GP0
MUL gp0 gp1 														#MULTIPLY
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @2
ADD gp0 gp1 														#ADD
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
#########################################################################################################################
																	Scope main
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
def Local.i 8
def @Local.i @8
def Local.trial 12
def @Local.trial @12
def Local.Array_oftrial 16
def @Local.Array_oftrial @16
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:main
SUB Stack_pointer @1040 									#OVERHEAD FOR FUNCTION main
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION main
Move Stack_pointer gp0 											#GETTING POINTER
ADD gp0 @Local.Array_oftrial
Store gp0 Local.trial [Stack_pointer] 						#STORE GP0
Load gp0 @0
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @189
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @211
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @176
Load gp6 @3
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @88
Load gp6 @4
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @35
Load gp6 @5
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @8
Load gp6 @6
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @29
Load gp6 @7
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @191
Load gp6 @8
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @55
Load gp6 @9
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @235
Load gp6 @10
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @63
Load gp6 @11
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @227
Load gp6 @12
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @175
Load gp6 @13
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @157
Load gp6 @14
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @37
Load gp6 @15
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @19
Load gp6 @16
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @199
Load gp6 @17
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @248
Load gp6 @18
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @167
Load gp6 @19
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @14
Load gp6 @20
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @27
Load gp6 @21
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @50
Load gp6 @22
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @25
Load gp6 @23
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @110
Load gp6 @24
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @12
Load gp6 @25
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @33
Load gp6 @26
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @30
Load gp6 @27
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @131
Load gp6 @28
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @249
Load gp6 @29
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @86
Load gp6 @30
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @121
Load gp6 @31
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @79
Load gp6 @32
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @22
Load gp6 @33
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @241
Load gp6 @34
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @64
Load gp6 @35
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @5
Load gp6 @36
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @8
Load gp6 @37
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @233
Load gp6 @38
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @236
Load gp6 @39
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @160
Load gp6 @40
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @68
Load gp6 @41
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @130
Load gp6 @42
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @229
Load gp6 @43
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @13
Load gp6 @44
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @115
Load gp6 @45
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @188
Load gp6 @46
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @154
Load gp6 @47
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @246
Load gp6 @48
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @149
Load gp6 @49
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @206
Load gp6 @50
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @77
Load gp6 @51
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @203
Load gp6 @52
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @76
Load gp6 @53
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @3
Load gp6 @54
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @162
Load gp6 @55
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @113
Load gp6 @56
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @184
Load gp6 @57
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @28
Load gp6 @58
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @18
Load gp6 @59
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @141
Load gp6 @60
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @180
Load gp6 @61
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @226
Load gp6 @62
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @207
Load gp6 @63
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @62
Load gp6 @64
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @85
Load gp6 @65
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @250
Load gp6 @66
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @190
Load gp6 @67
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @70
Load gp6 @68
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @230
Load gp6 @69
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @100
Load gp6 @70
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @231
Load gp6 @71
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @67
Load gp6 @72
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @31
Load gp6 @73
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @90
Load gp6 @74
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @144
Load gp6 @75
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @170
Load gp6 @76
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @223
Load gp6 @77
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @216
Load gp6 @78
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @97
Load gp6 @79
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @179
Load gp6 @80
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @132
Load gp6 @81
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @143
Load gp6 @82
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @9
Load gp6 @83
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @243
Load gp6 @84
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @91
Load gp6 @85
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @222
Load gp6 @86
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @98
Load gp6 @87
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @80
Load gp6 @88
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @139
Load gp6 @89
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @92
Load gp6 @90
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @102
Load gp6 @91
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @173
Load gp6 @92
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @156
Load gp6 @93
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @145
Load gp6 @94
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @177
Load gp6 @95
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @87
Load gp6 @96
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @151
Load gp6 @97
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @237
Load gp6 @98
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @239
Load gp6 @99
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @56
Load gp6 @100
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @228
Load gp6 @101
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @134
Load gp6 @102
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @84
Load gp6 @103
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @210
Load gp6 @104
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @251
Load gp6 @105
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @127
Load gp6 @106
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @103
Load gp6 @107
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @163
Load gp6 @108
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @126
Load gp6 @109
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @39
Load gp6 @110
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @153
Load gp6 @111
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @135
Load gp6 @112
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @150
Load gp6 @113
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @205
Load gp6 @114
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @142
Load gp6 @115
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @219
Load gp6 @116
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @152
Load gp6 @117
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @53
Load gp6 @118
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @17
Load gp6 @119
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @38
Load gp6 @120
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @74
Load gp6 @121
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @95
Load gp6 @122
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @220
Load gp6 @123
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @24
Load gp6 @124
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @60
Load gp6 @125
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @137
Load gp6 @126
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @166
Load gp6 @127
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @66
Load gp6 @128
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @47
Load gp6 @129
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @75
Load gp6 @130
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @7
Load gp6 @131
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @174
Load gp6 @132
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @105
Load gp6 @133
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @140
Load gp6 @134
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @106
Load gp6 @135
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @169
Load gp6 @136
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @185
Load gp6 @137
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @161
Load gp6 @138
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @146
Load gp6 @139
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @234
Load gp6 @140
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @59
Load gp6 @141
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @197
Load gp6 @142
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @116
Load gp6 @143
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @224
Load gp6 @144
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @254
Load gp6 @145
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @73
Load gp6 @146
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @214
Load gp6 @147
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @165
Load gp6 @148
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @253
Load gp6 @149
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @196
Load gp6 @150
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @10
Load gp6 @151
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @171
Load gp6 @152
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @61
Load gp6 @153
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @182
Load gp6 @154
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @57
Load gp6 @155
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @192
Load gp6 @156
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @208
Load gp6 @157
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @194
Load gp6 @158
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @218
Load gp6 @159
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @48
Load gp6 @160
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @128
Load gp6 @161
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @159
Load gp6 @162
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @1
Load gp6 @163
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @6
Load gp6 @164
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @46
Load gp6 @165
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @247
Load gp6 @166
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @43
Load gp6 @167
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @118
Load gp6 @168
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @240
Load gp6 @169
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @5
Load gp6 @170
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @107
Load gp6 @171
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @212
Load gp6 @172
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @204
Load gp6 @173
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @181
Load gp6 @174
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @172
Load gp6 @175
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @238
Load gp6 @176
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @242
Load gp6 @177
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @26
Load gp6 @178
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @200
Load gp6 @179
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @20
Load gp6 @180
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @96
Load gp6 @181
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @11
Load gp6 @182
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @112
Load gp6 @183
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @213
Load gp6 @184
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @120
Load gp6 @185
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @99
Load gp6 @186
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @71
Load gp6 @187
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @104
Load gp6 @188
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @201
Load gp6 @189
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @111
Load gp6 @190
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @2
Load gp6 @191
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @168
Load gp6 @192
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @148
Load gp6 @193
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @195
Load gp6 @194
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @209
Load gp6 @195
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @4
Load gp6 @196
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @81
Load gp6 @197
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @16
Load gp6 @198
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @245
Load gp6 @199
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @108
Load gp6 @200
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @123
Load gp6 @201
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @41
Load gp6 @202
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @217
Load gp6 @203
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @232
Load gp6 @204
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @198
Load gp6 @205
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @34
Load gp6 @206
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @114
Load gp6 @207
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @21
Load gp6 @208
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @94
Load gp6 @209
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @255
Load gp6 @210
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @133
Load gp6 @211
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @89
Load gp6 @212
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @36
Load gp6 @213
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @117
Load gp6 @214
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @225
Load gp6 @215
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @136
Load gp6 @216
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @78
Load gp6 @217
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @52
Load gp6 @218
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @252
Load gp6 @219
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @83
Load gp6 @220
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @65
Load gp6 @221
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @202
Load gp6 @222
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @147
Load gp6 @223
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @124
Load gp6 @224
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @49
Load gp6 @225
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @93
Load gp6 @226
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @82
Load gp6 @227
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @187
Load gp6 @228
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @101
Load gp6 @229
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @215
Load gp6 @230
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @186
Load gp6 @231
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @72
Load gp6 @232
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @109
Load gp6 @233
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @122
Load gp6 @234
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @42
Load gp6 @235
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @51
Load gp6 @236
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @138
Load gp6 @237
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @193
Load gp6 @238
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @129
Load gp6 @239
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @69
Load gp6 @240
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @23
Load gp6 @241
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @178
Load gp6 @242
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @44
Load gp6 @243
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @158
Load gp6 @244
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @221
Load gp6 @245
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @40
Load gp6 @246
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @32
Load gp6 @247
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @183
Load gp6 @248
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @15
Load gp6 @249
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @155
Load gp6 @250
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @45
Load gp6 @251
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @244
Load gp6 @252
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @54
Load gp6 @253
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @119
Load gp6 @254
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @125
Load gp6 @255
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @16
Load gp6 @256
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 Local.trial [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @256
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:heapsort 												#CALLING heapsort
Load gp0 @0
Store gp0 Local.i [Stack_pointer] 						#STORE GP0
Pass 										%loopmain-0entry 		#FOR LOOP
Load gp1 Local.i [Stack_pointer] 						#LOAD GP0
Load gp0 @256
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
NOT gp0
if gp0 then Load PC loopmain-0exit
Load gp6 Local.i [Stack_pointer] 						#LOAD GP0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.trial [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:print_i 												#CALLING print_i
Load gp0 CLL.string0 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Pass 										%loopmain-0continue
Load gp1 Local.i [Stack_pointer] 						#LOAD GP0
Load gp0 @1
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
