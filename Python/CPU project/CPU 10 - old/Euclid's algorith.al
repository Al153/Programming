def Areg gp0
def Breg gp1
def temp gp2
ptr loop
int A 12
int B 9
Load Areg @A
Load Breg @B
MOD Breg Areg %loop
Move Areg temp
Move Breg Areg
Move temp Breg
if Areg then Goto @loop
Halt