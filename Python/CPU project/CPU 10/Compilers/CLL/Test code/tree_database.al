

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

byteArray CLL.array_of_string10 4 [66, 65, 82, 0]
int CLL.string10 CLL.array_of_string10
byteArray CLL.array_of_string11 5 [109, 97, 114, 121, 0]
int CLL.string11 CLL.array_of_string11
byteArray CLL.array_of_string12 4 [104, 97, 100, 0]
int CLL.string12 CLL.array_of_string12
byteArray CLL.array_of_string13 10 [97, 32, 108, 105, 116, 116, 108, 101, 32, 0]
int CLL.string13 CLL.array_of_string13
byteArray CLL.array_of_string14 5 [108, 97, 109, 98, 0]
int CLL.string14 CLL.array_of_string14
byteArray CLL.array_of_string15 4 [102, 111, 111, 0]
int CLL.string15 CLL.array_of_string15
byteArray CLL.array_of_string16 20 [116, 101, 115, 116, 105, 110, 103, 32, 114, 101, 112, 108, 97, 99, 101, 109, 101, 110, 116, 0]
int CLL.string16 CLL.array_of_string16
byteArray CLL.array_of_string17 3 [49, 50, 0]
int CLL.string17 CLL.array_of_string17
byteArray CLL.array_of_string18 3 [51, 52, 0]
int CLL.string18 CLL.array_of_string18
byteArray CLL.array_of_string19 10 [97, 32, 108, 105, 116, 116, 108, 101, 32, 0]
int CLL.string19 CLL.array_of_string19
array CLL.array_of_MALLOC_TREE_PARTITION 61144 []
int CLL.MALLOC_TREE_PARTITION CLL.array_of_MALLOC_TREE_PARTITION
byteArray CLL.array_of_string8 6 [119, 111, 114, 108, 100, 0]
int CLL.string8 CLL.array_of_string8
byteArray CLL.array_of_string9 4 [102, 111, 111, 0]
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
byteArray CLL.array_of_string21 2 [10, 0]
int CLL.string21 CLL.array_of_string21
byteArray CLL.array_of_string20 10 [97, 32, 108, 105, 116, 116, 108, 101, 32, 0]
int CLL.string20 CLL.array_of_string20
byteArray CLL.array_of_string23 2 [10, 0]
int CLL.string23 CLL.array_of_string23
byteArray CLL.array_of_string22 2 [10, 0]
int CLL.string22 CLL.array_of_string22
int CLL.MALLOC_TREE 0
array CLL.array_of_MALLOC_HEAP 65536 []
int CLL.MALLOC_HEAP CLL.array_of_MALLOC_HEAP
int CLL.MALLOC_POOL 0











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
Load gp0  Expression_stack [gp7]

Store gp0 8 [Stack_pointer] 						#STORE GP0


				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 20 [Stack_pointer] 						#STORE GP0




Load gp0 20 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Goto function:simpleHash 												#CALLING simpleHash

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

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
Load gp0  Expression_stack [gp7]

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
Load gp0  Expression_stack [gp7]

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
Load gp0  Expression_stack [gp7]

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
Load gp0  Expression_stack [gp7]

Store gp0 20 [Stack_pointer] 						#STORE GP0


				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 12 [Stack_pointer] 						#STORE GP0




Load gp0 20 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Goto function:simpleHash 												#CALLING simpleHash

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

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
Load gp0  Expression_stack [gp7]

Store gp0 8 [Stack_pointer] 						#STORE GP0




Load gp0 @0
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Goto function:printf 												#CALLING printf



Load gp0 CLL.string23 										#LOAD GP0 GLOBAL
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Goto function:printf 												#CALLING printf



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




Load gp0 @0
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
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
Load gp0  Expression_stack [gp7]

if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
 														

if gp0 then Load PC ifretrieveFromDict-1true 									#IF ELSE STATEMENT

Pass 										%loopretrieveFromDict-0entry


Load gp0 @2
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
 														

if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

									
				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

NOT gp0
if gp0 then Load PC loopretrieveFromDict-0exit 								#WHILE LOOP


