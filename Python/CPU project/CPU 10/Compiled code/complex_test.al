Call main.main
 Halt

#<FORTH COMPILER: Using these .hlib files:
		#std.hlib
		#math.hlib



#<FORTH COMPILER: These files are imported by the .hlib files: 
		import Compilers\Forth\Headers\complex.al		
import Compilers\Forth\Headers\forth.al		
import Compilers\Forth\Headers\floating_point.al		




#<FORTH COMPILER the following are declarations for all variables used in the forth program
			int main:fft:*step main:fft:step
			int main:fft:*out main:fft:out
			int main:fft:*buf main:fft:buf
			int main:fft:*t main:fft:t
			int main:fft:*temp_complex main:fft:temp_complex
			int main:fft:k 0
			int main:fft:*n main:fft:n
			int main:fft:n 0
			int main:fft:step 0
			array main:fft:t 2 [0, 0]
			int main:fft:*k main:fft:k
			array main:fft:temp_complex 2 [0, 0]
			int main:fft:buf 0
			int main:fft:out 0
			array main:main:test_out 8 [0, 0,   0, 0,  0, 0,  0, 0]
			int main:main:*test2 main:main:test2
			array main:main:test2 2 [128, 129]
			int main:main:*test_out main:main:test_out
			array main:main:result 2 [0, 0]
			int main:main:*test main:main:test
			array main:main:test 2 [0, 1225775743]
			array main:main:test_buf 8 [128, 0,  0, 0,  0, 0,  0, 0]
			int main:main:*result main:main:result
			int main:main:*test_buf main:main:test_buf
			int main:floatify:*exponent main:floatify:exponent
			int main:floatify:exponent 0
			int main:print_complex_array:*Array main:print_complex_array:Array
			int main:print_complex_array:n 0
			int main:print_complex_array:*size main:print_complex_array:size
			int main:print_complex_array:*n main:print_complex_array:n
			int main:print_complex_array:Array 0
			int main:print_complex_array:size 0
#<FORTH COMPILER: end of variable declarations


#<FORTH COMPILER: Assembly generated for word: main.int_POP
Push @4 %main.int_POP
Load gp0 Forth.MUL
Goto Programstack.call
Load gp0 Forth.ADD
Goto Programstack.call
Load gp0 Forth.Pop
Goto Programstack.call
Return





#<FORTH COMPILER: Assembly generated for word: main.fft
Push main:fft:*step %main.fft
Load gp0 Forth.Pop
Goto Programstack.call
Push main:fft:*n
Load gp0 Forth.Pop
Goto Programstack.call
Push main:fft:*out
Load gp0 Forth.Pop
Goto Programstack.call
Push main:fft:*buf
Load gp0 Forth.Pop
Goto Programstack.call
Push main:fft:step
Push main:fft:n
Load gp0 Forth.Less
Goto Programstack.call
Pop gp0
if gp0 then {
Push main:fft:buf
Push main:fft:out
Push main:fft:n
Push main:fft:step
Push main:fft:out
Push main:fft:buf
Push main:fft:n
Push main:fft:step
Push @2
Load gp0 Forth.MUL
Goto Programstack.call
Load gp0 main.fft
Goto Programstack.call
Push main:fft:out
Push main:fft:step
Load gp0 Forth.ADD
Goto Programstack.call
Push main:fft:buf
Push main:fft:step
Load gp0 Forth.ADD
Goto Programstack.call
Push main:fft:n
Push main:fft:step
Push @2
Load gp0 Forth.MUL
Goto Programstack.call
Load gp0 main.fft
Goto Programstack.call
Push main:fft:*step
Load gp0 Forth.Pop
Goto Programstack.call
Push main:fft:*n
Load gp0 Forth.Pop
Goto Programstack.call
Push main:fft:*out
Load gp0 Forth.Pop
Goto Programstack.call
Push main:fft:*buf
Load gp0 Forth.Pop
Goto Programstack.call
Push @0
Push main:fft:*k
Load gp0 Forth.Pop
Goto Programstack.call
Push main:fft:k
Push main:fft:n
Load gp0 Forth.Less
Goto Programstack.call
Pop gp0 %FORTH.while0
if gp0 then {
Push @0
Push main:fft:*temp_complex
Load gp0 Forth.Pop
Goto Programstack.call
Push @3373256577
Push main:fft:k
Load gp0 main.floatify
Goto Programstack.call
Push main:fft:n
Load gp0 main.floatify
Goto Programstack.call
Load gp0 FP.Divide
Goto Programstack.call
Load gp0 FP.Multiply
Goto Programstack.call
Push main:fft:*temp_complex
Push @1
Load gp0 main.int_POP
Goto Programstack.call
Push main:fft:*temp_complex
Push main:fft:*t
Load gp0 Complex.exp
Goto Programstack.call
Push main:fft:out
Push main:fft:k
Push main:fft:step
Load gp0 Forth.ADD
Goto Programstack.call
Load gp0 main.int_PUSH
Goto Programstack.call
Push main:fft:*t
Push main:fft:*t
Load gp0 Complex.Multiply
Goto Programstack.call
Push main:fft:out
Push main:fft:k
Push main:fft:step
Load gp0 Forth.ADD
Goto Programstack.call
Load gp0 main.complex_PUSH
Goto Programstack.call
Push main:fft:*t
Push main:fft:buf
Push main:fft:k
Push @2
Load gp0 Forth.DIV
Goto Programstack.call
Push main:fft:step
Load gp0 Forth.ADD
Goto Programstack.call
Load gp0 main.complex_PUSH
Goto Programstack.call
Load gp0 Complex.Add
Goto Programstack.call
Push main:fft:out
Push main:fft:k
Push main:fft:step
Load gp0 Forth.ADD
Goto Programstack.call
Load gp0 main.complex_PUSH
Goto Programstack.call
Push main:fft:*t
Push main:fft:buf
Push main:fft:n
Load gp0 Forth.ADD
Goto Programstack.call
Push @2
Load gp0 Forth.DIV
Goto Programstack.call
Push main:fft:k
Push main:fft:step
Load gp0 Forth.ADD
Goto Programstack.call
Load gp0 main.complex_PUSH
Goto Programstack.call
Load gp0 Complex.Subtract
Goto Programstack.call
Push main:fft:k
Push main:fft:step
Push @2
Load gp0 Forth.MUL
Goto Programstack.call
Load gp0 Forth.ADD
Goto Programstack.call
Push main:fft:*k
Load gp0 Forth.Pop
Goto Programstack.call
Push main:fft:k
Push main:fft:n
Load gp0 Forth.Less
Goto Programstack.call
Load PC FORTH.while0
}
}
Return





