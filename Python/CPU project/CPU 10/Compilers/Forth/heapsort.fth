using std.hlib


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

"BEFORE SORT: " ECHO *test 256 print_heap CR CR CR
*test 256 Heapsort
"END OF SORT: " ECHO *test 256 print_heap

: Heapsort 		#array, size ==> array
	int size 0 *size POP
	int heap_pointer 0 *heap_pointer POP
	heap_pointer size build_heap
	heap_pointer size sort
	; 


: build_heap #array, size ==> array
	int i 0
	int size 0
	int heap_pointer 0
	*size POP
	*heap_pointer POP
	0 *i POP
	i size < while
		heap_pointer i sift_up
		i 1 + *i POP
		i size <  
	loop
;

: sort 
	int size 0
	int heap_pointer 0
	int temp 0

	*size POP
	*heap_pointer POP
	size 1 - *size POP
	size while
		#swap top two values
		heap_pointer size + heap_pointer swap_values
		0 heap_pointer size sift_down
		size 1 - *size POP
		size 
	loop
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
	i get_parent *j POP 
	j i < if
		heap_pointer i + PUSHB    heap_pointer j + PUSHB  > if
			heap_pointer i + heap_pointer j + swap_values
			heap_pointer j sift_up
		endif
	endif
;

: sift_down 
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