#Implementation of floating point operations in assembly

#my standard for Floats is as such
#sMMMMMMMMMMMMMMMMMMMMMMMeeeeeeee
#1 bit of sign, 8 bits of exponent 23 bits of mantissa
#the mantissa is 1.MMMMMMMMMMMMMMMMMMMMMMM where M is one of 23 bits of mantissa stored
#the exponent is excess-128
#if the sign is 1, then the number is negative

Struct Float sign exponent fraction
	char sign sign
	char exponent exponent
	int fraction fraction
end Struct

#_________________________________ FLoat to Dword _________________________________
Scope FP.float_to_Dword

#takes a float object and converts it into a dword representing that float
#. . . float_pointer ==> . . . Dword

		def floatpointer gp0
		def sign gp1
		def exponent gp2
		def fraction gp3




						Pop floatpointer		%FP.float_to_Dword

						LoadByte sign 0 [floatpointer]
						LoadByte exponent 1 [floatpointer]
						Load fraction 2 [floatpointer]





						AND fraction @8388607 						#gets bottom 23bits of fraction
						SHL fraction @8
						ADD exponent fraction                       # 0eeeeee efffffff ffffffff ffffffff 

						if sign then ADD exponent  @2147483648      #2**31, so adds in sign bit

						Push exponent
						Return

#_________________________________ Dword to float _________________________________

Scope FP.Dword_to_float
	
#takes a pointer to an empty float object and converts a dword to become that float
#. .  . floatpointer Dword ==> . . . floatpointer

		def floatpointer gp0
		def sign gp1
		def exponent gp2
		def fraction gp3
		def Dword gp4
		

		Pop Dword %FP.Dword_to_float
		Pop floatpointer
		
		Load exponent @255     #00000000 00000000 00000000 11111111
		AND exponent Dword    #extracts bottom 8 bits
		

		
		SHR Dword @8         #shifts down
		Load fraction @8388607    # 00000000 01111111 11111111 11111111
		AND fraction Dword    #extracts next 23 bits 
		OR fraction @8388608
		
		SHR Dword @23          #removes 8 bits
		Move Zero sign        #resets sign 
		if Dword then Move One sign  #adds sign if needed 


		StoreByte sign 0 [floatpointer]
		StoreByte exponent 1 [floatpointer]
		Store fraction 2 [floatpointer]

		Return

#_________________________________ display float _________________________________
Scope Display

		def sign gp1
		def exponent gp2
		def fraction gp3
		def Dword gp4
		

		Pop Dword %FP.display

		
		Load exponent @255     #00000000 00000000 00000000 11111111
		AND exponent Dword    #extracts bottom 8 bits
		

		
		SHR Dword @8         #shifts down
		Load fraction @8388607    # 00000000 01111111 11111111 11111111
		AND fraction Dword    #extracts next 23 bits 
		OR fraction @8388608
		
		SHR Dword @23          #removes 8 bits
		Move Zero sign        #resets sign 
		if Dword then Move One sign  #adds sign if needed 

			#print out data
							Outd sign
							Out @32
							Outd exponent
							Out @32
							Outd fraction
							Out @10
		Return

#_________________________________Normalisation for addition and subtraction _________________________________
# . . . float ==> . . . normalised float


Scope normalise

def float gp0 
def fraction gp1  
def exponent gp2 

#extract float_parts
Pop float %FP.normalise
Load fraction 2 [float]
LoadByte exponent 1 [float]

Load Flags_reset @4294967287  			#resets the borrow flag


#reduces fraction if too big
Compare fraction @16777216    			%FP.normalise_stage_1
if Less then Load PC FP.normalise_stage_2
	SHR fraction One
	ADD exponent One
	Load PC FP.normalise_stage_1


#checks if exponent is too large
Compare exponent @255         			%FP.normalise_stage_2
if Greater then Load PC normalise_return_infinity



#boosts fraction if too small
Compare fraction @8388607   			%FP.normalise_stage_3            #8388607 is 2**23 -1
if Greater then Load PC FP.normalise_stage_4
	SHL fraction One
	SUB exponent One
	if Borrow then Load PC normalise_return_zero
	Load PC FP.normalise_stage_3



