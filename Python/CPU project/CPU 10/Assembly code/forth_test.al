

Push n
Push @1
Push Forth.Equal
Pop gp0
Goto Programstack.call

Push n
Push @0
Push Forth.Equal
Pop gp0
Goto Programstack.call
Push Forth.OR
Pop gp0
Goto Programstack.call
Pop gp0
Outd gp0
Return


Subroutine Forth.OR(a,b)
	def a gp1
	def b gp2

	OR a b
	Return a

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