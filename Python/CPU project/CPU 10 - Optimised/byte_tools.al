int 8 8 

#___________ test ________
int A 65
int B 66
int C 67

int 0 12362
int trial @0
int byte_value 246

Load gp7 @byte_value
Load gp6 @trial

Out @A
Goto @write_byte
Out @B
Load gp7 @0
Goto @read_byte
Out @C
Halt


#____________ read_byte _________ #gp6: address ==> gp7: byte
ptr read_byte

int shift_value 24

ADD Jump @8 	%read_byte
Load gp7 0 [gp6]
SHR gp7 @shift_value
Move Jump PC

#___________ write_byte _________ #gp7: data, gp6: address, gp5 auxilary ==> NULL
ptr write_byte

int reverse_byte_mask 16777215 #0b 00000000 11111111 11111111 11111111
int shift_value 24

ADD Jump @8 				%write_byte
Load gp5 @reverse_byte_mask
AND gp5 0 [gp6]
SHL gp7 @shift_value
OR gp7 gp5
Store gp7 0 [gp6]
Move Jump PC


















