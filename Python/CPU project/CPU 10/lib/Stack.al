array Programstack	65536 [] 											#empty array of size 655356
int stack.io	0
int stack.temp	0
int stackoverflow 2
int stackunderflow 1


#Add push pop sub

#___________ stack call ___________
#called at start of a subroutine, puts the data @stack.io onto the stack (should have been taken from jump at start of subroutine)
#puts Jump reg onto the stack and goes to the value in register gp0		
									#takes input value

ADD Stack_pointer @4				%Programstack.call	    #increment stack pointer
Compare Stack_pointer @65535 									#check for overflow
if Greater then  Load PC stack.overflow 						
Store Jump Programstack [Stack_pointer]
Move gp0 PC

#_______________ stack return _______________
#takes data straight of stack and puts into the PC, used to return from subroutines

Load Jump  Programstack [Stack_pointer] %Programstack.return
Load Flags_reset @4294967287  #resets the borrow flag
SUB Stack_pointer @4 
if Borrow then Halt
Move Jump PC



array Datastack	65536 [] 											#empty array of size 655356
int Datastack.pointer 0
int Datastack.temp 0



#____________________ stack push ____________________
#pushes value in gp0 to the stack
											#takes input value 
Store gp7 Datastack.temp											%Datastack.push
Load gp7 Datastack.pointer 
 						
Store gp0 Datastack [gp7]
ADD gp7 @4 										    #increment stack pointer
Compare gp7 @65536 									#check for overflow
if Greater then  Load PC stack.overflow
Store gp7 Datastack.pointer
Load gp7 Datastack.temp

Move Jump PC

#____________________ stack pop ____________________
#pops from data stack into gp0


Store gp7 Datastack.temp %Datastack.pop
Load gp7 Datastack.pointer 
Load Flags_reset @4294967287  #resets the borrow flag
SUB gp7 @4 
if Borrow then Load PC stack.underflow
Store gp7 Datastack.pointer
Load gp0  Datastack [gp7]
Load gp7 Datastack.temp

Move Jump PC

#____________________ stack.errors ____________________
Load Flags_set stackoverflow			%stack.overflow
Move Jump PC

Load Flags_set stackunderflow 			%stack.underflow

Move Jump PC  

#___________ print stack ___________

Load gp7 Datastack.pointer %stack.print
Move Zero gp6
Out @83
Out @58
Out @32

Compare gp6 gp7 %stack.print_loop
if Equal then Load PC stack.print_return
Outd Datastack [gp6]
ADD gp6 @4
Out @32
Load PC stack.print_loop

Out @10 %stack.print_return
Return


#____________ Dup _____________
int stack.dup.temp
	Pop stack.dup.temp		%stack.dup
	Push stack.dup.temp
	Push stack.dup.temp
	Return
#____________ Swap ____________
int stack.swap.temp1
int stack.swap.temp2

	Pop stack.swap.temp1        %stack.swap
	Pop stack.swap.temp2
	Push stack.swap.temp1
	Push stack.swap.temp2

	Return

#____________ Drop ____________
int stack.drop.temp
	Pop stack.drop.temp         %stack.drop 
	Return