Load gp0 @2
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
 														

Store gp0 8 [Stack_pointer] 						#STORE GP0

 									


Load gp0 20 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error



Load gp0 @0
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Goto function:checkKey 												#CALLING checkKey

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
 														

NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifretrieveFromDict-0endif



Load gp0 @1
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
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



Load gp0 @1
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
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
Load gp0  Expression_stack [gp7]

Store gp0 36 [Stack_pointer] 						#STORE GP0


				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 12 [Stack_pointer] 						#STORE GP0




Load gp0 @3
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

ADD gp6 36 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
 														

Store gp0 24 [Stack_pointer] 						#STORE GP0



Load gp0 @1
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

ADD gp6 36 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
 														

Store gp0 16 [Stack_pointer] 						#STORE GP0


Load gp0 24 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load gp0 @2
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

DIV gp0 gp1 														#DIVIDE
if DivByZero then Load PC DIV_BY_ZERO
 														

Store gp0 28 [Stack_pointer] 						#STORE GP0



Load gp0 @4
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

ADD gp6 36 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
 														

Store gp0 32 [Stack_pointer] 						#STORE GP0



Load gp0 @5
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

ADD gp6 36 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
 														

Store gp0 8 [Stack_pointer] 						#STORE GP0



Load gp0 12 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error



Load gp0 @2
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

ADD gp6 36 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
 														

SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]

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



Load gp0 @2
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

ADD gp6 36 [Stack_pointer] 							#LOAD GP0 RELATIVE
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

Load gp0 @4
 														

SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]

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
 									

Load gp0 32 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load gp0 @0
 														

SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]

Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
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



Load gp0 @2
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

ADD gp6 36 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
 														

SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]

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
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @1
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

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

 									

Load gp0 32 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load gp0 @0
 														

SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]

Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
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



Load gp0 @2
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

ADD gp6 36 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
 														

SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]

Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
 														
NOT gp0 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]


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



Load gp0 @2
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

ADD gp6 36 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Load gp0 28 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load gp0 @4
 														

SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]

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
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error



				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

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
Load gp0  Expression_stack [gp7]

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
Load gp0  Expression_stack [gp7]

Store gp0 20 [Stack_pointer] 						#STORE GP0
 
Pass 										%if__dalloc-2endif           

 									


Load gp0 @1
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

ADD gp6 32 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
 														

if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error



Load gp0 @1
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
 														

if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
 														


SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]

OR gp0 gp1
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]
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
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @4
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

ADD gp6 36 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]

Load gp0 @5
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @5
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

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
SUB Stack_pointer @20 									#OVERHEAD FOR FUNCTION reBalanceDictTree
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 12 [Stack_pointer] 						#STORE GP0




Load gp0 12 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Goto function:sortTree 												#CALLING sortTree

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 8 [Stack_pointer] 						#STORE GP0




Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Load gp0 16 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Goto function:createBalancedTree 												#CALLING createBalancedTree

Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC



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

Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load gp0 @61144
 														

SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]

Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error



				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

NOT gp0
if gp0 then Load PC loopmalloc_init-0exit


Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load gp0 @6
 														

SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]

ADD gp0 gp1 														#ADD
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load gp0 @61144
 														

SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]

Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error



				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

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


Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load gp0 @6
 														

SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]

ADD gp0 gp1 														#ADD
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load gp0 @4
 														

SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]

MUL gp0 gp1 														#MULTIPLY
 														

SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]

ADD gp0 gp1 														#ADD
 														

Store gp0 12 [Stack_pointer] 						#STORE GP0
 
Pass 										%ifmalloc_init-0endif           


Load gp0 12 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

 


Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

ADD gp6 CLL.MALLOC_TREE_PARTITION 											#STORE GP0 GLOBAL RELATIVE
Store gp0 0 [gp6]

Pass 										%loopmalloc_init-0continue

Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load gp0 @6
 														

SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]

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
Load gp0  Expression_stack [gp7]

Store gp0 CLL.MALLOC_TREE 										#STORE GP0 GLOBAL



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
Load gp0  Expression_stack [gp7]

Store gp0 12 [Stack_pointer] 						#STORE GP0


