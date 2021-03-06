#Assembly words for string manipulation

Struct String character next 
	char character character
	int next next
end Struct

#___________________ Allocating strings ___________________

#allows for dynamic allocation + deallocation
<Python> "\n".join(["char forth_string_pool"+str(i)+" 0\nint forth_string_pool_ptr"+str(i)+" "+("forth_string_pool"+str(i-1) if i else "0") for i in xrange(65536)]+["int forth_string_pool forth_string_pool65535"])

					#   to allocate:
					#	ret = pool_pointer
					#	pool_pointer = link(pool_pointer)
					#	return ret

#allocate:
#	n ==> pointer to string of length n

Subroutine string_tools_allocate(n)
	def n gp1	
	def next_address gp2
	def previous_address gp3

	Push forth_string_pool 					#put pointer onto stack
	Load next_address forth_string_pool


	Compare n 0
		if Equal then Load PC string_tools.allocate.return0
	Compare next_address Zero
		if Equal then Load PC 					string_tools.pool_empty



		SUB n One								%string_tools.allocate_loop
		Load next_address 1 [next_address]
		Compare next_address Zero
		if Equal then Load PC 					string_tools.pool_empty
		Compare n Zero
		if Equal then Load PC 					string_tools.allocate2
		Move next_address previous_address
		Load PC string_tools.allocate_loop




	Store next_address forth_string_pool 		%string_tools.allocate2
	Store Zero 1 [previous_address] 
Return

Return @0	%string_tools.allocate.return0

str string_tools.pool_empty_message "RUNTIME ERROR: string allocation pool empty"
	Push string_tools.pool_empty_message %string_tools.pool_empty
	Call Strings.print
	Halt



#_____________________________ Deallocation _______

Subroutine string_tools_deallocate()
	Pop gp0 %string_tools.deallocate
	Load gp1 forth_string_pool
	Store gp0 forth_string_pool

			Load gp0 1 [gp0] 			%string_tools.deallocate_loop					#traverses to the end of the string to deallocate
			Compare gp0 Zero 
			if Equal then Load PC string_tools.deallocate2
			Move gp0 gp2																#gp2 contains last correct address
			Load PC 				string_tools.deallocate_loop

	Store gp1 1 [gp2] %string_tools.deallocate2
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

Pop string_to_copy 				%string_tools.copy
if string_to_copy then Load PC string_tools.copy_init
Push Zero
Return


				Load old_string forth_string_pool %string_tools.copy_init
					Compare old_string Zero
					if Equal then Halt
				Load data link [old_string]                                  #1
				Store data forth_string_pool                                 #2
				LoadByte data 0 [string_to_copy]                             #3
				StoreByte data 0 [old_string]
				Load string_to_copy link [string_to_copy]                    #4
				Move old_string top                                          #5
	if string_to_copy then Load PC string_tools.copy_loop
	Store Zero link [old_string]
	Push top                                                                 #13
	Return


				Load new_string forth_string_pool %string_tools.copy_loop    #7
					Compare new_string Zero                                  
					if Equal then Halt
				Load data link [new_string]                                  #8
				Store data forth_string_pool
				LoadByte data 0 [string_to_copy]                             #9
				StoreByte data 0 [new_string] 
				Load string_to_copy link [string_to_copy]                    #10
				Store new_string link [old_string]                           #11
				Move new_string old_string                                   #12
	if string_to_copy then Load PC string_tools.copy_loop                    #6
	Store Zero link [old_string]
	Push top                                                                 #13
	Return



#_____________________________ get line input _____________________________
#Stores an input into a string
#ends on a return key
Pop gp0               %string_tools.insert_to_pool_line
    In gp1                  %string_tools.insert_to_pool_loop
    if gp1 then StoreByte gp1 0 [gp0]
    if gp1 then Load gp0 1 [gp0]
        Compare gp1 @13
        if Equal then Load PC string_tools.insert_to_pool_return
    if gp0 then Load PC string_tools.insert_to_pool_loop 
    Return

Load gp1 @10 %string_tools.insert_to_pool_return
if gp0 then StoreByte gp1 0 [gp0]
Return 


#_____________________________ get file input _____________________________
#Stores an input into a string
#ends on an escape keypress

Scope getf

def next_string_pointer gp2
def return_counter gp3
def input_char gp1

Pop next_string_pointer               												%string_tools.insert_to_pool_file

Move Zero return_counter 
Push next_string_pointer

    In input_char                  													%string_tools.insert_to_pool_file_loop

    Compare input_char @27 												#escape
    if Equal then Load PC string_tools.insert_to_pool_file_return

    if input_char then StoreByte input_char 0 [next_string_pointer]					%string_tools.insert_to_pool_file_skip_input			
    if input_char then Load next_string_pointer 1 [next_string_pointer]



        Compare input_char @13
   		if Equal then Load PC string_tools.insert_to_pool_file_new_line
    	
    	Compare input_char @8
    	if Equal then Load PC string_tools.insert_to_pool_backspace



    if input_char then Push next_string_pointer
    if input_char then ADD return_counter One

    if next_string_pointer then Load PC string_tools.insert_to_pool_file_loop 

Load input_char @10																	%string_tools.insert_to_pool_file_return
if next_string_pointer then StoreByte input_char 0 [next_string_pointer]

Pop gp0														%string_tools.insert_to_pool_file_return_clean_stack
Compare return_counter Zero
if Equal then Return
SUB return_counter One
Load PC string_tools.insert_to_pool_file_return_clean_stack 





Pop next_string_pointer																%string_tools.insert_to_pool_backspace
StoreByte Zero 0 [next_string_pointer]
SUB return_counter One
if Borrow then Load PC string_tools.insert_to_pool_backspace_end_of_string
Load PC string_tools.insert_to_pool_file_loop


Push next_string_pointer 															%string_tools.insert_to_pool_backspace_end_of_string
Move Zero return_counter
Load PC string_tools.insert_to_pool_file_loop

Load input_char @10 																%string_tools.insert_to_pool_file_new_line
Load PC string_tools.insert_to_pool_file_skip_input