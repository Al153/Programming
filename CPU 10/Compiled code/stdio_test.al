Call main.main
 Halt

#<FORTH COMPILER: Using these .hlib files:
		#stdio.hlib
		#std.hlib



#<FORTH COMPILER: These files are imported by the .hlib files: 
		import Compilers\Forth\Headers\string_tools.al		
import Compilers\Forth\Headers\forth.al		




#<FORTH COMPILER the following are declarations for all variables used in the forth program
			int main:main:test 0
			str main:main:gen_string0 "hello world
"
			int main:main:*gen_string0 main:main:gen_string0
			int main:main:*test main:main:test
#<FORTH COMPILER: end of variable declarations


#<FORTH COMPILER: Assembly generated for word: main.main
Push main:main:gen_string0 %main.main
Push main:main:*test
Load gp0 Forth.Pop
Goto Programstack.call
Push @66
Push main:main:test
Load gp0 Forth.Pop_byte
Goto Programstack.call
Push main:main:test
Load gp0 Forth.echo
Goto Programstack.call
Return




