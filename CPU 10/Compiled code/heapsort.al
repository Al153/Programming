Call main.main
 Halt

#<FORTH COMPILER: Using these .hlib files:
		#std.hlib



#<FORTH COMPILER: These files are imported by the .hlib files: 
		import Compilers\Forth\Headers\forth.al		




#<FORTH COMPILER the following are declarations for all variables used in the forth program
			int main:sort:*temp main:sort:temp
			int main:sort:temp 0
			int main:sort:*heap_pointer main:sort:heap_pointer
			int main:sort:heap_pointer 0
			int main:sort:*size main:sort:size
			int main:sort:size 0
			int main:print_heap:i 0
			int main:print_heap:*size main:print_heap:size
			int main:print_heap:*i main:print_heap:i
			int main:print_heap:*test main:print_heap:test
			int main:print_heap:test 0
			int main:print_heap:size 0
			int main:build_heap:*heap_pointer main:build_heap:heap_pointer
			int main:build_heap:i 0
			int main:build_heap:heap_pointer 0
			int main:build_heap:*size main:build_heap:size
			int main:build_heap:*i main:build_heap:i
			int main:build_heap:size 0
			int main:heapsort:*size main:heapsort:size
			int main:heapsort:*heap_pointer main:heapsort:heap_pointer
			int main:heapsort:heap_pointer 0
			int main:heapsort:size 0
			int main:sift_up:*temp main:sift_up:temp
			int main:sift_up:temp 0
			int main:sift_up:*heap_pointer main:sift_up:heap_pointer
			int main:sift_up:i 0
			int main:sift_up:j 0
			int main:sift_up:heap_pointer 0
			int main:sift_up:*i main:sift_up:i
			int main:sift_up:*j main:sift_up:j
			int main:swap_values:*temp main:swap_values:temp
			char main:swap_values:temp 0
			int main:swap_values:ptr2 0
			int main:swap_values:*ptr1 main:swap_values:ptr1
			int main:swap_values:*ptr2 main:swap_values:ptr2
			int main:swap_values:ptr1 0
			int main:sift_down:right 0
			int main:sift_down:*heap_pointer main:sift_down:heap_pointer
			int main:sift_down:i 0
			int main:sift_down:*left main:sift_down:left
			int main:sift_down:*right main:sift_down:right
			int main:sift_down:heap_pointer 0
			int main:sift_down:*size main:sift_down:size
			int main:sift_down:*largest main:sift_down:largest
			int main:sift_down:*i main:sift_down:i
			int main:sift_down:largest 0
			int main:sift_down:left 0
			int main:sift_down:size 0
			str main:main:gen_string1 "END OF SORT: "
			str main:main:gen_string0 "BEFORE SORT: "
			int main:main:*gen_string0 main:main:gen_string0
			int main:main:*gen_string1 main:main:gen_string1
			int main:main:*test main:main:test
			byteArray main:main:test 256 [
0,  189,  211,  176,  88,  35,  8,  29,  191,  55,  235,  63,  227,  175,  157,  37,  19,  199, 
248,  167,  14,  27,  50,  25,  110,  12,  33,  30,  131,  249,  86,  121,  79,  22,  241,  64, 
5,  8,  233,  236,  160,  68,  130,  229,  13,  115,  188,  154,  246,  149,  206,  77,  203,  76, 
3,  162,  113,  184,  28,  18,  141,  180,  226,  207,  62,  85,  250,  190,  70,  230,  100,  231, 
67,  31,  90,  144,  170,  223,  216,  97,  179,  132,  143,  9,  243,  91,  222,  98,  80,  139,  
92,  102,  173,  156,  145,  177,  87,  151,  237,  239,  56,  228,  134,  84,  210,  251,  127, 
103,  163,  126,  39,  153,  135,  150,  205,  142,  219,  152,  53,  17,  38,  74,  95,  220,  24, 
60,  137,  166,  66,  47,  75,  7,  174,  105,  140,  106,  169,  185,  161,  146,  234,  59,  197, 
116,  224,  254,  73,  214,  165,  253,  196,  10,  171,  61,  182,  57,  192,  208,  194,  218, 
48,  128,  159,  1,  6,  46,  247,  43,  118,  240,  5,  107,  212,  204,  181,  172,  238,  242, 
26,  200,  20,  96,  11,  112,  213,  120,  99,  71,  104,  201,  111,  2,  168,  148,  195,  209, 
4,  81,  16,  245,  108,  123,  41,  217,  232,  198,  34,  114,  21,  94,  255,  133,  89,  36,  117, 
225,  136,  78,  52,  252,  83,  65,  202,  147,  124,  49,  93,  82,  187,  101,  215,  186,  72,  109, 
122,  42,  51,  138,  193,  129,  69,  23,  178,  44,  158,  221,  40,  32,  183,  15,  155,  45,  244,  54, 
119,  125,  16]
#<FORTH COMPILER: end of variable declarations


