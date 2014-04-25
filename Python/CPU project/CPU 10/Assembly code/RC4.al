str trial "Plaintext"
str Key_ "Key"
str Key_2 "Key"

int ciphertext 0



str init_string "Initialising
"
str kc_string 	"Circularising key
"
str key_schedule_string "key_scheduling
"
str encrypt_string "encrypting 
"


array S 256 []
#array buffer 10 []

Push Key_
Push trial

Call RC4.encrypt
Pop ciphertext

Push ciphertext 
Call Strings.print_hex
Out @10

Push Key_2
Push ciphertext

Call RC4.encrypt
Call Strings.print

Halt






#______________ circularise_key ______________ #makes key_string circular
# . . . key_string ==> . . . key_string

def key_index gp0
def previous_key_index gp1
def start_of_key gp2

 							




Pop key_index %RC4.circularise_key
Move key_index start_of_key

	Compare key_index Zero 			%RC4.key_circle_loop
	if Equal then  Load PC RC4.Key_circle_return
	#Out -3 [key_index]
	#Outd key_index
	Move key_index previous_key_index
	Load key_index 1 [key_index]
	Load PC RC4.key_circle_loop

Store start_of_key 1 [previous_key_index] 	%RC4.Key_circle_return
Push start_of_key
Return



#______________ key_schedule ______________
# . . . key_string ==> . . . 

def j gp1
def i gp2
def key gp3
def tempi gp4
def tempj gp5
def i_index gp6
def j_index gp7

Move Zero j			%RC4.key_schedule
Load i @256
Load i_index @1024
Pop key


	SUB i One 						%RC4.KS.init_loop
	SUB i_index @4
	Store i S [i_index]
if i then Load PC RC4.KS.init_loop

Move Zero j
Move Zero i
Move Zero i_index
Compare i @256						%RC4.KS.loop
if Equal then Return

	ADD j S [i_index] 					#j = (j + S[i] + key[i]%len(key))%256
	ADD j -3 [key] 
	AND j @255

	Move j j_index
	MUL j_index @4

	Load tempi S [i_index] 				#swap over 
	Load tempj S [j_index]
	Store tempi S [j_index]
	Store tempj S [i_index]


	Load key 1 [key] 			#cycles through key
ADD i One 
ADD i_index @4
Load PC RC4.KS.loop




#_______________ init _______________
# . . . key ==> . . .
#sets up RC4

int RC4.i 0
int RC4.j 0




							

Call RC4.circularise_key 		%RC4.init
Call RC4.key_schedule

Store Zero RC4.i #reset i and j for encrypting multiple times
Store Zero RC4.j
Return


# _________ generate _________
def k gp0 


Load  i RC4.i 								%RC4.generate
Load  j RC4.j

ADD i One
AND i @255

Move i i_index
MUL i_index @4

ADD j S [i_index]
AND j @255

Move j j_index
MUL j_index @4


Load tempi S [i_index]
Load tempj S [j_index]
Store tempi S [j_index]
Store tempj S [i_index]

Move tempi k
ADD k tempj
AND k @255
MUL k @4
Push S [k]

Store i RC4.i
Store j RC4.j

Return


#_____________________ encrypt _____________________
# . . . key plaintext ==> ciphertext
int current_plaintext_pointer 0
			


Pop current_plaintext_pointer	%RC4.encrypt
Call RC4.init 		
Push current_plaintext_pointer

Load gp0 @512                #discarding first 512 values for security	 					 					
	SUB gp0 One 				%RC4.encrypt.discard
	Push gp0
	Call RC4.generate
	Pop gp1
	Pop gp0
if gp0 then Load PC RC4.encrypt.discard



Load gp0 current_plaintext_pointer

Compare gp0 Zero 							%RC4.encrypt_loop
if Equal then Load PC RC4.encrypt.Return
	Call RC4.generate
	Pop gp1 					#key
	Load gp0 current_plaintext_pointer
	XOR gp1 -3 [gp0]
	Store gp1 -3 [gp0]
	Load gp0 1 [gp0]
Store gp0 current_plaintext_pointer
Load PC RC4.encrypt_loop


Return 	%RC4.encrypt.Return


#____________ Print array ____________
Move Zero i			 %print_array
Move Zero i_index


	Move i gp0 	%print_array_loop
	MOD gp0 @16
	Compare gp0 Zero
	if Equal then Out @10
	Outd S [i_index]
	Out @32

ADD i One		
ADD i_index @4
Compare i @256
if Less then Load PC print_array_loop

Return