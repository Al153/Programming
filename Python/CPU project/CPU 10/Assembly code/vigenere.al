Byte_array int_to_char 26 [97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122]
Byte_array char_to_int 256  [100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20,21, 22, 23, 24, 25, 100, 100, 100, 100, 100, 100, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9,10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100]

#python for generating char_to_int
#alphabet = list("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz")
#filter_funct = (lambda char: alphabet.index(char)%26 if char in alphabet else 100)

#print map(filter_funct, map(chr,range(256)))

#def circularise_key(key_index):
#	start_of_key = key_index
#	while key_index != 0:
#		key_char = lookup(char(key))
#		if key_char == 0:
#			index(previous_key_index) = index(key_index)
#		previous_key_index = key_index
#		key_index = index(key_index)
#	index(start_of_key) = previous_key_index
#	return start_of_key
 
int vigenere.test_string 0

Scope Main
	str key "Al is Awesome"
	str Plaintext "I don't like James; he's smelly!"
	Push Plaintext
	Push key
	Call vigenere.encrypt
	Call Strings.print
	Out @10
	Push Plaintext
	str key2 "Al is Awesome"
	#Push vigenere.test_string
	Push key2
	Call vigenere.decrypt
	Call Strings.print
	Halt



Scope Key_schedule

def key_index gp0
def previous_key_index gp1
def start_of_key gp2
def key_char gp3
def temp_key_index gp4


Pop key_index %vigenere.circularise_key
Move key_index start_of_key

	Compare key_index Zero 			%vigenere.key_circle_loop
	if Equal then  Load PC vigenere.Key_circle_return

	LoadByte key_char 0 [key_index]
	LoadByte key_char char_to_int [key_char]
	StoreByte key_char 0 [key_index]
	#Out key_char
	
	Load temp_key_index 1 [key_index]                         #char is not in the uppercase or lowercase alphabets    
	Move Zero Flags_reset
	Compare key_char @100          
	if Less then Move key_index temp_key_index
	Store temp_key_index 1 [previous_key_index]



	Move key_index previous_key_index
	Load key_index 1 [key_index]
	Load PC vigenere.key_circle_loop

Store start_of_key 1 [previous_key_index] 	%vigenere.Key_circle_return
Push start_of_key
Return




#_____________________ encrypt letter ________________
#gp1: int (0-25)
#gp2: key_index

#goes to  

#gp1 encrypted char
#gp2: new_key_index

Scope encrypt_letter

def char gp4
def key_index gp2

LoadByte gp7 0 [key_index] %vigenere.encrypt_letter
ADD char gp7
MOD char @26
LoadByte gp1 int_to_char [char]
Load key_index 1 [key_index]
Move Jump PC


Scope decrypt_letter

def char gp4
def key_index gp2

LoadByte gp7 0 [key_index] %vigenere.decrypt_letter

ADD char @26
SUB char gp7
MOD char @26


LoadByte gp1 int_to_char [char]

Load key_index 1 [key_index]
Move Jump PC



#_________________encrypt_string___________________
#Function encrypt(string,key):
#	start_of_string = string
#	while string != 0:
#		if char_to_int(string.char):
#			string.char,key = encrypt(char_to_int(string.char),key)
#		string = string.link
#	return start_of_string

Scope encrypt

def string_index gp0
def string_char gp1
def key_index gp2
def start_of_string gp3
def string_int gp4

Call vigenere.circularise_key %vigenere.encrypt
Pop key_index 
Pop string_index
Move string_index start_of_string

if string_index then Load PC vigenere.encrypt_subroutine %vigenere.encrypt_loop
	Push start_of_string
	Return

LoadByte string_char 0 [string_index] %vigenere.encrypt_subroutine
LoadByte string_int char_to_int [string_char]
Move Zero Flags_reset
Compare string_int @100
	if Less then Goto vigenere.encrypt_letter
StoreByte string_char 0 [string_index]
Load string_index 1 [string_index]
Load PC vigenere.encrypt_loop


Scope decrypt

def string_index gp0
def string_char gp1
def key_index gp2
def start_of_string gp3
def string_int gp4

Call vigenere.circularise_key %vigenere.decrypt
Pop key_index 
Pop string_index
Move string_index start_of_string

if string_index then Load PC vigenere.decrypt_subroutine  %vigenere.decrypt_loop
	Push start_of_string
	Return

LoadByte string_char 0 [string_index] %vigenere.decrypt_subroutine
LoadByte string_int char_to_int [string_char]
Move Zero Flags_reset
Compare string_int @100
	if Less then Goto vigenere.decrypt_letter
StoreByte string_char 0 [string_index]
Load string_index 1 [string_index]
Load PC vigenere.decrypt_loop


#LXFOPVEFRNHR
#ATTACKATDAWN