#<FORTH COMPILER: Assembly generated for word: main.sort
Push main:sort:*size %main.sort
Load gp0 Forth.Pop
Goto Programstack.call
Push main:sort:*heap_pointer
Load gp0 Forth.Pop
Goto Programstack.call
Push main:sort:size
Push @1
Load gp0 Forth.SUB
Goto Programstack.call
Push main:sort:*size
Load gp0 Forth.Pop
Goto Programstack.call
Push main:sort:size
Pop gp0 %FORTH.while0
if gp0 then {
Push main:sort:heap_pointer
Push main:sort:size
Load gp0 Forth.ADD
Goto Programstack.call
Push main:sort:heap_pointer
Load gp0 main.swap_values
Goto Programstack.call
Push @0
Push main:sort:heap_pointer
Push main:sort:size
Load gp0 main.sift_down
Goto Programstack.call
Push main:sort:size
Push @1
Load gp0 Forth.SUB
Goto Programstack.call
Push main:sort:*size
Load gp0 Forth.Pop
Goto Programstack.call
Push main:sort:size
Load PC FORTH.while0
}
Return





#<FORTH COMPILER: Assembly generated for word: main.get_childr
Push @2 %main.get_childr
Load gp0 Forth.MUL
Goto Programstack.call
Push @2
Load gp0 Forth.ADD
Goto Programstack.call
Return





#<FORTH COMPILER: Assembly generated for word: main.print_heap
Push @0 %main.print_heap
Push main:print_heap:*i
Load gp0 Forth.Pop
Goto Programstack.call
Push main:print_heap:*size
Load gp0 Forth.Pop
Goto Programstack.call
Push main:print_heap:*test
Load gp0 Forth.Pop
Goto Programstack.call
Push main:print_heap:i
Push main:print_heap:size
Load gp0 Forth.Less
Goto Programstack.call
Pop gp0 %FORTH.while1
if gp0 then {
Push main:print_heap:test
Push main:print_heap:i
Load gp0 Forth.ADD
Goto Programstack.call
Load gp0 Forth.Push_byte
Goto Programstack.call
Load gp0 Forth.print
Goto Programstack.call
Load gp0 Forth.space
Goto Programstack.call
Push main:print_heap:i
Push @1
Load gp0 Forth.ADD
Goto Programstack.call
Push main:print_heap:*i
Load gp0 Forth.Pop
Goto Programstack.call
Push main:print_heap:i
Push main:print_heap:size
Load gp0 Forth.Less
Goto Programstack.call
Load PC FORTH.while1
}
Return





