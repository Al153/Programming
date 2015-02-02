

############################################################################
# 						SET UP ROUTINE
############################################################################
def STACK_SIZE 65536   						#makes stack sizes easy to change

array Callstack	STACK_SIZE []  				#initialise runtime variables
array Expression_stack STACK_SIZE []
int stack_length STACK_SIZE 				
int Callstack_ptr Callstack 				

Load Stack_pointer Callstack_ptr 				
Load gp0 stack_length 						
MUL gp0 @4
SUB gp0 @12 
ADD Stack_pointer gp0							

Goto function:main 										
Halt
	
Out @'E'	%Stack_overflow_error 					#Define error handling 
Out @'R'
Out @'R'
Out @'O'
Out @'R'
Out @':'
Out @32
Out @'S'
Out @'T'
Out @'A'
Out @'C'
Out @'K'
Out @32
Out @'O'
Out @'V'
Out @'E'
Out @'R'
Out @'F'
Out @'L'
Out @'O'
Out @'W'
Halt
	
Out @'E' %Recursion_limit_reached 				#deal with a recursion error
Out @'R'
Out @'R'
Out @'O'
Out @'R'
Out @32
Out @'M'
Out @'A'
Out @'X'
Out @'I'
Out @'M'
Out @'U'
Out @'M'
Out @32
Out @'R'
Out @'E'
Out @'C'
Out @'U'
Out @'R'
Out @'S'
Out @'I'
Out @'O'
Out @'N'
Out @32
Out @'D'
Out @'E'
Out @'P'
Out @'T'
Out @'H'
Out @32
Out @'R'
Out @'E'
Out @'A'
Out @'C'
Out @'H'
Out @'E'
Out @'D'
Halt

Out @'E' %DIV_BY_ZERO
Out @'R'
Out @'R'
Out @'O'
Out @'R'
Out @':'
Out @32
Out @'D'
Out @'I'
Out @'V'
Out @'I'
Out @'S'
Out @'I'
Out @'O'
Out @'N'
Out @32
Out @'B'
Out @'Y'
Out @32
Out @'Z'
Out @'E'
Out @'R'
Out @'O'
Halt

