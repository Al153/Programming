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
