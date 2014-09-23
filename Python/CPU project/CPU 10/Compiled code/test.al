Call main.main
 Halt

#<FORTH COMPILER: Using these .hlib files:
		#std.hlib
		#debug.hlib



#<FORTH COMPILER: These files are imported by the .hlib files: 
		import Compilers\Forth\Headers\debug.al		
import Compilers\Forth\Headers\forth.al		




#<FORTH COMPILER the following are declarations for all variables used in the forth program
#<FORTH COMPILER: end of variable declarations


#<FORTH COMPILER: Assembly generated for word: main.main
Push @4000000000 %main.main
Push @4000000000
Load gp0 Forth.ADD
Goto Programstack.call
Load gp0 debug.print_flags
Goto Programstack.call
Load gp0 Forth.space
Goto Programstack.call
Load gp0 Forth.print
Goto Programstack.call
Load gp0 Forth.Carriage_return
Goto Programstack.call
Load gp0 debug.clear_flags
Goto Programstack.call
Push @1
Push @2
Load gp0 Forth.SUB
Goto Programstack.call
Load gp0 debug.print_flags
Goto Programstack.call
Load gp0 Forth.space
Goto Programstack.call
Load gp0 Forth.print
Goto Programstack.call
Load gp0 Forth.Carriage_return
Goto Programstack.call
Load gp0 debug.clear_flags
Goto Programstack.call
Push @400000000
Push @4000000000
Load gp0 Forth.MUL
Goto Programstack.call
Load gp0 debug.print_flags
Goto Programstack.call
Load gp0 Forth.space
Goto Programstack.call
Load gp0 debug.print_acc
Goto Programstack.call
Load gp0 Forth.space
Goto Programstack.call
Load gp0 Forth.print
Goto Programstack.call
Load gp0 Forth.Carriage_return
Goto Programstack.call
Load gp0 debug.clear_flags
Goto Programstack.call
Push @10
Push @0
Load gp0 Forth.DIV
Goto Programstack.call
Load gp0 debug.print_flags
Goto Programstack.call
Load gp0 Forth.space
Goto Programstack.call
Load gp0 Forth.print
Goto Programstack.call
Load gp0 Forth.Carriage_return
Goto Programstack.call
Load gp0 debug.clear_flags
Goto Programstack.call
Push @1
Push @31
Load gp0 Forth.SHR
Goto Programstack.call
Load gp0 Forth.print
Goto Programstack.call
Load gp0 Forth.Carriage_return
Goto Programstack.call
Push @1
Push @32
Load gp0 Forth.SHR
Goto Programstack.call
Load gp0 Forth.print
Goto Programstack.call
Return