byteArray CLL.array_of_string30 2 [10, 0]
int CLL.string30 CLL.array_of_string30
byteArray CLL.array_of_string31 8 [68, 65, 84, 65, 32, 61, 32, 0]
int CLL.string31 CLL.array_of_string31
byteArray CLL.array_of_string10 5 [82, 79, 79, 84, 0]
int CLL.string10 CLL.array_of_string10
byteArray CLL.array_of_string11 57 [95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 83, 84, 65, 82, 84, 73, 78, 71, 32, 83, 89, 83, 84, 69, 77, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 10, 0]
int CLL.string11 CLL.array_of_string11
byteArray CLL.array_of_string12 9 [83, 85, 67, 67, 69, 83, 83, 10, 0]
int CLL.string12 CLL.array_of_string12
byteArray CLL.array_of_string13 9 [70, 65, 73, 76, 85, 82, 69, 10, 0]
int CLL.string13 CLL.array_of_string13
byteArray CLL.array_of_string14 2 [10, 0]
int CLL.string14 CLL.array_of_string14
byteArray CLL.array_of_string15 27 [69, 82, 82, 79, 82, 58, 32, 75, 69, 89, 32, 68, 79, 69, 83, 32, 78, 79, 84, 32, 69, 88, 73, 83, 84, 10, 0]
int CLL.string15 CLL.array_of_string15
byteArray CLL.array_of_string16 4 [79, 107, 10, 0]
int CLL.string16 CLL.array_of_string16
byteArray CLL.array_of_string17 4 [62, 62, 62, 0]
int CLL.string17 CLL.array_of_string17
byteArray CLL.array_of_string18 4 [65, 68, 68, 0]
int CLL.string18 CLL.array_of_string18
int CLL.TREEOPCOUNT 0
byteArray CLL.array_of_string38 15 [9, 72, 97, 115, 104, 32, 118, 97, 108, 117, 101, 32, 61, 32, 0]
int CLL.string38 CLL.array_of_string38
byteArray CLL.array_of_string39 19 [9, 83, 116, 111, 114, 101, 100, 32, 115, 116, 114, 105, 110, 103, 115, 32, 61, 32, 0]
int CLL.string39 CLL.array_of_string39
byteArray CLL.array_of_string19 5 [69, 88, 73, 84, 0]
int CLL.string19 CLL.array_of_string19
array CLL.array_of_MALLOC_TREE_PARTITION 61144 []
int CLL.MALLOC_TREE_PARTITION CLL.array_of_MALLOC_TREE_PARTITION
byteArray CLL.array_of_string34 2 [10, 0]
int CLL.string34 CLL.array_of_string34
byteArray CLL.array_of_string43 16 [78, 85, 76, 76, 32, 76, 69, 70, 84, 32, 76, 73, 78, 75, 10, 0]
int CLL.string43 CLL.array_of_string43
byteArray CLL.array_of_string8 6 [119, 111, 114, 108, 100, 0]
int CLL.string8 CLL.array_of_string8
byteArray CLL.array_of_string9 5 [82, 79, 79, 84, 0]
int CLL.string9 CLL.array_of_string9
byteArray CLL.array_of_string6 2 [10, 0]
int CLL.string6 CLL.array_of_string6
byteArray CLL.array_of_string7 6 [72, 101, 108, 108, 111, 0]
int CLL.string7 CLL.array_of_string7
byteArray CLL.array_of_string4 45 [82, 85, 78, 84, 73, 77, 69, 32, 69, 82, 82, 79, 82, 58, 32, 114, 97, 110, 32, 111, 117, 116, 32, 111, 102, 32, 109, 97, 108, 108, 111, 99, 32, 116, 114, 101, 101, 32, 110, 111, 100, 101, 115, 10, 0]
int CLL.string4 CLL.array_of_string4
byteArray CLL.array_of_string5 2 [32, 0]
int CLL.string5 CLL.array_of_string5
byteArray CLL.array_of_string2 52 [82, 85, 78, 84, 73, 77, 69, 32, 69, 82, 82, 79, 82, 58, 32, 84, 114, 105, 101, 100, 32, 116, 111, 32, 100, 101, 97, 108, 108, 111, 99, 97, 116, 101, 32, 105, 110, 118, 97, 108, 105, 100, 32, 97, 100, 100, 114, 101, 115, 115, 10, 0]
int CLL.string2 CLL.array_of_string2
byteArray CLL.array_of_string3 51 [82, 85, 78, 84, 73, 77, 69, 32, 69, 82, 82, 79, 82, 58, 32, 97, 108, 108, 111, 99, 97, 116, 105, 111, 110, 32, 115, 105, 122, 101, 32, 116, 111, 111, 32, 98, 105, 103, 32, 102, 111, 114, 32, 109, 97, 108, 108, 111, 99, 10, 0]
int CLL.string3 CLL.array_of_string3
byteArray CLL.array_of_string0 43 [82, 85, 78, 84, 73, 77, 69, 32, 69, 82, 82, 79, 82, 58, 32, 117, 110, 97, 98, 108, 101, 32, 116, 111, 32, 97, 108, 108, 111, 99, 97, 116, 101, 32, 109, 101, 109, 111, 114, 121, 32, 10, 0]
int CLL.string0 CLL.array_of_string0
byteArray CLL.array_of_string1 44 [82, 85, 78, 84, 73, 77, 69, 32, 69, 82, 82, 79, 82, 58, 32, 99, 111, 117, 108, 100, 32, 110, 111, 116, 32, 100, 101, 97, 108, 108, 111, 99, 97, 116, 101, 32, 109, 101, 109, 111, 114, 121, 10, 0]
int CLL.string1 CLL.array_of_string1
byteArray CLL.array_of_string29 8 [68, 65, 84, 65, 32, 61, 32, 0]
int CLL.string29 CLL.array_of_string29
byteArray CLL.array_of_string28 33 [69, 82, 82, 79, 82, 32, 73, 78, 32, 83, 79, 82, 84, 58, 32, 69, 77, 80, 84, 89, 32, 82, 73, 71, 72, 84, 32, 78, 79, 68, 69, 10, 0]
int CLL.string28 CLL.array_of_string28
byteArray CLL.array_of_string44 82 [95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 32, 76, 73, 83, 84, 32, 68, 85, 77, 80, 69, 68, 32, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 10, 0]
int CLL.string44 CLL.array_of_string44
byteArray CLL.array_of_string21 9 [82, 69, 84, 82, 73, 69, 86, 69, 0]
int CLL.string21 CLL.array_of_string21
byteArray CLL.array_of_string20 7 [82, 69, 77, 79, 86, 69, 0]
int CLL.string20 CLL.array_of_string20
byteArray CLL.array_of_string23 5 [68, 85, 77, 80, 0]
int CLL.string23 CLL.array_of_string23
byteArray CLL.array_of_string22 10 [82, 69, 66, 65, 76, 65, 78, 67, 69, 0]
int CLL.string22 CLL.array_of_string22
byteArray CLL.array_of_string25 33 [69, 82, 82, 79, 82, 58, 32, 85, 78, 82, 69, 67, 79, 71, 78, 73, 83, 69, 68, 32, 73, 78, 83, 84, 82, 85, 67, 84, 73, 79, 78, 10, 0]
int CLL.string25 CLL.array_of_string25
byteArray CLL.array_of_string24 5 [80, 65, 83, 83, 0]
int CLL.string24 CLL.array_of_string24
byteArray CLL.array_of_string27 32 [69, 82, 82, 79, 82, 32, 73, 78, 32, 83, 79, 82, 84, 58, 32, 69, 77, 80, 84, 89, 32, 76, 69, 70, 84, 32, 78, 79, 68, 69, 10, 0]
int CLL.string27 CLL.array_of_string27
byteArray CLL.array_of_string26 19 [10, 82, 69, 66, 65, 76, 65, 78, 67, 73, 78, 71, 32, 84, 82, 69, 69, 10, 0]
int CLL.string26 CLL.array_of_string26
byteArray CLL.array_of_string41 2 [10, 0]
int CLL.string41 CLL.array_of_string41
byteArray CLL.array_of_string40 2 [58, 0]
int CLL.string40 CLL.array_of_string40
char CLL.demoBUFPTR 0
int CLL.MALLOC_TREE 0
byteArray CLL.array_of_string36 16 [78, 111, 100, 101, 32, 97, 100, 100, 114, 101, 115, 115, 32, 61, 32, 0]
int CLL.string36 CLL.array_of_string36
int CLL.createBalancedTree_rightmost 0
byteArray CLL.array_of_string37 16 [9, 68, 97, 116, 97, 80, 111, 105, 110, 116, 101, 114, 32, 61, 32, 0]
int CLL.string37 CLL.array_of_string37
byteArray CLL.array_of_string42 17 [78, 85, 76, 76, 32, 82, 73, 71, 72, 84, 32, 76, 73, 78, 75, 10, 0]
int CLL.string42 CLL.array_of_string42
byteArray CLL.array_of_BUF 255 []
int CLL.BUF CLL.array_of_BUF
array CLL.array_of_MALLOC_HEAP 65536 []
int CLL.MALLOC_HEAP CLL.array_of_MALLOC_HEAP
byteArray CLL.array_of_string35 82 [95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 32, 68, 85, 77, 80, 73, 78, 71, 32, 76, 73, 83, 84, 32, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 10, 0]
int CLL.string35 CLL.array_of_string35
int CLL.MALLOC_POOL 0
byteArray CLL.array_of_string32 2 [10, 0]
int CLL.string32 CLL.array_of_string32
byteArray CLL.array_of_string33 2 [58, 0]
int CLL.string33 CLL.array_of_string33
																	Scope newDict
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:newDict
SUB Stack_pointer @24 									#OVERHEAD FOR FUNCTION newDict
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 8 [Stack_pointer] 						#STORE GP0
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 20 [Stack_pointer] 						#STORE GP0
Load gp0 20 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:simpleHash 												#CALLING simpleHash
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 16 [Stack_pointer] 						#STORE GP0
Load gp0 20 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:createNewDataEntry 												#CALLING createNewDataEntry
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 12 [Stack_pointer] 						#STORE GP0
Load gp0 16 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:createNewTreeNode 												#CALLING createNewTreeNode
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
																	Scope malloc
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:malloc
SUB Stack_pointer @16 									#OVERHEAD FOR FUNCTION malloc
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 12 [Stack_pointer] 						#STORE GP0
Load gp0 12 [Stack_pointer] 						#LOAD GP0
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifmalloc-0endif
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Pass										%ifmalloc-0endif
Load gp0 CLL.MALLOC_TREE 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:__malloc 												#CALLING __malloc
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load gp0 8 [Stack_pointer] 						#LOAD GP0
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifmalloc-1endif
Load gp0 CLL.string0 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Goto function:quit 												#CALLING quit
Pass										%ifmalloc-1endif
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
																	Scope retrieveFromDict
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:retrieveFromDict
SUB Stack_pointer @24 									#OVERHEAD FOR FUNCTION retrieveFromDict
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 20 [Stack_pointer] 						#STORE GP0
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 12 [Stack_pointer] 						#STORE GP0
Load gp0 20 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:simpleHash 												#CALLING simpleHash
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 16 [Stack_pointer] 						#STORE GP0
Load gp0 16 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:findKey 												#CALLING findKey
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load gp0 8 [Stack_pointer] 						#LOAD GP0
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
if gp0 then Load PC ifretrieveFromDict-2true 									#IF ELSE STATEMENT
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Load PC ifretrieveFromDict-2endif
Pass 										%ifretrieveFromDict-2true
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 20 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:checkKey 												#CALLING checkKey
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
if gp0 then Load PC ifretrieveFromDict-1true 									#IF ELSE STATEMENT
Pass 										%loopretrieveFromDict-0entry
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0
if gp0 then Load PC loopretrieveFromDict-0exit 								#WHILE LOOP
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load gp0 20 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:checkKey 												#CALLING checkKey
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifretrieveFromDict-0endif
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Pass										%ifretrieveFromDict-0endif
Load PC loopretrieveFromDict-0entry					%loopretrieveFromDict-0continue
Pass 										%loopretrieveFromDict-0exit
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Load PC ifretrieveFromDict-1endif
Pass 										%ifretrieveFromDict-1true
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Pass 										%ifretrieveFromDict-1endif           
Pass 										%ifretrieveFromDict-2endif           
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
																	Scope __dalloc
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:__dalloc
SUB Stack_pointer @40 									#OVERHEAD FOR FUNCTION __dalloc
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 36 [Stack_pointer] 						#STORE GP0
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 12 [Stack_pointer] 						#STORE GP0
Load gp6 @3
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 36 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 24 [Stack_pointer] 						#STORE GP0
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 36 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 16 [Stack_pointer] 						#STORE GP0
Load gp0 24 [Stack_pointer] 						#LOAD GP0
Load gp1 @2
DIV gp0 gp1 														#DIVIDE
if DivByZero then Load PC DIV_BY_ZERO
Store gp0 28 [Stack_pointer] 						#STORE GP0
Load gp6 @4
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 36 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 32 [Stack_pointer] 						#STORE GP0
Load gp6 @5
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 36 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 36 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Load gp2 @4294967295  												#COMPARE (NOT LESS)
Compare gp1 gp0
if Less then Move Zero gp2
Move gp2 gp0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 36 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp1 24 [Stack_pointer] 						#LOAD GP0
Load gp0 @4
MUL gp0 gp1 														#MULTIPLY
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
AND gp0 gp1
if gp0 then Load PC if__dalloc-4true 									#IF ELSE STATEMENT
Load gp0 CLL.string2 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Goto function:quit 												#CALLING quit
Load PC if__dalloc-4endif
Pass 										%if__dalloc-4true
Load gp1 32 [Stack_pointer] 						#LOAD GP0
Load gp0 @0
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 36 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
AND gp0 gp1
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC if__dalloc-0endif
Load gp0 @0
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 36 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @1
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Pass										%if__dalloc-0endif
Load gp1 32 [Stack_pointer] 						#LOAD GP0
Load gp0 @0
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 36 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
AND gp0 gp1
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC if__dalloc-1endif
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Pass										%if__dalloc-1endif
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 36 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp1 28 [Stack_pointer] 						#LOAD GP0
Load gp0 @4
MUL gp0 gp1 														#MULTIPLY
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC if__dalloc-2true 									#IF ELSE STATEMENT
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 32 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:__dalloc 												#CALLING __dalloc
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 20 [Stack_pointer] 						#STORE GP0
Load PC if__dalloc-2endif
Pass 										%if__dalloc-2true
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 32 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:__dalloc 												#CALLING __dalloc
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 20 [Stack_pointer] 						#STORE GP0
Pass 										%if__dalloc-2endif           
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 32 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
OR gp0 gp1
NOT gp0 														
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC if__dalloc-3endif
Load gp0 32 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:delete_tree_node 												#CALLING delete_tree_node
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:delete_tree_node 												#CALLING delete_tree_node
Load gp0 @0
Load gp6 @4
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 36 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @5
Load gp6 @5
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 36 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Pass										%if__dalloc-3endif
Load gp0 20 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Pass 										%if__dalloc-4endif           
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC

################## built in function char ##############################################

SUB gp7 @4 		 		 %function:char									#Pops into gp0
Load gp0 Expression_stack [gp7]  				
AND gp0 @255
Store gp0 Expression_stack [gp7] 
ADD gp7 @4
Move Jump PC  			#reads new top of stack from the stack frame
#######################################################################################

#################################### Built in function print_al ####################################
SUB gp7 @4 		 		 %function:print_i										#Pops into gp0
Load gp0 Expression_stack [gp7]  				
Outd gp0
Move Jump PC  			#reads new top of stack from the stack frame
####################################################################################################


############################################## Built in function printf ####################################################################

#heavily optimised printf loop, avoids call stack use entirely

SUB gp7 @4 		 		 %function:printf										#Pops into gp0
Load gp0 Expression_stack [gp7]
						
					
																#increments through addresses printing out until a null char is found (0x0)
