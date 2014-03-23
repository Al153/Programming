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


#____________ read_byte _________ #gp0: address ==> gp0: byte
ptr read_byte

int shift_value 24
	
Load gp0 0 [gp0] %read_byte
SHR gp0 @shift_value
Move Jump PC

#___________ write_byte _________ #gp0: data, gp1: address, gp2: auxilary ==> NULL
ptr write_byte

int reverse_byte_mask 16777215 #0b 00000000 11111111 11111111 11111111
int shift_value 24
				
Load gp2 @reverse_byte_mask %write_byte
AND gp2 0 [gp1]
SHL gp0 @shift_value
OR gp0 gp2
Store gp0 0 [gp1]
Move Jump PC

#____________ read word ____________
ptr read_word

Load gp0 0 [gp0] %read_word
SHR gp0 @16
Move Jump PC

#____________ write word ____________
int word_mask 65535
ptr write_word
Load gp2 @word_mask %write_word
AND gp2 0 [gp1]
SHL gp0 @16
OR gp0 gp2
Store gp0 0 [gp1]
Move Jump PC

















