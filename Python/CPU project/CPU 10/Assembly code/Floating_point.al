#Implementation of floating point operations in assembly

#my standard for Floats is as such
#sMMMMMMMMMMMMMMMMMMMMMMMeeeeeeee
#1 bit of sign, 8 bits of exponent 23 bits of mantissa
#the mantissa is 1.MMMMMMMMMMMMMMMMMMMMMMM where M is one of 23 bits of mantissa stored

Struct Float sign exponent fraction
	char sign sign
	char exponent exponent
	int fraction fraction
end Struct






Push @22413454
Push @1375731846

Call Divide


Pop gp0
Outd gp0
Halt






Scope float_to_Dword

#takes a float object and converts it into a dword representing that float
#. . . float_pointer ==> . . . Dword

		def floatpointer gp0
		def sign gp1
		def exponent gp2
		def fraction gp3




						Pop floatpointer		%float_to_Dword

						LoadByte sign 0 [floatpointer]
						LoadByte exponent 1 [floatpointer]
						Load fraction 2 [floatpointer]





							Outd sign
							Out @32
							Outd exponent
							Out @32
							Outd fraction
							Out @10




						AND fraction @8388607 						#gets bottom 23bits of fraction
						SHL fraction @8
						ADD exponent fraction                       # 0eeeeee efffffff ffffffff ffffffff 

						if sign then ADD exponent  @2147483648      #2**31, so adds in sign bit

						Push exponent
						Return

Scope Dword_to_float
	
#takes a pointer to an empty float object and converts a dword to become that float
#. .  . floatpointer Dword ==> . . . floatpointer

		def floatpointer gp0
		def sign gp1
		def exponent gp2
		def fraction gp3
		def Dword gp4
		

		Pop Dword %Dword_to_float
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
#_________________________________Normalisation for addition and subtraction _________________________________
# . . . float ==> . . . normalised float


Scope normalise

def float gp0 
def fraction gp1  
def exponent gp2 

#extract float_parts
Pop float %normalise
Load fraction 2 [float]
LoadByte exponent 1 [float]

Load Flags_reset @4294967287  			#resets the borrow flag


#reduces fraction if too big
Compare fraction @16777216    			%normalise_stage_1
if Less then Load PC normalise_stage_2
	SHR fraction One
	ADD exponent One
	Load PC normalise_stage_1


#checks if exponent is too large
Compare exponent @255         			%normalise_stage_2
if Greater then Load PC normalise_return_infinity



#boosts fraction if too small
Compare fraction @8388607   			%normalise_stage_3            #8388607 is 2**23 -1
if Greater then Load PC normalise_stage_4
	SHL fraction One
	ADD exponent One
	if Borrow then Load PC normalise_return_zero
	Load PC normalise_stage_3



Store fraction 2 [float]			%normalise_stage_4
StoreByte exponent 1 [float]
Push float
Return

Load exponent @255 %normalise_return_infinity
Load fraction 16777215   #biggest possible value of the fraction
Load PC normalise_stage_4

Move Zero exponent  %normalise_return_zero                   
Load fraction @8388608  #smallest value of the fraction
Load PC normalise_stage_4


#_________________________________ ADD _________________________________

Scope ADD

#variables needed:
def float1 gp1
def float2 gp2
def result_pointer gp3

Float ADD.result 0 0 0 
Float ADD.float1 0 0 0 
Float ADD.float2 0 0 0

	Pop float2 %Add
	Pop float1

	Push ADD.float1
	Push float1
	Push ADD.float2
	Push float2

	Call Dword_to_float
	Call Dword_to_float

	Load float1 ADD.float1
	Load float2 ADD.float2
	Load result_pointer ADD.result



	#assume  float1 has largest exponent

	LoadByte gp4 1 [float1]
	LoadByte gp5 1 [float2]
	Compare gp4 gp5
	if Less then Goto ADD.swap_floats

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
	if Equal then  Load PC ADD.Equal_signs
		Load Flags_reset  @4294967287  			#resets the borrow flag
		SUB gp4 gp5
		if Borrow then Load PC ADD.negative_fraction
		#else
		Load PC ADD.return








	Store gp4 2 [result_pointer]   %ADD.return
	StoreByte gp6 0 [result_pointer]
	Push result_pointer
	Call normalise
	Call float_to_Dword
	Return




	Move One gp7					  %ADD.negative_fraction                 #invert sign
	SUB gp7 gp6
	Move gp7 gp6 

	Move Zero gp5 #invert fraction
	SUB gp5 gp4
	Move gp5 gp4
	Load PC ADD.return 

	ADD gp4 gp5						 %ADD.Equal_signs
	Load PC ADD.return




	Move float1 gp6             %ADD.swap_floats   #swap float pointers
	Move float2 float1
	Move gp6 float2

	Move gp4 gp6                                   #swap exponents
	Move gp5 gp4
	Move gp6 gp5

	Move Jump PC




