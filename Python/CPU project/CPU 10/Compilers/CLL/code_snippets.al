#Snippets which define how the compiled program behaves at runtime

#____________ routines defined ____________
#		- setup and error handling
#		- arithmetic-logic operations
#		- function call, stack frame manipulation, etc
# 		-




<< setup routines >>

#is run before main program, sets up stacks and global variables

def STACK_SIZE 65536   #makes stack sizes easy to change

#register reservations:

#Hardware register:	|				New Purpose
#Zero 				| 				Same
#One				|				Same
#Accumulator 		|				Same
#Jump 				|				Same - mostly for calling functions
#PC 				|				Same
#Flags_set 			|				Same
#Flags_reset 		| 				Same
#Stack_pointer 		| 				Same
#gp0 				|				Primary operations register
#gp1 				|				Secondary operations register
#gp2 				|		
#gp3				|
#gp4				|				Call-auxilary - holds important call information eg stack frame size
#gp5 				|				stack_pointer manipulation
#gp6				|				indexing register  for relative addressing whilst using stack frames
#gp7 				|				expression_stack_pointer								




array Callstack	STACK_SIZE []  				#initialise stacks
array Expression_stack STACK_SIZE []
int stack_length STACK_SIZE 				#creates a variable of size stack size

Load Stack_pointer $Callstack 				#creates a pointer to the start of the call stack
Load gp0 stack_length 						#modifies pointer to point to end of call stack - call stack  advances downwards
MUL gp0 @4
ADD Stack_pointer gp0



Load PC <main_program_name>

	
Out @'E'	%Stack_overflow_error 					#deal with an Expression_stack overflow  
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


<< ADD >>
<getgp0> 															#compiler will work out whether gp0 is loaded or Pushed
<getgp1>
ADD gp0 gp1
<storegp0>

<< SUB >>
<getgp0>
<getgp1>
SUB gp0 gp1
Load Flags_reset @4294967287  #resets the borrow flag
<storegp0>

<< MUL>>
<getgp0>
<getgp1>
MUL gp0 gp1
<storegp0>

<< DIV >>
<getgp0>
<getgp1>
DIV gp0 gp1
if DivByZero then Load PC DIV_BY_ZERO
<storegp0>

<< MOD >>
<getgp0>
<getgp1>
MOD gp0 gp1
if DivByZero then Load PC DIV_BY_ZERO
<storegp0>

<< AND >>
<getgp0>
<getgp1>
AND gp0 gp1
<storegp0>

<< OR >
<getgp0>
<getgp1>
OR gp0 gp1
<storegp0>

<< XOR >>
<getgp0>
<getgp1>
XOR gp0 gp1
<storegp0>

<< NOT >>
<getgp0>
<getgp1>
NOT gp0 gp1
<storegp0>

#_________________________ Comparison operations _________________________
<<is equal>>
<getgp0>
<getgp1>
Move Zero gp2
Compare gp1 gp0
if Equal then Move One gp2
Move gp2 gp0
<Push gp0>

<<is greater>>
<getgp0>
<getgp1>
Move Zero gp2
Compare gp1 gp0
if Greater then Move One gp2
Move gp2 gp0
<Push gp0>

<<is less>>
<getgp0>
<getgp1>
Move Zero gp2
Compare gp1 gp0
if Less then Move One gp2
Move gp2 gp0
<Push gp0>

<<not greater>>
<getgp0>
<getgp1>
Move One gp2
Compare gp1 gp0
if Greater then Move Zero gp2
Move gp2 gp0
<Push gp0>

<<not less>>
<getgp0>
<getgp1>
Move One gp2
Compare gp1 gp0
if Less then Move Zero gp2
Move gp2 gp0
<Push gp0>

<<is true>>
<getgp0>
if gp0 then Move One gp0
<Push gp0>

#________________________________ Function usage routines ________________________________

<< function call routine >>
<Push args> 				#compiled part
Goto <Call_address> 		#needs to sub in call address



<< function startup routine >>
#creates a stack frame and loads it with correct  values 

Scope <function_name>

def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5



Load length 4 [Stack_pointer]				%<function_name> 	#gets length of current top stack_frame
Move Stack_pointer previous_stack_ptr						 	#gets a copy of the current stack pointer
SUB Stack_pointer length 										#shift stack pointer on
Compare Stack_pointer $Callstack  								#checks for a stack overflow
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer] 								#stores address to return to
Load gp0 @<new_length> 											#gets the newlength (compiled in)
Store gp0 4 [Stack_pointer] 									#gives new length
Store previous_stack_ptr 8 [Stack_pointer]						#gives pointer to pop off of stack
<get_parameters>												#get passed in parameters, repeated as many times as needed 

