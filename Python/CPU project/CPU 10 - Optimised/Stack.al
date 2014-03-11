array stack	65536 [] 											#empty array of size 655356
int stack.io	0
int stack.temp	0
int 4 			4
int 8 			8
int 65536		65536
int stackoverflow 2
int stackunderflow 1

ptr stack.push
ptr stack.pop
ptr stack.overflow
ptr stack.underflow

#Add push pop sub

#stack push
Store gp0 @stack.temp 					%stack.push				#allows use of gp0
#ADD Jump @8														#for return
Load  gp0 @stack.io												#takes input value
ADD Stack_pointer @4 										    #increment stack pointer
Compare Stack_pointer @65536 									#check for overflow
if Greater then  Load PC @stack.overflow 						
Store gp0 @stack [Stack_pointer]
Load gp0 @stack.temp
Move Jump PC

#stack pop
Store gp0 @stack.temp 					%stack.pop
#ADD Jump @8
Load gp0  @stack [Stack_pointer]
Store gp0 @stack.io
Load gp0 @stack.temp
SUB Stack_pointer @4 
if Borrow then Load PC @stack.underflow
Move Jump PC

#stack.underflow
ADD Stack_pointer @4			%stack.underflow
Load Flags_set @stackunderflow
Move Jump PC


#stack overflow
SUB Stack_pointer @4			%stack.overflow
Load Flags_set @stackoverflow
Move Jump PC
