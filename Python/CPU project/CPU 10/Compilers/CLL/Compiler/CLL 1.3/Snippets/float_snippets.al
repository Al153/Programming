<<junk>>

#Library which alows float operations in CLL


#float format: 
#sign exponent mantissa
#exponent is excess 127

<<FP standard funtions>> #included optinonally by compiler


#Expect mantissa in gp0, exp in gp2

SHR gp0 One %FP.multiply.normalise
ADD gp2 One
Move Jump PC

SHL gp0 One %FP.Divide.normalise
SUB gp2 One
Move Jump PC


Move Zero gp2 %FP.Zero
Load gp0 @8388608
Move Jump PC

Load gp0 @16777215 %FP.Infinity
Load gp2 @2139095040  #255<<23
Move Jump PC


<< Float MUL >>
<getgp0>
<getgp1>
#cant use gp6 or gp7
Load Flags_reset @4294967287 			#reset flags
Move gp0 gp2
Move gp0 gp4
Move gp1 gp3

XOR gp4 gp3							#gets sign
AND gp4 @2147483648

AND gp2 @2139095040 			#gp2 and gp3 are the respective exponents, - bit mask to expose just exponent
AND gp3 @2139095040
ADD gp2 gp3
SUB gp2 @1065353216			#removes bias

AND gp0 @8388607
AND gp1 @8388607
OR gp0 @8388608 				#adds implied bit
OR gp1 @8388608 

MUL gp0 gp1 					#multiplies mantissas
SHR gp0 @23
SHL Accumulator @9
OR gp0 Accumulator

Compare gp0 @16777215
if Greater then Goto FP.multiply.normalise 	#normalise

Compare gp2 @255
if Borrow then Goto FP.multiply.Zero
if Greater then Goto FP.multiply.Infinitys

AND gp0 @8388607
OR gp0 gp2
OR gp0 gp4
<storegp0>


<<Float DIV >>
<getgp1>
<getgp0>
#cant use gp6 or gp7
Load Flags_reset @4294967287 			#reset flags
Move gp0 gp2
Move gp0 gp4
Move gp1 gp3

XOR gp4 gp3							#gets sign
AND gp4 @2147483648

AND gp2 @2139095040 			#gp2 and gp3 are the respective exponents, - bit mask to expose just exponent
AND gp3 @2139095040

ADD gp2 @1065353216			#removes bias
SUB gp2 gp3 				

AND gp0 @8388607
AND gp1 @8388607
OR gp0 @8388608 				#adds implied bit
OR gp1 @8388608 

#first stage of division - complicated fashion since we need to calculate mantissa1<<23/mantissa2 without losing precision
#mantissa_result = (((float1.mantissa<<8)/float2.mantissa)<<15)
SHL gp0 @8 		
Move gp0 gp3 				#now also using gp3			gp3 = remainder
DIV gp0 gp1
SHL gp0 @15

#remainder = (((float1.mantissa<<8)%float2.mantissa)<<8)
MOD gp3 gp1
SHL gp3 @8

#	mantissa_result += (remainder/float2.mantissa)<<7
Move gp3 gp5
DIV gp5 gp1
SHL gp5 @7
ADD gp0 gp5

#	remainder = (remainder %float2.mantissa)<<7
MOD gp3 gp1
SHL gp3 @7

#	mantissa_result += remainder/float2.mantissa
DIV gp3 gp1
ADD gp0 gp3



Compare gp0 @8388608
if Less then Goto FP.Divide.normalise

Compare gp2 @255
if Borrow then Goto FP.multiply.Zero
if Greater then Goto FP.multiply.Infinitys

AND gp0 @8388607
OR gp0 gp2
OR gp0 gp4
<storegp0>

<< Float ADD >>
	#assume  float1 has largest exponent
<getgp1><getgp0>
Move gp0 gp2
Move gp1 gp3

	AND gp2 @2139095040 			#gp2 and gp3 are the respective exponents, - bit mask to expose just exponent
	AND gp3 @2139095040

	Compare gp2 gp3
	if Less then Goto FP.ADD.swap_floats
	Move gp2 gp4					   #
	SUB gp4 gp3                        #exponent_difference ==> gp3
	Move gp4 gp3

	Load gp4 @2147483648				#signs go to gps 4 and 5				
	Load gp5 @2147483648

	AND gp4 gp0 						#gets signs
	AND gp5 gp1

	AND gp0 @8388607
	AND gp1 @8388607
	OR gp0 @8388608 				#adds implied bit
	OR gp1 @8388608 

	SHR gp1 gp3                        #scale float2.fraction by the difference in exponents
									   #gp3 is now dead


#gp0 		f1 mantissa
#gp1 		f2 mantissa
#gp2 		result exponent
#gp3 		spare
#gp4 		f1 sign
#gp5 		f2 sign
#gp6
#gp7

	Compare gp4 gp5
	if Equal then  Load PC FP.ADD.Equal_signs
		Load Flags_reset  @4294967287  			#resets the borrow flag

############ here ##############################
		SUB gp4 gp5
		if Borrow then Load PC FP.ADD.negative_fraction
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