<< get parameters >>
<Popgp0>
Store gp1 <index> [Stack_pointer]

<< push args >>




<< return routine >>
 Load previous_stack_ptr 8 [Stack_pointer] 					#reads new top of stack from the stack
 Load return_addr 0 [Stack_pointer] 						#gets address to jump back to
 <generate value to return> 								#calculates retun value, leaves on stack
 Move previous_stack_ptr Stack_pointer 						#sets new stack pointer
 Move return_addr PC 										#returns


 << while loop code >>
 Pass %loop<number>entry 									#placeholder to allow label to be placed easily
 <Calculate_condition> 										#calculates if condtion true or false 										
 <Popgp0> 													#inline POP
 NOT gp0 													#easier to test if condition not true ie inverted
 if gp0 then Load PC loop<number>exit 						#if condtion false then end loop
 	<looped_code>
 Load PC loop<number>entry 									#loop
 Pass %loop<number>exit 									#placeholder exit label

 << for loop code >>
<assignment1> 												#initialisation assignment
Pass %loop<number>entry 									#placeholder label
<Calculate_condition> 										#checks condition and inverts it
<Popgp0>
NOT gp0
if gp0 then Load PC loop<number>exit 						#if condition violatedthen exits loop
	<looped_code> 											#runs looped code
<assignment2> 												and of loop assignement and loops back
Load PC loop<number>entry
Pass %loop<number>exit 										#another placeholder


<< if statement code >> 									
<Calculate_condition> 										#boolean calculation
<Popgp0> 													#gets result of boolean calculation into gp0
NOT gp0 													#inverts result of boolean calculation since next step is easier to calculate this way
if gp0 then Load PC if<number>endif 						#jumps to the the endif if condition is false
	<conditional code> 										#code to execute otherwise
Pass %if<number>endif 										#placeholder for label (endif)

<<if-else statement code >>
<Calculate_condition> 										#same set up as nefore
<Popgp0>
if gp0 then Load PC if<number>true 							#if true then jump to true code
	<false_code> 											#false code runs by default
	Load PC if<number>endif									#goto endif
Pass %if<number>true  										#placeholder for label
	<true_code> 
Pass %if<number>endif           



#______________________________________ Snippets to load and store registers ______________________________________

<<Popgp0>>				
SUB gp7 @4 															#decrement stack pointer to point to top of stack
LOad gp0  Expression_stack [gp7] 									#pop into gp0

<<Popgp1>>				 											#same for gp1 and index
SUB gp7 @4
Load gp1 Expression_stack [gp7]

<<Popindex>>				
SUB gp7 @4
Load gp6 Expression_stack [gp7]


<<Pushgp0>> 														#Push routine
Store gp0 Expression_stack [gp7] 									#stores gp0 to top of stack
Add gp7 @4 															#increment stack pointer
Compare gp7 stack_length 											#check for stack overflow
if Greater then Load PC Stack_overflow_error

<<Pushgp1>> 														#same for gp1
Store gp1 Expression_stack [gp7]
Add gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error






<< to load gp0 >>
Load gp0 <absolute_address> [Stack_pointer] 						#Recursion stack increments downwards

<< to load gp1 >>
Load gp1 <absolute_address> [Stack_pointer] 

<< load gp0 relative >>
<get_index>
ADD gp6 Stack_pointer 												#combines index and stackpointer
Load gp0 <absolute_address> [gp6] 									#Loads

<< load gp1 relative >> 											#same for gp1
<get_index>
ADD gp6 Stack_pointer
Load gp1 <absolute_address> [gp6]

<< get index integer >>
<index expr>
<pop index>
MUL gp6 @4

<< get index char >>
<index expr>
<pop index>

<< get ptr >>
Move Stack_pointer gp0
ADD gp0 <absolute_address>
<Push gp0>

<< to store gp0 >> 													#same functions but for Storing
Store gp0 <absolute_address> [Stack_pointer]

<< to store gp1 >>
Store gp1 <absolute_address> [Stack_pointer]

<< store gp0 relative >> 
<get index expr>
<Popindex>
ADD gp6 Stack_pointer
Store gp0 <absolute_address> [gp6]

<< store gp0 relative >>
<get index expr>
<Popindex>
ADD gp6 Stack_pointer
Store gp0 <absolute_address> [gp6]

<<display>>
Load gp0 12 [stack_pointer]
Outd gp0