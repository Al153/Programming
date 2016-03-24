#___________________ description ___________________
#A default set of string manipulation subroutines, automatically imported when a str Struct is used.
#
#so far:
#		- Strings.print: Prints a String
#		- Strings.print_hex: prints out the hex values of a string
#		- Strings.splice:    reduces a string to string[start:end]
#		- Strings.copy





















Struct String character next 
	char character character
	int next next
end Struct
 
#____________ print string ____________
#dup 0 swap index print 4 swap index if print end return

Pop gp0 				%Strings.print

LoadByte gp1 0 [gp0] 			%Strings.print_loop
if gp1 then Out gp1
Load gp0 1 [gp0]
Compare gp0 Zero 
if Equal then Return
Load PC 				Strings.print_loop


#____________ print hex ____________
array Strings.hex_lookup 16 [48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 97, 98, 99, 100, 101, 102]

Pop gp0 				%Strings.print_hex

LoadByte gp1 0 [gp0] 			%Strings.print_hex_loop
Move gp1 gp2
SHR gp1 @4
AND gp2 @15
SHL gp1 @2
SHL gp2 @2

Out Strings.hex_lookup [gp1]
Out Strings.hex_lookup [gp2]

Load gp0 1 [gp0]
Compare gp0 Zero 
if Equal then Return
Load PC 				Strings.print_hex_loop

#____________ splice ____________ 
#gets string [start:end], but breaks string
#str start end ==> return_ptr

def Strings.start gp1
def Strings.end gp2
def Strings.str gp3
def Strings.return_ptr gp4
def Strings.i gp5
def Strings.last_ptr gp6

Pop Strings.end 				%Strings.splice
Pop Strings.start 
Pop Strings.str

Move Zero Strings.i
Move Zero Strings.return_ptr
Move Zero Strings.last_ptr
 
	Compare Zero 1 [Strings.str] 		%Strings.splice.loop
		if Equal then Load PC Strings.splice.return
	

	Compare Strings.i Strings.start
		if Equal then Move Strings.str Strings.return_ptr

	Compare Strings.i Strings.end
		if Equal then Load PC Strings.splice.return

	Move Strings.str Strings.last_ptr
	Load Strings.str 1 [Strings.str]
	ADD Strings.i One
	Load PC Strings.splice.loop

Store Zero 1 [Strings.last_ptr] %Strings.splice.return
Push Strings.return_ptr
Return


#___________________ Allocating strings ___________________

#allows for dynamic allocation + deallocation
<Python> "\n".join(["char string_pool"+str(i)+" 0\nint string_pool_ptr"+str(i)+" "+("string_pool"+str(i-1) if i else "0") for i in xrange(1024)]+["int string_pool string_pool1023"])

					#   to allocate:
					#	ret = pool_pointer
					#	pool_pointer = link(pool_pointer)
					#	return ret

	Load gp0 string_pool %Strings.allocate
	Compare gp0 Zero
	if Equal then Halt
	Load gp1 1 [gp0]
	Store gp1 string_pool
	Push gp0
Return

					#to deallocate:
					#link(new_string) = pool_pointer
					#pool_pointer = new_string
					#return


	Pop gp0 %Strings.deallocate
	Load gp1 string_pool
	Store gp1 1 [gp0]
	Store gp0 string_pool
Return

#___________________ copy string ___________________
#def copy(string):
#	old_string = 0
#	if string: 
#		old_string = pool_pointer                        1)
#		pool_pointer = old_string.link 					 2)
#		old_string.data = string.data                    3)
#		string = string.link 							 4)
#	top = old_string 									 5)
#	while string != 0:                                   6)
#		new_string = pool_pointer                        7)
#		pool_pointer = new_string.link                   8)
#		new_string.data = string.data                    9)
#		string = string.link                             10) 
#		old_string.link = new_string                     11)
#		old_string = new_string                          12) 
#	return top                                           13)


Scope  copy_strings

def string_to_copy gp0
def new_string gp1
def old_string gp2
def data  gp3
def top gp4
def link 1

Pop string_to_copy 				%Strings.copy 
if string_to_copy then Load PC Strings.copy_init
Push Zero
Return


				Load old_string string_pool %Strings.copy_init
					Compare old_string Zero
					if Equal then Halt
				Load data link [old_string]                                  #1
				Store data string_pool                                       #2
				LoadByte data 0 [string_to_copy]                             #3
				StoreByte data 0 [old_string]
				Load string_to_copy link [string_to_copy]                    #4
				Move old_string top                                          #5
	if string_to_copy then Load PC Strings.copy_loop
	Store Zero link [old_string]
	Push top                                                                 #13
	Return


				Load new_string string_pool %Strings.copy_loop               #7
					Compare new_string Zero                                  
					if Equal then Halt
				Load data link [new_string]                                  #8
				Store data string_pool
				LoadByte data 0 [string_to_copy]                             #9
				StoreByte data 0 [new_string] 
				Load string_to_copy link [string_to_copy]                    #10
				Store new_string link [old_string]                           #11
				Move new_string old_string                                   #12
	if string_to_copy then Load PC Strings.copy_loop                        #6
	Store Zero link [old_string]
	Push top                                                                 #13
	Return







	