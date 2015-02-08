#checked:
#Out, Outd, Load, Move, LoadByte, Load[], LoadByte[], Halt, LoadPC, if reg


str message "HELLO WORLD"
Load gp0 message

LoadByte gp1 0 [gp0] 			%Strings.print_loop
if gp1 then Out gp1
Load gp0 1 [gp0]
Compare gp0 Zero 
if Equal then Halt
Load PC 				Strings.print_loop
