Struct String character next 
	char character character
	int next next
end Struct

int 2 2
int 6 6
 
String str10 'd' 0
String str9 'l' $str10
String str8 'r' $str9
String str7 'o' $str8
String str6 'w' $str7
String str5  32 $str6
String str4 'o' $str5
String str3 'l' $str4
String str2 'l' $str3
String str1 'e' $str2
String str0 'h' $str1

Push					str0
Call 					Strings.print
Push @2
Push @6
Call 					Strings.splice
Call 					Strings.print
Halt
#____________ print string ____________
#dup 0 swap index print 4 swap index if print end return
ptr Strings.print

Pop gp0 				%Strings.print
Out -3 [gp0]
Load gp0 1 [gp0]
Compare gp0 Zero 
if Equal then Return
Push gp0
Call 					Strings.print
Return

#____________ splice ____________
#str start end ==> return_ptr


ptr Strings.splice
ptr Strings.splice.loop
ptr Strings.splice.return


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