Load gp0 @0
 														

Store gp0 8 [Stack_pointer] 						#STORE GP0


Load gp0 @0
 														

Store gp0 8 [Stack_pointer] 						#STORE GP0

Pass 										%loopgetLength-0entry 		#FOR LOOP



Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 

ADD gp6 12 [Stack_pointer]							#LOAD GP0 RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
 														

if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
 														

NOT gp0
if gp0 then Load PC loopgetLength-0exit
Load PC loopgetLength-0continue

Pass 										%loopgetLength-0continue

Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load gp0 @1
 														

SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]

ADD gp0 gp1 														#ADD
 														

Store gp0 8 [Stack_pointer] 						#STORE GP0
								
Load PC loopgetLength-0entry
Pass 										%loopgetLength-0exit



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
Load gp0  Expression_stack [gp7]

Store gp0 8 [Stack_pointer] 						#STORE GP0


				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 20 [Stack_pointer] 						#STORE GP0


				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

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


Load gp0 @0
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

ADD gp6 12 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
 														

Store gp0 CLL.MALLOC_POOL 										#STORE GP0 GLOBAL


Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

 

Load gp0 @0
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

ADD gp6 12 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]

Load gp0 @0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @1
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

ADD gp6 12 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]


Load gp0 20 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

 

Load gp0 @2
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

ADD gp6 12 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]


Load gp0 16 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

 

Load gp0 @3
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

ADD gp6 12 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]

Load gp0 @0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @4
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

ADD gp6 12 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]

Load gp0 @0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @5
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

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
In gp0 function:getc #gets a char without waiting (state of keyboard)
Store gp0 Expression_stack [gp7]
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Move Jump PC
##########################################################################











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
Load gp0  Expression_stack [gp7]

Store gp0 12 [Stack_pointer] 						#STORE GP0


				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 8 [Stack_pointer] 						#STORE GP0


				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 16 [Stack_pointer] 						#STORE GP0




Load gp0 16 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error



Load gp0 @0
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

ADD gp6 12 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
 														

SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]

Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
 														

if gp0 then Load PC ifeditDict-3true 									#IF ELSE STATEMENT


Load gp0 16 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error



Load gp0 @0
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

ADD gp6 12 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
 														

SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]

Move Zero gp2 														#COMPARE (IS GREATER)
Compare gp1 gp0
if Greater then Load gp2 @4294967295
Move gp2 gp0
 														

if gp0 then Load PC ifeditDict-2true 									#IF ELSE STATEMENT



Load gp0 @1
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
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
 

Load gp0 @1
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

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



Load gp0 @1
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
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



Load gp0 @2
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
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
 

Load gp0 @2
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

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



Load gp0 @2
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
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
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

 

Load gp0 @3
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

ADD gp6 12 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
 
Pass 										%ifeditDict-3endif           



Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC
########################## PUTC (char) ########################################
SUB gp7 @4 															%function:putc
Load gp0  Expression_stack [gp7]
Out gp0
Move Jump PC
################################################################################










																	Scope print_pool
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
Load gp0  Expression_stack [gp7]

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




Load gp0 @0
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
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




Load gp0 @0
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
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
Load gp0  Expression_stack [gp7]

Store gp0 24 [Stack_pointer] 						#STORE GP0


				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 20 [Stack_pointer] 						#STORE GP0


				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 12 [Stack_pointer] 						#STORE GP0


Load gp0 @1
 														

Store gp0 16 [Stack_pointer] 						#STORE GP0


Load gp0 @0
 														

Store gp0 8 [Stack_pointer] 						#STORE GP0

Pass 										%loopcopyString-0entry 		#FOR LOOP

Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Load gp0 24 [Stack_pointer] 						#LOAD GP0
 														

SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]

Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error



				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

NOT gp0
if gp0 then Load PC loopcopyString-0exit


Load gp0 16 [Stack_pointer] 						#LOAD GP0
 														

if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
 														

if gp0 then Load PC ifcopyString-1true 									#IF ELSE STATEMENT
Load gp0 @0
 														

AND gp0 @255 													  #CASTING INT TO CHAR
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error




Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