Store fraction 2 [float]			%FP.normalise_stage_4
StoreByte exponent 1 [float]
Push float
Return

Load exponent @255 %normalise_return_infinity
Load fraction 16777215   #biggest possible value of the fraction
Load PC FP.normalise_stage_4

Move Zero exponent  %normalise_return_zero                   
Load fraction @8388608  #smallest value of the fraction
Load PC FP.normalise_stage_4


#_________________________________ ADD _________________________________

Scope ADD

#variables needed:
def float1 gp1
def float2 gp2
def result_pointer gp3

Float FP.ADD.result 0 0 0 
Float FP.ADD.float1 0 0 0 
Float FP.ADD.float2 0 0 0

	Pop float2 %FP.Add
	Pop float1

	Push FP.ADD.float1
	Push float1
	Push FP.ADD.float2
	Push float2

	Call FP.Dword_to_float
	Call FP.Dword_to_float

	Load float1 FP.ADD.float1
	Load float2 FP.ADD.float2
	Load result_pointer FP.ADD.result



	#assume  float1 has largest exponent

	LoadByte gp4 1 [float1]
	LoadByte gp5 1 [float2]
	Compare gp4 gp5
	if Less then Goto FP.ADD.swap_floats

	StoreByte gp4 1 [result_pointer]   #the exponent of the rewsult is the same a that of float1
	SUB gp4 gp5                        #exponent_difference ==> gp4
	Load gp5 2 [float1]                #fetch fractions
	Load gp6 2 [float2]     

	SHR gp6 gp4                        #scale float2.fraction by the difference in exponents

	Move gp5 gp4 					   #free up gp6
	Move gp6 gp5 

	LoadByte gp6 0 [float1]            #fetch signs
	LoadByte gp7 0 [float2]
	Compare gp6 gp7
	if Equal then  Load PC FP.ADD.Equal_signs
		Load Flags_reset  @4294967287  			#resets the borrow flag
		SUB gp4 gp5
		if Borrow then Load PC FP.ADD.negative_fraction
		#else
		Load PC FP.ADD.return








	Store gp4 2 [result_pointer]   %FP.ADD.return
	StoreByte gp6 0 [result_pointer]
	Push result_pointer

	Call FP.normalise
	Call FP.float_to_Dword
	Return




	Move One gp7					  %FP.ADD.negative_fraction                 #invert sign
	SUB gp7 gp6
	Move gp7 gp6 

	Move Zero gp5 #invert fraction
	SUB gp5 gp4
	Move gp5 gp4
	Load PC FP.ADD.return 

	ADD gp4 gp5						 %FP.ADD.Equal_signs
	Load PC FP.ADD.return




	Move float1 gp6             %FP.ADD.swap_floats   #swap float pointers
	Move float2 float1
	Move gp6 float2

	Move gp4 gp6                                   #swap exponents
	Move gp5 gp4
	Move gp6 gp5

	Move Jump PC




#_________________________________ FP.Subtract _________________________________

Scope FP.Subtract

#variables needed:
def float1 gp1
def float2 gp2
def result_pointer gp3

Float FP.SUB.result 0 0 0 
Float FP.SUB.float1 0 0 0 
Float FP.SUB.float2 0 0 0

	Pop float2 %FP.Subtract
	Pop float1


	Push FP.SUB.float1
	Push float1
	Push FP.SUB.float2
	Push float2


	Call FP.Dword_to_float
	Call FP.Dword_to_float


	Load float1 FP.SUB.float1
	Load float2 FP.SUB.float2
	Load result_pointer FP.SUB.result


