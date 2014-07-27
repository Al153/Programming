#Demonstrating stack use and recursion

#def fib(n):
#	if n >1:
#		return fib(n-1)+fib(n-2)
# 	else:
#		return 1


Subroutine main()                       #main Subroutine
	Call fib(@5)                         #calls fib(5)
	Pop gp1                             #pops value of fib(5) into register gp1
	Outd gp1                            #prints out the value
Return


										

Subroutine fib(n) 						#gets the value into register n

	def n gp1  							#renames general purpose register 1 to n

	Compare n @1
	if Greater then { 					#if n>1: return fib(n+1) + fib(n-2) 
		SUB n @1                        # n = n-1
		Push n                          # pushes n-1 onto the stack
		SUB n @1                        # n = n-1 again (=original_n -2)
		Push n                          # pushes n-2 onto the stack

		Call fib                        # calls fib on n-2  					stack goes from . . . n-1 n-2 ==> . . . n-1 fib(n-2)
		Call stack.swap                 # swaps top two valus on the stack
		Call fib                        # calls fib on n-1    					stack goes from . . . fib(n-2) n-1 ==> . . . fib(n-2) fib(n-1)
		Pop gp1 						#gets values of fib(n-1) and fib(n-2) into registers gp1 and gp2
		Pop gp2       
		ADD gp1 gp2                     #adds them
		Push gp1                        #pushes them onto the stack
		Return 							#returns

	}
	else {                              #otherwise push 1 and return  (return 1)
		Push @1 						
		Return
	}
