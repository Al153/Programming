Struct Fraction numerator denominator
	int numerator numerator
	int denominator denominator
end Struct


int return 10
int space 32

int slash 47

Fraction half 1 3
Fraction third 1 2 
Load gp0 @half
Load gp1 @third
Goto @Fractions.divide

Outd @half.numerator
Out @slash
Outd @half.denominator
Halt

#__________________________ GCD __________________________
ptr Fractions.GCD
ptr Fractions.GCD_loop

def Fractions.GCD.a gp5 	#to keep low address gps free
def Fractions.GCD.b gp6
def Fractions.GCD.temp gp7

if Fractions.GCD.a then Load PC @Fractions.GCD_loop 		%Fractions.GCD
	Move Jump PC
Move Fractions.GCD.a Fractions.GCD.temp 	  							%Fractions.GCD_loop
MOD  Fractions.GCD.b Fractions.GCD.a
Move Fractions.GCD.b Fractions.GCD.a
Move Fractions.GCD.temp Fractions.GCD.b
Load PC @Fractions.GCD

#__________________________ ADD __________________________
#gp0: fraction0, gp1: fraction1 ==> gp0: fraction0 + fraction1

ptr Fractions.add
int Fractions.add.return 0

def Fractions.ADD.fraction0 gp0
def Fractions.ADD.fraction1 gp1

Load gp2 0 [Fractions.ADD.fraction0] %Fractions.add
Load gp3 4 [Fractions.ADD.fraction0]
Load gp4 0 [Fractions.ADD.fraction1]
Load gp5 4 [Fractions.ADD.fraction1]
Store Jump @Fractions.add.return

MUL gp2 gp5
MUL gp4 gp3

MUL gp3 gp5 		#get the denominator
ADD gp2 gp4 #get the numerator

Move gp2 gp5
Move gp3 gp6
Goto @Fractions.GCD
DIV gp2 gp6
DIV gp3 gp6 
Store gp2 0 [Fractions.ADD.fraction0]
Store gp3 4 [Fractions.ADD.fraction0]
if Accumulator then Goto @Fractions.Overflow #Overflow control
if DivByZero then Goto @Fractions.Invalid 	 #Underflow control
Load PC @Fractions.add.return

#__________________________ Multiply __________________________
ptr Fractions.Multiply
int Fractions.Multiply.return 0

def Fractions.Multiply.fraction0 gp0
def Fractions.Multiply.fraction1 gp1

Load gp2 0 [Fractions.Multiply.fraction0] %Fractions.Multiply
Load gp3 4 [Fractions.Multiply.fraction0]
Load gp4 0 [Fractions.Multiply.fraction1]
Load gp5 4 [Fractions.Multiply.fraction1]
Store Jump @Fractions.Multiply.return

MUL gp2 gp4
MUL gp3 gp5
Move gp2 gp5
Move gp3 gp6
Goto @Fractions.GCD
DIV gp2 gp6
DIV gp3 gp6

Store gp2 0 [Fractions.Multiply.fraction0]
Store gp3 4 [Fractions.Multiply.fraction0]
if Accumulator then Goto @Fractions.Overflow #Overflow control
if DivByZero then Goto @Fractions.Invalid 	 #Underflow control
Load PC @Fractions.Multiply.return

#__________________________ invert __________________________
ptr Fractions.invert

Load gp2 0 [gp1] %Fractions.invert
Load gp3 4 [gp1]
Outd gp2
Out  @space
Outd gp3
Store gp2 4 [gp1]
Store gp3 0 [gp1]
Move Jump PC

#_________________________ divide _________________________
ptr Fractions.divide
int Fractions.divide.return 0

Store Jump @Fractions.divide.return %Fractions.divide
Goto @Fractions.invert
Goto @Fractions.Multiply
Load PC @Fractions.divide.return


ptr Fractions.Overflow
Halt %Fractions.Overflow

ptr Fractions.Invalid
Halt %Fractions.Invalid