LoadByte gp1 0 [gp0] %PrintfLoop
Compare gp1 Zero
if Equal then Move Jump PC							#null char found
Out gp1
ADD gp0 One
Load PC PrintfLoop
############################################################################################################################################
																	Scope reBalanceDictTree
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:reBalanceDictTree
SUB Stack_pointer @28 									#OVERHEAD FOR FUNCTION reBalanceDictTree
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 16 [Stack_pointer] 						#STORE GP0
Load gp0 CLL.string26 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 16 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:sortTree 												#CALLING sortTree
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 12 [Stack_pointer] 						#STORE GP0
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 12 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 24 [Stack_pointer] 						#STORE GP0
Load gp0 24 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:pruneTree 												#CALLING pruneTree
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 24 [Stack_pointer] 						#STORE GP0
Load gp0 24 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:getListLength 												#CALLING getListLength
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 20 [Stack_pointer] 						#STORE GP0
Load gp0 24 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 20 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:createBalancedTree 												#CALLING createBalancedTree
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC

Halt %function:quit
																	Scope malloc_init
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:malloc_init
SUB Stack_pointer @16 									#OVERHEAD FOR FUNCTION malloc_init
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
Load gp0 @0
Store gp0 8 [Stack_pointer] 						#STORE GP0
Pass 										%loopmalloc_init-0entry 		#FOR LOOP
Load gp1 8 [Stack_pointer] 						#LOAD GP0
Load gp0 @61144
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
NOT gp0
if gp0 then Load PC loopmalloc_init-0exit
Load gp1 8 [Stack_pointer] 						#LOAD GP0
Load gp0 @6
ADD gp0 gp1 														#ADD
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @61144
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifmalloc_init-0true 									#IF ELSE STATEMENT
Load gp0 @0
Store gp0 12 [Stack_pointer] 						#STORE GP0
Load PC ifmalloc_init-0endif
Pass 										%ifmalloc_init-0true
Load gp0 CLL.MALLOC_TREE_PARTITION 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp1 8 [Stack_pointer] 						#LOAD GP0
Load gp0 @6
ADD gp0 gp1 														#ADD
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @4
MUL gp0 gp1 														#MULTIPLY
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Store gp0 12 [Stack_pointer] 						#STORE GP0
Pass 										%ifmalloc_init-0endif           
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Load gp6 8 [Stack_pointer] 						#LOAD GP0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 CLL.MALLOC_TREE_PARTITION 											#STORE GP0 GLOBAL RELATIVE
Store gp0 0 [gp6]
Pass 										%loopmalloc_init-0continue
Load gp1 8 [Stack_pointer] 						#LOAD GP0
Load gp0 @6
ADD gp0 gp1 														#ADD
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load PC loopmalloc_init-0entry
Pass 										%loopmalloc_init-0exit
Load gp0 @65536
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 CLL.MALLOC_HEAP 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:create_tree_node 												#CALLING create_tree_node
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 CLL.MALLOC_TREE 										#STORE GP0 GLOBAL
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
																	Scope demoSystem
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:demoSystem
SUB Stack_pointer @24 									#OVERHEAD FOR FUNCTION demoSystem
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
Load gp0 CLL.string9 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 CLL.string10 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:newDict 												#CALLING newDict
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 12 [Stack_pointer] 						#STORE GP0
Load gp0 CLL.string11 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Pass 										%loopdemoSystem-0entry
Load gp0 @1
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0
if gp0 then Load PC loopdemoSystem-0exit 								#WHILE LOOP
Goto function:readIn 												#CALLING readIn
Goto function:getDemoOp 												#CALLING getDemoOp
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load gp1 8 [Stack_pointer] 						#LOAD GP0
Load gp0 @1
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifdemoSystem-0endif
Load PC loopdemoSystem-0exit
Pass										%ifdemoSystem-0endif
Load gp1 8 [Stack_pointer] 						#LOAD GP0
Load gp0 @2
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifdemoSystem-7true 									#IF ELSE STATEMENT
Load gp1 8 [Stack_pointer] 						#LOAD GP0
Load gp0 @3
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifdemoSystem-6true 									#IF ELSE STATEMENT
Load gp1 8 [Stack_pointer] 						#LOAD GP0
Load gp0 @4
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifdemoSystem-5true 									#IF ELSE STATEMENT
Load gp1 8 [Stack_pointer] 						#LOAD GP0
Load gp0 @5
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifdemoSystem-4true 									#IF ELSE STATEMENT
Load gp1 8 [Stack_pointer] 						#LOAD GP0
Load gp0 @6
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifdemoSystem-3endif
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:dumpDict 												#CALLING dumpDict
Pass										%ifdemoSystem-3endif
Load PC ifdemoSystem-4endif
Pass 										%ifdemoSystem-4true
Move Stack_pointer gp0 											#GETTING POINTER
ADD gp0 @12
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:reBalanceDictTree 												#CALLING reBalanceDictTree
Pass 										%ifdemoSystem-4endif           
Load PC ifdemoSystem-5endif
Pass 										%ifdemoSystem-5true
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:getWord 												#CALLING getWord
Goto function:retrieveFromDict 												#CALLING retrieveFromDict
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 20 [Stack_pointer] 						#STORE GP0
Load gp0 20 [Stack_pointer] 						#LOAD GP0
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
if gp0 then Load PC ifdemoSystem-2true 									#IF ELSE STATEMENT
Load gp0 CLL.string15 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load PC ifdemoSystem-2endif
Pass 										%ifdemoSystem-2true
Load gp0 20 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 CLL.string14 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Pass 										%ifdemoSystem-2endif           
Pass 										%ifdemoSystem-5endif           
Load PC ifdemoSystem-6endif
Pass 										%ifdemoSystem-6true
Goto function:getWord 												#CALLING getWord
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 16 [Stack_pointer] 						#STORE GP0
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 16 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:deleteFromDict 												#CALLING deleteFromDict
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
if gp0 then Load PC ifdemoSystem-1true 									#IF ELSE STATEMENT
Load gp0 CLL.string13 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load PC ifdemoSystem-1endif
Pass 										%ifdemoSystem-1true
Load gp0 CLL.string12 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Pass 										%ifdemoSystem-1endif           
Pass 										%ifdemoSystem-6endif           
Load PC ifdemoSystem-7endif
Pass 										%ifdemoSystem-7true
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:getWord 												#CALLING getWord
Goto function:getWord 												#CALLING getWord
Goto function:newString 												#CALLING newString
Goto function:insertToDict 												#CALLING insertToDict
Pass 										%ifdemoSystem-7endif           
Load gp0 CLL.string16 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load PC loopdemoSystem-0entry					%loopdemoSystem-0continue
Pass 										%loopdemoSystem-0exit
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
																	Scope getLength
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:getLength
SUB Stack_pointer @16 									#OVERHEAD FOR FUNCTION getLength
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 12 [Stack_pointer] 						#STORE GP0
Load gp0 @0
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load gp0 @0
Store gp0 8 [Stack_pointer] 						#STORE GP0
Pass 										%loopgetLength-0entry 		#FOR LOOP
Load gp6 8 [Stack_pointer] 						#LOAD GP0
ADD gp6 12 [Stack_pointer]							#LOAD GP0 RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0
if gp0 then Load PC loopgetLength-0exit
Load PC loopgetLength-0continue
Pass 										%loopgetLength-0continue
Load gp1 8 [Stack_pointer] 						#LOAD GP0
Load gp0 @1
ADD gp0 gp1 														#ADD
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load PC loopgetLength-0entry
Pass 										%loopgetLength-0exit
Load gp1 8 [Stack_pointer] 						#LOAD GP0
Load gp0 @1
ADD gp0 gp1 														#ADD
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
																	Scope create_tree_node
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:create_tree_node
SUB Stack_pointer @24 									#OVERHEAD FOR FUNCTION create_tree_node
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 8 [Stack_pointer] 						#STORE GP0
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 20 [Stack_pointer] 						#STORE GP0
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 16 [Stack_pointer] 						#STORE GP0
Load gp0 CLL.MALLOC_POOL 										#LOAD GP0 GLOBAL
Store gp0 12 [Stack_pointer] 						#STORE GP0
Load gp0 12 [Stack_pointer] 						#LOAD GP0
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
if gp0 then Load PC ifcreate_tree_node-0true 									#IF ELSE STATEMENT
Load gp0 CLL.string4 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Goto function:quit 												#CALLING quit
Load PC ifcreate_tree_node-0endif
Pass 										%ifcreate_tree_node-0true
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 12 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 CLL.MALLOC_POOL 										#STORE GP0 GLOBAL
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 12 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @0
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 12 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 20 [Stack_pointer] 						#LOAD GP0
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 12 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 16 [Stack_pointer] 						#LOAD GP0
Load gp6 @3
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 12 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @0
Load gp6 @4
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 12 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @0
Load gp6 @5
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 12 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Pass 										%ifcreate_tree_node-0endif           
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC

