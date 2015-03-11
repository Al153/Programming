<<junk>>

#Library which alows float operations in CLL


#float format: 
#sign exponent mantissa
#exponent is excess 127

<<FP standard funtions>> #included optionally by compiler

		
	
	
	#################################################### FP.MULTIPLY
		Load Flags_reset @4294967287 			%FP.MUL #reset flags
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
		if Greater then Load PC FP.MUL.normalise 	#normalise
		
		Compare gp2 @255						%FP.MUL.after_normalisation
		if Borrow then Load PC FP.MUL.Zero
		if Greater then Load PC FP.MUL.Infinity
		
		AND gp0 @8388607						%FP.MUL.return
		OR gp0 gp2
		OR gp0 gp4
		Move Jump PC

		################################ Auxiliary multiply routines ##########################################

		SHR gp0 One %FP.MUL.normalise
		ADD gp2 One
		Load PC FP.MUL.after_normalisation

		Move Zero gp2 %FP.MUL.Zero
		Load gp0 @8388608
		Load PC FP.MUL.return
		
		Load gp0 @16777215 %FP.MUL.Infinity
		Load gp2 @2139095040  #255<<23
		Load PC FP.MUL.return
	

	
	########################### FP DIV #######################################
	
	
		Load Flags_reset @4294967287 	%FP.DIV		#reset flags
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
		if Less then Load PC FP.DIV.normalise 		
		
		Compare gp2 @255 			%FP.DIV.after_normalisation
		if Borrow then Load PC FP.DIV.Zero
		if Greater then Load PC FP.DIV.infinity
		
		AND gp0 @8388607 			%FP.DIV.return
		OR gp0 gp2
		OR gp0 gp4
		Move Jump PC


		#_____________________________________ Divide auxiliary routines _____________________________________

		SHL gp0 One %FP.DIV.normalise
		SUB gp2 One
		Load PC FP.DIV.after_normalisation

		Move Zero gp2 %FP.DIV.Zero
		Load gp0 @8388608
		Load PC FP.DIV.return
		
		Load gp0 @16777215 %FP.DIV.Infinity
		Load gp2 @2139095040  #255<<23
		Load PC FP.DIV.return
	

	
	################################# ADD ###############################
	
	
		#assume  float1 has largest exponent
		Move gp0 gp2 		%FP.ADD
		Move gp1 gp3
		
		AND gp2 @2139095040 			#gp2 and gp3 are the respective exponents, - bit mask to expose just exponent
		AND gp3 @2139095040
		Compare gp2 gp3
		if Less then Load PC FP.ADD.swap_floats
		Move gp2 gp4					   %FP.ADD.swapped
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
		
		SUB gp0 gp1
		if Borrow then Load PC FP.ADD.negative_fraction
		Load PC FP.ADD.return
		
		Load Flags_reset @4294967287  		%FP.ADD.return #resets the borrow flag
		
		#reduces fraction if too big
		Compare gp0 @16777216    			%FP.ADD.normalise_stage_1
		if Less then Load PC FP.ADD.normalise_stage_2
		SHR gp0 One
		ADD gp2 @8388608
		Load PC FP.ADD.normalise_stage_1
		
		#checks if exponent is too large
		Compare gp2 @2139095040         			%FP.ADD.normalise_stage_2
		if Greater then Load PC FP.ADD.normalise_return_infinity
		
		
		
		#boosts fraction if too small
		Compare gp0 @8388607   			%FP.ADD.normalise_stage_3            #8388607 is 2**23 -1
		if Greater then Load PC FP.ADD.normalise_stage_4
		SHL gp0 One
		SUB gp2 @8388608
		if Borrow then Load PC FP.ADD.normalise_return_zero
		Load PC FP.ADD.normalise_stage_3
		
		
		
		AND gp0 8388607					%FP.ADD.normalise_stage_4
		
		OR gp0 gp2			
		OR gp0 gp4
		Move Jump PC
		
		
		Compare gp2 @2139095040  %FP.ADD.normalise_return_infinity
		Load gp0 @16777215   #biggest possible value of the fraction
		Load PC FP.ADD.normalise_stage_4
		
		Move Zero gp2 %FP.ADD.normalise_return_zero                   
		Load gp0 @8388608  #smallest value of the fraction
		Load PC FP.ADD.normalise_stage_4
		XOR gp4 @2147483648	  %FP.ADD.negative_fraction                 #invert sign
						
		Move Zero gp1 #invert fraction
		SUB gp1 gp0
		Move gp1 gp0
		Load PC FP.ADD.return 
		
		ADD gp0 gp1						 %FP.ADD.Equal_signs
		Load PC FP.ADD.return
		
		
		
		
		Move float1 gp6             %FP.ADD.swap_floats   #swap float pointers
		Move float2 float1
		Move gp6 float2
		Move gp4 gp6                                   #swap exponents
		Move gp5 gp4
		Move gp6 gp5
		Load PC FP.ADD.swapped


	################################# SUB ###############################
	
	
		#assume  float1 has largest exponent
		Move gp0 gp2 		%FP.SUB
		Move gp1 gp3
		
		AND gp2 @2139095040 			#gp2 and gp3 are the respective exponents, - bit mask to expose just exponent
		AND gp3 @2139095040
		Compare gp2 gp3
		if Less then Load PC FP.SUB.swap_floats
		Move gp2 gp4					   %FP.SUB.swapped
		SUB gp4 gp3                        #exponent_difference ==> gp3
		Move gp4 gp3
		Load gp4 @2147483648				#signs go to gps 4 and 5				
		Load gp5 @2147483648
		AND gp4 gp0 						#gets signs
		AND gp5 gp1
		XOR gp5 @2147483648					#inverts sign of float2 
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
		if Equal then  Load PC FP.SUB.Equal_signs
		Load Flags_reset  @4294967287  			#resets the borrow flag
		
		SUB gp0 gp1
		if Borrow then Load PC FP.SUB.negative_fraction
		Load PC FP.SUB.return
		
		Load Flags_reset @4294967287  		%FP.SUB.return #resets the borrow flag
		
		#reduces fraction if too big
		Compare gp0 @16777216    			%FP.SUB.normalise_stage_1
		if Less then Load PC FP.SUB.normalise_stage_2
		SHR gp0 One
		ADD gp2 @8388608
		Load PC FP.SUB.normalise_stage_1
		
		#checks if exponent is too large
		Compare gp2 @2139095040         			%FP.SUB.normalise_stage_2
		if Greater then Load PC FP.SUB.normalise_return_infinity
		
		
		
		#boosts fraction if too small
		Compare gp0 @8388607   			%FP.SUB.normalise_stage_3            #8388607 is 2**23 -1
		if Greater then Load PC FP.SUB.normalise_stage_4
		SHL gp0 One
		SUB gp2 @8388608
		if Borrow then Load PC FP.SUB.normalise_return_zero
		Load PC FP.SUB.normalise_stage_3
		
		
		
		AND gp0 8388607					%FP.SUB.normalise_stage_4
		
		OR gp0 gp2			
		OR gp0 gp4
		Move Jump PC
		
		
		Compare gp2 @2139095040  %FP.SUB.normalise_return_infinity
		Load gp0 @16777215   #biggest possible value of the fraction
		Load PC FP.SUB.normalise_stage_4
		
		Move Zero gp2 %FP.SUB.normalise_return_zero                   
		Load gp0 @8388608  #smallest value of the fraction
		Load PC FP.SUB.normalise_stage_4
		XOR gp4 @2147483648	  %FP.SUB.negative_fraction                 #invert sign
						
		Move Zero gp1 #invert fraction
		SUB gp1 gp0
		Move gp1 gp0
		Load PC FP.SUB.return 
		
		ADD gp0 gp1						 %FP.SUB.Equal_signs
		Load PC FP.SUB.return
		
		
		
		
		Move float1 gp6             %FP.SUB.swap_floats   #swap float pointers
		Move float2 float1
		Move gp6 float2
		Move gp4 gp6                                   #swap exponents
		Move gp5 gp4
		Move gp6 gp5
		Load PC FP.SUB.swapped