#	invert sign of float2
	Move One gp4
	LoadByte gp5 0 [float2]
	SUB gp4 gp5
	StoreByte gp4 0 [float2]


	#assume  float1 has largest exponent

	LoadByte gp4 1 [float1]
	LoadByte gp5 1 [float2]
	Compare gp4 gp5
	if Less then Goto FP.SUB.swap_floats


	StoreByte gp4 1 [result_pointer]   #the exponent of the rewsult is the same a that of float1
	SUB gp4 gp5                        #exponent_difference ==> gp4
	Load gp5 2 [float1]                #fetch fractions
	Load gp6 2 [float2]     



	SHR gp6 gp4                        #scale float2.fraction by the difference in exponents

	Move gp5 gp4 					   #free up gp6
	Move gp6 gp5 

	LoadByte gp6 0 [float1]            #fetch signs
	LoadByte gp7 0 [float2]




	Compare gp6 gp7
	if Equal then  Load PC FP.SUB.Equal_signs
		Load Flags_reset  @4294967287  			#resets the borrow flag
		SUB gp4 gp5
		if Borrow then Load PC FP.SUB.negative_fraction
		#else
		Load PC FP.SUB.return








	Store gp4 2 [result_pointer]   %FP.SUB.return
	StoreByte gp6 0 [result_pointer]
	Push result_pointer
	Call FP.normalise
	Call FP.float_to_Dword
	Return



	Move One gp7					  %FP.SUB.negative_fraction                 #invert sign
	SUB gp7 gp6
	Move gp7 gp6 

	Move Zero gp5 #invert fraction
	SUB gp5 gp4
	Move gp5 gp4
	Load PC FP.SUB.return 

	ADD gp4 gp5						 %FP.SUB.Equal_signs
	Load PC FP.SUB.return




	Move float1 gp6             %FP.SUB.swap_floats   #swap float pointers
	Move float2 float1
	Move gp6 float2

	Move gp4 gp6                                   #swap exponents
	Move gp5 gp4
	Move gp6 gp5

	Move Jump PC
















#_________________________________ MULTIPLICATION _________________________________
Scope FP.Multiply
#variables needed:
def float1 gp1
def float2 gp2
def result_pointer gp3

Float FP.Multiply.result 0 0 0 
Float FP.Multiply.float1 0 0 0 
Float FP.Multiply.float2 0 0 0

	#get pointers to the floats

	Pop float1 %FP.Multiply
	Pop float2

	Push FP.Multiply.float1
	Push float1
	Push FP.Multiply.float2
	Push float2

	Call FP.Dword_to_float
	Call FP.Dword_to_float




	Load float1 FP.Multiply.float1
	Load float2 FP.Multiply.float2
	Load result_pointer FP.Multiply.result



    #result_sign = float1.sign ^ float2.sign
	LoadByte gp4 0 [float1]
	LoadByte gp5 0 [float2]
	XOR gp4 gp5
	StoreByte gp4 0 [result_pointer]

	#result.mantissa = (float1.mantissa * float2.mantissa)>>23
	Load gp4 2 [float1]
	Load gp5 2 [float2]
	MUL gp4 gp5

    #perfoming >> across 2 dwords
	SHR gp4 @23
	SHL Accumulator @9
	OR gp4 Accumulator
	Move gp4 gp6   #create a copy of the mantiss

	#result.exponent = float1.exponent + float2.exponent -128
	Load Flags_reset @4294967287  #resets the borrow flag
	LoadByte gp4 1 [float1]
	LoadByte gp5 1 [float2]

	ADD gp4 gp5
	SUB gp4 @128


	Compare gp6 @16777215
	if Greater then Goto FP.Multiply.normalise
	#check for overflows

	Compare gp4 @255
	if Borrow then Load PC FP.Multiply.return_zero
	if Greater then Load PC FP.Multiply.return_infinity	


	Store gp6 2 [result_pointer]     %FP.Multiply.return
	StoreByte gp4 1 [result_pointer] 



	Push result_pointer
	Call FP.float_to_Dword

	Return

	


	#normalisation subroutines

	SHR gp6 One %FP.Multiply.normalise
	ADD gp4 One
	Move Jump PC

	Move Zero gp4 %FP.Multiply.return_zero
	Load gp6 @8388608
	Load PC FP.Multiply.return

	Load gp6 @16777215 %FP.Multiply.return_infinity
	Load gp4 @255
	Load PC FP.Multiply.return



