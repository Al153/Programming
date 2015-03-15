

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

byteArray CLL.array_of_grid1 4000 []
int CLL.grid1 CLL.array_of_grid1
byteArray CLL.array_of_grid2 4000 []
int CLL.grid2 CLL.array_of_grid2
																	Scope display_grid
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:display_grid
SUB Stack_pointer @20 									#OVERHEAD FOR FUNCTION display_grid
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 16 [Stack_pointer] 						#STORE GP0
Load gp1 16 [Stack_pointer] 						#LOAD GP0
Load gp0 @1
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifdisplay_grid-0true 									#IF ELSE STATEMENT
Load gp0 @0
Store gp0 8 [Stack_pointer] 						#STORE GP0
Pass 										%loopdisplay_grid-3entry 		#FOR LOOP
Load gp1 8 [Stack_pointer] 						#LOAD GP0
Load gp0 @50
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
NOT gp0
if gp0 then Load PC loopdisplay_grid-3exit
Load gp0 @0
Store gp0 12 [Stack_pointer] 						#STORE GP0
Pass 										%loopdisplay_grid-2entry 		#FOR LOOP
Load gp1 12 [Stack_pointer] 						#LOAD GP0
Load gp0 @80
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
NOT gp0
if gp0 then Load PC loopdisplay_grid-2exit
Load gp1 8 [Stack_pointer] 						#LOAD GP0
Load gp0 @80
MUL gp0 gp1 														#MULTIPLY
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 12 [Stack_pointer] 						#LOAD GP0
ADD gp0 gp1 														#ADD
Move gp0 gp6 						#PUSH gp0 POP gp6
ADD gp6 CLL.grid2 											#LOAD GP0 GLOBAL RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:putc 												#CALLING putc
Pass 										%loopdisplay_grid-2continue
Load gp1 12 [Stack_pointer] 						#LOAD GP0
Load gp0 @1
ADD gp0 gp1 														#ADD
Store gp0 12 [Stack_pointer] 						#STORE GP0
Load PC loopdisplay_grid-2entry
Pass 										%loopdisplay_grid-2exit
Pass 										%loopdisplay_grid-3continue
Load gp1 8 [Stack_pointer] 						#LOAD GP0
Load gp0 @1
ADD gp0 gp1 														#ADD
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load PC loopdisplay_grid-3entry
Pass 										%loopdisplay_grid-3exit
Load PC ifdisplay_grid-0endif
Pass 										%ifdisplay_grid-0true
Load gp0 @0
Store gp0 8 [Stack_pointer] 						#STORE GP0
Pass 										%loopdisplay_grid-1entry 		#FOR LOOP
Load gp1 8 [Stack_pointer] 						#LOAD GP0
Load gp0 @50
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
NOT gp0
if gp0 then Load PC loopdisplay_grid-1exit
Load gp0 @0
Store gp0 12 [Stack_pointer] 						#STORE GP0
Pass 										%loopdisplay_grid-0entry 		#FOR LOOP
Load gp1 12 [Stack_pointer] 						#LOAD GP0
Load gp0 @80
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
NOT gp0
if gp0 then Load PC loopdisplay_grid-0exit
Load gp1 8 [Stack_pointer] 						#LOAD GP0
Load gp0 @80
MUL gp0 gp1 														#MULTIPLY
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 12 [Stack_pointer] 						#LOAD GP0
ADD gp0 gp1 														#ADD
Move gp0 gp6 						#PUSH gp0 POP gp6
ADD gp6 CLL.grid1 											#LOAD GP0 GLOBAL RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:putc 												#CALLING putc
Pass 										%loopdisplay_grid-0continue
Load gp1 12 [Stack_pointer] 						#LOAD GP0
Load gp0 @1
ADD gp0 gp1 														#ADD
Store gp0 12 [Stack_pointer] 						#STORE GP0
Load PC loopdisplay_grid-0entry
Pass 										%loopdisplay_grid-0exit
Pass 										%loopdisplay_grid-1continue
Load gp1 8 [Stack_pointer] 						#LOAD GP0
Load gp0 @1
ADD gp0 gp1 														#ADD
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load PC loopdisplay_grid-1entry
Pass 										%loopdisplay_grid-1exit
Pass 										%ifdisplay_grid-0endif           
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