#<FORTH COMPILER: Assembly generated for word: main.int_PUSH
Push @4 %main.int_PUSH
Load gp0 Forth.MUL
Goto Programstack.call
Load gp0 Forth.ADD
Goto Programstack.call
Load gp0 Forth.Push
Goto Programstack.call
Return





#<FORTH COMPILER: Assembly generated for word: main.main
Push main:main:*test %main.main
Push main:main:*result
Load gp0 Complex.exp
Goto Programstack.call
Push main:main:*result
Load gp0 Complex.display
Goto Programstack.call
Push main:main:*test_buf
Push main:main:*test_out
Push @4
Push @1
Load gp0 main.fft
Goto Programstack.call
Push main:main:*test_out
Push @4
Load gp0 main.print_complex_array
Goto Programstack.call
Return





#<FORTH COMPILER: Assembly generated for word: main.floatify
Push @151 %main.floatify
Push main:floatify:*exponent
Load gp0 Forth.Pop
Goto Programstack.call
Load gp0 Forth.dup
Goto Programstack.call
Push @0
Load gp0 Forth.Equal
Goto Programstack.call
Pop gp0
if gp0 then {
Return
}
else {
Load gp0 Forth.dup
Goto Programstack.call
Push @8388608
Load gp0 Forth.Less
Goto Programstack.call
Pop gp0 %FORTH.while1
if gp0 then {
Push @1
Load gp0 Forth.SHL
Goto Programstack.call
Push main:floatify:exponent
Push @1
Load gp0 Forth.SUB
Goto Programstack.call
Push main:floatify:*exponent
Load gp0 Forth.Pop
Goto Programstack.call
Load gp0 Forth.dup
Goto Programstack.call
Push @8388608
Load gp0 Forth.Less
Goto Programstack.call
Load PC FORTH.while1
}
Load gp0 Forth.dup
Goto Programstack.call
Push @16777216
Load gp0 Forth.Greater_or_Equal
Goto Programstack.call
Pop gp0 %FORTH.while2
if gp0 then {
Push @1
Load gp0 Forth.SHR
Goto Programstack.call
Push main:floatify:exponent
Push @1
Load gp0 Forth.ADD
Goto Programstack.call
Push main:floatify:*exponent
Load gp0 Forth.Pop
Goto Programstack.call
Load gp0 Forth.dup
Goto Programstack.call
Push @16777216
Load gp0 Forth.Greater_or_Equal
Goto Programstack.call
Load PC FORTH.while2
}
Push @8388607
Load gp0 Forth.AND
Goto Programstack.call
Push @8
Load gp0 Forth.SHL
Goto Programstack.call
Push main:floatify:exponent
Load gp0 Forth.OR
Goto Programstack.call
Return
}
Return





#<FORTH COMPILER: Assembly generated for word: main.print_complex_array
Push main:print_complex_array:*size %main.print_complex_array
Load gp0 Forth.Pop
Goto Programstack.call
Push main:print_complex_array:*Array
Load gp0 Forth.Pop
Goto Programstack.call
Push @0
Push main:print_complex_array:*n
Load gp0 Forth.Pop
Goto Programstack.call
Push main:print_complex_array:n
Push main:print_complex_array:size
Load gp0 Forth.Less
Goto Programstack.call
Pop gp0 %FORTH.while3
if gp0 then {
Push main:print_complex_array:Array
Push main:print_complex_array:n
Load gp0 main.complex_PUSH
Goto Programstack.call
Load gp0 Complex.display
Goto Programstack.call
Push main:print_complex_array:n
Push @1
Load gp0 Forth.ADD
Goto Programstack.call
Push main:print_complex_array:*n
Load gp0 Forth.Pop
Goto Programstack.call
Push main:print_complex_array:n
Push main:print_complex_array:size
Load gp0 Forth.Less
Goto Programstack.call
Load PC FORTH.while3
}
Return





#<FORTH COMPILER: Assembly generated for word: main.complex_PUSH
Push @8 %main.complex_PUSH
Load gp0 Forth.MUL
Goto Programstack.call
Load gp0 Forth.ADD
Goto Programstack.call
Return