ADD gp6 20 [Stack_pointer] 							#STORE GP0 RELATIVE (CHAR)
StoreByte gp0 0 [gp6]

Load PC ifcopyString-1endif
Pass 										%ifcopyString-1true



Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 

ADD gp6 12 [Stack_pointer]							#LOAD GP0 RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error




Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

ADD gp6 20 [Stack_pointer] 							#STORE GP0 RELATIVE (CHAR)
StoreByte gp0 0 [gp6]

 									



Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 

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

Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load gp0 @1
 														

SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]

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
SUB Stack_pointer @16 									#OVERHEAD FOR FUNCTION main
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]


Load gp0 CLL.MALLOC_TREE_PARTITION 										#LOAD GP0 GLOBAL
 														

Store gp0 CLL.MALLOC_POOL 										#STORE GP0 GLOBAL



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
Load gp0  Expression_stack [gp7]

Store gp0 12 [Stack_pointer] 						#STORE GP0



Load gp0 12 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


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


Goto function:insertToDict 												#CALLING insertToDict



Load gp0 12 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Load gp0 CLL.string11 										#LOAD GP0 GLOBAL
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Load gp0 CLL.string12 										#LOAD GP0 GLOBAL
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Goto function:insertToDict 												#CALLING insertToDict



Load gp0 12 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Load gp0 CLL.string13 										#LOAD GP0 GLOBAL
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Load gp0 CLL.string14 										#LOAD GP0 GLOBAL
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Goto function:insertToDict 												#CALLING insertToDict



Load gp0 12 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Load gp0 CLL.string15 										#LOAD GP0 GLOBAL
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Load gp0 CLL.string16 										#LOAD GP0 GLOBAL
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Goto function:insertToDict 												#CALLING insertToDict



Load gp0 12 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Load gp0 CLL.string17 										#LOAD GP0 GLOBAL
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Load gp0 CLL.string18 										#LOAD GP0 GLOBAL
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Goto function:insertToDict 												#CALLING insertToDict



Load gp0 12 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Load gp0 CLL.string19 										#LOAD GP0 GLOBAL
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Goto function:retrieveFromDict 												#CALLING retrieveFromDict

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 8 [Stack_pointer] 						#STORE GP0



Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Goto function:printf 												#CALLING printf




Load gp0 CLL.string20 										#LOAD GP0 GLOBAL
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Goto function:simpleHash 												#CALLING simpleHash

Goto function:print_i 												#CALLING print_i



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
Load gp0  Expression_stack [gp7]

Store gp0 12 [Stack_pointer] 						#STORE GP0


				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 24 [Stack_pointer] 						#STORE GP0




Load gp0 24 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Goto function:getLength 												#CALLING getLength

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 20 [Stack_pointer] 						#STORE GP0



Load gp0 20 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load gp0 @3
 														

SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]

AND gp0 gp1 														#AND
 														

if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
 														

if gp0 then Load PC ifcreateNewDataEntry-0true 									#IF ELSE STATEMENT

Load gp0 20 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load gp0 @2
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

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
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load gp0 @2
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

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
Load gp0  Expression_stack [gp7]

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
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load gp0 @2
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 	

SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]
 
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
Load gp0  Expression_stack [gp7]

Store gp0 16 [Stack_pointer] 						#STORE GP0


Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

 

Load gp0 @0
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

ADD gp6 16 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]


Load gp0 12 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

 

Load gp0 @1
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

ADD gp6 16 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]

Load gp0 @0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @2
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

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
Load gp0  Expression_stack [gp7]

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
Load gp0  Expression_stack [gp7]

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
SUB Stack_pointer @20 									#OVERHEAD FOR FUNCTION createBalancedTree
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 16 [Stack_pointer] 						#STORE GP0


				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 12 [Stack_pointer] 						#STORE GP0


Load gp0 @1
 														

Store gp0 8 [Stack_pointer] 						#STORE GP0


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
Load gp0  Expression_stack [gp7]

