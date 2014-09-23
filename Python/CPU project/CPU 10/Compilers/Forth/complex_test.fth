using std.hlib
using math.hlib
using debug.hlib

array test 2 [0f,0.7853981634f]
array test2 2 [1f,2f]
array result 2 [0f,0f]

array test_buf 8 [1f,0, 0,0, 0,0, 0,0] #8 ints to store 4 complexes
array test_out 8 [0,0,  0,0, 0,0, 0,0]

#*test  *result cexp
#*result .complex

*test_buf *test_out 4 1 fft
WAIT
*test_out 4 print_complex_array 



: fft     	#buf,out,n,step ==> none
	int step   0     *step POP
	int n      0     *n    POP
	int out    0     *out  POP  #out and buf are pointers to the first value in an array
	int buf    0     *buf  POP

	int k 0
	array temp_complex 2 [0,0]
	array t 2 [0,0]

	step n < if
"\ngenerating fft(odd) fft(even) n = " ECHO n .
"  step = " ECHO step .
		buf out n step

		out buf n step 2 * fft
		out step + buf step + n step 2 * fft

"\n generated ff(odd) and fft(even)\n " ECHO
		*step POP  *n POP  *out POP   *buf POP     #refresh variables
	   

		0 *k POP
		k n < while
		"Looping\n" ECHO
		   0 *temp_complex POP -3.14159f k floatify  n floatify f/ f* *temp_complex 1 int_POP #temp_complex = 0 - 2         
		   *temp_complex *t cexp
		   out k step + int_PUSH
		   *t *t c*
		   out k step + complex_PUSH *t buf k 2 / step + complex_PUSH  c+
		   out k step + complex_PUSH *t buf n + 2 / k step + complex_PUSH  c-


		k step 2 * + *k POP
		k n < loop
	endif 

;  

: int_PUSH 4 * + PUSH ;
: int_POP  4 * + POP ;
: complex_PUSH 8 * + ; #puts the address of a complex number from an array onto the stack

: floatify
int exponent 0
151 *exponent POP #151 takes into account the 23 bits of fraction as an integer
DUP 0 = if 
		return
	else
		DUP 8388608 < while #need to shift up
		 	1 << exponent 1 - *exponent POP
		DUP 8388608 < loop
		DUP 16777216  >= while #need to shift down
		  1 >> exponent 1 + *exponent POP
		DUP 16777216  >= loop
		8388607 & 8 << exponent | #filters the unique 23 bits of fraction and adds the exponent
		return

	endif
;

: print_complex_array   #length, array ==> prints array
	int size 0 *size POP
	int Array 0 *Array POP


	int n 0 0 *n POP

	"Printing array\n" ECHO
	n size < while
		#"Looping 2\n" ECHO
		Array n complex_PUSH .complex
	n 1 + *n POP
	n size < loop

;