global array RC4_array 256 []


: init_array      #array = range(256)
	int i 256
	256 *i POP 		#definitely intialise i

	i while
		i 1 - *i POP
		i *RC4_array i + POP     #array[i] = i
	i loop
;

: as_byte 255 & ; #converts an int to to a byte

: KSA
	int i 0
	int j 0
	0 *i POP
	0 *j POP 			#definitely init i,j to 0

						#init key

	init_array

	1 while
		#do key move
		
		j *RC4_array i PUSH key_char + + as_byte *j POP #update j
		*RC4_array i PUSH *RC4_array j PUSH
		*RC4_array i POP  *RC4_array j POP




		i 1 + *i POP
	i 256 < loop
;
