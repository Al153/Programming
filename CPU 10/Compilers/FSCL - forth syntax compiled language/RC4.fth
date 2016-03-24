using std.hlib

global array RC4_array 256 []
global int i 0
global int j 0
global str key "hello"

: init_key
	int start_addr 0
	int current_addr 0
	int next_addr 0

	DUP *start_addr POP *next_addr POP    #stores key pointer to next addr and start addr

	next_addr while
		next_addr *current_addr POP 		#current_addr = next addr
		current_addr 1 + PUSH *next_addr POP     #next_addr = current_addr[1]
	next_addr loop

	start_addr key_char:*current_addr POP 	#inits key_char
	start_addr *current_addr 1 + POP        #current_addr[1] = start_addr (circularises)
;

: init_array      #array = range(256)
	
	256 *i POP 		#definitely intialise i

	1 while
		i--
		i *RC4_array i + POPB     #array[i] = i
	i loop
;

: as_byte 255 & ; 			#converts an int to to a byte

: key_char 					 					#gets the next char of the key
	int current_addr 0 							#inited by init_key
	current_addr PUSHB 							#Pushes current char
	current_addr 1 + *current_addr POP          #current_addr = current_addr[1]
;

: update_j j *RC4_array i + PUSHB key_char + + as_byte *j POP	; # j = (j + RC4_array[i] + key[i%key_length])%256

: swap_array #swaps RC4_array[i] and RC4_array[j] 
	*RC4_array i + PUSHB *RC4_array j + PUSHB
	*RC4_array i + POPB  *RC4_array j + POPB
;

: i++ i 1 + *i POP ;
: i-- i 1 - *i POP ;

: KSA
	0 *i POP			#init i,j to 0s
	0 *j POP 			

	init_key			
	init_array

	1 while
		#do key move
		
		update_j  #update j
		swap_array
		i++
	i 256 < loop
0 *i POP #reset i,j
0 *j POP
;

: generate
	i++ i as_byte *i POP 						#i = i +1 (mod 256)
	j *RC4_array i + PUSHB + as_byte *j POP 	#j = j + RC4_array[i] (mod 256)
	swap_array
	*RC4_array DUP i + PUSHB *RC4_array j + PUSHB + PUSHB 
;

key KSA #generate generate generate generate .s