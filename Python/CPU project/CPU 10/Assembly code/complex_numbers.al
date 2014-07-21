import "Assembly code\\Floating_point"

Struct Complex real imaginary
	int real real
	int imaginary imaginary
end Struct



#Complex cmp_1 1073741953 2147483777
#Complex cmp_2 129 536871042 
#Complex cmp_rst 0 0 
#
#Push cmp_1
#Push cmp_2
#Push cmp_rst
#
#Call Complex.Multiply
##Push cmp_2
##Call Complex.Divide
#
#
#Push cmp_rst.real
#Call FP.display
#Push cmp_rst.imaginary
#Call FP.display
#
#
#
Push @129
Call FP.sin
Call FP.display
Halt


#______________ Add ______________
#Adds two complex numbers, leaving the result in a third one
# . . . cmp1 cmp2 cmp_result ==> . . . cmp_result

int Complex.Add.complex1_ptr 0
int Complex.Add.complex2_ptr 0
int Complex.Add.result_complex 0

def cmp1 gp1
def cmp2 gp2
def cmp_result gp3

		Pop Complex.Add.result_complex %Complex.Add
		Pop cmp2
		Pop cmp1


		Store cmp2 Complex.Add.complex2_ptr
		Store cmp1 Complex.Add.complex1_ptr



		Push 0 [cmp1]
		Push 0 [cmp2]


		Call FP.Add



		Load gp1 Complex.Add.result_complex
		Pop 0 [gp1]


		Load cmp1 Complex.Add.complex1_ptr
		Load cmp2 Complex.Add.complex2_ptr


		Push 4 [cmp1]
		Push 4 [cmp2]

		Call FP.Add



		Load gp1 Complex.Add.result_complex
		Pop 4 [gp1]



		Push Complex.Add.result_complex
		Return


#______________ Subtract ______________
#Adds two complex numbers, leaving the result in a third one
# . . . cmp1 cmp2 cmp_result ==> . . . cmp_result

int Complex.Subtract.complex1_ptr 0
int Complex.Subtract.complex2_ptr 0
int Complex.Subtract.result_complex 0

def cmp1 gp1
def cmp2 gp2
def cmp_result gp3

		Pop Complex.Subtract.result_complex %Complex.Subtract
		Pop cmp2
		Pop cmp1

		

		Store cmp2 Complex.Subtract.complex2_ptr
		Store cmp1 Complex.Subtract.complex1_ptr

		

		Push 0 [cmp1]
		Push 0 [cmp2]

		

		Call FP.Subtract

		

		Load gp1 Complex.Subtract.result_complex
		Pop 0 [gp1]

		

		Load cmp1 Complex.Subtract.complex1_ptr
		Load cmp2 Complex.Subtract.complex2_ptr

		

		Push 4 [cmp1]
		Push 4 [cmp2]

		


		Call FP.Subtract

		

		Load gp1 Complex.Subtract.result_complex
		Pop 4 [gp1]

		

		Push Complex.Subtract.result_complex
		Return



# ______________ Multiply ______________
#multiplies two complex numbers
#(a + bi)(c + di) = (ac-bd)+(ad + bc)i

int Complex.Multiply.complex1_ptr 0
int Complex.Multiply.complex2_ptr 0
int Complex.Multiply.result_complex 0

def cmp1 gp1
def cmp2 gp2
def cmp_result gp3

		Pop Complex.Multiply.result_complex %Complex.Multiply
		Pop cmp2
		Pop cmp1

		

		Store cmp2 Complex.Multiply.complex2_ptr
		Store cmp1 Complex.Multiply.complex1_ptr

		

		Push 0 [cmp1]
		Push 0 [cmp2]


		Call FP.Multiply

		Load cmp1 Complex.Multiply.complex1_ptr
		Load cmp2 Complex.Multiply.complex2_ptr


		Push 4 [cmp1]
		Push 4 [cmp2]


		Call FP.Multiply



		Call FP.Subtract

		Load cmp_result Complex.Multiply.result_complex
		Pop 0 [cmp_result]



		Load cmp1 Complex.Multiply.complex1_ptr
		Load cmp2 Complex.Multiply.complex2_ptr

		Push 0 [cmp1]
		Push 4 [cmp2]

		Call FP.Multiply

		Load cmp1 Complex.Multiply.complex1_ptr
		Load cmp2 Complex.Multiply.complex2_ptr

		Push 4 [cmp1]
		Push 0 [cmp2]

		Call FP.Multiply
		Call FP.Add

		Load cmp_result Complex.Multiply.result_complex
		Pop 4 [cmp_result]

		Push Complex.Multiply.result_complex
		Return


#_________________ Divide _________________

## . . . numerator denominator result ==> . . . result
Scope Divide

int Complex.Divide.numerator_ptr 0 
int Complex.Divide.denominator_ptr 0 
int Complex.Divide.result_ptr 0

Complex Complex.Divide.denom_conjugate 0 0 
Complex Complex.Divide.divided_numerator 0 0

int Complex.Divide.denom_modsquared 0


def numerator gp1
def denominator gp2
def result gp3

	Pop result %Complex.Divide
	Pop denominator
	Pop numerator

	Store result Complex.Divide.result_ptr
	Store denominator Complex.Divide.denominator_ptr
	Store numerator Complex.Divide.numerator_ptr

	#create modulus squared of the denominator

	Push 0 [denominator]
	Push 0 [denominator]

	Call FP.Multiply

	Load denominator Complex.Divide.denominator_ptr
	
	Push 4 [denominator]
	Push 4 [denominator]

	Call FP.Multiply
	Call FP.Add

	Pop Complex.Divide.denom_modsquared

	#create conjugate of the denominator

	Load denominator Complex.Divide.denominator_ptr
	Load gp4 4 [denominator]
	XOR gp4 @2147483648
	Load denominator Complex.Divide.denom_conjugate
	Store gp4 4 [denominator] #inverts sign bit


	#divide numerator by the modulus squared

	Load numerator Complex.Divide.numerator_ptr
	Push 0 [numerator]
	Push Complex.Divide.denom_modsquared
	Call FP.Divide

	Load numerator Complex.Divide.numerator_ptr
	Load gp4 Complex.Divide.divided_numerator
	Pop 0 [gp4]

	Push 4 [numerator]
	Push Complex.Divide.denom_modsquared
	Call FP.Divide

	Load gp4 Complex.Divide.divided_numerator
	Pop 4 [gp4]

	Push gp4
	Push Complex.Divide.denom_conjugate
	Push Complex.Divide.result_ptr

	Call Complex.Multiply
	Return