#_________________________________ division _________________________________

Scope FP.Divide
#variables needed:
def float1 gp1
def float2 gp2
def result_pointer gp3

Float FP.Divide.result 0 0 0 
Float FP.Divide.float1 0 0 0 
Float FP.Divide.float2 0 0 0

	#get pointers to the floats

	Pop float2 %FP.Divide
	Pop float1

	Push FP.Divide.float1
	Push float1
	Push FP.Divide.float2
	Push float2

	Call FP.Dword_to_float
	Call FP.Dword_to_float




	Load float1 FP.Divide.float1
	Load float2 FP.Divide.float2
	Load result_pointer FP.Divide.result



    #result_sign = float1.sign ^ float2.sign
	LoadByte gp4 0 [float1]
	LoadByte gp5 0 [float2]
	XOR gp4 gp5
	StoreByte gp4 0 [result_pointer]

	#fraction = float1.fraction<<23 /float2.fraction
	#cannot do in 32 bits so done in multiple steps

	Load gp4 2 [float1]
	Load gp5 2 [float2]

	def remainder gp4
	def sum gp0
	def float2_fraction gp5
	def temp gp6


	#mantissa_result = (((float1.mantissa<<8)/float2.mantissa)<<15)

	SHL remainder @8
	Move remainder sum
	DIV sum float2_fraction
	SHL sum @15

	#remainder = (((float1.mantissa<<8)%float2.mantissa)<<8)
	MOD remainder float2_fraction
	SHL remainder @8

	#	mantissa_result += (remainder/float2.mantissa)<<7
	Move remainder temp
	DIV temp float2_fraction
	SHL temp @7
	ADD sum temp

	#	remainder = (remainder %float2.mantissa)<<7
	MOD remainder float2_fraction
	SHL remainder @7

	#	mantissa_result += remainder/float2.mantissa
	DIV remainder float2_fraction
	ADD sum remainder

	Move sum gp6   #store into gp6


	#now calculating new exponent
	Load Flags_reset  @4294967287

	LoadByte gp4 1 [float1]
	LoadByte gp5 1 [float2]

	ADD gp4 @128
	SUB gp4 gp5

	Compare gp6 @8388608
	if Less then Goto FP.Divide.normalise

	Compare gp4 @255
	if Borrow then Load PC FP.Divide.return_zero
	if Greater then Load PC FP.Divide.return_infinity	


	Store gp6 2 [result_pointer]     %FP.Divide.return
	StoreByte gp4 1 [result_pointer] 



	Push result_pointer
	Call FP.float_to_Dword

	Return

	


	#normalisation subroutines

	SHL gp6 One %FP.Divide.normalise
	SUB gp4 One
	Move Jump PC

	Move Zero gp4 %FP.Divide.return_zero
	Load gp6 @8388608
	Load PC FP.Divide.return

	Load gp6 @16777215 %FP.Divide.return_infinity
	Load gp4 @255
	Load PC FP.Divide.return

#_________________________________ compare _________________________________
#compares a pair of floats


#



#______________ Square_root ______________

#guess = 2
#for i in xrange(10):
#	guess2 = x/guess
#	guess = guess + guess2
#	guess = guess/2


#[forth pseudocode] guess {dup x / + 2 / } while counter > 0

def x gp0

int FP.sqrt.guess
int FP.sqrt.counter
int FP.sqrt.x

			Pop x	%FP.sqrt
			Load gp1 @10
			Load gp2 @129    #guess is equal to 2
			Store gp1 FP.sqrt.counter
			Store x FP.sqrt.x
			Push gp2    #pushes the guess on

				
				Call stack.dup %FP.sqrt.loop


				
				Push FP.sqrt.x	
				Call stack.swap

				Call FP.Divide

				Call FP.Add
				Push @129   #float representation of 2
				Call FP.Divide

				Load gp1 FP.sqrt.counter
				SUB gp1 One
				Store gp1 FP.sqrt.counter
				if gp1 then Load PC FP.sqrt.loop

			Return