##################### GETC ###############################################
#returns a char
In gp0 %function:getc #gets a char without waiting (state of keyboard)
Store gp0 Expression_stack [gp7]
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Move Jump PC
##########################################################################
																	Scope readIn
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:readIn
SUB Stack_pointer @12 									#OVERHEAD FOR FUNCTION readIn
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
Load gp0 @0
AND gp0 @255 													  #CASTING INT TO CHAR
StoreByte gp0 CLL.demoBUFPTR 									#STORE GP0 GLOBAL (CHAR)
Load gp0 CLL.string17 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 @10
AND gp0 @255 													  #CASTING INT TO CHAR
StoreByte gp0 10 [Stack_pointer] 					#STORE GP0 (CHAR)
Load gp0 @0
AND gp0 @255 													  #CASTING INT TO CHAR
StoreByte gp0 11 [Stack_pointer] 					#STORE GP0 (CHAR)
Load gp0 @8
AND gp0 @255 													  #CASTING INT TO CHAR
StoreByte gp0 8 [Stack_pointer] 					#STORE GP0 (CHAR)
Pass 										%loopreadIn-0entry
Load gp0 @1
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0
if gp0 then Load PC loopreadIn-0exit 								#WHILE LOOP
Goto function:getw 												#CALLING getw
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
StoreByte gp0 9 [Stack_pointer] 					#STORE GP0 (CHAR)
LoadByte gp0 9 [Stack_pointer] 					#LOAD GP0 (CHAR)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:putc 												#CALLING putc
LoadByte gp0 9 [Stack_pointer] 					#LOAD GP0 (CHAR)
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @13
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifreadIn-1true 									#IF ELSE STATEMENT
LoadByte gp0 9 [Stack_pointer] 					#LOAD GP0 (CHAR)
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @8
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifreadIn-0endif
Load gp0 @0
AND gp0 @255 													  #CASTING INT TO CHAR
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
LoadByte gp0 CLL.demoBUFPTR 									#LOAD GP0 GLOBAL (CHAR)
Move gp0 gp6 						#PUSH gp0 POP gp6
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
ADD gp6 CLL.BUF 											#STORE GP0 GLOBAL RELATIVE (CHAR)
StoreByte gp0 0 [gp6]
LoadByte gp0 CLL.demoBUFPTR 									#LOAD GP0 GLOBAL (CHAR)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @1
AND gp0 @255 													  #CASTING INT TO CHAR
Move gp0 gp1 						#PUSH gp0 POP gp1
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
AND gp0 @255 														#SUBTRACT (CHARS)
AND gp1 @255
SUB gp0 gp1
AND gp0 @255
Load Flags_reset @4294967287  
StoreByte gp0 CLL.demoBUFPTR 									#STORE GP0 GLOBAL (CHAR)
LoadByte gp0 11 [Stack_pointer] 					#LOAD GP0 (CHAR)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:putc 												#CALLING putc
LoadByte gp0 8 [Stack_pointer] 					#LOAD GP0 (CHAR)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:putc 												#CALLING putc
Load PC loopreadIn-0continue
Pass										%ifreadIn-0endif
LoadByte gp0 9 [Stack_pointer] 					#LOAD GP0 (CHAR)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
LoadByte gp0 CLL.demoBUFPTR 									#LOAD GP0 GLOBAL (CHAR)
Move gp0 gp6 						#PUSH gp0 POP gp6
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
ADD gp6 CLL.BUF 											#STORE GP0 GLOBAL RELATIVE (CHAR)
StoreByte gp0 0 [gp6]
LoadByte gp0 CLL.demoBUFPTR 									#LOAD GP0 GLOBAL (CHAR)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @1
AND gp0 @255 													  #CASTING INT TO CHAR
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD (CHARS)
AND gp0 @255
StoreByte gp0 CLL.demoBUFPTR 									#STORE GP0 GLOBAL (CHAR)
Load PC ifreadIn-1endif
Pass 										%ifreadIn-1true
Load gp0 @0
AND gp0 @255 													  #CASTING INT TO CHAR
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
LoadByte gp0 CLL.demoBUFPTR 									#LOAD GP0 GLOBAL (CHAR)
Move gp0 gp6 						#PUSH gp0 POP gp6
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
ADD gp6 CLL.BUF 											#STORE GP0 GLOBAL RELATIVE (CHAR)
StoreByte gp0 0 [gp6]
LoadByte gp0 10 [Stack_pointer] 					#LOAD GP0 (CHAR)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:putc 												#CALLING putc
Load PC loopreadIn-0exit
Pass 										%ifreadIn-1endif           
Load PC loopreadIn-0entry					%loopreadIn-0continue
Pass 										%loopreadIn-0exit
Pass 										%loopreadIn-1entry
LoadByte gp0 CLL.demoBUFPTR 									#LOAD GP0 GLOBAL (CHAR)
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0
if gp0 then Load PC loopreadIn-1exit 								#WHILE LOOP
Load gp0 @0
AND gp0 @255 													  #CASTING INT TO CHAR
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
LoadByte gp0 CLL.demoBUFPTR 									#LOAD GP0 GLOBAL (CHAR)
Move gp0 gp6 						#PUSH gp0 POP gp6
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
ADD gp6 CLL.BUF 											#STORE GP0 GLOBAL RELATIVE (CHAR)
StoreByte gp0 0 [gp6]
LoadByte gp0 CLL.demoBUFPTR 									#LOAD GP0 GLOBAL (CHAR)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @1
AND gp0 @255 													  #CASTING INT TO CHAR
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD (CHARS)
AND gp0 @255
StoreByte gp0 CLL.demoBUFPTR 									#STORE GP0 GLOBAL (CHAR)
Load PC loopreadIn-1entry					%loopreadIn-1continue
Pass 										%loopreadIn-1exit
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
																	Scope editDict
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:editDict
SUB Stack_pointer @20 									#OVERHEAD FOR FUNCTION editDict
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 12 [Stack_pointer] 						#STORE GP0
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 8 [Stack_pointer] 						#STORE GP0
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 16 [Stack_pointer] 						#STORE GP0
Load gp0 16 [Stack_pointer] 						#LOAD GP0
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 12 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifeditDict-3true 									#IF ELSE STATEMENT
Load gp0 16 [Stack_pointer] 						#LOAD GP0
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 12 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Move Zero gp2 														#COMPARE (IS GREATER)
Compare gp1 gp0
if Greater then Load gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifeditDict-2true 									#IF ELSE STATEMENT
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 12 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
if gp0 then Load PC ifeditDict-1true 									#IF ELSE STATEMENT
Load gp0 16 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:createNewTreeNode 												#CALLING createNewTreeNode
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 12 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load PC ifeditDict-1endif
Pass 										%ifeditDict-1true
Load gp0 16 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 12 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:editDict 												#CALLING editDict
Pass 										%ifeditDict-1endif           
Load PC ifeditDict-2endif
Pass 										%ifeditDict-2true
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 12 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
if gp0 then Load PC ifeditDict-0true 									#IF ELSE STATEMENT
Load gp0 16 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:createNewTreeNode 												#CALLING createNewTreeNode
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 12 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load PC ifeditDict-0endif
Pass 										%ifeditDict-0true
Load gp0 16 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 12 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:editDict 												#CALLING editDict
Pass 										%ifeditDict-0endif           
Pass 										%ifeditDict-2endif           
Load PC ifeditDict-3endif
Pass 										%ifeditDict-3true
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Load gp6 @3
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 12 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Pass 										%ifeditDict-3endif           
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
																	Scope getListLength
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:getListLength
SUB Stack_pointer @20 									#OVERHEAD FOR FUNCTION getListLength
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 16 [Stack_pointer] 						#STORE GP0
Load gp0 @1
Store gp0 12 [Stack_pointer] 						#STORE GP0
Load gp0 16 [Stack_pointer] 						#LOAD GP0
Store gp0 8 [Stack_pointer] 						#STORE GP0
Pass 										%loopgetListLength-0entry
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp1 0 [gp6]
Load gp0 16 [Stack_pointer] 						#LOAD GP0
Load  gp2 @4294967295 												#COMPARE (NOT EQUAL)
Compare gp1 gp0 
if Equal then Move Zero gp2
Move gp2 gp0
NOT gp0
if gp0 then Load PC loopgetListLength-0exit 								#WHILE LOOP
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load gp1 12 [Stack_pointer] 						#LOAD GP0
Load gp0 @1
ADD gp0 gp1 														#ADD
Store gp0 12 [Stack_pointer] 						#STORE GP0
Load PC loopgetListLength-0entry					%loopgetListLength-0continue
Pass 										%loopgetListLength-0exit
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC

########################## PUTC (char) ########################################
SUB gp7 @4 															%function:putc
Load gp0  Expression_stack [gp7]
Out gp0
Move Jump PC
################################################################################																	Scope print_pool
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:print_pool
SUB Stack_pointer @12 									#OVERHEAD FOR FUNCTION print_pool
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load gp0 8 [Stack_pointer] 						#LOAD GP0
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifprint_pool-0endif
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:print_i 												#CALLING print_i
Load gp0 CLL.string5 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:print_i 												#CALLING print_i
Load gp0 CLL.string6 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:print_pool 												#CALLING print_pool
Pass										%ifprint_pool-0endif
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
																	Scope checkKey
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:checkKey
SUB Stack_pointer @20 									#OVERHEAD FOR FUNCTION checkKey
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 12 [Stack_pointer] 						#STORE GP0
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 16 [Stack_pointer] 						#STORE GP0
Load gp0 @0
Store gp0 8 [Stack_pointer] 						#STORE GP0
Pass 										%loopcheckKey-0entry
Load gp6 8 [Stack_pointer] 						#LOAD GP0
ADD gp6 16 [Stack_pointer]							#LOAD GP0 RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0
if gp0 then Load PC loopcheckKey-0exit 								#WHILE LOOP
Load gp6 8 [Stack_pointer] 						#LOAD GP0
ADD gp6 16 [Stack_pointer]							#LOAD GP0 RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp6 8 [Stack_pointer] 						#LOAD GP0
ADD gp6 12 [Stack_pointer]							#LOAD GP0 RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
Load  gp2 @4294967295 												#COMPARE (NOT EQUAL)
Compare gp1 gp0 
if Equal then Move Zero gp2
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifcheckKey-0endif
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Pass										%ifcheckKey-0endif
Load gp1 8 [Stack_pointer] 						#LOAD GP0
Load gp0 @1
ADD gp0 gp1 														#ADD
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load PC loopcheckKey-0entry					%loopcheckKey-0continue
Pass 										%loopcheckKey-0exit
Load gp6 8 [Stack_pointer] 						#LOAD GP0
ADD gp6 12 [Stack_pointer]							#LOAD GP0 RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifcheckKey-1endif
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Pass										%ifcheckKey-1endif
Load gp0 @1
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
																	Scope copyString
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:copyString
SUB Stack_pointer @28 									#OVERHEAD FOR FUNCTION copyString
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 24 [Stack_pointer] 						#STORE GP0
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 20 [Stack_pointer] 						#STORE GP0
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 12 [Stack_pointer] 						#STORE GP0
Load gp0 @1
Store gp0 16 [Stack_pointer] 						#STORE GP0
Load gp0 @0
Store gp0 8 [Stack_pointer] 						#STORE GP0
Pass 										%loopcopyString-0entry 		#FOR LOOP
Load gp1 8 [Stack_pointer] 						#LOAD GP0
Load gp0 24 [Stack_pointer] 						#LOAD GP0
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
NOT gp0
if gp0 then Load PC loopcopyString-0exit
Load gp0 16 [Stack_pointer] 						#LOAD GP0
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
if gp0 then Load PC ifcopyString-1true 									#IF ELSE STATEMENT
Load gp0 @0
AND gp0 @255 													  #CASTING INT TO CHAR
Load gp6 8 [Stack_pointer] 						#LOAD GP0
ADD gp6 20 [Stack_pointer] 							#STORE GP0 RELATIVE (CHAR)
StoreByte gp0 0 [gp6]
Load PC ifcopyString-1endif
Pass 										%ifcopyString-1true
Load gp6 8 [Stack_pointer] 						#LOAD GP0
ADD gp6 12 [Stack_pointer]							#LOAD GP0 RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
Load gp6 8 [Stack_pointer] 						#LOAD GP0
ADD gp6 20 [Stack_pointer] 							#STORE GP0 RELATIVE (CHAR)
StoreByte gp0 0 [gp6]
Load gp6 8 [Stack_pointer] 						#LOAD GP0
ADD gp6 12 [Stack_pointer]							#LOAD GP0 RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifcopyString-0endif
Load gp0 @0
Store gp0 16 [Stack_pointer] 						#STORE GP0
Pass										%ifcopyString-0endif
Pass 										%ifcopyString-1endif           
Pass 										%loopcopyString-0continue
Load gp1 8 [Stack_pointer] 						#LOAD GP0
Load gp0 @1
ADD gp0 gp1 														#ADD
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load PC loopcopyString-0entry
Pass 										%loopcopyString-0exit
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
																	Scope main
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:main
SUB Stack_pointer @12 									#OVERHEAD FOR FUNCTION main
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
Load gp0 CLL.MALLOC_TREE_PARTITION 										#LOAD GP0 GLOBAL
Store gp0 CLL.MALLOC_POOL 										#STORE GP0 GLOBAL
Load gp0 @0
AND gp0 @255 													  #CASTING INT TO CHAR
StoreByte gp0 CLL.demoBUFPTR 									#STORE GP0 GLOBAL (CHAR)
Load gp0 @32
Store gp0 CLL.TREEOPCOUNT 										#STORE GP0 GLOBAL
Goto function:malloc_init 												#CALLING malloc_init
Load gp0 CLL.string7 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 CLL.string8 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:newDict 												#CALLING newDict
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 8 [Stack_pointer] 						#STORE GP0
Goto function:demoSystem 												#CALLING demoSystem
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
																	Scope createNewDataEntry
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:createNewDataEntry
SUB Stack_pointer @28 									#OVERHEAD FOR FUNCTION createNewDataEntry
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 12 [Stack_pointer] 						#STORE GP0
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 24 [Stack_pointer] 						#STORE GP0
Load gp0 24 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:getLength 												#CALLING getLength
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 20 [Stack_pointer] 						#STORE GP0
Load gp1 20 [Stack_pointer] 						#LOAD GP0
Load gp0 @3
AND gp0 gp1 														#AND
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
if gp0 then Load PC ifcreateNewDataEntry-0true 									#IF ELSE STATEMENT
Load gp0 20 [Stack_pointer] 						#LOAD GP0
Load gp1 @2
SHR gp0 gp1 														#SHIFT RIGHT
Store gp0 20 [Stack_pointer] 						#STORE GP0
Load PC ifcreateNewDataEntry-0endif
Pass 										%ifcreateNewDataEntry-0true
Load gp0 @1
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 20 [Stack_pointer] 						#LOAD GP0
Load gp1 @2
SHR gp0 gp1 														#SHIFT RIGHT
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Store gp0 20 [Stack_pointer] 						#STORE GP0
Pass 										%ifcreateNewDataEntry-0endif           
Load gp0 20 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:malloc 												#CALLING malloc
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load gp0 24 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 20 [Stack_pointer] 						#LOAD GP0
Load gp1 @2
SHL gp0 gp1 														#SHIFT LEFT
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:copyString 												#CALLING copyString
Load gp0 @4
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:malloc 												#CALLING malloc
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 16 [Stack_pointer] 						#STORE GP0
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 16 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 16 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @0
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 16 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 16 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
																	Scope dalloc
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:dalloc
SUB Stack_pointer @16 									#OVERHEAD FOR FUNCTION dalloc
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 12 [Stack_pointer] 						#STORE GP0
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 CLL.MALLOC_TREE 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:__dalloc 												#CALLING __dalloc
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load gp0 8 [Stack_pointer] 						#LOAD GP0
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifdalloc-0endif
Load gp0 CLL.string1 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Goto function:quit 												#CALLING quit
Pass										%ifdalloc-0endif
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
																	Scope createBalancedTree
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:createBalancedTree
SUB Stack_pointer @32 									#OVERHEAD FOR FUNCTION createBalancedTree
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 24 [Stack_pointer] 						#STORE GP0
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load gp0 24 [Stack_pointer] 						#LOAD GP0
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
if gp0 then Load PC ifcreateBalancedTree-3true 									#IF ELSE STATEMENT
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Load PC ifcreateBalancedTree-3endif
Pass 										%ifcreateBalancedTree-3true
Load gp0 24 [Stack_pointer] 						#LOAD GP0
Load gp1 @2
DIV gp0 gp1 														#DIVIDE
if DivByZero then Load PC DIV_BY_ZERO
Store gp0 20 [Stack_pointer] 						#STORE GP0
Load gp0 20 [Stack_pointer] 						#LOAD GP0
Store gp0 12 [Stack_pointer] 						#STORE GP0
Load gp0 20 [Stack_pointer] 						#LOAD GP0
Load gp1 @1
SHL gp0 gp1 														#SHIFT LEFT
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 24 [Stack_pointer] 						#LOAD GP0
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifcreateBalancedTree-0endif
Load gp0 20 [Stack_pointer] 						#LOAD GP0
Load gp1 @1
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Store gp0 20 [Stack_pointer] 						#STORE GP0
Pass										%ifcreateBalancedTree-0endif
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 20 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:createBalancedTree 												#CALLING createBalancedTree
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 16 [Stack_pointer] 						#STORE GP0
Load gp0 20 [Stack_pointer] 						#LOAD GP0
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifcreateBalancedTree-1endif
Load gp0 CLL.createBalancedTree_rightmost 										#LOAD GP0 GLOBAL
Store gp0 8 [Stack_pointer] 						#STORE GP0
Pass										%ifcreateBalancedTree-1endif
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:createBalancedTree 												#CALLING createBalancedTree
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 28 [Stack_pointer] 						#STORE GP0
Load gp0 12 [Stack_pointer] 						#LOAD GP0
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifcreateBalancedTree-2endif
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 CLL.createBalancedTree_rightmost 										#STORE GP0 GLOBAL
Pass										%ifcreateBalancedTree-2endif
Load gp0 16 [Stack_pointer] 						#LOAD GP0
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 28 [Stack_pointer] 						#LOAD GP0
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Pass 										%ifcreateBalancedTree-3endif           
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
																	Scope createNewTreeNode
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:createNewTreeNode
SUB Stack_pointer @28 									#OVERHEAD FOR FUNCTION createNewTreeNode
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 24 [Stack_pointer] 						#STORE GP0
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 12 [Stack_pointer] 						#STORE GP0
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 8 [Stack_pointer] 						#STORE GP0
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 20 [Stack_pointer] 						#STORE GP0
Load gp0 @4
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:malloc 												#CALLING malloc
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 16 [Stack_pointer] 						#STORE GP0
Load gp0 20 [Stack_pointer] 						#LOAD GP0
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 16 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 16 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 16 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 24 [Stack_pointer] 						#LOAD GP0
Load gp6 @3
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 16 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 16 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
																	Scope insertToDict
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:insertToDict
SUB Stack_pointer @28 									#OVERHEAD FOR FUNCTION insertToDict
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 12 [Stack_pointer] 						#STORE GP0
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 24 [Stack_pointer] 						#STORE GP0
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 16 [Stack_pointer] 						#STORE GP0
Load gp0 CLL.TREEOPCOUNT 										#LOAD GP0 GLOBAL
Load gp1 @1
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Store gp0 CLL.TREEOPCOUNT 										#STORE GP0 GLOBAL
Load gp0 CLL.TREEOPCOUNT 										#LOAD GP0 GLOBAL
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifinsertToDict-0endif
Load gp0 @32
Store gp0 CLL.TREEOPCOUNT 										#STORE GP0 GLOBAL
Move Stack_pointer gp0 											#GETTING POINTER
ADD gp0 @16
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:reBalanceDictTree 												#CALLING reBalanceDictTree
Pass										%ifinsertToDict-0endif
Load gp0 24 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:simpleHash 												#CALLING simpleHash
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 20 [Stack_pointer] 						#STORE GP0
Load gp0 20 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 16 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:findKey 												#CALLING findKey
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load gp0 CLL.string29 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:print_i 												#CALLING print_i
Load gp0 CLL.string30 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 8 [Stack_pointer] 						#LOAD GP0
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
if gp0 then Load PC ifinsertToDict-3true 									#IF ELSE STATEMENT
Load gp0 20 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 24 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:createNewDataEntry 												#CALLING createNewDataEntry
Load gp0 16 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:editDict 												#CALLING editDict
Load PC ifinsertToDict-3endif
Pass 										%ifinsertToDict-3true
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 24 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:checkKey 												#CALLING checkKey
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
if gp0 then Load PC ifinsertToDict-2true 									#IF ELSE STATEMENT
Pass 										%loopinsertToDict-0entry
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0
if gp0 then Load PC loopinsertToDict-0exit 								#WHILE LOOP
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load gp0 24 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:checkKey 												#CALLING checkKey
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifinsertToDict-1endif
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Pass										%ifinsertToDict-1endif
Load PC loopinsertToDict-0entry					%loopinsertToDict-0continue
Pass 										%loopinsertToDict-0exit
Load gp0 24 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:createNewDataEntry 												#CALLING createNewDataEntry
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load PC ifinsertToDict-2endif
Pass 										%ifinsertToDict-2true
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Pass 										%ifinsertToDict-2endif           
Pass 										%ifinsertToDict-3endif           
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
																	Scope sortTree
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:sortTree
SUB Stack_pointer @24 									#OVERHEAD FOR FUNCTION sortTree
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
if gp0 then Load PC ifsortTree-2true 									#IF ELSE STATEMENT
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
if gp0 then Load PC ifsortTree-1true 									#IF ELSE STATEMENT
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Store gp0 12 [Stack_pointer] 						#STORE GP0
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load PC ifsortTree-1endif
Pass 										%ifsortTree-1true
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:sortTree 												#CALLING sortTree
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 12 [Stack_pointer] 						#STORE GP0
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 12 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 16 [Stack_pointer] 						#STORE GP0
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 16 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 16 [Stack_pointer] 						#LOAD GP0
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 12 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Pass 										%ifsortTree-1endif           
Load PC ifsortTree-2endif
Pass 										%ifsortTree-2true
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:sortTree 												#CALLING sortTree
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
if gp0 then Load PC ifsortTree-0true 									#IF ELSE STATEMENT
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Store gp0 12 [Stack_pointer] 						#STORE GP0
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 16 [Stack_pointer] 						#STORE GP0
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 16 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 20 [Stack_pointer] 						#STORE GP0
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 20 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 16 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load PC ifsortTree-0endif
Pass 										%ifsortTree-0true
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:sortTree 												#CALLING sortTree
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 12 [Stack_pointer] 						#STORE GP0
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 12 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 20 [Stack_pointer] 						#STORE GP0
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 20 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 20 [Stack_pointer] 						#STORE GP0
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 20 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 20 [Stack_pointer] 						#LOAD GP0
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 12 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 16 [Stack_pointer] 						#STORE GP0
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 16 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 16 [Stack_pointer] 						#STORE GP0
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 16 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Pass 										%ifsortTree-0endif           
Pass 										%ifsortTree-2endif           
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifsortTree-3endif
Load gp0 CLL.string27 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Pass										%ifsortTree-3endif
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifsortTree-4endif
Load gp0 CLL.string28 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Pass										%ifsortTree-4endif
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
																	Scope __malloc
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:__malloc
SUB Stack_pointer @32 									#OVERHEAD FOR FUNCTION __malloc
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 28 [Stack_pointer] 						#STORE GP0
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load gp6 @3
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 12 [Stack_pointer] 						#STORE GP0
Load gp1 28 [Stack_pointer] 						#LOAD GP0
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Move Zero gp2 														#COMPARE (IS GREATER)
Compare gp1 gp0
if Greater then Load gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC if__malloc-11true 									#IF ELSE STATEMENT
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC if__malloc-0endif
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Pass										%if__malloc-0endif
Load gp0 28 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Load gp1 @2
DIV gp0 gp1 														#DIVIDE
if DivByZero then Load PC DIV_BY_ZERO
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
Move Zero gp2 														#COMPARE (IS GREATER)
Compare gp1 gp0
if Greater then Load gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC if__malloc-2endif
Load gp6 @4
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC if__malloc-1endif
Load gp0 @1
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Pass										%if__malloc-1endif
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Pass										%if__malloc-2endif
Load gp1 12 [Stack_pointer] 						#LOAD GP0
Load gp0 @1
Move Zero gp2 														#COMPARE (IS GREATER)
Compare gp1 gp0
if Greater then Load gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC if__malloc-10endif
Load gp6 @4
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 24 [Stack_pointer] 						#STORE GP0
Load gp0 24 [Stack_pointer] 						#LOAD GP0
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC if__malloc-3endif
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:split_tree_node 												#CALLING split_tree_node
Load gp6 @4
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 24 [Stack_pointer] 						#STORE GP0
Pass										%if__malloc-3endif
Load gp6 @5
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 20 [Stack_pointer] 						#STORE GP0
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 24 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC if__malloc-6endif
Load gp0 24 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 28 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:__malloc 												#CALLING __malloc
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 16 [Stack_pointer] 						#STORE GP0
Load gp0 16 [Stack_pointer] 						#LOAD GP0
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC if__malloc-5endif
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 24 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 20 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
AND gp0 gp1 														#AND
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC if__malloc-4endif
Load gp0 @1
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Pass										%if__malloc-4endif
Load gp0 16 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Pass										%if__malloc-5endif
Pass										%if__malloc-6endif
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 20 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC if__malloc-9endif
Load gp0 20 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 28 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:__malloc 												#CALLING __malloc
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 16 [Stack_pointer] 						#STORE GP0
Load gp0 16 [Stack_pointer] 						#LOAD GP0
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC if__malloc-8endif
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 24 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 20 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
AND gp0 gp1 														#AND
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC if__malloc-7endif
Load gp0 @1
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Pass										%if__malloc-7endif
Load gp0 16 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Pass										%if__malloc-8endif
Pass										%if__malloc-9endif
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Pass										%if__malloc-10endif
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Load PC if__malloc-11endif
Pass 										%if__malloc-11true
Load gp0 CLL.string3 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Goto function:quit 												#CALLING quit
Pass 										%if__malloc-11endif           
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
																	Scope simpleHash
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:simpleHash
SUB Stack_pointer @20 									#OVERHEAD FOR FUNCTION simpleHash
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 16 [Stack_pointer] 						#STORE GP0
Load gp0 @0
Store gp0 12 [Stack_pointer] 						#STORE GP0
Load gp0 @0
Store gp0 8 [Stack_pointer] 						#STORE GP0
Pass 										%loopsimpleHash-0entry
Load gp6 8 [Stack_pointer] 						#LOAD GP0
ADD gp6 16 [Stack_pointer]							#LOAD GP0 RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0
if gp0 then Load PC loopsimpleHash-0exit 								#WHILE LOOP
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Load gp1 @6
SHL gp0 gp1 														#SHIFT LEFT
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Load gp1 @16
SHL gp0 gp1 														#SHIFT LEFT
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Load gp1 12 [Stack_pointer] 						#LOAD GP0
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp6 8 [Stack_pointer] 						#LOAD GP0
ADD gp6 16 [Stack_pointer]							#LOAD GP0 RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Store gp0 12 [Stack_pointer] 						#STORE GP0
Load gp1 8 [Stack_pointer] 						#LOAD GP0
Load gp0 @1
ADD gp0 gp1 														#ADD
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load PC loopsimpleHash-0entry					%loopsimpleHash-0continue
Pass 										%loopsimpleHash-0exit
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
																	Scope findKey
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:findKey
SUB Stack_pointer @16 									#OVERHEAD FOR FUNCTION findKey
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 8 [Stack_pointer] 						#STORE GP0
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 12 [Stack_pointer] 						#STORE GP0
Load gp0 8 [Stack_pointer] 						#LOAD GP0
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC iffindKey-0endif
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Pass										%iffindKey-0endif
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC iffindKey-1endif
Load gp6 @3
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Pass										%iffindKey-1endif
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Move Zero gp2 														#COMPARE (IS GREATER)
Compare gp1 gp0
if Greater then Load gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC iffindKey-2endif
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:findKey 												#CALLING findKey
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Pass										%iffindKey-2endif
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:findKey 												#CALLING findKey
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC

############################## GETW ################################
#returns a char
In gp0 %function:getw 				#waits for a user to press a key
Compare gp0 Zero
if Equal then Load PC function:getw
Store gp0 Expression_stack [gp7]

ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Move Jump PC
###################################################################
																	Scope newString
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:newString
SUB Stack_pointer @20 									#OVERHEAD FOR FUNCTION newString
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 12 [Stack_pointer] 						#STORE GP0
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:getLength 												#CALLING getLength
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 16 [Stack_pointer] 						#STORE GP0
Load gp1 16 [Stack_pointer] 						#LOAD GP0
Load gp0 @3
AND gp0 gp1 														#AND
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
if gp0 then Load PC ifnewString-0true 									#IF ELSE STATEMENT
Load gp0 16 [Stack_pointer] 						#LOAD GP0
Load gp1 @2
SHR gp0 gp1 														#SHIFT RIGHT
Store gp0 16 [Stack_pointer] 						#STORE GP0
Load PC ifnewString-0endif
Pass 										%ifnewString-0true
Load gp0 @1
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 16 [Stack_pointer] 						#LOAD GP0
Load gp1 @2
SHR gp0 gp1 														#SHIFT RIGHT
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Store gp0 16 [Stack_pointer] 						#STORE GP0
Pass 										%ifnewString-0endif           
Load gp0 16 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:malloc 												#CALLING malloc
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 16 [Stack_pointer] 						#LOAD GP0
Load gp1 @2
SHL gp0 gp1 														#SHIFT LEFT
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:copyString 												#CALLING copyString
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
																	Scope pruneTree
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:pruneTree
SUB Stack_pointer @28 									#OVERHEAD FOR FUNCTION pruneTree
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 16 [Stack_pointer] 						#STORE GP0
Load gp0 16 [Stack_pointer] 						#LOAD GP0
Store gp0 20 [Stack_pointer] 						#STORE GP0
Pass 										%looppruneTree-0entry
Load gp6 @3
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 20 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														
NOT gp0
if gp0 then Load PC looppruneTree-0exit 								#WHILE LOOP
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 20 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 20 [Stack_pointer] 						#STORE GP0
Load gp1 20 [Stack_pointer] 						#LOAD GP0
Load gp0 16 [Stack_pointer] 						#LOAD GP0
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifpruneTree-0endif
Load gp0 16 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Pass										%ifpruneTree-0endif
Load PC looppruneTree-0entry					%looppruneTree-0continue
Pass 										%looppruneTree-0exit
Load gp0 20 [Stack_pointer] 						#LOAD GP0
Store gp0 8 [Stack_pointer] 						#STORE GP0
Pass 										%looppruneTree-1entry
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp1 0 [gp6]
Load gp0 20 [Stack_pointer] 						#LOAD GP0
Load  gp2 @4294967295 												#COMPARE (NOT EQUAL)
Compare gp1 gp0 
if Equal then Move Zero gp2
Move gp2 gp0
NOT gp0
if gp0 then Load PC looppruneTree-1exit 								#WHILE LOOP
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 12 [Stack_pointer] 						#STORE GP0
Load gp6 @3
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifpruneTree-1endif
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 24 [Stack_pointer] 						#STORE GP0
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 24 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 24 [Stack_pointer] 						#LOAD GP0
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 12 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:dalloc 												#CALLING dalloc
Pass										%ifpruneTree-1endif
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load PC looppruneTree-1entry					%looppruneTree-1continue
Pass 										%looppruneTree-1exit
Load gp0 20 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
																	Scope deleteFromDict
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:deleteFromDict
SUB Stack_pointer @36 									#OVERHEAD FOR FUNCTION deleteFromDict
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 24 [Stack_pointer] 						#STORE GP0
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 16 [Stack_pointer] 						#STORE GP0
Load gp0 CLL.TREEOPCOUNT 										#LOAD GP0 GLOBAL
Load gp1 @1
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Store gp0 CLL.TREEOPCOUNT 										#STORE GP0 GLOBAL
Load gp0 CLL.TREEOPCOUNT 										#LOAD GP0 GLOBAL
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifdeleteFromDict-0endif
Load gp0 @32
Store gp0 CLL.TREEOPCOUNT 										#STORE GP0 GLOBAL
Move Stack_pointer gp0 											#GETTING POINTER
ADD gp0 @16
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:reBalanceDictTree 												#CALLING reBalanceDictTree
Pass										%ifdeleteFromDict-0endif
Load gp0 24 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:simpleHash 												#CALLING simpleHash
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 20 [Stack_pointer] 						#STORE GP0
Load gp0 20 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 16 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:findTreeNode 												#CALLING findTreeNode
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 12 [Stack_pointer] 						#STORE GP0
Load gp6 @3
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 12 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load gp0 8 [Stack_pointer] 						#LOAD GP0
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
if gp0 then Load PC ifdeleteFromDict-4true 									#IF ELSE STATEMENT
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Load PC ifdeleteFromDict-4endif
Pass 										%ifdeleteFromDict-4true
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 24 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:checkKey 												#CALLING checkKey
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
if gp0 then Load PC ifdeleteFromDict-3true 									#IF ELSE STATEMENT
Pass 										%loopdeleteFromDict-0entry
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0
if gp0 then Load PC loopdeleteFromDict-0exit 								#WHILE LOOP
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Store gp0 32 [Stack_pointer] 						#STORE GP0
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 24 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:checkKey 												#CALLING checkKey
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifdeleteFromDict-2endif
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 32 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:dalloc 												#CALLING dalloc
Pass										%ifdeleteFromDict-2endif
Load PC loopdeleteFromDict-0entry					%loopdeleteFromDict-0continue
Pass 										%loopdeleteFromDict-0exit
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Load PC ifdeleteFromDict-3endif
Pass 										%ifdeleteFromDict-3true
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
if gp0 then Load PC ifdeleteFromDict-1true 									#IF ELSE STATEMENT
Load gp0 @0
Load gp6 @3
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 12 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load PC ifdeleteFromDict-1endif
Pass 										%ifdeleteFromDict-1true
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Load gp6 @3
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 12 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:dalloc 												#CALLING dalloc
Pass 										%ifdeleteFromDict-1endif           
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 28 [Stack_pointer] 						#STORE GP0
Load gp0 CLL.string31 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 28 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:print_i 												#CALLING print_i
Load gp0 CLL.string32 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 28 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:dalloc 												#CALLING dalloc
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:dalloc 												#CALLING dalloc
Load gp0 @1
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Pass 										%ifdeleteFromDict-3endif           
Pass 										%ifdeleteFromDict-4endif           
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
																	Scope delete_tree_node
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:delete_tree_node
SUB Stack_pointer @12 									#OVERHEAD FOR FUNCTION delete_tree_node
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load gp0 CLL.MALLOC_POOL 										#LOAD GP0 GLOBAL
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Store gp0 CLL.MALLOC_POOL 										#STORE GP0 GLOBAL
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
																	Scope check_allocation
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:check_allocation
SUB Stack_pointer @20 									#OVERHEAD FOR FUNCTION check_allocation
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load gp6 @4
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifcheck_allocation-0endif
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Pass										%ifcheck_allocation-0endif
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifcheck_allocation-1endif
Load gp0 @1
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Pass										%ifcheck_allocation-1endif
Load gp6 @4
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 12 [Stack_pointer] 						#STORE GP0
Load gp6 @5
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 16 [Stack_pointer] 						#STORE GP0
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:check_allocation 												#CALLING check_allocation
Load gp0 16 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:check_allocation 												#CALLING check_allocation
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
OR gp0 gp1 															#OR
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
																	Scope findTreeNode
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:findTreeNode
SUB Stack_pointer @16 									#OVERHEAD FOR FUNCTION findTreeNode
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 8 [Stack_pointer] 						#STORE GP0
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 12 [Stack_pointer] 						#STORE GP0
Load gp0 8 [Stack_pointer] 						#LOAD GP0
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC iffindTreeNode-0endif
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Pass										%iffindTreeNode-0endif
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC iffindTreeNode-1endif
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Pass										%iffindTreeNode-1endif
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Move Zero gp2 														#COMPARE (IS GREATER)
Compare gp1 gp0
if Greater then Load gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC iffindTreeNode-2endif
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:findTreeNode 												#CALLING findTreeNode
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Pass										%iffindTreeNode-2endif
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:findTreeNode 												#CALLING findTreeNode
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
																	Scope dumpList
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:dumpList
SUB Stack_pointer @28 									#OVERHEAD FOR FUNCTION dumpList
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 12 [Stack_pointer] 						#STORE GP0
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load gp0 CLL.string35 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Pass 										%loopdumpList-0entry
Load gp0 @1
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0
if gp0 then Load PC loopdumpList-0exit 								#WHILE LOOP
Load gp6 @3
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 16 [Stack_pointer] 						#STORE GP0
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 16 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 24 [Stack_pointer] 						#STORE GP0
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 16 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 20 [Stack_pointer] 						#STORE GP0
Load gp0 CLL.string36 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:print_i 												#CALLING print_i
Load gp0 CLL.string37 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 16 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:print_i 												#CALLING print_i
Load gp0 CLL.string38 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:print_i 												#CALLING print_i
Load gp0 CLL.string39 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 24 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 CLL.string40 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 20 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 CLL.string41 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifdumpList-0endif
Load gp0 CLL.string42 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load PC loopdumpList-0exit
Pass										%ifdumpList-0endif
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifdumpList-1endif
Load gp0 CLL.string43 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load PC loopdumpList-0exit
Pass										%ifdumpList-1endif
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load gp1 8 [Stack_pointer] 						#LOAD GP0
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifdumpList-2endif
Load PC loopdumpList-0exit
Pass										%ifdumpList-2endif
Load PC loopdumpList-0entry					%loopdumpList-0continue
Pass 										%loopdumpList-0exit
Load gp0 CLL.string44 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
																	Scope dumpDict
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:dumpDict
SUB Stack_pointer @16 									#OVERHEAD FOR FUNCTION dumpDict
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 12 [Stack_pointer] 						#STORE GP0
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 12 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifdumpDict-0endif
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 12 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:dumpDict 												#CALLING dumpDict
Pass										%ifdumpDict-0endif
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 12 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifdumpDict-1endif
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 12 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:dumpDict 												#CALLING dumpDict
Pass										%ifdumpDict-1endif
Load gp6 @3
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 12 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 8 [Stack_pointer] 						#STORE GP0
Pass 										%loopdumpDict-0entry
Load gp0 8 [Stack_pointer] 						#LOAD GP0
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0
if gp0 then Load PC loopdumpDict-0exit 								#WHILE LOOP
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 CLL.string33 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 CLL.string34 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load PC loopdumpDict-0entry					%loopdumpDict-0continue
Pass 										%loopdumpDict-0exit
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
																	Scope split_tree_node
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:split_tree_node
SUB Stack_pointer @28 									#OVERHEAD FOR FUNCTION split_tree_node
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load gp6 @3
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 24 [Stack_pointer] 						#STORE GP0
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 16 [Stack_pointer] 						#STORE GP0
Load gp0 24 [Stack_pointer] 						#LOAD GP0
Load gp1 @2
DIV gp0 gp1 														#DIVIDE
if DivByZero then Load PC DIV_BY_ZERO
Store gp0 20 [Stack_pointer] 						#STORE GP0
Load gp0 16 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp1 20 [Stack_pointer] 						#LOAD GP0
Load gp0 @4
MUL gp0 gp1 														#MULTIPLY
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Store gp0 12 [Stack_pointer] 						#STORE GP0
Load gp0 20 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 16 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:create_tree_node 												#CALLING create_tree_node
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Load gp6 @4
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 20 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 12 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:create_tree_node 												#CALLING create_tree_node
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Load gp6 @5
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 8 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
																	Scope getWord
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:getWord
SUB Stack_pointer @12 									#OVERHEAD FOR FUNCTION getWord
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
Pass 										%loopgetWord-0entry
LoadByte gp0 CLL.demoBUFPTR 									#LOAD GP0 GLOBAL (CHAR)
Move gp0 gp6 						#PUSH gp0 POP gp6
ADD gp6 CLL.BUF 											#LOAD GP0 GLOBAL RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
LoadByte gp0 CLL.demoBUFPTR 									#LOAD GP0 GLOBAL (CHAR)
Move gp0 gp6 						#PUSH gp0 POP gp6
ADD gp6 CLL.BUF 											#LOAD GP0 GLOBAL RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @32
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
OR gp0 gp1
NOT gp0
if gp0 then Load PC loopgetWord-0exit 								#WHILE LOOP
LoadByte gp0 CLL.demoBUFPTR 									#LOAD GP0 GLOBAL (CHAR)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @1
AND gp0 @255 													  #CASTING INT TO CHAR
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD (CHARS)
AND gp0 @255
StoreByte gp0 CLL.demoBUFPTR 									#STORE GP0 GLOBAL (CHAR)
Load PC loopgetWord-0entry					%loopgetWord-0continue
Pass 										%loopgetWord-0exit
Load gp0 CLL.BUF 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
LoadByte gp0 CLL.demoBUFPTR 									#LOAD GP0 GLOBAL (CHAR)
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Store gp0 8 [Stack_pointer] 						#STORE GP0
Pass 										%loopgetWord-1entry
LoadByte gp0 CLL.demoBUFPTR 									#LOAD GP0 GLOBAL (CHAR)
Move gp0 gp6 						#PUSH gp0 POP gp6
ADD gp6 CLL.BUF 											#LOAD GP0 GLOBAL RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
LoadByte gp0 CLL.demoBUFPTR 									#LOAD GP0 GLOBAL (CHAR)
Move gp0 gp6 						#PUSH gp0 POP gp6
ADD gp6 CLL.BUF 											#LOAD GP0 GLOBAL RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @32
Load  gp2 @4294967295 												#COMPARE (NOT EQUAL)
Compare gp1 gp0 
if Equal then Move Zero gp2
Move gp2 gp0
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
AND gp0 gp1
NOT gp0
if gp0 then Load PC loopgetWord-1exit 								#WHILE LOOP
LoadByte gp0 CLL.demoBUFPTR 									#LOAD GP0 GLOBAL (CHAR)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @1
AND gp0 @255 													  #CASTING INT TO CHAR
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD (CHARS)
AND gp0 @255
StoreByte gp0 CLL.demoBUFPTR 									#STORE GP0 GLOBAL (CHAR)
Load PC loopgetWord-1entry					%loopgetWord-1continue
Pass 										%loopgetWord-1exit
Load gp0 @0
AND gp0 @255 													  #CASTING INT TO CHAR
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
LoadByte gp0 CLL.demoBUFPTR 									#LOAD GP0 GLOBAL (CHAR)
Move gp0 gp6 						#PUSH gp0 POP gp6
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
ADD gp6 CLL.BUF 											#STORE GP0 GLOBAL RELATIVE (CHAR)
StoreByte gp0 0 [gp6]
LoadByte gp0 CLL.demoBUFPTR 									#LOAD GP0 GLOBAL (CHAR)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @1
AND gp0 @255 													  #CASTING INT TO CHAR
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD (CHARS)
AND gp0 @255
StoreByte gp0 CLL.demoBUFPTR 									#STORE GP0 GLOBAL (CHAR)
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
																	Scope getDemoOp