Store gp0 24 [Stack_pointer] 						#STORE GP0


				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 12 [Stack_pointer] 						#STORE GP0


				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 8 [Stack_pointer] 						#STORE GP0


				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 20 [Stack_pointer] 						#STORE GP0



Load gp0 @4
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Goto function:malloc 												#CALLING malloc

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 16 [Stack_pointer] 						#STORE GP0


Load gp0 20 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

 

Load gp0 @0
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

ADD gp6 16 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]


Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

 

Load gp0 @1
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

ADD gp6 16 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]


Load gp0 12 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

 

Load gp0 @2
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

ADD gp6 16 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]


Load gp0 24 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

 

Load gp0 @3
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

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
Load gp0  Expression_stack [gp7]

Store gp0 8 [Stack_pointer] 						#STORE GP0





Load gp0 @1
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
 														

if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
 														

if gp0 then Load PC ifsortTree-2true 									#IF ELSE STATEMENT



Load gp0 @2
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
 														

if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
 														

if gp0 then Load PC ifsortTree-1true 									#IF ELSE STATEMENT

Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														

Store gp0 12 [Stack_pointer] 						#STORE GP0


Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

 

Load gp0 @1
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

ADD gp6 8 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]


Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

 

Load gp0 @2
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

ADD gp6 8 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]

Load PC ifsortTree-1endif
Pass 										%ifsortTree-1true



Load gp0 @2
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Goto function:sortTree 												#CALLING sortTree
 

Load gp0 @2
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

ADD gp6 8 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]



Load gp0 @2
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
 														

Store gp0 16 [Stack_pointer] 						#STORE GP0



Load gp0 @1
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

ADD gp6 16 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
 														

Store gp0 12 [Stack_pointer] 						#STORE GP0


Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

 

Load gp0 @1
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

ADD gp6 16 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]


Load gp0 12 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

 

Load gp0 @1
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

ADD gp6 8 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]


Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

 

Load gp0 @2
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

ADD gp6 12 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
 
Pass 										%ifsortTree-1endif           

Load PC ifsortTree-2endif
Pass 										%ifsortTree-2true



Load gp0 @2
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
 														

if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
 														

if gp0 then Load PC ifsortTree-0true 									#IF ELSE STATEMENT

Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														

Store gp0 12 [Stack_pointer] 						#STORE GP0



Load gp0 @1
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
 														

Store gp0 16 [Stack_pointer] 						#STORE GP0



Load gp0 @2
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

ADD gp6 16 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

 

Load gp0 @2
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

ADD gp6 8 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]



Load gp0 @2
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
 														

Store gp0 20 [Stack_pointer] 						#STORE GP0


Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

 

Load gp0 @1
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

ADD gp6 20 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]


Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

 

Load gp0 @2
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

ADD gp6 16 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]

Load PC ifsortTree-0endif
Pass 										%ifsortTree-0true



Load gp0 @1
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Goto function:sortTree 												#CALLING sortTree
 

Load gp0 @1
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

ADD gp6 8 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]




Load gp0 @2
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Goto function:sortTree 												#CALLING sortTree

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 12 [Stack_pointer] 						#STORE GP0



Load gp0 @2
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

ADD gp6 12 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

 

Load gp0 @2
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

ADD gp6 8 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]



Load gp0 @1
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
 														

Store gp0 20 [Stack_pointer] 						#STORE GP0



Load gp0 @2
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

ADD gp6 20 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
 														

Store gp0 20 [Stack_pointer] 						#STORE GP0


Load gp0 12 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

 

Load gp0 @1
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

ADD gp6 20 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]


Load gp0 20 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

 

Load gp0 @2
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

ADD gp6 12 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]



Load gp0 @2
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
 														

Store gp0 16 [Stack_pointer] 						#STORE GP0


Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

 

Load gp0 @1
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

ADD gp6 16 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]



Load gp0 @1
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
 														

Store gp0 16 [Stack_pointer] 						#STORE GP0


Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

 

Load gp0 @2
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

ADD gp6 16 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
 
Pass 										%ifsortTree-0endif           
 
Pass 										%ifsortTree-2endif           



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
Load gp0  Expression_stack [gp7]