########################## PUTC (char) ########################################
SUB gp7 @4 															%function:putc
Load gp0  Expression_stack [gp7]
Out gp0
Move Jump PC
################################################################################
Halt %function:quit
																	Scope golSetup
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:golSetup
SUB Stack_pointer @18 									#OVERHEAD FOR FUNCTION golSetup
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
Load gp0 @0
Store gp0 12 [Stack_pointer] 						#STORE GP0
Load gp0 @0
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load gp0 @0
AND gp0 @255 													  #CASTING INT TO CHAR
StoreByte gp0 17 [Stack_pointer] 					#STORE GP0 (CHAR)
Pass 										%loopgolSetup-0entry
Load gp0 @1
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0
if gp0 then Load PC loopgolSetup-0exit 								#WHILE LOOP
LoadByte gp0 17 [Stack_pointer] 					#LOAD GP0 (CHAR)
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
ADD gp6 CLL.grid1 											#STORE GP0 GLOBAL RELATIVE (CHAR)
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
if gp0 then Load PC ifgolSetup-0endif
Load PC loopgolSetup-0exit
Pass										%ifgolSetup-0endif
LoadByte gp0 16 [Stack_pointer] 					#LOAD GP0 (CHAR)
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @105
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifgolSetup-10true 									#IF ELSE STATEMENT
LoadByte gp0 16 [Stack_pointer] 					#LOAD GP0 (CHAR)
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @111
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifgolSetup-9true 									#IF ELSE STATEMENT
LoadByte gp0 16 [Stack_pointer] 					#LOAD GP0 (CHAR)
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @97
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifgolSetup-8true 									#IF ELSE STATEMENT
LoadByte gp0 16 [Stack_pointer] 					#LOAD GP0 (CHAR)
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @115
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifgolSetup-7true 									#IF ELSE STATEMENT
LoadByte gp0 16 [Stack_pointer] 					#LOAD GP0 (CHAR)
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @100
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifgolSetup-6true 									#IF ELSE STATEMENT
LoadByte gp0 16 [Stack_pointer] 					#LOAD GP0 (CHAR)
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @119
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifgolSetup-5endif
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
if gp0 then Load PC ifgolSetup-4endif
Load gp0 @49
Store gp0 8 [Stack_pointer] 						#STORE GP0
Pass										%ifgolSetup-4endif
Pass										%ifgolSetup-5endif
Load PC ifgolSetup-6endif
Pass 										%ifgolSetup-6true
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
if gp0 then Load PC ifgolSetup-3endif
Load gp0 @0
Store gp0 12 [Stack_pointer] 						#STORE GP0
Pass										%ifgolSetup-3endif
Pass 										%ifgolSetup-6endif           
Load PC ifgolSetup-7endif
Pass 										%ifgolSetup-7true
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
if gp0 then Load PC ifgolSetup-2endif
Load gp0 @0
Store gp0 8 [Stack_pointer] 						#STORE GP0
Pass										%ifgolSetup-2endif
Pass 										%ifgolSetup-7endif           
Load PC ifgolSetup-8endif
Pass 										%ifgolSetup-8true
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
if gp0 then Load PC ifgolSetup-1endif
Load gp0 @79
Store gp0 12 [Stack_pointer] 						#STORE GP0
Pass										%ifgolSetup-1endif
Pass 										%ifgolSetup-8endif           
Load PC ifgolSetup-9endif
Pass 										%ifgolSetup-9true
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
ADD gp6 CLL.grid1 											#STORE GP0 GLOBAL RELATIVE (CHAR)
StoreByte gp0 0 [gp6]
Pass 										%ifgolSetup-9endif           
Load PC ifgolSetup-10endif
Pass 										%ifgolSetup-10true
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
ADD gp6 CLL.grid1 											#STORE GP0 GLOBAL RELATIVE (CHAR)
StoreByte gp0 0 [gp6]
Pass 										%ifgolSetup-10endif           
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp1 @80
Load gp0 8 [Stack_pointer] 						#LOAD GP0
MUL gp0 gp1 														#MULTIPLY
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Move gp0 gp6 						#PUSH gp0 POP gp6
ADD gp6 CLL.grid1 											#LOAD GP0 GLOBAL RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
StoreByte gp0 17 [Stack_pointer] 					#STORE GP0 (CHAR)
Load gp0 @35
AND gp0 @255 													  #CASTING INT TO CHAR
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp1 @80
Load gp0 8 [Stack_pointer] 						#LOAD GP0
MUL gp0 gp1 														#MULTIPLY
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Move gp0 gp6 						#PUSH gp0 POP gp6
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
ADD gp6 CLL.grid1 											#STORE GP0 GLOBAL RELATIVE (CHAR)
StoreByte gp0 0 [gp6]
Load gp0 @1
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:display_grid 												#CALLING display_grid
Load PC loopgolSetup-0entry					%loopgolSetup-0continue
Pass 										%loopgolSetup-0exit
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
																	Scope wraparoundx
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:wraparoundx
SUB Stack_pointer @12 									#OVERHEAD FOR FUNCTION wraparoundx
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load gp1 8 [Stack_pointer] 						#LOAD GP0
Load gp0 @80
Move Zero gp2 														#COMPARE (IS GREATER)
Compare gp1 gp0
if Greater then Load gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifwraparoundx-1true 									#IF ELSE STATEMENT
Load gp1 8 [Stack_pointer] 						#LOAD GP0
Load gp0 @80
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifwraparoundx-0endif
Load gp0 @0
Store gp0 8 [Stack_pointer] 						#STORE GP0
Pass										%ifwraparoundx-0endif
Load PC ifwraparoundx-1endif
Pass 										%ifwraparoundx-1true
Load gp0 @79
Store gp0 8 [Stack_pointer] 						#STORE GP0
Pass 										%ifwraparoundx-1endif           
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
																	Scope wraparoundy
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:wraparoundy
SUB Stack_pointer @12 									#OVERHEAD FOR FUNCTION wraparoundy
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load gp1 8 [Stack_pointer] 						#LOAD GP0
Load gp0 @50
Move Zero gp2 														#COMPARE (IS GREATER)
Compare gp1 gp0
if Greater then Load gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifwraparoundy-1true 									#IF ELSE STATEMENT
Load gp1 8 [Stack_pointer] 						#LOAD GP0
Load gp0 @50
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifwraparoundy-0endif
Load gp0 @0
Store gp0 8 [Stack_pointer] 						#STORE GP0
Pass										%ifwraparoundy-0endif
Load PC ifwraparoundy-1endif
Pass 										%ifwraparoundy-1true
Load gp0 @49
Store gp0 8 [Stack_pointer] 						#STORE GP0
Pass 										%ifwraparoundy-1endif           
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