def length gp4
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
Move Stack_pointer previous_stack_ptr								%function:getDemoOp
SUB Stack_pointer @12 									#OVERHEAD FOR FUNCTION getDemoOp
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]
Goto function:getWord 												#CALLING getWord
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 8 [Stack_pointer] 						#STORE GP0
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 CLL.string18 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:checkKey 												#CALLING checkKey
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
if gp0 then Load PC ifgetDemoOp-6true 									#IF ELSE STATEMENT
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 CLL.string19 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:checkKey 												#CALLING checkKey
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
if gp0 then Load PC ifgetDemoOp-5true 									#IF ELSE STATEMENT
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 CLL.string20 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:checkKey 												#CALLING checkKey
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
if gp0 then Load PC ifgetDemoOp-4true 									#IF ELSE STATEMENT
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 CLL.string21 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:checkKey 												#CALLING checkKey
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
if gp0 then Load PC ifgetDemoOp-3true 									#IF ELSE STATEMENT
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 CLL.string22 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:checkKey 												#CALLING checkKey
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
if gp0 then Load PC ifgetDemoOp-2true 									#IF ELSE STATEMENT
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 CLL.string23 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:checkKey 												#CALLING checkKey
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
if gp0 then Load PC ifgetDemoOp-1true 									#IF ELSE STATEMENT
Load gp0 8 [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 CLL.string24 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:checkKey 												#CALLING checkKey
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifgetDemoOp-0endif
Load gp0 @7
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Pass										%ifgetDemoOp-0endif
Load PC ifgetDemoOp-1endif
Pass 										%ifgetDemoOp-1true
Load gp0 @6
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Pass 										%ifgetDemoOp-1endif           
Load PC ifgetDemoOp-2endif
Pass 										%ifgetDemoOp-2true
Load gp0 @5
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Pass 										%ifgetDemoOp-2endif           
Load PC ifgetDemoOp-3endif
Pass 										%ifgetDemoOp-3true
Load gp0 @4
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Pass 										%ifgetDemoOp-3endif           
Load PC ifgetDemoOp-4endif
Pass 										%ifgetDemoOp-4true
Load gp0 @3
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Pass 										%ifgetDemoOp-4endif           
Load PC ifgetDemoOp-5endif
Pass 										%ifgetDemoOp-5true
Load gp0 @1
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Pass 										%ifgetDemoOp-5endif           
Load PC ifgetDemoOp-6endif
Pass 										%ifgetDemoOp-6true
Load gp0 @2
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Pass 										%ifgetDemoOp-6endif           
Load gp0 CLL.string25 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 @7
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
