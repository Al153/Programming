Call main.main
 Halt

#<FORTH COMPILER: Using these .hlib files:
		#std.hlib
		#math.hlib
		#debug.hlib



#<FORTH COMPILER: These files are imported by the .hlib files: 
		import Compilers\Forth\Headers\debug.al		
import Compilers\Forth\Headers\forth.al		
import Compilers\Forth\Headers\floating_point.al		




#<FORTH COMPILER the following are declarations for all variables used in the forth program
			str main:main:gen_string1 " Sin Theta = "
			str main:main:gen_string0 "Theta = "
			int main:main:*gen_string0 main:main:gen_string0
			int main:main:*gen_string1 main:main:gen_string1
#<FORTH COMPILER: end of variable declarations


#<FORTH COMPILER: Assembly generated for word: main.main
Push @0 %main.main
Load gp0 Forth.dup
Goto Programstack.call
Push @1225770370
Load gp0 FP.Less
Goto Programstack.call
Pop gp0 %FORTH.while0
if gp0 then {
Load gp0 Forth.dup
Goto Programstack.call
Load gp0 Forth.dup
Goto Programstack.call
Push main:main:gen_string0
Load gp0 Forth.echo
Goto Programstack.call
Load gp0 FP.display
Goto Programstack.call
Push main:main:gen_string1
Load gp0 Forth.echo
Goto Programstack.call
Load gp0 FP.cos
Goto Programstack.call
Load gp0 FP.display
Goto Programstack.call
Load gp0 Forth.Carriage_return
Goto Programstack.call
Push @1225775743
Load gp0 FP.Add
Goto Programstack.call
Load gp0 Forth.dup
Goto Programstack.call
Push @1225770370
Load gp0 FP.Less
Goto Programstack.call
Load PC FORTH.while0
}
Return