Store gp0 28 [Stack_pointer] 						#STORE GP0


				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 8 [Stack_pointer] 						#STORE GP0




Load gp0 @3
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
 														

Store gp0 12 [Stack_pointer] 						#STORE GP0



Load gp0 28 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Load gp0 12 [Stack_pointer] 						#LOAD GP0
 														

SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]

Move Zero gp2 														#COMPARE (IS GREATER)
Compare gp1 gp0
if Greater then Load gp2 @4294967295
Move gp2 gp0
 														

if gp0 then Load PC if__malloc-11true 									#IF ELSE STATEMENT
 									


Load gp0 @1
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
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
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load gp0 @2
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

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
 									


Load gp0 @4
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
 														

if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
 														
NOT gp0 														

NOT gp0 														    #IF STATEMENT
if gp0 then Load PC if__malloc-1endif
Load gp0 @1
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @1
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

ADD gp6 8 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]




Load gp0 @2
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
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

 									

Load gp0 12 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load gp0 @1
 														

SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]

Move Zero gp2 														#COMPARE (IS GREATER)
Compare gp1 gp0
if Greater then Load gp2 @4294967295
Move gp2 gp0
 														

NOT gp0 														    #IF STATEMENT
if gp0 then Load PC if__malloc-10endif


Load gp0 @4
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
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



Load gp0 @4
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
 														

Store gp0 24 [Stack_pointer] 						#STORE GP0

Pass										%if__malloc-3endif



Load gp0 @5
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
 														

Store gp0 20 [Stack_pointer] 						#STORE GP0

 									


Load gp0 @1
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
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
Load gp0  Expression_stack [gp7]

Store gp0 16 [Stack_pointer] 						#STORE GP0

 									

Load gp0 16 [Stack_pointer] 						#LOAD GP0
 														

if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
 														

NOT gp0 														    #IF STATEMENT
if gp0 then Load PC if__malloc-5endif
 									


Load gp0 @1
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

ADD gp6 24 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error



Load gp0 @1
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

ADD gp6 20 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
 														

SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]

AND gp0 gp1 														#AND
 														

if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
 														

NOT gp0 														    #IF STATEMENT
if gp0 then Load PC if__malloc-4endif
Load gp0 @1
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @1
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

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

 									


Load gp0 @1
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
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
Load gp0  Expression_stack [gp7]

Store gp0 16 [Stack_pointer] 						#STORE GP0

 									

Load gp0 16 [Stack_pointer] 						#LOAD GP0
 														

if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
 														

NOT gp0 														    #IF STATEMENT
if gp0 then Load PC if__malloc-8endif
 									


Load gp0 @1
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

ADD gp6 24 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error



Load gp0 @1
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

ADD gp6 20 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
 														

SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]

AND gp0 gp1 														#AND
 														

if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
 														

NOT gp0 														    #IF STATEMENT
if gp0 then Load PC if__malloc-7endif
Load gp0 @1
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @1
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

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
Load gp0  Expression_stack [gp7]

Store gp0 16 [Stack_pointer] 						#STORE GP0


Load gp0 @0
 														

Store gp0 12 [Stack_pointer] 						#STORE GP0

Load gp0 @0
 														

Store gp0 8 [Stack_pointer] 						#STORE GP0


Pass 										%loopsimpleHash-0entry



Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 

ADD gp6 16 [Stack_pointer]							#LOAD GP0 RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
 														

if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

									
				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

NOT gp0
if gp0 then Load PC loopsimpleHash-0exit 								#WHILE LOOP

Load gp0 12 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load gp0 @6
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 	

SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]
 
SHL gp0 gp1 														#SHIFT LEFT
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Load gp0 12 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load gp0 @16
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 	

SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]
 
SHL gp0 gp1 														#SHIFT LEFT
 														

SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]

ADD gp0 gp1 														#ADD
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Load gp0 12 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error



SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error




Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 

ADD gp6 16 [Stack_pointer]							#LOAD GP0 RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
 														

SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]

ADD gp0 gp1 														#ADD
 														

Store gp0 12 [Stack_pointer] 						#STORE GP0


Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load gp0 @1
 														

SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]

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
Load gp0  Expression_stack [gp7]

Store gp0 8 [Stack_pointer] 						#STORE GP0


				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

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
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error



Load gp0 @0
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
 														

SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]

Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
 														

NOT gp0 														    #IF STATEMENT
if gp0 then Load PC iffindKey-1endif



Load gp0 @3
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
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
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error



Load gp0 @0
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
 														

SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]

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



Load gp0 @2
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
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



Load gp0 @1
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
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
Load gp0  Expression_stack [gp7]

Store gp0 12 [Stack_pointer] 						#STORE GP0


				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 24 [Stack_pointer] 						#STORE GP0


				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 16 [Stack_pointer] 						#STORE GP0




Load gp0 CLL.string21 										#LOAD GP0 GLOBAL
 														
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



Load gp0 CLL.string22 										#LOAD GP0 GLOBAL
 														
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


Goto function:simpleHash 												#CALLING simpleHash

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

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
Load gp0  Expression_stack [gp7]

Store gp0 8 [Stack_pointer] 						#STORE GP0



Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														

if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
 														

if gp0 then Load PC ifinsertToDict-2true 									#IF ELSE STATEMENT


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

Load PC ifinsertToDict-2endif
Pass 										%ifinsertToDict-2true




Load gp0 @0
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
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
Load gp0  Expression_stack [gp7]

if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
 														

if gp0 then Load PC ifinsertToDict-1true 									#IF ELSE STATEMENT

Pass 										%loopinsertToDict-0entry


Load gp0 @2
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
 														

if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

									
				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

NOT gp0
if gp0 then Load PC loopinsertToDict-0exit 								#WHILE LOOP


Load gp0 @2
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
 														

Store gp0 8 [Stack_pointer] 						#STORE GP0

 									


Load gp0 24 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error



Load gp0 @0
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Goto function:checkKey 												#CALLING checkKey

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
 														

NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifinsertToDict-0endif

Load gp0 12 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

 

Load gp0 @1
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

ADD gp6 8 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]



Load previous_stack_ptr 4 [Stack_pointer] 							#RETURNING
Load ret_addr 0 [Stack_pointer]
Move previous_stack_ptr Stack_pointer
Move ret_addr PC

Pass										%ifinsertToDict-0endif

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
 

Load gp0 @2
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

ADD gp6 8 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]

Load PC ifinsertToDict-1endif
Pass 										%ifinsertToDict-1true

Load gp0 12 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

 

Load gp0 @1
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

ADD gp6 8 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
 
Pass 										%ifinsertToDict-1endif           
 
Pass 										%ifinsertToDict-2endif           



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
Load gp0  Expression_stack [gp7]

Store gp0 24 [Stack_pointer] 						#STORE GP0


				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 16 [Stack_pointer] 						#STORE GP0




Load gp0 24 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Goto function:simpleHash 												#CALLING simpleHash

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

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
Load gp0  Expression_stack [gp7]

Store gp0 12 [Stack_pointer] 						#STORE GP0



Load gp0 @3
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

ADD gp6 12 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
 														

Store gp0 8 [Stack_pointer] 						#STORE GP0



Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														

if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
 														

if gp0 then Load PC ifdeleteFromDict-3true 									#IF ELSE STATEMENT

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




Load gp0 @0
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
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
Load gp0  Expression_stack [gp7]

if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
 														

if gp0 then Load PC ifdeleteFromDict-2true 									#IF ELSE STATEMENT

Pass 										%loopdeleteFromDict-0entry


Load gp0 @2
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
 														

if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

									
				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

NOT gp0
if gp0 then Load PC loopdeleteFromDict-0exit 								#WHILE LOOP

Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														

Store gp0 32 [Stack_pointer] 						#STORE GP0



Load gp0 @2
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
 														

Store gp0 8 [Stack_pointer] 						#STORE GP0

 									



Load gp0 @0
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
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
Load gp0  Expression_stack [gp7]

if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
 														

NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifdeleteFromDict-1endif


Load gp0 @2
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

 

Load gp0 @2
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

ADD gp6 32 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]



Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Goto function:dalloc 												#CALLING dalloc

