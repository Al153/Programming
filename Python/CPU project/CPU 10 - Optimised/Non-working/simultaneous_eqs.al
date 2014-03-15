import  Fractions

Struct Eq sign value next
	char sign 			sign
    Fraction value value
	int next			next
end Struct

Struct adv_faction value sign
	char sign 			sign
	Fraction value 		value

#____________________ multiply ____________________
#gp0:  source, gp1: destination, gp2: multiplier == > gp0: source, gp1: result

ptr simultaneous_eqs.multiply
int simultaneous_eqs.multiply.return 0 

int simultaneous_eqs.multiply.source_pointer 0
int simultaneous_eqs.multiply.dest_pointer 0
int simultaneous_eqs.multiply.mult_pointer 0

Fraction simultaneous_eqs.multiply.temp 0 0

Store Jump @simultaneous_eqs.multiply.return
Store gp0 @simultaneous_eqs.multiply.source_pointer
Store gp1 @simultaneous_eqs.multiply.dest_pointer
Store gp2 @simultaneous_eqs.multiply.source_pointer

Load gp3 0 [gp0]
Load gp4 4 [gp1]
Store gp3 @simultaneous_eqs.multiply.temp.numerator
Store gp4 @simultaneous_eqs.multiply.temp.denominator

Load gp1 1 [gp0]
Load gp0 @temp
Goto @Fractions.multiply











