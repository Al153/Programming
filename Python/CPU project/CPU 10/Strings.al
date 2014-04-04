Struct String character next 
	char character character
	int next next
end Struct
 
#____________ print string ____________
#dup 0 swap index print 4 swap index if print end return
#ptr Strings.print

Pop gp0 				%Strings.print
Out -3 [gp0] 			%Strings.print.loop
Load gp0 1 [gp0]
if gp0 then Load PC Strings.print.loop
Return

#____________ Print hex ____________
array hex_lookup 16 [48,49,50,51,52,53,54,55,56,57,65,66,67,68,69,70]



Pop gp0 				%Strings.print_hex
Load gp1 -3 [gp0] 			%Strings.print_hex.loop
Move gp1 gp2

SHR gp1 @4     #get top and bottom nybbles
AND gp1 @15
AND gp2 @15
MUL gp1 @4
MUL gp2 @4

Load gp1 hex_lookup [gp1]
Load gp2 hex_lookup [gp2]
Out gp1
Out gp2

Load gp0 1 [gp0]

if gp0 then Load PC Strings.print_hex.loop
Out @10
Return

#____________ splice ____________
#str start end ==> return_ptr


#ptr Strings.splice
#ptr Strings.splice.loop
#ptr Strings.splice.return


def Strings.start gp1
def Strings.end gp2
def Strings.str gp3
def Strings.return_ptr gp4
def Strings.i gp5

Pop Strings.end 				%Strings.splice
Pop Strings.start 
Pop Strings.str

Move Zero Strings.i
Move Zero Strings.return_ptr
 
	Compare Zero 1 [Strings.str] 		%Strings.splice.loop
	if Equal then Load PC Strings.splice.return
		Load Strings.str 1 [Strings.str]

		Compare Strings.i Strings.start
		if Equal then Move Strings.str Strings.return_ptr

		Compare Strings.i Strings.end
		if Equal then Load PC Strings.splice.return

		ADD Strings.i One
		Load PC Strings.splice.loop

Push Zero %Strings.splice.return
Return


