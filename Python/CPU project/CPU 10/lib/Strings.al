Struct String character next 
	char character character
	int next next
end Struct
 
#String str10 'd' 0
#String str9 'l' $str10
#String str8 'r' $str9
#String str7 'o' $str8
#String str6 'w' $str7
#String str5  32 $str6
#String str4 'o' $str5
#String str3 'l' $str4
#String str2 'l' $str3
#String str1 'e' $str2
#String str0 'h' $str1#

#Push					str0
#Call 					Strings.print
#Push @2
#Push @6
#Call 					Strings.splice
#Call 					Strings.print
#Halt
#____________ print string ____________
#dup 0 swap index print 4 swap index if print end return
#ptr Strings.print

Pop gp0 				%Strings.print

Out -3 [gp0] 			%Strings.print_loop
Load gp0 1 [gp0]
Compare gp0 Zero 
if Equal then Return
Load PC 				Strings.print_loop


#____________ print hex ____________
array Strings.hex_lookup 16 [48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 97, 98, 99, 100, 101, 102]

Pop gp0 				%Strings.print_hex

Load gp1 -3 [gp0] 			%Strings.print_hex_loop
Move gp1 gp2
SHR gp1 @4
AND gp1 @15
AND gp2 @15
MUL gp1 @4
MUL gp2 @4

Out Strings.hex_lookup [gp1]
Out Strings.hex_lookup [gp2]

Load gp0 1 [gp0]
Compare gp0 Zero 
if Equal then Return
Load PC 				Strings.print_hex_loop

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


