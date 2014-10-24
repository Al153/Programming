#an implementation of the heapsort algorithm in my own stack based progrmming language.
#I recommend setting a text editor to recognise the file as python for syntax highlighting.

#I have included it as an example of my programming language

#this code can be compiled and run.

#On windows: (requires python to be installed and accessible from the command line)
#	-	first use github to download the entiire CPU 10 folder from my github repository https://github.com/Al153/Programming 
#	-	Then navigate to the CPU 10 directory within the programming repository in the command line (cd "Python\CPU project\CPU 10"    this navigates to the CPU directory from the programming directory)
#	-	then issue the following commands:
#	-	cd Compilers\Forth           					(Note, I originally named my language forth as the forth language was an inspiration for it)
#	- 	python "Forth compiler.py" heapsort.fth   	 	(this compiles the code to assembly language)
#	-	cd ..\..  										(Gets back to the main directory. In the directory "Compiled code", it is possible to view compiled assembly language.)
#	-	python Assembler.py "Compiled code\heapsort.al" (Assembles the code to machine language)
#	-	CEmu.exe "C machine code\heapsort.cml" 			(Runs the emulator, the emulator should print out the array before and after sorting


#About the language:

#This is a very low level language, functioning more as an extension for interfacing with assembly language than as a language in its own right.
#For example it does not use stack frames, so local variables are not unique for each function call
#It ignores types,the only datatype on the stack is 32bit int, ie anything which isnt operable using integers, (strings, arrays etc) must be manipulated using pointers
#The core language itself is extremely basic and can do virtually nothing. It consists of: variable and word definitions, pushing variables and word addresses onto the stack,
#and the primitives: if else endif, while loop, call return. Any other functionality, such as arithmetic, storing to variables and io are handled by assembly language files which are
#interfaced by .hlib (header library) files.

using std.hlib		#Using a standard library of functions

#Declaring a test array of the numbers 0...255 scrambled
byteArray test 256 [
0, 189, 211, 176, 88, 35, 8, 29, 191, 55, 235, 63, 227, 175, 157, 37, 19, 199,
248, 167, 14, 27, 50, 25, 110, 12, 33, 30, 131, 249, 86, 121, 79, 22, 241, 64,
5, 8, 233, 236, 160, 68, 130, 229, 13, 115, 188, 154, 246, 149, 206, 77, 203, 76,
3, 162, 113, 184, 28, 18, 141, 180, 226, 207, 62, 85, 250, 190, 70, 230, 100, 231,
67, 31, 90, 144, 170, 223, 216, 97, 179, 132, 143, 9, 243, 91, 222, 98, 80, 139, 
92, 102, 173, 156, 145, 177, 87, 151, 237, 239, 56, 228, 134, 84, 210, 251, 127,
103, 163, 126, 39, 153, 135, 150, 205, 142, 219, 152, 53, 17, 38, 74, 95, 220, 24,
60, 137, 166, 66, 47, 75, 7, 174, 105, 140, 106, 169, 185, 161, 146, 234, 59, 197,
116, 224, 254, 73, 214, 165, 253, 196, 10, 171, 61, 182, 57, 192, 208, 194, 218,
48, 128, 159, 1, 6, 46, 247, 43, 118, 240, 5, 107, 212, 204, 181, 172, 238, 242,
26, 200, 20, 96, 11, 112, 213, 120, 99, 71, 104, 201, 111, 2, 168, 148, 195, 209,
4, 81, 16, 245, 108, 123, 41, 217, 232, 198, 34, 114, 21, 94, 255, 133, 89, 36, 117,
225, 136, 78, 52, 252, 83, 65, 202, 147, 124, 49, 93, 82, 187, 101, 215, 186, 72, 109,
122, 42, 51, 138, 193, 129, 69, 23, 178, 44, 158, 221, 40, 32, 183, 15, 155, 45, 244, 54,
119, 125, 16]


