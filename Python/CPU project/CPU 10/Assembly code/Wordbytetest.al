str test "hello world"

Load gp0 test

LoadWord gp1 0 [gp0] 			%print_loop
SHR gp1 @8
Outd gp1
Out @10
Load gp0 1 [gp0]
Compare gp0 Zero 
if Equal then Return
Load PC 				print_loop