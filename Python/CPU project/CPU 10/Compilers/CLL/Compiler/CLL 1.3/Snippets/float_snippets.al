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



