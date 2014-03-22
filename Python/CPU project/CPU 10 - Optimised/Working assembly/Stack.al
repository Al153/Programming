array Programstack	65536 [] 											#empty array of size 655356
int stack.io	0
int stack.temp	0
int 4 			4
int 8 			8
int 65536		65536
int stackoverflow 2
int stackunderflow 1

ptr Programstack.push
ptr Programstack.return
ptr stack.overflow
ptr stack.underflow

#Add push pop sub

#___________ stack push ___________
#called at start of a subroutine, puts the data @stack.io onto the stack (should have been taken from jump at start of subroutine)
puts Jump reg onto the stack and goes to the value in register gp0		
									#takes input value
ADD Stack_pointer @4				%Programstack.push	    #increment stack pointer
Compare Stack_pointer @65536 									#check for overflow
if Greater then  Load PC @stack.overflow 						
Store Jump @Programstack [Stack_pointer]
Move gp0 PC

#_______________ stack return _______________
#takes data straight of stack and puts into the PC, used to return from subroutines
Load Jump  @Programstack [Stack_pointer] %Programstack.return
SUB Stack_pointer @4 
if Borrow then Halt
Move Jump PC



array Datastack	65536 [] 											#empty array of size 655356
int Datastack.pointer 0

ptr Datastack.push
ptr Datastack.pop



#____________________ stack push ____________________
#pushes value in gp0 to the stack
											#takes input value 
Load gp7 @Datastack.pointer %Datastack.push
 						
Store gp0 @Datastack [gp7]
ADD gp7 @4 										    #increment stack pointer
Compare gp7 @65536 									#check for overflow
if Greater then  Load PC @stack.overflow
Store gp7 @Datastack.pointer
Move Jump PC

#____________________ stack pop ____________________
#pops from data stack into gp0

Load gp7 @Datastack.pointer %Datastack.pop
SUB gp7 @4 
if Borrow then Load PC @stack.underflow
Store gp7 @Datastack.pointer
Load gp0  @Datastack [gp7]

Move Jump PC

#____________________ stack.errors ____________________
Load Flags_set @stackoverflow			%stack.overflow
Move Jump PC

Load Flags_set @stackunderflow 			%stack.underflow
Move Jump PC  