"BEFORE SORT: " ECHO *test 256 print_heap CR CR CR   #Echoes "BEFORE SORT: ", then prints all 256 values of the test array, then gives 3 carriage returns
*test 256 heapsort 									 #Carries out the heapsort algorithm in place
"END OF SORT: " ECHO *test 256 print_heap 			 #Prints out sorted heap. Program ends


#Definitions of the words used

#": word_name . . . ;" defines a word

: heapsort 		#array, size ==> NULL
	int size 0 *size POP 							#gets size of the array to sort
	int heap_pointer 0 *heap_pointer POP 			#Gets a pointer to the start of the array
	heap_pointer size build_heap 					#Builds the heap data structure
	heap_pointer size sort 							#sorts the array using the heap
	; 


: build_heap #array, size ==> NULL
	int i 0
	int size 0
	int heap_pointer 0
	*size POP 										#initializes size and pointer variables
	*heap_pointer POP
	0 *i POP 										#sets i = 0
	i size < while 									#while (i<size){....}
		heap_pointer i sift_up 						#Adds value to the heap
		i 1 + *i POP 								#increments i
		i size <  									#tests 
	loop
;

: sort  		
	int size 0
	int heap_pointer 0
	int temp 0

	*size POP 										#initializes variables
	*heap_pointer POP
	size 1 - *size POP 								#decrements size
	size while 
		#swap top two values
		heap_pointer size + heap_pointer swap_values 	#swaps root of tree and a leaf node, this extracts the greates value in the heap
		0 heap_pointer size sift_down 					#sift_down manipulates the tree to regain the heap property
		size 1 - *size POP
	size loop 											#if size == 0 then return
;


#def sift_up(array,i):
#	j = get_parent(i)
#	if j>i:
#		if array[i] > array[j]:
#			temp = array[i]
#			array[i] = array[j]
#			array[j] = temp
#			array = sift_up[array,j]


: sift_up 
	int i 0
	int j 0
	int heap_pointer 0
	int temp 0


	*i POP 
	*heap_pointer POP

	i get_parent *j POP  								#j = parent(i)
	j i < if 											#checks for wraparound (if i the poinjter to the top of the heap, then j is negative, which in twos complement is a large number)
		heap_pointer i + PUSHB    heap_pointer j + PUSHB  > if #compares values pointed to by j and i, if heap[i] > heap[j], then the two values are swapped and sift_up is called again recursively
			heap_pointer i + heap_pointer j + swap_values
			heap_pointer j sift_up
		endif
	endif
;

: sift_down
	#sift down called on a node checks if either of the children of the node are greater than it, and if so, the value of the node is swapped with the largest child
	int left 0
	int right 0
	int i 0
	int size 0
	int largest 0
	int heap_pointer 0


	*size POP *heap_pointer POP *i POP #get vars

	i get_childl *left POP i  get_childr *right POP
	left size < heap_pointer left + PUSHB heap_pointer i + PUSHB > &
	if 
		left *largest POP
	else
		i *largest POP
	endif

	right size < heap_pointer right + PUSHB heap_pointer largest + PUSHB > &
	if 
		right *largest POP
	endif

	largest i > if
		heap_pointer i + heap_pointer largest +  swap_values
		largest heap_pointer size sift_down
	endif


;


#words which calculate the indices of children and parents
: get_parent 1 - 2 / ;
: get_childl 2 * 1 + ;
: get_childr 2 * 2 + ;

: swap_values #swaps two values from pointers
	char temp 0
	int ptr1 0
	int ptr2 0

	*ptr1 POP *ptr2 POP

	ptr1 PUSHB *temp POPB
	ptr2 PUSHB ptr1 POPB
	*temp PUSHB ptr2 POPB
;

: print_heap
	#iteratively prints the heap
	int test 0
	int size 0
	int i 0

	0 *i POP
	*size POP
	*test POP
	i size < while
		
		test i + PUSHB . SPACE
		i 1 + *i POP

	 i size < loop
;