Pass										%ifdeleteFromDict-1endif

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

Load PC ifdeleteFromDict-2endif
Pass 										%ifdeleteFromDict-2true



Load gp0 @2
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
 														

if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
 														

if gp0 then Load PC ifdeleteFromDict-0true 									#IF ELSE STATEMENT
Load gp0 @0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
 

Load gp0 @3
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

ADD gp6 12 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]

Load PC ifdeleteFromDict-0endif
Pass 										%ifdeleteFromDict-0true


Load gp0 @2
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

 

Load gp0 @3
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

ADD gp6 12 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]



Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Goto function:dalloc 												#CALLING dalloc
 
Pass 										%ifdeleteFromDict-0endif           



Load gp0 @0
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
 														

Store gp0 28 [Stack_pointer] 						#STORE GP0



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
 
Pass 										%ifdeleteFromDict-2endif           
 
Pass 										%ifdeleteFromDict-3endif           


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
Load gp0  Expression_stack [gp7]

Store gp0 8 [Stack_pointer] 						#STORE GP0



Load gp0 CLL.MALLOC_POOL 										#LOAD GP0 GLOBAL
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

 

Load gp0 @0
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

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
Load gp0  Expression_stack [gp7]

Store gp0 8 [Stack_pointer] 						#STORE GP0


 									


Load gp0 @4
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
 														

if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
 														
NOT gp0 														

NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifcheck_allocation-0endif



Load gp0 @1
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
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

 									


Load gp0 @1
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
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



Load gp0 @4
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
 														

Store gp0 12 [Stack_pointer] 						#STORE GP0



Load gp0 @5
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
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
Load gp0  Expression_stack [gp7]

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
Load gp0  Expression_stack [gp7]

Store gp0 8 [Stack_pointer] 						#STORE GP0


				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

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
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error



Load gp0 @0
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
 														

SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]

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
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error



Load gp0 @0
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
 														

SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]

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



Load gp0 @2
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
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

Pass										%iffindTreeNode-2endif




Load gp0 12 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error



Load gp0 @1
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
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
Load gp0  Expression_stack [gp7]

Store gp0 12 [Stack_pointer] 						#STORE GP0


				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

Store gp0 16 [Stack_pointer] 						#STORE GP0


Load gp0 @0
 														

Store gp0 8 [Stack_pointer] 						#STORE GP0


Pass 										%loopcheckKey-0entry



Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 

ADD gp6 16 [Stack_pointer]							#LOAD GP0 RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
 														

if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

									
				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

NOT gp0
if gp0 then Load PC loopcheckKey-0exit 								#WHILE LOOP
 									



Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 

ADD gp6 16 [Stack_pointer]							#LOAD GP0 RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error




Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 

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


Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load gp0 @1
 														

SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]

ADD gp0 gp1 														#ADD
 														

Store gp0 8 [Stack_pointer] 						#STORE GP0

Load PC loopcheckKey-0entry					%loopcheckKey-0continue
Pass 										%loopcheckKey-0exit

 									



Load gp0 8 [Stack_pointer] 						#LOAD GP0
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 

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
Load gp0  Expression_stack [gp7]

Store gp0 8 [Stack_pointer] 						#STORE GP0




Load gp0 @3
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
 														

Store gp0 24 [Stack_pointer] 						#STORE GP0



Load gp0 @2
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

ADD gp6 8 [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
 														

Store gp0 16 [Stack_pointer] 						#STORE GP0


Load gp0 24 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load gp0 @2
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

DIV gp0 gp1 														#DIVIDE
if DivByZero then Load PC DIV_BY_ZERO
 														

Store gp0 20 [Stack_pointer] 						#STORE GP0


Load gp0 16 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error


Load gp0 20 [Stack_pointer] 						#LOAD GP0
 														
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error

Load gp0 @4
 														

SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]

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
 

Load gp0 @4
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

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
 

Load gp0 @5
 														
Move gp0 gp6 		 				#PUSH gp0 POP gp6 
MUL gp6 @4 														   #INDEXING FOR @INT

				
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]

ADD gp6 8 [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]



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