#______________________________________ Comparisons ______________________________________

	#just does the comparison - lets the code which calls it do the stack manipulation
	 
	Load gp4 @2147483648			%FP.Compare	#gets signs				
	Load gp5 @2147483648
	AND gp4 gp0 						#gets signs
	AND gp5 gp1
	Compare gp5 gp4
	Move Flags_set gp5					#saves flags register
	if Equal then Load PC FP.Compare.exponent
	Move gp5 Flags_set 					#reinstates flags register
	Move Jump PC


	Move gp0 gp2 		 			%FP.Compare.exponent
	Move gp1 gp3
		
	AND gp2 @2139095040 			#gp2 and gp3 are the respective exponents, - bit mask to expose just exponent
	AND gp3 @2139095040
	if gp4 then Load PC FP.Compare.Negative
	Compare gp2 gp3
	Move Flags_set gp5
	if Equal then Load PC FP.Compare.Positive.fractions
	Move gp5 Flags_set
	Move Jump PC

	Compare gp3 gp2		%FP.Compare.Negative
	Move Flags_set gp5
	if Equal then Load PC FP.Compare.Negative.fractions
	Move gp5 Flags_set
	Move Jump PC


	AND gp0 @8388607	%FP.Compare.Positive.fractions
	AND gp1 @8388607
	Compare gp0 gp1
	Move Jump PC

	AND gp0 @8388607	%FP.Compare.Negative.fractions
	AND gp1 @8388607
	Compare gp1 gp0
	Move Jump PC