#______________ sin x ______________
#using mclaurin exansion          initial values
int FP.sin.x                      #= x
int FP.sin.denominator            #= 1
int FP.sin.numerator              #= x
int FP.sin.i                      #= 1
int FP.sin.total                  #= x
int FP.sin.x_squared              #= x**2
int FP.sin.sign                   #= 1

	Pop gp0  %FP.sin
	#initialise values
	Store gp0 FP.sin.total
	Store gp0 FP.sin.numerator

	Load gp1 @128                      #float of one
	Store gp1 FP.sin.denominator
	Store gp1 FP.sin.sign
	Store gp1 FP.sin.i
	
	Push gp0 
	Push gp0 
	#Call stack.print
	Call FP.Multiply
	Pop FP.sin.x_squared




		#calculate denominator (denominator *= (2*i)*(2*i+1))
		Push FP.sin.i %FP.sin.loop
		Push @129              #push 2
		Call FP.Multiply
		Call stack.dup

		Push @128 				#push 1
		Call  FP.Add
		Call FP.Multiply
		Push FP.sin.denominator
		Call FP.Multiply

		Pop FP.sin.denominator

		#calculate numerator (numerator *= x**2)

		Push FP.sin.numerator
		Push FP.sin.x_squared
		Call FP.Multiply
		#Call stack.print
		Pop FP.sin.numerator

		#calculate sign of term
		Load gp0 FP.sin.sign
		XOR gp0 @2147483648
		Store gp0 FP.sin.sign

		#Add term
		Push FP.sin.total
		Push FP.sin.sign
		Push FP.sin.numerator
		Push FP.sin.denominator

		Call FP.Divide
		Call FP.Multiply
		Call FP.Add
		Pop FP.sin.total

		Push FP.sin.i
		Push @128
		Call FP.Add
		Pop gp0
		Store gp0 FP.sin.i
		Compare gp0 @536871043   #fp of 10
		if Equal then Load PC FP.sin.return
		#else:
		Load PC FP.sin.loop

		Push FP.sin.total %FP.sin.return
		Return










#______________ cos x ______________
#using mclaurin exansion          initial values
int FP.cos.x                      #= x
int FP.cos.denominator            #= 1
int FP.cos.numerator              #= 1
int FP.cos.i                      #= 1
int FP.cos.total                  #= 1
int FP.cos.x_squared              #= x**2
int FP.cos.sign                   #= 1

	Pop gp0  %FP.cos
	#initialise values


	Load gp1 @128                      #float of one
	Store gp1 FP.cos.denominator
	Store gp1 FP.cos.sign
	Store gp1 FP.cos.i
	Store gp1 FP.cos.total
	Store gp1 FP.cos.numerator
	
	Push gp0 
	Push gp0 
	#Call stack.print
	Call FP.Multiply
	Pop FP.cos.x_squared




		#calculate denominator (denominator *= (2*i)*(2*i-1))
		Push FP.cos.i %FP.cos.loop
		Push @129              #push 2
		Call FP.Multiply
		Call stack.dup

		Push @128 				#push 1
		Call  FP.Subtract
		Call FP.Multiply
		Push FP.cos.denominator
		Call FP.Multiply

		Pop FP.cos.denominator

		#calculate numerator (numerator *= x**2)

		Push FP.cos.numerator
		Push FP.cos.x_squared
		Call FP.Multiply
		#Call stack.print
		Pop FP.cos.numerator

		#calculate sign of term
		Load gp0 FP.cos.sign
		XOR gp0 @2147483648
		Store gp0 FP.cos.sign

		#Add term
		Push FP.cos.total
		Push FP.cos.sign
		Push FP.cos.numerator
		Push FP.cos.denominator

		Call FP.Divide
		Call FP.Multiply
		Call FP.Add
		Pop FP.cos.total

		Push FP.cos.i
		Push @128
		Call FP.Add
		Pop gp0
		Store gp0 FP.cos.i
		Compare gp0 @536871043   #fp of 10
		if Equal then Load PC FP.cos.return
		#else:
		Load PC FP.cos.loop

		Push FP.cos.total %FP.cos.return
		Return

