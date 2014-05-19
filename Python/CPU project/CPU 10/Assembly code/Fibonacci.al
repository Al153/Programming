import Stack

#Demonstrating stack use and recursion

#def fib(n):
#	if n == 0:
#		return 1
#   if n == 1:
# 		return 1
#	else:
# 		return fib(n-1)+fib(n-2)


ptr Fib
ptr return_1

int x 15

Load gp0 x
Goto Datastack.push

Load gp0 Fib
Goto Programstack.call
Goto Datastack.pop
Outd gp0
Halt



def n gp0
def fibn-1 gp1

	Goto Datastack.pop %Fib
	Compare n Zero
	if Equal then Goto return_1
	Compare n One
	if Equal then Goto return_1
		SUB n One

		
		Goto Datastack.push # . . . n-1 n-1
		Goto Datastack.push
		Load gp0 Fib
		Goto Programstack.call 	 
		Goto Datastack.pop     	
		
		Move gp0 fibn-1 			
		Goto Datastack.pop 		
		SUB gp0 One 				

		Move gp0 gp2
		Move gp1 gp0 				
		Goto Datastack.push 		
		Move gp2 gp0
		Goto Datastack.push        

		Load gp0 Fib 					
		Goto Programstack.call     
		
		Goto Datastack.pop
		

		
		Move gp0 gp1
		Goto Datastack.pop

		ADD gp0 gp1


		Goto Datastack.push
		Load PC Programstack.return

Move One gp0 %return_1
Goto Datastack.push
Load PC Programstack.return