#_________________________________ Subtract _________________________________

Scope Subtract

#variables needed:
def float1 gp1
def float2 gp2
def result_pointer gp3

Float SUB.result 0 0 0 
Float SUB.float1 0 0 0 
Float SUB.float2 0 0 0

	Pop float2 %Subtract
	Pop float1

	Push SUB.float1
	Push float1
	Push SUB.float2
	Push float2

	Call Dword_to_float
	Call Dword_to_float

	Load float1 SUB.float1
	Load float2 SUB.float2
	Load result_pointer SUB.result

#	invert sign of float2
	Move One gp4
	LoadByte gp5 0 [float2]
	SUB gp4 gp5
	StoreByte gp4 0 [float2]

	#assume  float1 has largest exponent

	LoadByte gp4 1 [float1]
	LoadByte gp5 1 [float2]
	Compare gp4 gp5
	if Less then Goto SUB.swap_floats

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
	if Equal then  Load PC SUB.Equal_signs
		Load Flags_reset  @4294967287  			#resets the borrow flag
		SUB gp4 gp5
		if Borrow then Load PC SUB.negative_fraction
		#else
		Load PC SUB.return








	Store gp4 2 [result_pointer]   %SUB.return
	StoreByte gp6 0 [result_pointer]
	Push result_pointer
	Call normalise
	Call float_to_Dword
	Return




	Move One gp7					  %SUB.negative_fraction                 #invert sign
	SUB gp7 gp6
	Move gp7 gp6 

	Move Zero gp5 #invert fraction
	SUB gp5 gp4
	Move gp5 gp4
	Load PC SUB.return 

	ADD gp4 gp5						 %SUB.Equal_signs
	Load PC SUB.return




	Move float1 gp6             %SUB.swap_floats   #swap float pointers
	Move float2 float1
	Move gp6 float2

	Move gp4 gp6                                   #swap exponents
	Move gp5 gp4
	Move gp6 gp5

	Move Jump PC
















#_________________________________ MULTIPLICATION _________________________________
Scope Multiply
#variables needed:
def float1 gp1
def float2 gp2
def result_pointer gp3

Float Multiply.result 0 0 0 
Float Multiply.float1 0 0 0 
Float Multiply.float2 0 0 0

	#get pointers to the floats

	Pop float1 %Multiply
	Pop float2

	Push Multiply.float1
	Push float1
	Push Multiply.float2
	Push float2

	Call Dword_to_float
	Call Dword_to_float




	Load float1 Multiply.float1
	Load float2 Multiply.float2
	Load result_pointer Multiply.result



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
	if Greater then Goto Multiply.normalise
	#check for overflows

	Compare gp4 @255
	if Borrow then Load PC Multiply.return_zero
	if Greater then Load PC Multiply.return_infinity	


	Store gp6 2 [result_pointer]     %Multiply.return
	StoreByte gp4 1 [result_pointer] 



	Push result_pointer
	Call float_to_Dword

	Return

	


	#normalisation subroutines

	SHR gp6 One %Multiply.normalise
	ADD gp4 One
	Move Jump PC

	Move Zero gp4 %Multiply.return_zero
	Load gp6 @8388608
	Load PC Multiply.return

	Load gp6 @16777215 %Multiply.return_infinity
	Load gp4 @255
	Load PC Multiply.return



#_________________________________ division _________________________________

Scope Divide
#variables needed:
def float1 gp1
def float2 gp2
def result_pointer gp3

Float Divide.result 0 0 0 
Float Divide.float1 0 0 0 
Float Divide.float2 0 0 0

	#get pointers to the floats

	Pop float2 %Divide
	Pop float1

	Push Divide.float1
	Push float1
	Push Divide.float2
	Push float2

	Call Dword_to_float
	Call Dword_to_float




	Load float1 Divide.float1
	Load float2 Divide.float2
	Load result_pointer Divide.result



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

	Compare gp4 @255
	if Borrow then Load PC Divide.return_zero
	if Greater then Load PC Divide.return_infinity	


	Store gp6 2 [result_pointer]     %Divide.return
	StoreByte gp4 1 [result_pointer] 



	Push result_pointer
	Call float_to_Dword

	Return

	


	#normalisation subroutines

	SHR gp6 One %Divide.normalise
	ADD gp4 One
	Move Jump PC

	Move Zero gp4 %Divide.return_zero
	Load gp6 @8388608
	Load PC Divide.return

	Load gp6 @16777215 %Divide.return_infinity
	Load gp4 @255
	Load PC Divide.return