#______________________________________ Casting operations ______________________________________
	in casting operations, gp0 is mantissa, gp1 the exponent, gp2 the sign
	#_______________float to unsigned_______________________

		Move gp0 gp1 			%FP.to_unsigned 			#extract to registerss
		AND gp1 @2139095040 			#gp1 is exponent - bit mask to expose just exponent
		Load gp2 @2147483648				#sign goes to gp2s		
		AND gp2 gp0 						#gets signs
		AND gp0 @8388607
		OR gp0 @8388608 				#adds implied bit

		Compare gp1 @159
		if Greater then Load PC FP.to_unsigned.return_inf 	#too big exponent means return infinity
		Compare gp1 @127
		if Less then Load PC FP.to_unsigned.return_zero 	#too small means return zero

		Compare gp1 @151 		%FP.to_unsigned.0 					#scale up if exponent too big
		if Less then Load PC FP.to_unsigned.1
			SHL gp0 One
			SUB gp1 One
		Load PC FP.to_unsigned.0

		Compare gp1 @149 %FP.to_unsigned.1
		if Greater then Load PC FP.to_unsigned.2 					#scale down if exponent too small
			SHR gp0 One
			ADD gp1 One
		if gp2 then Load PC FP.to_unsigned.invert				%FP.to_unsigned.2
		Move Jump PC 											#if not negative then return, result in gp0
		Move Zero gp1 											%FP.to_unsigned.invert #if negative then invert
		SUB gp1 gp0
		Move gp1 gp0
		Move Jump PC


		Load gp0 @4294967295 %FP.to_unsigned.return_inf
		Move Jump PC

		Move Zero gp0 %FP.to_unsigned.return_zero
		Move Jump PC
	#_______________unsigned to float_______________________
	Move Zero gp2 %FP.from_unsigned
	Compare gp0 Zero
	if Equal then Load PC FP.from_unsigned.2 						#if zero then return 0
	Load gp1 @150 													#23 + 127
	Compare gp0 @16777216 				%FP.from_unsigned.0
	if Less then Load PC FP.from_unsigned.1 						#while greater than 2**24-1 normalise down
		SHR gp0 One
		ADD gp1 One
		Load PC FP.from_unsigned.0

	Compare gp0 @8388607	%FP.from_unsigned.1 					#while smaller than 2**23 normalise up
	if Greater then Load PC FP.from_unsigned.2
		SHL gp0 One
		SUB gp1 One
		Load PC FP.from_unsigned.1
	SHR gp1 @23 %FP.from_unsigned.2
	AND gp0 @8388607 			#removes assumed bit
	OR gp0 gp1
	Move Jump PC

	#_______________float to signed_______________________

		Load Move gp0 gp1 %FP.to_signed #extract to registers

		AND gp1 @2139095040 			#gp1 is exponent - bit mask to expose just exponent
		Load gp2 @2147483648				#sign goes to gp2s		
		AND gp2 gp0 						#gets signs
		AND gp0 @8388607
		OR gp0 @8388608 				#adds implied bit

		Compare gp1 @159
		if Greater then Load PC FP.to_signed.return_inf 	#too big exponent means return infinity
		Compare gp1 @127
		if Less then Load PC FP.to_signed.return_zero 	#too small means return zero

		Compare gp1 @151 		%FP.to_signed.0 					#scale up if exponent too big
		if Less then Load PC FP.to_signed.1
			SHL gp0 One
			SUB gp1 One
		Load PC FP.to_unsigned.0

		Compare gp1 @149 %FP.to_signed.1
		if Greater then Load PC FP.to_signed.2 					#scale down if exponent too small
			SHR gp0 One
			ADD gp1 One
		if gp2 then Load PC FP.to_signed.invert				%FP.to_signed.2
		Move Jump PC 											#if not negative then return, result in gp0
		Move Zero gp1 											%FP.to_signed.invert #if negative then invert
		SUB gp1 gp0
		Move gp1 gp0
		Move Jump PC


		Load gp0 @4294967295 %FP.to_signed.return_inf
		Move Jump PC

		Move Zero gp0 %FP.to_signed.return_zero
		Move Jump PC

	#_______________signed to float_______________________

	Load gp2 @2147483648	%FP.from_signed
	AND gp2 gp0
	if gp0 then Load PC FP.from_signed.invert

	Compare gp0 Zero 												%FP.from_signed.convert
	if Equal then Load PC FP.from_signed.2 						#if zero then return 0
	Load gp1 @150 													#23 + 127
	Compare gp0 @16777216 				%FP.from_signed.0
	if Less then Load PC FP.from_signed.1 						#while greater than 2**24-1 normalise down
		SHR gp0 One
		ADD gp1 One
		Load PC FP.from_signed.0

	Compare gp0 @8388607	%FP.from_signed.1 					#while smaller than 2**23 normalise up
	if Greater then Load PC FP.from_signed.2
		SHL gp0 One
		SUB gp1 One
		Load PC FP.from_signed.1
	SHR gp1 @23 %FP.from_signed.2
	AND gp0 @8388607 			#removes assumed bit
	OR gp0 gp1
	Move Jump PC

	
	Move Zero gp3		%FP.from_signed.invert
	SUB gp3 gp0
	Move gp3 gp0
	Load PC FP.from_signed.convert





