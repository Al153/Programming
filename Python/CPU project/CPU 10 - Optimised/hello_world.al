Struct hello

int H 72
char E 101
char L 108
char L2 108
char O 111
char space 32  
char W 119
char O2 111
char R 114
char L3 108
char D 100

end Struct

hello hello_instance

int 11 11
ptr loop 


Out @hello_instance.H [gp0] %loop
ADD gp0 One
Compare gp0 @11
if Equal then Halt
Load PC @loop 