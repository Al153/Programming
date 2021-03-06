#Library files for a forth compiler

#ALU commands

import lib\Strings
#ADD
Subroutine Forth.ADD(a,b)
	def a gp1
	def b gp2

	ADD a b
	Return a

#SUB
Subroutine Forth.SUB(a,b)
# . . . a b
	def a gp1
	def b gp2
	SUB a b
	Return a

#MUL
Subroutine Forth.MUL(a,b)
	def a gp1
	def b gp2

	MUL a b
	Return a

#DIV
Subroutine Forth.DIV(a,b)
# . . . a b
	def a gp1
	def b gp2

	DIV a b
	Return a


#MOD
Subroutine Forth.MOD(a,b)
	def a gp1
	def b gp2

	MOD a b
	Return a

#AND
Subroutine Forth.AND(a,b)
# . . . a b
	def a gp1
	def b gp2

	AND a b
	Return a

#OR
Subroutine Forth.OR(a,b)
	def a gp1
	def b gp2

	OR a b
	Return a

#XOR
Subroutine Forth.XOR(a,b)
# . . . a b
	def a gp1
	def b gp2

	XOR a b
	Return a

#NOT
Subroutine Forth.NOT(a)
# . . . a
	def a gp1
	NOT a
	Return a


#NAND
Subroutine Forth.NAND(a,b)
	def a gp1
	def b gp2

	NAND a b
	Return a

#NOR
Subroutine Forth.NOR(a,b)
# . . . a b
	def a gp1
	def b gp2

	NOR a b
	Return a

#XNOR
Subroutine Forth.XNOR(a,b)
	def a gp1
	def b gp2

	XNOR a b
	Return a

#SHR
Subroutine Forth.SHR(a,b)
# . . . a b
	def a gp1
	def b gp2

	SHR a b
	Return a

#SHL
Subroutine Forth.SHL(a,b)
# . . . a b
	def a gp1
	def b gp2

	SHL a b
	Return a





#Comparatives

#=
Subroutine Forth.Equal(a,b)
# . . . a b
	def a gp1
	def b gp2
	Compare a b
	if Equal then {
		Return One
	}
	else {
		Return Zero
	}


#<
Subroutine Forth.Less(a,b)
# . . . a b
	def a gp1
	def b gp2

	Compare a b
	if Less then {
		Return One
	}
	else {
		Return Zero
	}

#>
Subroutine Forth.Greater(a,b)
# . . . a b
	def a gp1
	def b gp2

	Compare a b
	if Greater then {
		Return One
	}
	else {
		Return Zero
	}

#>=
Subroutine Forth.Greater_or_Equal(a,b)
# . . . a b
	def a gp1
	def b gp2

	Compare a b
	if Less then {
		Return Zero
	}
	else {
		Return One
	}

#<=
Subroutine Forth.Less_or_Equal(a,b)
# . . . a b
	def a gp1
	def b gp2

	Compare a b
	if Greater then {
		Return Zero
	}
	else {
		Return One
	}

#!=
Subroutine Forth.Not_Equal(a,b)
# . . . a b
	def a gp1
	def b gp2

	Compare a b
	if Equal then {
		Return Zero
	}
	else {
		Return One
	}

#____________ Dup _____________
int Forth.dup.temp
	Pop Forth.dup.temp		%Forth.dup
	Push Forth.dup.temp
	Push Forth.dup.temp
	Return
#____________ Swap ____________
int Forth.swap.temp1
int Forth.swap.temp2

	Pop Forth.swap.temp1        %Forth.swap
	Pop Forth.swap.temp2
	Push Forth.swap.temp1
	Push Forth.swap.temp2

	Return

#____________ Drop ____________
int Forth.drop.temp
	Pop Forth.drop.temp         %Forth.drop 
	Return


#____________ print ____________
#prints to of stack
	Pop gp0 					%Forth.print
	Outd gp0
	Return

#____________ print_stack ____________
#prints whole stack

	Call stack.print %Forth.print_stack
	Return
	

Subroutine Forth.Pop(data,address)
	def data gp1
	def address gp2

	Store data 0 [address]
	Return

Subroutine Forth.Pop_byte(data,address)
	def data gp1
	def address gp2

	StoreByte data 0 [address]
	Return

Subroutine Forth.Pop_word(data,address)
	def data gp1
	def address gp2

	StoreWord data 0 [address]
	Return


Subroutine Forth.Push(address)
	def data gp1
	def address gp2

	Load data 0 [address]
	Return data

Subroutine Forth.Push_byte(address)
	def data gp1
	def address gp2

	LoadByte data 0 [address]
	Return data

Subroutine Forth.PushWord(address)
	def data gp1
	def address gp2

	LoadWord data 0 [address]
	Return data



Call Strings.print %Forth.echo
Return

Pop gp0 %Forth.echo_char
Out gp0
Return

Out @13 %Forth.Carriage_return
Out @10
Return


Out @32 %Forth.space
Return

Halt %Forth.quit