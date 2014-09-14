Call main.main
 Halt

#<FORTH COMPILER: Using these .hlib files:
		#stdio.hlib
		#std.hlib



#<FORTH COMPILER: These files are imported by the .hlib files: 
		import Compilers\Forth\Headers\string_tools.al		
import Compilers\Forth\Headers\forth.al		




#<FORTH COMPILER the following are declarations for all variables used in the forth program
			str main:main:message "hello world
"
			int main:main:*message main:main:message
#<FORTH COMPILER: end of variable declarations


#<FORTH COMPILER: Assembly generated for word: main.main
Push main:main:message %main.main
Load gp0 string_tools.copy
Goto Programstack.call
Load gp0 Forth.print_stack
Goto Programstack.call
Load gp0 Forth.echo
Goto Programstack.call
Return