#<FORTH COMPILER: Assembly generated for word: main.build_heap
Push main:build_heap:*size %main.build_heap
Load gp0 Forth.Pop
Goto Programstack.call
Push main:build_heap:*heap_pointer
Load gp0 Forth.Pop
Goto Programstack.call
Push @0
Push main:build_heap:*i
Load gp0 Forth.Pop
Goto Programstack.call
Push main:build_heap:i
Push main:build_heap:size
Load gp0 Forth.Less
Goto Programstack.call
Pop gp0 %FORTH.while2
if gp0 then {
Push main:build_heap:heap_pointer
Push main:build_heap:i
Load gp0 main.sift_up
Goto Programstack.call
Push main:build_heap:i
Push @1
Load gp0 Forth.ADD
Goto Programstack.call
Push main:build_heap:*i
Load gp0 Forth.Pop
Goto Programstack.call
Push main:build_heap:i
Push main:build_heap:size
Load gp0 Forth.Less
Goto Programstack.call
Load PC FORTH.while2
}
Return





#<FORTH COMPILER: Assembly generated for word: main.get_parent
Push @1 %main.get_parent
Load gp0 Forth.SUB
Goto Programstack.call
Push @2
Load gp0 Forth.DIV
Goto Programstack.call
Return





#<FORTH COMPILER: Assembly generated for word: main.heapsort
Push main:heapsort:*size %main.heapsort
Load gp0 Forth.Pop
Goto Programstack.call
Push main:heapsort:*heap_pointer
Load gp0 Forth.Pop
Goto Programstack.call
Push main:heapsort:heap_pointer
Push main:heapsort:size
Load gp0 main.build_heap
Goto Programstack.call
Push main:heapsort:heap_pointer
Push main:heapsort:size
Load gp0 main.sort
Goto Programstack.call
Return





#<FORTH COMPILER: Assembly generated for word: main.sift_up
Push main:sift_up:*i %main.sift_up
Load gp0 Forth.Pop
Goto Programstack.call
Push main:sift_up:*heap_pointer
Load gp0 Forth.Pop
Goto Programstack.call
Push main:sift_up:i
Load gp0 main.get_parent
Goto Programstack.call
Push main:sift_up:*j
Load gp0 Forth.Pop
Goto Programstack.call
Push main:sift_up:j
Push main:sift_up:i
Load gp0 Forth.Less
Goto Programstack.call
Pop gp0
if gp0 then {
Push main:sift_up:heap_pointer
Push main:sift_up:i
Load gp0 Forth.ADD
Goto Programstack.call
Load gp0 Forth.Push_byte
Goto Programstack.call
Push main:sift_up:heap_pointer
Push main:sift_up:j
Load gp0 Forth.ADD
Goto Programstack.call
Load gp0 Forth.Push_byte
Goto Programstack.call
Load gp0 Forth.Greater
Goto Programstack.call
Pop gp0
if gp0 then {
Push main:sift_up:heap_pointer
Push main:sift_up:i
Load gp0 Forth.ADD
Goto Programstack.call
Push main:sift_up:heap_pointer
Push main:sift_up:j
Load gp0 Forth.ADD
Goto Programstack.call
Load gp0 main.swap_values
Goto Programstack.call
Push main:sift_up:heap_pointer
Push main:sift_up:j
Load gp0 main.sift_up
Goto Programstack.call
}
}
Return





#<FORTH COMPILER: Assembly generated for word: main.swap_values
Push main:swap_values:*ptr1 %main.swap_values
Load gp0 Forth.Pop
Goto Programstack.call
Push main:swap_values:*ptr2
Load gp0 Forth.Pop
Goto Programstack.call
Push main:swap_values:ptr1
Load gp0 Forth.Push_byte
Goto Programstack.call
Push main:swap_values:*temp
Load gp0 Forth.Pop_byte
Goto Programstack.call
Push main:swap_values:ptr2
Load gp0 Forth.Push_byte
Goto Programstack.call
Push main:swap_values:ptr1
Load gp0 Forth.Pop_byte
Goto Programstack.call
Push main:swap_values:*temp
Load gp0 Forth.Push_byte
Goto Programstack.call
Push main:swap_values:ptr2
Load gp0 Forth.Pop_byte
Goto Programstack.call
Return





