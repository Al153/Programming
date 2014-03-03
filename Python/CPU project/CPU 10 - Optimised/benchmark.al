ptr loop
int 65536 65536

ADD gp0 One %loop
#Out gp0
Compare gp0 @65536
if Equal then Halt
Load PC @loop
