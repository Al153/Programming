Call main.main
 Halt

#<FORTH COMPILER: Using these .hlib files:
		#std.hlib



#<FORTH COMPILER: These files are imported by the .hlib files: 
		import Compilers\Forth\Headers\forth.al		




#<FORTH COMPILER the following are declarations for all variables used in the forth program
#<FORTH COMPILER: end of variable declarations


#<FORTH COMPILER: Assembly generated for word: main.main
Push @0 %main.main
Push @1
Pop gp0 %FORTH.while0
if gp0 then {
Push @1
Load gp0 Forth.ADD
Goto Programstack.call
Load gp0 Forth.dup
Goto Programstack.call
Push @1000000
Load gp0 Forth.Less
Goto Programstack.call
Load PC FORTH.while0
}
Load gp0 Forth.print
Goto Programstack.call
Return




