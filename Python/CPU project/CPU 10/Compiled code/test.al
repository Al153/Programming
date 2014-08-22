Call main.main
 Halt

#<FORTH COMPILER: Using these .hlib files:
		#std.hlib



#<FORTH COMPILER: These files are imported by the .hlib files: 
		import Compilers\Forth\Headers\forth.al		




#<FORTH COMPILER the following are declarations for all variables used in the forth program
			int main:fib:*n main:fib:n
			int main:fib:n 0
#<FORTH COMPILER: end of variable declarations


#<FORTH COMPILER: Assembly generated for word: main.fib
Push main:fib:*n %main.fib
Push Forth.Pop
Pop gp0
Goto Programstack.call
Push main:fib:n
Push @1
Push Forth.Equal
Pop gp0
Goto Programstack.call
Push main:fib:n
Push @0
Push Forth.Equal
Pop gp0
Goto Programstack.call
Push Forth.OR
Pop gp0
Goto Programstack.call
Pop gp0
if gp0 then {
Push @1
}
else {
Push main:fib:n
Push main:fib:n
Push @2
Push Forth.SUB
Pop gp0
Goto Programstack.call
Push main.fib
Pop gp0
Goto Programstack.call
Push Forth.swap
Pop gp0
Goto Programstack.call
Push @1
Push Forth.SUB
Pop gp0
Goto Programstack.call
Push main.fib
Pop gp0
Goto Programstack.call
Push Forth.ADD
Pop gp0
Goto Programstack.call
}
Return





#<FORTH COMPILER: Assembly generated for word: main.main
Push @0 %main.main
Push main.fib
Pop gp0
Goto Programstack.call
Push Forth.print
Pop gp0
Goto Programstack.call
Push @1
Push main.fib
Pop gp0
Goto Programstack.call
Push Forth.print
Pop gp0
Goto Programstack.call
Push @2
Push main.fib
Pop gp0
Goto Programstack.call
Push Forth.print
Pop gp0
Goto Programstack.call
Push @3
Push main.fib
Pop gp0
Goto Programstack.call
Push Forth.print
Pop gp0
Goto Programstack.call
Return




