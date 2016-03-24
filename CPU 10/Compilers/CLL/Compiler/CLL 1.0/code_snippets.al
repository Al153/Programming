#Snippets which define how the compiled program behaves at runtime

#____________ routines defined ____________
#		- setup and error handling
#		- arithmetic-logic operations
#		- function call, stack frame manipulation, etc
# 		-



For detailed explanations of the run time see "code_snippets - commented.al"
<< setup routines >>

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

<<junk>>
# ________________________ Binary operations ________________________
#________________________ Additive ________________________
<< ADD >>
<getgp0><getgp1>
ADD gp0 gp1 														#ADD
<storegp0>
<< SUB >>
<getgp1><getgp0>
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
<storegp0>
<< SHR >>
<getgp1><getgp0>
SHR gp0 gp1 														#SHIFT RIGHT
<storegp0>
<< SHL >> 	
<getgp1><getgp0> 
SHL gp0 gp1 														#SHIFT LEFT
<storegp0>
<< ADD char >>
<getgp0><getgp1>
ADD gp0 gp1 														#ADD (CHARS)
AND gp0 @255
<storegp0>
<< SUB char >>
<getgp1><getgp0>
AND gp0 @255 														#SUBTRACT (CHARS)
AND gp1 @255
SUB gp0 gp1
AND gp0 @255
Load Flags_reset @4294967287  
<storegp0>
<< SHR char >>
<getgp1><getgp0>
AND gp0 @255 														#SHIFT RIGHT (CHARS)
SHR gp0 gp1
<storegp0>
<< SHL char >>
<getgp1><getgp0>
SHL gp0 gp1 														#SHIFT LEFT (CHARS)
AND gp0 @255
<storegp0>
<<junk>>
# ________________________ Multiplicative ________________________
<< MUL >>
<getgp0><getgp1>
MUL gp0 gp1 														#MULTIPLY
<storegp0>
<< DIV >>
<getgp1><getgp0>
DIV gp0 gp1 														#DIVIDE
if DivByZero then Load PC DIV_BY_ZERO
<storegp0>
<< MOD >>
<getgp1><getgp0>
MOD gp0 gp1 														#MODULO
if DivByZero then Load PC DIV_BY_ZERO
<storegp0>
<< AND >>
<getgp0><getgp1>
AND gp0 gp1 														#AND
<storegp0>
<< OR >>
<getgp0><getgp1>
OR gp0 gp1 															#OR
<storegp0>
<< XOR >>
<getgp0><getgp1>
XOR gp0 gp1 														#XOR
<storegp0>
<< MUL char >>
<getgp0><getgp1>
MUL gp0 gp1 														#MULTIPLY (CHARS)
AND gp0 @255
<storegp0>
<< DIV char >>
<getgp1><getgp0>
AND gp0 @255 														#DIVIDE (CHARS)
AND gp1 @255
DIV gp0 gp1
AND gp0 @255
if DivByZero then Load PC DIV_BY_ZERO
<storegp0>
<< MOD char >>
<getgp1><getgp0>
AND gp0 @255 														#MODULO (CHARS)
AND gp0 @255
MOD gp0 gp1
AND gp0 @255
if DivByZero then Load PC DIV_BY_ZERO
<storegp0>
<< AND char >>
<getgp0><getgp1>
AND gp0 gp1 														#AND (CHARS)
AND gp0 @255
<storegp0>
<< OR char >>
<getgp0><getgp1>
OR gp0 gp1 															#OR (CHARS)
AND gp0 @255
<storegp0>
<< XOR char >>
<getgp0><getgp1>
XOR gp0 gp1 														#XOR (CHARS)
AND gp0 @255
<storegp0>
<<junk>>

#_________________________ unary operators _________________________

<< NOT >>
<getgp0>
NOT gp0 															#NOT
<storegp0>
<< NOT char >>
<getgp0>
NOT gp0 															#NOT (CHAR)
AND gp0 @255
<storegp0>
<< unary SUB >>													
<getgp0>
Move Zero gp1 														#UNARY SUBTRACT
SUB gp1 gp0 
Move gp1 gp0
Load Flags_reset @4294967287  
<storegp0>
<< unary SUB char >>														
<getgp0>
Move Zero gp1 														#UNARY SUBTRACT (CHAR)
SUB gp1 gp0 
Move gp1 gp0
AND gp1 @255
Load Flags_reset @4294967287  
<storegp0>
<<junk>>
#_________________________ Comparison operations _________________________
<<is equal>>
<getgp0><getgp1>
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
<Push gp0>
<<is greater>>
<getgp0><getgp1>
Move Zero gp2 														#COMPARE (IS GREATER)
Compare gp1 gp0
if Greater then Load gp2 @4294967295
Move gp2 gp0
<Push gp0>
<<is less>>
<getgp0><getgp1>
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
<Push gp0>
<<not equal>>
<getgp0><getgp1>
Load  gp2 @4294967295 												#COMPARE (NOT EQUAL)
Compare gp1 gp0 
if Equal then Move Zero gp2
Move gp2 gp0
<Push gp0>
<<not greater>>
<getgp0><getgp1>
Load gp2 @4294967295 												#COMPARE (NOT GREATER)
Compare gp1 gp0
if Greater then Move Zero gp2
Move gp2 gp0
<Push gp0>
<<not less>>
<getgp0><getgp1>
Load gp2 @4294967295  												#COMPARE (NOT LESS)
Compare gp1 gp0
if Less then Move Zero gp2
Move gp2 gp0
<Push gp0>
<<is true>>
<getgp0>
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
<Push gp0>
<<junk>>
#________________________________ Function usage routines ________________________________