<<Float MUL>>
<getgp1><getgp0>
Goto FP.MUL 										#FLOAT MULTIPLY
<storegp0>
<<Float DIV >>
<getgp1><getgp0>
Goto FP.DIV 										#FLOAT DIVIDE
<storegp0>
<<Float ADD>>
<getgp1><getgp0>
Goto FP.ADD 										#FLOAT ADD
<storegp0>
<<Float SUB>>
<getgp1><getgp0>
Goto FP.SUB 										#FLOAT SUB
<storegp0>

<<FLOAT is equal>>
<getgp0><getgp1>
Move Zero gp2 														#FLOAT COMPARE (IS EQUAL)
Goto FP.Compare
if Equal then Load  gp2 @4294967295
Move gp2 gp0
<Push gp0>
<<FLOAT is greater>>
<getgp0><getgp1>
Move Zero gp2 														#FLOAT COMPARE (IS GREATER)
Goto FP.Compare
if Greater then Load gp2 @4294967295
Move gp2 gp0
<Push gp0>
<<FLOAT is less>>
<getgp0><getgp1>
Move Zero gp2 														#FLOAT COMPARE (IS LESS)
Goto FP.Compare
if Less then Load gp2 @4294967295
Move gp2 gp0
<Push gp0>
<<FLOAT not equal>>
<getgp0><getgp1>
Load  gp2 @4294967295 												#FLOAT COMPARE (NOT EQUAL)
Goto FP.Compare
if Equal then Move Zero gp2
Move gp2 gp0
<Push gp0>
<<FLOAT not greater>>
<getgp0><getgp1>
Load gp2 @4294967295 												#FLOAT COMPARE (NOT GREATER)
Goto FP.Compare
if Greater then Move Zero gp2
Move gp2 gp0
<Push gp0>
<<FLOAT not less>>
<getgp0><getgp1>
Load gp2 @4294967295  												#FLOAT COMPARE (NOT LESS)
Goto FP.Compare
if Less then Move Zero gp2
Move gp2 gp0
<Push gp0>
<<FLOAT is true>>
<getgp0>
if gp0 then Load gp0 @4294967295 									#FLOAT COMPARE (IS TRUE)
<Push gp0>
<<FLOAT to unsigned>>
<getgp0>
Goto FP.to_unsigned													#CASTING FLOAT TO UNSIGNED INT
<Push gp0>
<<unsigned to FLOAT>>
<getgp0>
Goto FP.from_unsigned 												#CASTING UNSIGNED INT TO FLOAT
<Push gp0>
<<FLOAT to signed>>
<getgp0>
Goto FP.to_signed 													#CASTING FLOAT TO SIGNED INT
<Push gp0>
<<signed to FLOAT>>
<getgp0>
Goto FP.from_signed 												#CASTING SIGNED INT TO FLOAT
<Push gp0>