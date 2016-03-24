#_________________________ Comparison operations _________________________

<<is equal>>
<getgp0><getgp1>
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
<Push gp0>
<<is greater>>
<getgp0><getgp1>
Move Zero gp2 														#COMPARE (IS GREATER)
Compare gp1 gp0
if Greater then Load gp2 @4294967295
Move gp2 gp0
<Push gp0>
<<is less>>
<getgp0><getgp1>
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
<Push gp0>
<<not equal>>
<getgp0><getgp1>
Load  gp2 @4294967295 												#COMPARE (NOT EQUAL)
Compare gp1 gp0 
if Equal then Move Zero gp2
Move gp2 gp0
<Push gp0>
<<not greater>>
<getgp0><getgp1>
Load gp2 @4294967295 												#COMPARE (NOT GREATER)
Compare gp1 gp0
if Greater then Move Zero gp2
Move gp2 gp0
<Push gp0>
<<not less>>
<getgp0><getgp1>
Load gp2 @4294967295  												#COMPARE (NOT LESS)
Compare gp1 gp0
if Less then Move Zero gp2
Move gp2 gp0
<Push gp0>
<<is true>>
<getgp0>
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
<Push gp0>
<<junk>>

#_________________________ Signed Comparison operations _________________________
<< SIGNED Comparison code >>
#_________________________ SIGNED COMPARE CODE _________________________
	Load gp2 @2147483648 				%Signed_compare #extracts sign
	Load gp3 @2147483648
	AND gp2 gp0
	AND gp3 gp1
	AND gp0 @2147483647 				#removes signs from magnitude
	AND gp1 @2147483647

	Compare gp3 gp2
	Move Flags_set gp4
	if Equal then Load PC Signed_compare.1
	Move gp4 Flags_set 			#if unequal signs then just return the comparison
	Move Jump PC

	Compare gp0 gp1	%Signed_compare.1 #same signed so now need to check magnitude
	Move 
<<junk>>





<<Signed is equal>>
<getgp1><getgp0>
Move Zero gp2 														#COMPARE SIGNED (IS EQUAL)
Compare gp0 gp1
if Equal then Load  gp2 @4294967295
Move gp2 gp0
<Push gp0>
<<Signed is greater>>
<getgp1><getgp0>
Move Zero gp2 														#COMPARE SIGNED (IS GREATER)
Goto Signed_compare
if Greater then Load gp2 @4294967295
Move gp2 gp0
<Push gp0>
<<Signed is less>>
<getgp1><getgp0>
Move Zero gp2 														#COMPARE SIGNED (IS LESS)
Goto Signed_compare
if Less then Load gp2 @4294967295
Move gp2 gp0
<Push gp0>
<<Signed not equal>>
<getgp1><getgp0>
Load  gp2 @4294967295 												#COMPARE SIGNED (NOT EQUAL)
Compare gp1 gp0 
if Equal then Move Zero gp2
Move gp2 gp0
<Push gp0>
<<Signed not greater>>
<getgp1><getgp0>
Load gp2 @4294967295 												#COMPARE  SIGNED (NOT GREATER)
Goto Signed_compare
if Greater then Move Zero gp2
Move gp2 gp0
<Push gp0>
<<Signed not less>>
<getgp1><getgp0>
Load gp2 @4294967295  												#COMPARE SIGNED (NOT LESS)
Goto Signed_compare
if Less then Move Zero gp2
Move gp2 gp0
<Push gp0>
<<Signed is true>>
<getgp0>
if gp0 then Load gp0 @4294967295 									#COMPARE SIGNED (IS TRUE)
<Push gp0>
<<junk>>
