Call main.main
 Halt

#<FORTH COMPILER: Using these .hlib files:
		#std.hlib



#<FORTH COMPILER: These files are imported by the .hlib files: 
		import Compilers\Forth\Headers\forth.al		




#<FORTH COMPILER the following are declarations for all variables used in the forth program
			int main:add_fractions:*numerator2 main:add_fractions:numerator2
			int main:add_fractions:*numerator1 main:add_fractions:numerator1
			int main:add_fractions:*denominator2 main:add_fractions:denominator2
			int main:add_fractions:*denominator1 main:add_fractions:denominator1
			int main:add_fractions:numerator1 0
			int main:add_fractions:numerator2 0
			int main:add_fractions:denominator1 0
			int main:add_fractions:denominator2 0
			int main:simplify:*numerator main:simplify:numerator
			int main:simplify:denominator 0
			int main:simplify:numerator 0
			int main:simplify:*denominator main:simplify:denominator
			int main:GCD:a 0
			int main:GCD:*a main:GCD:a
#<FORTH COMPILER: end of variable declarations


#<FORTH COMPILER: Assembly generated for word: main.add_fractions
Push main:add_fractions:*denominator2 %main.add_fractions
Load gp0 Forth.Pop
Goto Programstack.call
Push main:add_fractions:*numerator2
Load gp0 Forth.Pop
Goto Programstack.call
Push main:add_fractions:*denominator1
Load gp0 Forth.Pop
Goto Programstack.call
Push main:add_fractions:*numerator1
Load gp0 Forth.Pop
Goto Programstack.call
Push main:add_fractions:numerator1
Push main:add_fractions:denominator2
Load gp0 Forth.MUL
Goto Programstack.call
Push main:add_fractions:numerator2
Push main:add_fractions:denominator1
Load gp0 Forth.MUL
Goto Programstack.call
Load gp0 Forth.ADD
Goto Programstack.call
Push main:add_fractions:denominator1
Push main:add_fractions:denominator2
Load gp0 Forth.MUL
Goto Programstack.call
Load gp0 main.simplify
Goto Programstack.call
Return





#<FORTH COMPILER: Assembly generated for word: main.simplify
Push main:simplify:*denominator %main.simplify
Load gp0 Forth.Pop
Goto Programstack.call
Push main:simplify:*numerator
Load gp0 Forth.Pop
Goto Programstack.call
Push main:simplify:numerator
Push main:simplify:denominator
Load gp0 main.GCD
Goto Programstack.call
Load gp0 Forth.dup
Goto Programstack.call
Push main:simplify:numerator
Load gp0 Forth.swap
Goto Programstack.call
Load gp0 Forth.DIV
Goto Programstack.call
Load gp0 Forth.swap
Goto Programstack.call
Push main:simplify:denominator
Load gp0 Forth.swap
Goto Programstack.call
Load gp0 Forth.DIV
Goto Programstack.call
Return





#<FORTH COMPILER: Assembly generated for word: main.main
Push @4 %main.main
Push @6
Push @3
Push @4
Load gp0 main.add_fractions
Goto Programstack.call
Load gp0 Forth.swap
Goto Programstack.call
Load gp0 Forth.print
Goto Programstack.call
Load gp0 Forth.Carriage_return
Goto Programstack.call
Load gp0 Forth.print
Goto Programstack.call
Return





#<FORTH COMPILER: Assembly generated for word: main.GCD
Load gp0 Forth.dup %main.GCD
Goto Programstack.call
Push @0
Load gp0 Forth.Equal
Goto Programstack.call
Pop gp0
if gp0 then {
Load gp0 Forth.drop
Goto Programstack.call
}
else {
Load gp0 Forth.dup
Goto Programstack.call
Push main:GCD:*a
Load gp0 Forth.Pop
Goto Programstack.call
Load gp0 Forth.MOD
Goto Programstack.call
Push main:GCD:a
Load gp0 Forth.swap
Goto Programstack.call
Load gp0 main.GCD
Goto Programstack.call
}
Return




