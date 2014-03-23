import Stack

Struct Matrix var0 var1 var2 var3
int 00 var0
int 01 var1
int 10 var2
int 11 var3
end Struct

#_____ Multiply_matrices _____

#stack: matrix1 matrix2 aux ==>  matrix1*matrix2 in aux

ptr Multiply_matrices
Goto @Datastack.pop %Multiply_matrices
Move gp0 gp2
Goto @Datastack.pop
Move gp0 gp1
Goto @Datastack.pop

Load gp3 0 [gp0]
MUL gp3 0 [gp1]
Load gp4 4 [gp0]
MUL gp4 8 [gp1]
ADD gp3 gp4
Store gp3 0 [gp2]

Load gp3 0 [gp0]
MUL gp3 4 [gp1]
Load gp4 4 [gp0]
MUL gp4 12 [gp1]
ADD gp3 gp4
Store gp3 4 [gp2]

Load gp3 8 [gp0]
MUL gp3 0 [gp1]
Load gp4 12 [gp0]
MUL gp4 8 [gp1]
ADD gp3 gp4
Store gp3 8 [gp2]

Load gp3 8 [gp0]
MUL gp3 4 [gp1]
Load gp4 12 [gp0]
MUL gp4 12 [gp1]
ADD gp3 gp4
Store gp3 12 [gp2]

Move gp2 gp0
Goto @Datastack.push
Move PC @Programstack.return

#_______ exponentiate matrices _______

#stack: matrix, aux, n ==> matrix^n
def n gp2
def aux gp1
def matrix gp0