<< function call routine >>
<Push args>
Goto function:<Call_address> 												#CALLING <Call_address>
<< function startup routine >>










																	Scope <function_name>
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5

Move Stack_pointer previous_stack_ptr								%function:<function_name>
SUB Stack_pointer @<new_length> 									#OVERHEAD FOR FUNCTION <function_name>
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
<get_parameters>
<< return routine >>
<generate value to return>
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
<< while loop code >>
Pass 										%loop<number>entry
<Calculate_condition>									
<Popgp0>
NOT gp0
if gp0 then Load PC loop<number>exit 								#WHILE LOOP
<looped_code>
Load PC loop<number>entry					%loop<number>continue
Pass 										%loop<number>exit
<< for loop code >>
<assignment1>
Pass 										%loop<number>entry 		#FOR LOOP
<Calculate_condition>
<Popgp0>
NOT gp0
if gp0 then Load PC loop<number>exit
<looped_code>
Pass 										%loop<number>continue
<assignment2>								
Load PC loop<number>entry
Pass 										%loop<number>exit
<< if statement code >> 									
<Calculate_condition>
<Popgp0>
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC if<number>endif
<conditional code>
Pass										%if<number>endif
<< if-else statement code >>
<Calculate_condition>
<Popgp0>
if gp0 then Load PC if<number>true 									#IF ELSE STATEMENT
<false_code>
Load PC if<number>endif
Pass 										%if<number>true
<true_code> 
Pass 										%if<number>endif           
<<junk>>


#______________________________________ Snippets to load and store registers ______________________________________

<<Popgp0>>				
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
<<Popgp1>>
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
<<Popindex>>				
SUB gp7 @4 															#POP TO INDEX REGISTER
Load gp6 Expression_stack [gp7]
<<Pushgp0>> 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
<<junk>>
#______________________________________ Local vars ______________________________________
#__________________________ Load-store integers __________________________


<< load >>
Load gp0 <absolute_address> [Stack_pointer] 						#LOAD GP0
<Pushgp0>
<< load relative >>
<get_index>
ADD gp6 <absolute_address> [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
<Pushgp0>
<< store >>
<Popgp0>
Store gp0 <absolute_address> [Stack_pointer] 						#STORE GP0
<< store relative >> 
<get_index>
<Popgp0>
ADD gp6 <absolute_address> [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
<<junk>>
#_________________________ Load store char _________________________

<< load char >>
LoadByte gp0 <absolute_address> [Stack_pointer] 					#LOAD GP0 (CHAR)
<Pushgp0>
<< load relative char >>
<get_index>
ADD gp6 <absolute_address> [Stack_pointer]							#LOAD GP0 RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
<Pushgp0>
<< store char >>
<Popgp0>
StoreByte gp0 <absolute_address> [Stack_pointer] 					#STORE GP0 (CHAR)
<< store relative char >>
<get_index>
<Popgp0>
ADD gp6 <absolute_address> [Stack_pointer] 							#STORE GP0 RELATIVE (CHAR)
StoreByte gp0 0 [gp6]
<<junk>>

#______________________________________ global vars ______________________________________

<< load global >>
Load gp0 <absolute_address> 										#LOAD GP0 GLOBAL
<Pushgp0>
<< load relative global >>
<get_index>
ADD gp6 <absolute_address> 											#LOAD GP0 GLOBAL RELATIVE
Load gp0 0 [gp6]									
<Pushgp0>
<< store global >>
<Popgp0>
Store gp0 <absolute_address> 										#STORE GP0 GLOBAL
<< store relative global >> 
<get_index>
<Popgp0>
ADD gp6 <absolute_address> 											#STORE GP0 GLOBAL RELATIVE
Store gp0 0 [gp6]
<<junk>>
#_________________________ Load store char _________________________

<< load char global >>
LoadByte gp0 <absolute_address> 									#LOAD GP0 GLOBAL (CHAR)
<Pushgp0>
<< load relative char global >>
<get_index>
ADD gp6 <absolute_address> 											#LOAD GP0 GLOBAL RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
<Pushgp0>
<< store char global >>
<Popgp0>
StoreByte gp0 <absolute_address> 									#STORE GP0 GLOBAL (CHAR)
<< store relative char global >>
<get_index>
<Popgp0>
ADD gp6 <absolute_address> 											#STORE GP0 GLOBAL RELATIVE (CHAR)
StoreByte gp0 0 [gp6]
<<junk>>

#_________________________ index operations _________________________



<< get index integer >>
<index expr>
<pop index>
MUL gp6 @4 														   #INDEXING FOR @INT
<< get index char >>
<index expr>
<pop index>
<<junk>>

#____________ type casting operations ____________
<< cast int to char >>
<Popgp0>
AND gp0 @255 													  #CASTING INT TO CHAR
<Push gp0>
<< cast char to int >>
Pass 															  #CASTING CHAR TO INT
<<junk>>
#____________ ptr operations _________________________

<< get ptr >>
Move Stack_pointer gp0 											#GETTING POINTER
ADD gp0 @<absolute_address>
<Push gp0>
<< get ptr global >>
int CLLPTR.<absolute_address> <absolute_address> 				#GETTING POINTER GLOBAl
Load gp0 CLLPTR.<absolute_address>
<Push gp0>
<<junk>>





