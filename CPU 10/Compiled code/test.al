Call main.main
 Halt

#<FORTH COMPILER: Using these .hlib files:
		#std.hlib
		#stdio.hlib
		#debug.hlib



#<FORTH COMPILER: These files are imported by the .hlib files: 
		import Compilers\Forth\Headers\debug.al		
import Compilers\Forth\Headers\string_tools.al		
import Compilers\Forth\Headers\forth.al		




#<FORTH COMPILER the following are declarations for all variables used in the forth program
#<FORTH COMPILER: end of variable declarations


#<FORTH COMPILER: Assembly generated for word: main.main
Push @1024 %main.main
Load gp0 string_tools_allocate
Goto Programstack.call
Load gp0 Forth.dup
Goto Programstack.call
Load gp0 string_tools.insert_to_pool_file
Goto Programstack.call
Load gp0 Forth.echo
Goto Programstack.call
Return