################## built in function char ##############################################

SUB gp7 @4 		 		 %function:char									#Pops into gp0
Load gp0 Expression_stack [gp7]  				
AND gp0 @255
Store gp0 Expression_stack [gp7] 
ADD gp7 @4
Move Jump PC  			#reads new top of stack from the stack frame
#######################################################################################

#################################### Built in function print_al ####################################
SUB gp7 @4 		 		 %function:print_i										#Pops into gp0
Load gp0 Expression_stack [gp7]  				
Outd gp0
Move Jump PC  			#reads new top of stack from the stack frame
####################################################################################################

																	Scope golSimulate
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:golSimulate
SUB Stack_pointer @21 									#OVERHEAD FOR FUNCTION golSimulate
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
Pass 										%loopgolSimulate-4entry
Load gp0 @1
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0
if gp0 then Load PC loopgolSimulate-4exit 								#WHILE LOOP
Load gp0 @0
Store gp0 8 [Stack_pointer] 						#STORE GP0
Pass 										%loopgolSimulate-1entry 		#FOR LOOP
Load gp1 8 [Stack_pointer] 						#LOAD GP0
Load gp0 @50
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
NOT gp0
if gp0 then Load PC loopgolSimulate-1exit
Load gp0 @0
Store gp0 12 [Stack_pointer] 						#STORE GP0
Pass 										%loopgolSimulate-0entry 		#FOR LOOP
Load gp1 12 [Stack_pointer] 						#LOAD GP0
Load gp0 @80
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
NOT gp0
if gp0 then Load PC loopgolSimulate-0exit
Load gp0 @1
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
Goto function:count_neighbours 												#CALLING count_neighbours
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 17 [Stack_pointer] 						#STORE GP0
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp1 @80
Load gp0 8 [Stack_pointer] 						#LOAD GP0
MUL gp0 gp1 														#MULTIPLY
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Move gp0 gp6 						#PUSH gp0 POP gp6
ADD gp6 CLL.grid1 											#LOAD GP0 GLOBAL RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
if gp0 then Load PC ifgolSimulate-2true 									#IF ELSE STATEMENT
Load gp1 17 [Stack_pointer] 						#LOAD GP0
Load gp0 @3
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifgolSimulate-1true 									#IF ELSE STATEMENT
Load gp0 @0
AND gp0 @255 													  #CASTING INT TO CHAR
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp1 @80
Load gp0 8 [Stack_pointer] 						#LOAD GP0
MUL gp0 gp1 														#MULTIPLY
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Move gp0 gp6 						#PUSH gp0 POP gp6
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
ADD gp6 CLL.grid2 											#STORE GP0 GLOBAL RELATIVE (CHAR)
StoreByte gp0 0 [gp6]
Load PC ifgolSimulate-1endif
Pass 										%ifgolSimulate-1true
Load gp0 @48
AND gp0 @255 													  #CASTING INT TO CHAR
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp1 @80
Load gp0 8 [Stack_pointer] 						#LOAD GP0
MUL gp0 gp1 														#MULTIPLY
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Move gp0 gp6 						#PUSH gp0 POP gp6
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
ADD gp6 CLL.grid2 											#STORE GP0 GLOBAL RELATIVE (CHAR)
StoreByte gp0 0 [gp6]
Pass 										%ifgolSimulate-1endif           
Load PC ifgolSimulate-2endif
Pass 										%ifgolSimulate-2true
Load gp1 17 [Stack_pointer] 						#LOAD GP0
Load gp0 @2
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp1 17 [Stack_pointer] 						#LOAD GP0
Load gp0 @3
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
OR gp0 gp1
if gp0 then Load PC ifgolSimulate-0true 									#IF ELSE STATEMENT
Load gp0 @0
AND gp0 @255 													  #CASTING INT TO CHAR
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp1 @80
Load gp0 8 [Stack_pointer] 						#LOAD GP0
MUL gp0 gp1 														#MULTIPLY
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Move gp0 gp6 						#PUSH gp0 POP gp6
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
ADD gp6 CLL.grid2 											#STORE GP0 GLOBAL RELATIVE (CHAR)
StoreByte gp0 0 [gp6]
Load PC ifgolSimulate-0endif
Pass 										%ifgolSimulate-0true
Load gp0 @48
AND gp0 @255 													  #CASTING INT TO CHAR
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp1 @80
Load gp0 8 [Stack_pointer] 						#LOAD GP0
MUL gp0 gp1 														#MULTIPLY
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Move gp0 gp6 						#PUSH gp0 POP gp6
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
ADD gp6 CLL.grid2 											#STORE GP0 GLOBAL RELATIVE (CHAR)
StoreByte gp0 0 [gp6]
Pass 										%ifgolSimulate-0endif           
Pass 										%ifgolSimulate-2endif           
Pass 										%loopgolSimulate-0continue
Load gp1 12 [Stack_pointer] 						#LOAD GP0
Load gp0 @1
ADD gp0 gp1 														#ADD
Store gp0 12 [Stack_pointer] 						#STORE GP0
Load PC loopgolSimulate-0entry
Pass 										%loopgolSimulate-0exit
Pass 										%loopgolSimulate-1continue
Load gp1 8 [Stack_pointer] 						#LOAD GP0
Load gp0 @1
ADD gp0 gp1 														#ADD
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load PC loopgolSimulate-1entry
Pass 										%loopgolSimulate-1exit
Load gp0 @2
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:display_grid 												#CALLING display_grid
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
if gp0 then Load PC ifgolSimulate-3endif
Load PC loopgolSimulate-2exit
Pass										%ifgolSimulate-3endif
Load gp0 @0
Store gp0 8 [Stack_pointer] 						#STORE GP0
Pass 										%loopgolSimulate-3entry 		#FOR LOOP
Load gp1 8 [Stack_pointer] 						#LOAD GP0
Load gp0 @50
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
NOT gp0
if gp0 then Load PC loopgolSimulate-3exit
Load gp0 @0
Store gp0 12 [Stack_pointer] 						#STORE GP0
Pass 										%loopgolSimulate-2entry 		#FOR LOOP
Load gp1 12 [Stack_pointer] 						#LOAD GP0
Load gp0 @80
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
NOT gp0
if gp0 then Load PC loopgolSimulate-2exit
Load gp0 @2
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
Goto function:count_neighbours 												#CALLING count_neighbours
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 17 [Stack_pointer] 						#STORE GP0
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp1 @80
Load gp0 8 [Stack_pointer] 						#LOAD GP0
MUL gp0 gp1 														#MULTIPLY
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Move gp0 gp6 						#PUSH gp0 POP gp6
ADD gp6 CLL.grid2 											#LOAD GP0 GLOBAL RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
if gp0 then Load PC ifgolSimulate-6true 									#IF ELSE STATEMENT
Load gp1 17 [Stack_pointer] 						#LOAD GP0
Load gp0 @3
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifgolSimulate-5true 									#IF ELSE STATEMENT
Load gp0 @0
AND gp0 @255 													  #CASTING INT TO CHAR
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp1 @80
Load gp0 8 [Stack_pointer] 						#LOAD GP0
MUL gp0 gp1 														#MULTIPLY
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Move gp0 gp6 						#PUSH gp0 POP gp6
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
ADD gp6 CLL.grid1 											#STORE GP0 GLOBAL RELATIVE (CHAR)
StoreByte gp0 0 [gp6]
Load PC ifgolSimulate-5endif
Pass 										%ifgolSimulate-5true
Load gp0 @48
AND gp0 @255 													  #CASTING INT TO CHAR
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp1 @80
Load gp0 8 [Stack_pointer] 						#LOAD GP0
MUL gp0 gp1 														#MULTIPLY
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Move gp0 gp6 						#PUSH gp0 POP gp6
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
ADD gp6 CLL.grid1 											#STORE GP0 GLOBAL RELATIVE (CHAR)
StoreByte gp0 0 [gp6]
Pass 										%ifgolSimulate-5endif           
Load PC ifgolSimulate-6endif
Pass 										%ifgolSimulate-6true
Load gp1 17 [Stack_pointer] 						#LOAD GP0
Load gp0 @2
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp1 17 [Stack_pointer] 						#LOAD GP0
Load gp0 @3
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
OR gp0 gp1
if gp0 then Load PC ifgolSimulate-4true 									#IF ELSE STATEMENT
Load gp0 @0
AND gp0 @255 													  #CASTING INT TO CHAR
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp1 @80
Load gp0 8 [Stack_pointer] 						#LOAD GP0
MUL gp0 gp1 														#MULTIPLY
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Move gp0 gp6 						#PUSH gp0 POP gp6
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
ADD gp6 CLL.grid1 											#STORE GP0 GLOBAL RELATIVE (CHAR)
StoreByte gp0 0 [gp6]
Load PC ifgolSimulate-4endif
Pass 										%ifgolSimulate-4true
Load gp0 @48
AND gp0 @255 													  #CASTING INT TO CHAR
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp1 @80
Load gp0 8 [Stack_pointer] 						#LOAD GP0
MUL gp0 gp1 														#MULTIPLY
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Move gp0 gp6 						#PUSH gp0 POP gp6
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
ADD gp6 CLL.grid1 											#STORE GP0 GLOBAL RELATIVE (CHAR)
StoreByte gp0 0 [gp6]
Pass 										%ifgolSimulate-4endif           
Pass 										%ifgolSimulate-6endif           
Pass 										%loopgolSimulate-2continue
Load gp1 12 [Stack_pointer] 						#LOAD GP0
Load gp0 @1
ADD gp0 gp1 														#ADD
Store gp0 12 [Stack_pointer] 						#STORE GP0
Load PC loopgolSimulate-2entry
Pass 										%loopgolSimulate-2exit
Pass 										%loopgolSimulate-3continue
Load gp1 8 [Stack_pointer] 						#LOAD GP0
Load gp0 @1
ADD gp0 gp1 														#ADD
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load PC loopgolSimulate-3entry
Pass 										%loopgolSimulate-3exit
Load gp0 @1
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:display_grid 												#CALLING display_grid
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
if gp0 then Load PC ifgolSimulate-7endif
Load PC loopgolSimulate-4exit
Pass										%ifgolSimulate-7endif
Load PC loopgolSimulate-4entry					%loopgolSimulate-4continue
Pass 										%loopgolSimulate-4exit
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
																	Scope count_neighbours
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:count_neighbours
SUB Stack_pointer @24 									#OVERHEAD FOR FUNCTION count_neighbours
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 12 [Stack_pointer] 						#STORE GP0
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 20 [Stack_pointer] 						#STORE GP0
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 16 [Stack_pointer] 						#STORE GP0
Load gp0 @0
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load gp1 16 [Stack_pointer] 						#LOAD GP0
Load gp0 @1
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifcount_neighbours-16true 									#IF ELSE STATEMENT
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp1 20 [Stack_pointer] 						#LOAD GP0
Load gp0 @1
ADD gp0 gp1 														#ADD
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:wraparoundx 												#CALLING wraparoundx
Load gp1 @80
Load gp0 12 [Stack_pointer] 						#LOAD GP0
MUL gp0 gp1 														#MULTIPLY
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Move gp0 gp6 						#PUSH gp0 POP gp6
ADD gp6 CLL.grid2 											#LOAD GP0 GLOBAL RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
if gp0 then Load PC ifcount_neighbours-8true 									#IF ELSE STATEMENT
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load PC ifcount_neighbours-8endif
Pass 										%ifcount_neighbours-8true
Load gp0 @1
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Pass 										%ifcount_neighbours-8endif           
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 20 [Stack_pointer] 						#LOAD GP0
Load gp1 @1
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:wraparoundx 												#CALLING wraparoundx
Load gp1 @80
Load gp0 12 [Stack_pointer] 						#LOAD GP0
MUL gp0 gp1 														#MULTIPLY
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Move gp0 gp6 						#PUSH gp0 POP gp6
ADD gp6 CLL.grid2 											#LOAD GP0 GLOBAL RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
if gp0 then Load PC ifcount_neighbours-9true 									#IF ELSE STATEMENT
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load PC ifcount_neighbours-9endif
Pass 										%ifcount_neighbours-9true
Load gp0 @1
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Pass 										%ifcount_neighbours-9endif           
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Store gp0 8 [Stack_pointer] 						#STORE GP0
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
Load gp0 @80
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
Goto function:wraparoundy 												#CALLING wraparoundy
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
MUL gp0 gp1 														#MULTIPLY
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Move gp0 gp6 						#PUSH gp0 POP gp6
ADD gp6 CLL.grid2 											#LOAD GP0 GLOBAL RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
if gp0 then Load PC ifcount_neighbours-10true 									#IF ELSE STATEMENT
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load PC ifcount_neighbours-10endif
Pass 										%ifcount_neighbours-10true
Load gp0 @1
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Pass 										%ifcount_neighbours-10endif           
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Store gp0 8 [Stack_pointer] 						#STORE GP0
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
Load gp0 @80
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Load gp1 @1
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:wraparoundy 												#CALLING wraparoundy
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
MUL gp0 gp1 														#MULTIPLY
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Move gp0 gp6 						#PUSH gp0 POP gp6
ADD gp6 CLL.grid2 											#LOAD GP0 GLOBAL RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
if gp0 then Load PC ifcount_neighbours-11true 									#IF ELSE STATEMENT
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load PC ifcount_neighbours-11endif
Pass 										%ifcount_neighbours-11true
Load gp0 @1
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Pass 										%ifcount_neighbours-11endif           
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp1 20 [Stack_pointer] 						#LOAD GP0
Load gp0 @1
ADD gp0 gp1 														#ADD
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:wraparoundx 												#CALLING wraparoundx
Load gp0 @80
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
Goto function:wraparoundy 												#CALLING wraparoundy
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
MUL gp0 gp1 														#MULTIPLY
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Move gp0 gp6 						#PUSH gp0 POP gp6
ADD gp6 CLL.grid2 											#LOAD GP0 GLOBAL RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
if gp0 then Load PC ifcount_neighbours-12true 									#IF ELSE STATEMENT
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load PC ifcount_neighbours-12endif
Pass 										%ifcount_neighbours-12true
Load gp0 @1
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Pass 										%ifcount_neighbours-12endif           
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 20 [Stack_pointer] 						#LOAD GP0
Load gp1 @1
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:wraparoundx 												#CALLING wraparoundx
Load gp0 @80
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
Goto function:wraparoundy 												#CALLING wraparoundy
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
MUL gp0 gp1 														#MULTIPLY
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Move gp0 gp6 						#PUSH gp0 POP gp6
ADD gp6 CLL.grid2 											#LOAD GP0 GLOBAL RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
if gp0 then Load PC ifcount_neighbours-13true 									#IF ELSE STATEMENT
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load PC ifcount_neighbours-13endif
Pass 										%ifcount_neighbours-13true
Load gp0 @1
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Pass 										%ifcount_neighbours-13endif           
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp1 20 [Stack_pointer] 						#LOAD GP0
Load gp0 @1
ADD gp0 gp1 														#ADD
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:wraparoundx 												#CALLING wraparoundx
Load gp0 @80
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Load gp1 @1
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:wraparoundy 												#CALLING wraparoundy
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
MUL gp0 gp1 														#MULTIPLY
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Move gp0 gp6 						#PUSH gp0 POP gp6
ADD gp6 CLL.grid2 											#LOAD GP0 GLOBAL RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
if gp0 then Load PC ifcount_neighbours-14true 									#IF ELSE STATEMENT
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load PC ifcount_neighbours-14endif
Pass 										%ifcount_neighbours-14true
Load gp0 @1
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Pass 										%ifcount_neighbours-14endif           
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 20 [Stack_pointer] 						#LOAD GP0
Load gp1 @1
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:wraparoundx 												#CALLING wraparoundx
Load gp0 @80
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Load gp1 @1
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:wraparoundy 												#CALLING wraparoundy
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
MUL gp0 gp1 														#MULTIPLY
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Move gp0 gp6 						#PUSH gp0 POP gp6
ADD gp6 CLL.grid2 											#LOAD GP0 GLOBAL RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
if gp0 then Load PC ifcount_neighbours-15true 									#IF ELSE STATEMENT
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load PC ifcount_neighbours-15endif
Pass 										%ifcount_neighbours-15true
Load gp0 @1
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Pass 										%ifcount_neighbours-15endif           
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load PC ifcount_neighbours-16endif
Pass 										%ifcount_neighbours-16true
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp1 20 [Stack_pointer] 						#LOAD GP0
Load gp0 @1
ADD gp0 gp1 														#ADD
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:wraparoundx 												#CALLING wraparoundx
Load gp1 @80
Load gp0 12 [Stack_pointer] 						#LOAD GP0
MUL gp0 gp1 														#MULTIPLY
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Move gp0 gp6 						#PUSH gp0 POP gp6
ADD gp6 CLL.grid1 											#LOAD GP0 GLOBAL RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
if gp0 then Load PC ifcount_neighbours-0true 									#IF ELSE STATEMENT
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load PC ifcount_neighbours-0endif
Pass 										%ifcount_neighbours-0true
Load gp0 @1
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Pass 										%ifcount_neighbours-0endif           
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 20 [Stack_pointer] 						#LOAD GP0
Load gp1 @1
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:wraparoundx 												#CALLING wraparoundx
Load gp1 @80
Load gp0 12 [Stack_pointer] 						#LOAD GP0
MUL gp0 gp1 														#MULTIPLY
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Move gp0 gp6 						#PUSH gp0 POP gp6
ADD gp6 CLL.grid1 											#LOAD GP0 GLOBAL RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
if gp0 then Load PC ifcount_neighbours-1true 									#IF ELSE STATEMENT
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load PC ifcount_neighbours-1endif
Pass 										%ifcount_neighbours-1true
Load gp0 @1
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Pass 										%ifcount_neighbours-1endif           
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Store gp0 8 [Stack_pointer] 						#STORE GP0
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
Load gp0 @80
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
Goto function:wraparoundy 												#CALLING wraparoundy
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
MUL gp0 gp1 														#MULTIPLY
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Move gp0 gp6 						#PUSH gp0 POP gp6
ADD gp6 CLL.grid1 											#LOAD GP0 GLOBAL RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
if gp0 then Load PC ifcount_neighbours-2true 									#IF ELSE STATEMENT
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load PC ifcount_neighbours-2endif
Pass 										%ifcount_neighbours-2true
Load gp0 @1
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Pass 										%ifcount_neighbours-2endif           
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Store gp0 8 [Stack_pointer] 						#STORE GP0
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
Load gp0 @80
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Load gp1 @1
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:wraparoundy 												#CALLING wraparoundy
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
MUL gp0 gp1 														#MULTIPLY
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Move gp0 gp6 						#PUSH gp0 POP gp6
ADD gp6 CLL.grid1 											#LOAD GP0 GLOBAL RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
if gp0 then Load PC ifcount_neighbours-3true 									#IF ELSE STATEMENT
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load PC ifcount_neighbours-3endif
Pass 										%ifcount_neighbours-3true
Load gp0 @1
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Pass 										%ifcount_neighbours-3endif           
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp1 20 [Stack_pointer] 						#LOAD GP0
Load gp0 @1
ADD gp0 gp1 														#ADD
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:wraparoundx 												#CALLING wraparoundx
Load gp0 @80
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
Goto function:wraparoundy 												#CALLING wraparoundy
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
MUL gp0 gp1 														#MULTIPLY
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Move gp0 gp6 						#PUSH gp0 POP gp6
ADD gp6 CLL.grid1 											#LOAD GP0 GLOBAL RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
if gp0 then Load PC ifcount_neighbours-4true 									#IF ELSE STATEMENT
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load PC ifcount_neighbours-4endif
Pass 										%ifcount_neighbours-4true
Load gp0 @1
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Pass 										%ifcount_neighbours-4endif           
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 20 [Stack_pointer] 						#LOAD GP0
Load gp1 @1
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:wraparoundx 												#CALLING wraparoundx
Load gp0 @80
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
Goto function:wraparoundy 												#CALLING wraparoundy
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
MUL gp0 gp1 														#MULTIPLY
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Move gp0 gp6 						#PUSH gp0 POP gp6
ADD gp6 CLL.grid1 											#LOAD GP0 GLOBAL RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
if gp0 then Load PC ifcount_neighbours-5true 									#IF ELSE STATEMENT
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load PC ifcount_neighbours-5endif
Pass 										%ifcount_neighbours-5true
Load gp0 @1
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Pass 										%ifcount_neighbours-5endif           
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp1 20 [Stack_pointer] 						#LOAD GP0
Load gp0 @1
ADD gp0 gp1 														#ADD
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:wraparoundx 												#CALLING wraparoundx
Load gp0 @80
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Load gp1 @1
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:wraparoundy 												#CALLING wraparoundy
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
MUL gp0 gp1 														#MULTIPLY
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Move gp0 gp6 						#PUSH gp0 POP gp6
ADD gp6 CLL.grid1 											#LOAD GP0 GLOBAL RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
if gp0 then Load PC ifcount_neighbours-6true 									#IF ELSE STATEMENT
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load PC ifcount_neighbours-6endif
Pass 										%ifcount_neighbours-6true
Load gp0 @1
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Pass 										%ifcount_neighbours-6endif           
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 20 [Stack_pointer] 						#LOAD GP0
Load gp1 @1
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:wraparoundx 												#CALLING wraparoundx
Load gp0 @80
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Load gp1 @1
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:wraparoundy 												#CALLING wraparoundy
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
MUL gp0 gp1 														#MULTIPLY
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Move gp0 gp6 						#PUSH gp0 POP gp6
ADD gp6 CLL.grid1 											#LOAD GP0 GLOBAL RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
if gp0 then Load PC ifcount_neighbours-7true 									#IF ELSE STATEMENT
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load PC ifcount_neighbours-7endif
Pass 										%ifcount_neighbours-7true
Load gp0 @1
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Pass 										%ifcount_neighbours-7endif           
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Store gp0 8 [Stack_pointer] 						#STORE GP0
Pass 										%ifcount_neighbours-16endif           
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
Goto function:golSetup 												#CALLING golSetup
Goto function:golSimulate 												#CALLING golSimulate
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