#<FORTH COMPILER: Assembly generated for word: main.sift_down
Push main:sift_down:*size %main.sift_down
Load gp0 Forth.Pop
Goto Programstack.call
Push main:sift_down:*heap_pointer
Load gp0 Forth.Pop
Goto Programstack.call
Push main:sift_down:*i
Load gp0 Forth.Pop
Goto Programstack.call
Push main:sift_down:i
Load gp0 main.get_childl
Goto Programstack.call
Push main:sift_down:*left
Load gp0 Forth.Pop
Goto Programstack.call
Push main:sift_down:i
Load gp0 main.get_childr
Goto Programstack.call
Push main:sift_down:*right
Load gp0 Forth.Pop
Goto Programstack.call
Push main:sift_down:left
Push main:sift_down:size
Load gp0 Forth.Less
Goto Programstack.call
Push main:sift_down:heap_pointer
Push main:sift_down:left
Load gp0 Forth.ADD
Goto Programstack.call
Load gp0 Forth.Push_byte
Goto Programstack.call
Push main:sift_down:heap_pointer
Push main:sift_down:i
Load gp0 Forth.ADD
Goto Programstack.call
Load gp0 Forth.Push_byte
Goto Programstack.call
Load gp0 Forth.Greater
Goto Programstack.call
Load gp0 Forth.AND
Goto Programstack.call
Pop gp0
if gp0 then {
Push main:sift_down:left
Push main:sift_down:*largest
Load gp0 Forth.Pop
Goto Programstack.call
}
else {
Push main:sift_down:i
Push main:sift_down:*largest
Load gp0 Forth.Pop
Goto Programstack.call
}
Push main:sift_down:right
Push main:sift_down:size
Load gp0 Forth.Less
Goto Programstack.call
Push main:sift_down:heap_pointer
Push main:sift_down:right
Load gp0 Forth.ADD
Goto Programstack.call
Load gp0 Forth.Push_byte
Goto Programstack.call
Push main:sift_down:heap_pointer
Push main:sift_down:largest
Load gp0 Forth.ADD
Goto Programstack.call
Load gp0 Forth.Push_byte
Goto Programstack.call
Load gp0 Forth.Greater
Goto Programstack.call
Load gp0 Forth.AND
Goto Programstack.call
Pop gp0
if gp0 then {
Push main:sift_down:right
Push main:sift_down:*largest
Load gp0 Forth.Pop
Goto Programstack.call
}
Push main:sift_down:largest
Push main:sift_down:i
Load gp0 Forth.Greater
Goto Programstack.call
Pop gp0
if gp0 then {
Push main:sift_down:heap_pointer
Push main:sift_down:i
Load gp0 Forth.ADD
Goto Programstack.call
Push main:sift_down:heap_pointer
Push main:sift_down:largest
Load gp0 Forth.ADD
Goto Programstack.call
Load gp0 main.swap_values
Goto Programstack.call
Push main:sift_down:largest
Push main:sift_down:heap_pointer
Push main:sift_down:size
Load gp0 main.sift_down
Goto Programstack.call
}
Return





#<FORTH COMPILER: Assembly generated for word: main.main
Push main:main:gen_string0 %main.main
Load gp0 Forth.echo
Goto Programstack.call
Push main:main:*test
Push @256
Load gp0 main.print_heap
Goto Programstack.call
Load gp0 Forth.Carriage_return
Goto Programstack.call
Load gp0 Forth.Carriage_return
Goto Programstack.call
Load gp0 Forth.Carriage_return
Goto Programstack.call
Push main:main:*test
Push @256
Load gp0 main.heapsort
Goto Programstack.call
Push main:main:gen_string1
Load gp0 Forth.echo
Goto Programstack.call
Push main:main:*test
Push @256
Load gp0 main.print_heap
Goto Programstack.call
Return





#<FORTH COMPILER: Assembly generated for word: main.get_childl
Push @2 %main.get_childl
Load gp0 Forth.MUL
Goto Programstack.call
Push @1
Load gp0 Forth.ADD
Goto Programstack.call
Return




