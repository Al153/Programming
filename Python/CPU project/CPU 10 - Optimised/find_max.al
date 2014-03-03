int length 6  #define variables and constants
int 4 4
array list @length [2,3,5,6,12,1,6]
ptr loop
ptr replace
ptr return

def i gp3 #rename registers
def max gp1
def address gp2
def trial gp0

Load i @length #init step
Load gp4 @4
MUL i gp4

SUB i gp4 				%loop  #search loop
Load trial @list [i]
Compare trial max
if Greater then Load PC @replace
if i then Load PC @loop 			%return


Move max gp0		#tidying up 
Move address gp1
DIV gp1 gp4
Move Zero gp2
Move Zero gp3
Move Zero gp4
Halt






Move trial max 	%replace  #if new max is found
Move i address
Load PC @return
