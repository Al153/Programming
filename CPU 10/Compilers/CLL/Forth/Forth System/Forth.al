

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

byteArray CLL.array_of_string155 3 [126, 124, 0]
int CLL.string155 CLL.array_of_string155
byteArray CLL.array_of_string58 2 [91, 0]
int CLL.string58 CLL.array_of_string58
byteArray CLL.array_of_string59 2 [93, 0]
int CLL.string59 CLL.array_of_string59
byteArray CLL.array_of_string54 22 [32, 100, 117, 114, 105, 110, 103, 32, 99, 111, 109, 112, 105, 108, 97, 116, 105, 111, 110, 46, 10, 0]
int CLL.string54 CLL.array_of_string54
byteArray CLL.array_of_string55 32 [10, 67, 111, 117, 108, 100, 32, 110, 111, 116, 32, 99, 111, 109, 112, 108, 101, 116, 101, 32, 99, 111, 109, 112, 105, 108, 97, 116, 105, 111, 110, 0]
int CLL.string55 CLL.array_of_string55
byteArray CLL.array_of_string56 3 [47, 47, 0]
int CLL.string56 CLL.array_of_string56
byteArray CLL.array_of_string57 2 [59, 0]
int CLL.string57 CLL.array_of_string57
byteArray CLL.array_of_string50 2 [123, 0]
int CLL.string50 CLL.array_of_string50
byteArray CLL.array_of_string51 2 [123, 0]
int CLL.string51 CLL.array_of_string51
byteArray CLL.array_of_string52 2 [125, 0]
int CLL.string52 CLL.array_of_string52
int CLL.EOL 0
byteArray CLL.array_of_string172 3 [46, 99, 0]
int CLL.string172 CLL.array_of_string172
byteArray CLL.array_of_string186 7 [83, 87, 73, 84, 67, 72, 0]
int CLL.string186 CLL.array_of_string186
byteArray CLL.array_of_string138 2 [33, 0]
int CLL.string138 CLL.array_of_string138
byteArray CLL.array_of_string139 2 [46, 0]
int CLL.string139 CLL.array_of_string139
byteArray CLL.array_of_string130 40 [69, 82, 82, 79, 82, 58, 32, 85, 110, 97, 98, 108, 101, 32, 116, 111, 32, 108, 111, 97, 100, 32, 98, 108, 111, 99, 107, 32, 102, 114, 111, 109, 32, 100, 105, 115, 107, 58, 32, 0]
int CLL.string130 CLL.array_of_string130
byteArray CLL.array_of_string131 2 [10, 0]
int CLL.string131 CLL.array_of_string131
byteArray CLL.array_of_string132 25 [69, 82, 82, 79, 82, 58, 32, 66, 79, 79, 84, 83, 84, 82, 65, 80, 32, 70, 65, 73, 76, 69, 68, 10, 0]
int CLL.string132 CLL.array_of_string132
byteArray CLL.array_of_string133 24 [83, 99, 97, 110, 110, 105, 110, 103, 32, 116, 111, 32, 101, 110, 100, 32, 111, 102, 32, 100, 101, 102, 10, 0]
int CLL.string133 CLL.array_of_string133
byteArray CLL.array_of_string134 30 [69, 82, 82, 79, 82, 58, 32, 70, 111, 114, 116, 104, 32, 83, 116, 97, 99, 107, 32, 111, 118, 101, 114, 102, 108, 111, 119, 46, 10, 0]
int CLL.string134 CLL.array_of_string134
byteArray CLL.array_of_string135 31 [69, 82, 82, 79, 82, 58, 32, 70, 111, 114, 116, 104, 32, 83, 116, 97, 99, 107, 32, 117, 110, 100, 101, 114, 102, 108, 111, 119, 46, 10, 0]
int CLL.string135 CLL.array_of_string135
byteArray CLL.array_of_string136 23 [62, 62, 67, 79, 77, 80, 73, 76, 73, 78, 71, 32, 66, 85, 73, 76, 84, 32, 73, 78, 83, 10, 0]
int CLL.string136 CLL.array_of_string136
byteArray CLL.array_of_string137 2 [64, 0]
int CLL.string137 CLL.array_of_string137
byteArray CLL.array_of_keyboardBuff 256 []
int CLL.keyboardBuff CLL.array_of_keyboardBuff
array CLL.array_of_diskBuff 4097 []
int CLL.diskBuff CLL.array_of_diskBuff
byteArray CLL.array_of_string180 6 [65, 76, 76, 79, 67, 0]
int CLL.string180 CLL.array_of_string180
byteArray CLL.array_of_string179 6 [82, 69, 65, 68, 67, 0]
int CLL.string179 CLL.array_of_string179
byteArray CLL.array_of_string182 8 [83, 69, 84, 68, 73, 67, 84, 0]
int CLL.string182 CLL.array_of_string182
byteArray CLL.array_of_string114 2 [93, 0]
int CLL.string114 CLL.array_of_string114
byteArray CLL.array_of_string49 3 [47, 47, 0]
int CLL.string49 CLL.array_of_string49
byteArray CLL.array_of_string48 28 [69, 82, 82, 79, 82, 58, 32, 117, 110, 114, 101, 99, 111, 103, 110, 105, 115, 101, 100, 32, 111, 112, 99, 111, 100, 101, 32, 0]
int CLL.string48 CLL.array_of_string48
byteArray CLL.array_of_string47 30 [69, 82, 82, 79, 82, 58, 32, 70, 111, 114, 116, 104, 32, 83, 116, 97, 99, 107, 32, 79, 118, 101, 114, 102, 108, 111, 119, 46, 10, 0]
int CLL.string47 CLL.array_of_string47
byteArray CLL.array_of_string46 31 [69, 82, 82, 79, 82, 58, 32, 117, 110, 114, 101, 99, 111, 103, 110, 105, 115, 101, 100, 32, 98, 121, 116, 101, 99, 111, 100, 101, 58, 32, 0]
int CLL.string46 CLL.array_of_string46
byteArray CLL.array_of_string45 30 [69, 82, 82, 79, 82, 58, 32, 70, 111, 114, 116, 104, 32, 83, 116, 97, 99, 107, 32, 85, 110, 100, 101, 114, 102, 108, 111, 119, 10, 0]
int CLL.string45 CLL.array_of_string45
byteArray CLL.array_of_string44 30 [69, 82, 82, 79, 82, 58, 32, 70, 111, 114, 116, 104, 32, 83, 116, 97, 99, 107, 32, 85, 110, 100, 101, 114, 102, 108, 111, 119, 10, 0]
int CLL.string44 CLL.array_of_string44
byteArray CLL.array_of_string43 30 [69, 82, 82, 79, 82, 58, 32, 70, 111, 114, 116, 104, 32, 83, 116, 97, 99, 107, 32, 85, 110, 100, 101, 114, 102, 108, 111, 119, 10, 0]
int CLL.string43 CLL.array_of_string43
byteArray CLL.array_of_string42 30 [69, 82, 82, 79, 82, 58, 32, 70, 111, 114, 116, 104, 32, 83, 116, 97, 99, 107, 32, 85, 110, 100, 101, 114, 102, 108, 111, 119, 10, 0]
int CLL.string42 CLL.array_of_string42
byteArray CLL.array_of_string41 30 [69, 82, 82, 79, 82, 58, 32, 70, 111, 114, 116, 104, 32, 83, 116, 97, 99, 107, 32, 85, 110, 100, 101, 114, 102, 108, 111, 119, 10, 0]
int CLL.string41 CLL.array_of_string41
byteArray CLL.array_of_string40 30 [69, 82, 82, 79, 82, 58, 32, 70, 111, 114, 116, 104, 32, 83, 116, 97, 99, 107, 32, 85, 110, 100, 101, 114, 102, 108, 111, 119, 10, 0]
int CLL.string40 CLL.array_of_string40
byteArray CLL.array_of_string53 32 [69, 82, 82, 79, 82, 58, 32, 99, 111, 117, 108, 100, 32, 110, 111, 116, 32, 101, 120, 101, 99, 117, 116, 101, 32, 119, 111, 114, 100, 58, 32, 0]
int CLL.string53 CLL.array_of_string53
int CLL.lineBuff 0
byteArray CLL.array_of_string119 66 [69, 82, 82, 79, 82, 58, 32, 68, 105, 100, 32, 110, 111, 116, 32, 101, 120, 112, 101, 99, 116, 32, 97, 32, 115, 101, 109, 105, 99, 111, 108, 111, 110, 32, 119, 104, 101, 110, 32, 99, 111, 109, 112, 105, 108, 105, 110, 103, 32, 97, 110, 32, 105, 102, 32, 115, 116, 97, 116, 101, 109, 101, 110, 116, 10, 0]
int CLL.string119 CLL.array_of_string119
byteArray CLL.array_of_string149 2 [37, 0]
int CLL.string149 CLL.array_of_string149
byteArray CLL.array_of_string148 2 [47, 0]
int CLL.string148 CLL.array_of_string148
byteArray CLL.array_of_string145 2 [43, 0]
int CLL.string145 CLL.array_of_string145
byteArray CLL.array_of_string144 5 [68, 82, 79, 80, 0]
int CLL.string144 CLL.array_of_string144
byteArray CLL.array_of_string147 2 [42, 0]
int CLL.string147 CLL.array_of_string147
byteArray CLL.array_of_string146 2 [45, 0]
int CLL.string146 CLL.array_of_string146
byteArray CLL.array_of_string141 5 [83, 87, 65, 80, 0]
int CLL.string141 CLL.array_of_string141
byteArray CLL.array_of_string140 4 [68, 85, 80, 0]
int CLL.string140 CLL.array_of_string140
byteArray CLL.array_of_string143 5 [79, 86, 69, 82, 0]
int CLL.string143 CLL.array_of_string143
byteArray CLL.array_of_string142 4 [82, 79, 84, 0]
int CLL.string142 CLL.array_of_string142
byteArray CLL.array_of_string72 3 [46, 34, 0]
int CLL.string72 CLL.array_of_string72
int CLL.keyboardPtr 0
byteArray CLL.array_of_string70 68 [69, 82, 82, 79, 82, 58, 32, 68, 105, 100, 32, 110, 111, 116, 32, 101, 120, 112, 101, 99, 116, 32, 97, 32, 115, 101, 109, 105, 99, 111, 108, 111, 110, 32, 119, 104, 101, 110, 32, 99, 111, 109, 112, 105, 108, 105, 110, 103, 32, 97, 110, 32, 119, 104, 105, 108, 101, 32, 115, 116, 97, 116, 101, 109, 101, 110, 116, 0]
int CLL.string70 CLL.array_of_string70
byteArray CLL.array_of_string71 56 [69, 82, 82, 79, 82, 58, 32, 117, 110, 114, 101, 99, 111, 103, 110, 105, 115, 101, 100, 32, 114, 101, 116, 117, 114, 110, 32, 99, 111, 100, 101, 32, 102, 114, 111, 109, 32, 99, 111, 109, 112, 105, 108, 101, 87, 104, 105, 108, 101, 87, 111, 114, 100, 58, 32, 0]
int CLL.string71 CLL.array_of_string71
byteArray CLL.array_of_string76 2 [123, 0]
int CLL.string76 CLL.array_of_string76
byteArray CLL.array_of_string77 2 [123, 0]
int CLL.string77 CLL.array_of_string77
byteArray CLL.array_of_string74 3 [34, 10, 0]
int CLL.string74 CLL.array_of_string74
byteArray CLL.array_of_string75 3 [47, 47, 0]
int CLL.string75 CLL.array_of_string75
int CLL.blockOverFlowFlag 0
byteArray CLL.array_of_string79 32 [69, 82, 82, 79, 82, 58, 32, 99, 111, 117, 108, 100, 32, 110, 111, 116, 32, 101, 120, 101, 99, 117, 116, 101, 32, 119, 111, 114, 100, 58, 32, 0]
int CLL.string79 CLL.array_of_string79
byteArray CLL.array_of_string86 2 [91, 0]
int CLL.string86 CLL.array_of_string86
byteArray CLL.array_of_string175 6 [46, 100, 105, 99, 116, 0]
int CLL.string175 CLL.array_of_string175
byteArray CLL.array_of_string158 3 [62, 62, 0]
int CLL.string158 CLL.array_of_string158
byteArray CLL.array_of_string159 2 [60, 0]
int CLL.string159 CLL.array_of_string159
byteArray CLL.array_of_string156 3 [126, 94, 0]
int CLL.string156 CLL.array_of_string156
byteArray CLL.array_of_string157 3 [60, 60, 0]
int CLL.string157 CLL.array_of_string157
byteArray CLL.array_of_string154 3 [126, 38, 0]
int CLL.string154 CLL.array_of_string154
byteArray CLL.array_of_string62 32 [10, 67, 111, 117, 108, 100, 32, 110, 111, 116, 32, 99, 111, 109, 112, 108, 101, 116, 101, 32, 99, 111, 109, 112, 105, 108, 97, 116, 105, 111, 110, 0]
int CLL.string62 CLL.array_of_string62
byteArray CLL.array_of_string152 2 [94, 0]
int CLL.string152 CLL.array_of_string152
byteArray CLL.array_of_string153 2 [126, 0]
int CLL.string153 CLL.array_of_string153
byteArray CLL.array_of_string150 2 [38, 0]
int CLL.string150 CLL.array_of_string150
byteArray CLL.array_of_string151 2 [124, 0]
int CLL.string151 CLL.array_of_string151
byteArray CLL.array_of_string65 66 [69, 82, 82, 79, 82, 58, 32, 68, 105, 100, 32, 110, 111, 116, 32, 101, 120, 112, 101, 99, 116, 32, 97, 32, 115, 101, 109, 105, 99, 111, 108, 111, 110, 32, 119, 104, 101, 110, 32, 99, 111, 109, 112, 105, 108, 105, 110, 103, 32, 97, 110, 32, 105, 102, 32, 115, 116, 97, 116, 101, 109, 101, 110, 116, 10, 0]
int CLL.string65 CLL.array_of_string65
byteArray CLL.array_of_string64 66 [69, 82, 82, 79, 82, 58, 32, 68, 105, 100, 32, 110, 111, 116, 32, 101, 120, 112, 101, 99, 116, 32, 97, 32, 115, 101, 109, 105, 99, 111, 108, 111, 110, 32, 119, 104, 101, 110, 32, 99, 111, 109, 112, 105, 108, 105, 110, 103, 32, 97, 110, 32, 105, 102, 32, 115, 116, 97, 116, 101, 109, 101, 110, 116, 10, 0]
int CLL.string64 CLL.array_of_string64
byteArray CLL.array_of_string67 53 [69, 82, 82, 79, 82, 58, 32, 117, 110, 114, 101, 99, 111, 103, 110, 105, 115, 101, 100, 32, 114, 101, 116, 117, 114, 110, 32, 99, 111, 100, 101, 32, 102, 114, 111, 109, 32, 99, 111, 109, 112, 105, 108, 101, 73, 102, 87, 111, 114, 100, 58, 32, 0]
int CLL.string67 CLL.array_of_string67
byteArray CLL.array_of_string66 74 [69, 82, 82, 79, 82, 58, 32, 68, 105, 100, 32, 110, 111, 116, 32, 101, 120, 112, 101, 99, 116, 32, 115, 101, 99, 111, 110, 100, 32, 101, 108, 115, 101, 32, 99, 108, 97, 117, 115, 101, 32, 119, 104, 101, 110, 32, 99, 111, 109, 112, 105, 108, 105, 110, 103, 32, 97, 110, 100, 32, 105, 102, 32, 115, 116, 97, 116, 101, 109, 101, 110, 116, 10, 0]
int CLL.string66 CLL.array_of_string66
byteArray CLL.array_of_string61 22 [32, 100, 117, 114, 105, 110, 103, 32, 99, 111, 109, 112, 105, 108, 97, 116, 105, 111, 110, 46, 10, 0]
int CLL.string61 CLL.array_of_string61
byteArray CLL.array_of_string60 32 [69, 82, 82, 79, 82, 58, 32, 99, 111, 117, 108, 100, 32, 110, 111, 116, 32, 101, 120, 101, 99, 117, 116, 101, 32, 119, 111, 114, 100, 58, 32, 0]
int CLL.string60 CLL.array_of_string60
byteArray CLL.array_of_string63 3 [105, 102, 0]
int CLL.string63 CLL.array_of_string63
int CLL.ForthStackPointer 0
int CLL.diskPtr 0
byteArray CLL.array_of_string69 6 [119, 104, 105, 108, 101, 0]
int CLL.string69 CLL.array_of_string69
byteArray CLL.array_of_string68 53 [69, 82, 82, 79, 82, 58, 32, 117, 110, 114, 101, 99, 111, 103, 110, 105, 115, 101, 100, 32, 114, 101, 116, 117, 114, 110, 32, 99, 111, 100, 101, 32, 102, 114, 111, 109, 32, 99, 111, 109, 112, 105, 108, 101, 73, 102, 87, 111, 114, 100, 58, 32, 0]
int CLL.string68 CLL.array_of_string68
byteArray CLL.array_of_string115 32 [69, 82, 82, 79, 82, 58, 32, 99, 111, 117, 108, 100, 32, 110, 111, 116, 32, 101, 120, 101, 99, 117, 116, 101, 32, 119, 111, 114, 100, 58, 32, 0]
int CLL.string115 CLL.array_of_string115
byteArray CLL.array_of_string163 6 [67, 79, 78, 83, 84, 0]
int CLL.string163 CLL.array_of_string163
byteArray CLL.array_of_string162 9 [86, 65, 82, 73, 65, 66, 76, 69, 0]
int CLL.string162 CLL.array_of_string162
byteArray CLL.array_of_string161 2 [61, 0]
int CLL.string161 CLL.array_of_string161
byteArray CLL.array_of_string160 2 [62, 0]
int CLL.string160 CLL.array_of_string160
byteArray CLL.array_of_string167 7 [73, 78, 68, 73, 67, 84, 0]
int CLL.string167 CLL.array_of_string167
byteArray CLL.array_of_string166 5 [69, 88, 69, 67, 0]
int CLL.string166 CLL.array_of_string166
byteArray CLL.array_of_string165 5 [82, 69, 65, 68, 0]
int CLL.string165 CLL.array_of_string165
byteArray CLL.array_of_string164 6 [84, 65, 66, 76, 69, 0]
int CLL.string164 CLL.array_of_string164
byteArray CLL.array_of_string169 6 [73, 83, 73, 78, 84, 0]
int CLL.string169 CLL.array_of_string169
byteArray CLL.array_of_string168 2 [58, 0]
int CLL.string168 CLL.array_of_string168
int CLL.blockOverFlowPointer 0
byteArray CLL.array_of_string90 32 [10, 67, 111, 117, 108, 100, 32, 110, 111, 116, 32, 99, 111, 109, 112, 108, 101, 116, 101, 32, 99, 111, 109, 112, 105, 108, 97, 116, 105, 111, 110, 0]
int CLL.string90 CLL.array_of_string90
int CLL.READ_IN_STATE 0
byteArray CLL.array_of_string189 7 [84, 82, 89, 73, 78, 84, 0]
int CLL.string189 CLL.array_of_string189
byteArray CLL.array_of_string188 30 [62, 62, 67, 79, 77, 80, 73, 76, 73, 78, 71, 32, 82, 69, 80, 76, 32, 69, 78, 86, 73, 82, 79, 78, 77, 69, 78, 84, 10, 0]
int CLL.string188 CLL.array_of_string188
byteArray CLL.array_of_string73 37 [69, 82, 82, 79, 82, 58, 32, 117, 110, 114, 101, 99, 111, 103, 110, 105, 115, 101, 100, 32, 119, 111, 114, 100, 32, 99, 111, 109, 112, 105, 108, 101, 100, 58, 32, 34, 0]
int CLL.string73 CLL.array_of_string73
byteArray CLL.array_of_string181 7 [68, 65, 76, 76, 79, 67, 0]
int CLL.string181 CLL.array_of_string181
byteArray CLL.array_of_string178 3 [47, 47, 0]
int CLL.string178 CLL.array_of_string178
byteArray CLL.array_of_string183 9 [65, 68, 68, 66, 76, 79, 67, 75, 0]
int CLL.string183 CLL.array_of_string183
int CLL.linePtr 0
byteArray CLL.array_of_string185 6 [33, 68, 73, 83, 75, 0]
int CLL.string185 CLL.array_of_string185
byteArray CLL.array_of_string184 6 [64, 68, 73, 83, 75, 0]
int CLL.string184 CLL.array_of_string184
byteArray CLL.array_of_string187 8 [71, 69, 84, 68, 73, 67, 84, 0]
int CLL.string187 CLL.array_of_string187
byteArray CLL.array_of_string95 53 [69, 82, 82, 79, 82, 58, 32, 117, 110, 114, 101, 99, 111, 103, 110, 105, 115, 101, 100, 32, 114, 101, 116, 117, 114, 110, 32, 99, 111, 100, 101, 32, 102, 114, 111, 109, 32, 99, 111, 109, 112, 105, 108, 101, 73, 102, 87, 111, 114, 100, 58, 32, 0]
int CLL.string95 CLL.array_of_string95
byteArray CLL.array_of_string10 2 [10, 0]
int CLL.string10 CLL.array_of_string10
byteArray CLL.array_of_string11 2 [9, 0]
int CLL.string11 CLL.array_of_string11
byteArray CLL.array_of_string12 17 [48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 65, 66, 67, 68, 69, 70, 0]
int CLL.string12 CLL.array_of_string12
byteArray CLL.array_of_string13 5 [10, 79, 75, 10, 0]
int CLL.string13 CLL.array_of_string13
byteArray CLL.array_of_string14 4 [10, 62, 62, 0]
int CLL.string14 CLL.array_of_string14
byteArray CLL.array_of_string15 31 [69, 82, 82, 79, 82, 58, 32, 70, 111, 114, 116, 104, 32, 83, 116, 97, 99, 107, 32, 85, 110, 100, 101, 114, 102, 108, 111, 119, 46, 10, 0]
int CLL.string15 CLL.array_of_string15
byteArray CLL.array_of_string16 30 [69, 82, 82, 79, 82, 58, 32, 70, 111, 114, 116, 104, 32, 83, 116, 97, 99, 107, 32, 85, 110, 100, 101, 114, 102, 108, 111, 119, 10, 0]
int CLL.string16 CLL.array_of_string16
byteArray CLL.array_of_string17 2 [45, 0]
int CLL.string17 CLL.array_of_string17
byteArray CLL.array_of_string18 2 [32, 0]
int CLL.string18 CLL.array_of_string18
byteArray CLL.array_of_string19 2 [32, 0]
int CLL.string19 CLL.array_of_string19
byteArray CLL.array_of_string98 68 [69, 82, 82, 79, 82, 58, 32, 68, 105, 100, 32, 110, 111, 116, 32, 101, 120, 112, 101, 99, 116, 32, 97, 32, 115, 101, 109, 105, 99, 111, 108, 111, 110, 32, 119, 104, 101, 110, 32, 99, 111, 109, 112, 105, 108, 105, 110, 103, 32, 97, 110, 32, 119, 104, 105, 108, 101, 32, 115, 116, 97, 116, 101, 109, 101, 110, 116, 0]
int CLL.string98 CLL.array_of_string98
byteArray CLL.array_of_string99 56 [69, 82, 82, 79, 82, 58, 32, 117, 110, 114, 101, 99, 111, 103, 110, 105, 115, 101, 100, 32, 114, 101, 116, 117, 114, 110, 32, 99, 111, 100, 101, 32, 102, 114, 111, 109, 32, 99, 111, 109, 112, 105, 108, 101, 87, 104, 105, 108, 101, 87, 111, 114, 100, 58, 32, 0]
int CLL.string99 CLL.array_of_string99
byteArray CLL.array_of_string176 5 [72, 65, 76, 84, 0]
int CLL.string176 CLL.array_of_string176
byteArray CLL.array_of_string177 8 [68, 82, 79, 80, 65, 76, 76, 0]
int CLL.string177 CLL.array_of_string177
byteArray CLL.array_of_string170 9 [67, 79, 78, 86, 95, 73, 78, 84, 0]
int CLL.string170 CLL.array_of_string170
byteArray CLL.array_of_string171 5 [46, 66, 85, 70, 0]
int CLL.string171 CLL.array_of_string171
int CLL.ForthDictHead 0
byteArray CLL.array_of_string173 5 [80, 65, 83, 83, 0]
int CLL.string173 CLL.array_of_string173
int CLL.BackOfQueue 0
byteArray CLL.array_of_string91 3 [105, 102, 0]
int CLL.string91 CLL.array_of_string91
byteArray CLL.array_of_string92 66 [69, 82, 82, 79, 82, 58, 32, 68, 105, 100, 32, 110, 111, 116, 32, 101, 120, 112, 101, 99, 116, 32, 97, 32, 115, 101, 109, 105, 99, 111, 108, 111, 110, 32, 119, 104, 101, 110, 32, 99, 111, 109, 112, 105, 108, 105, 110, 103, 32, 97, 110, 32, 105, 102, 32, 115, 116, 97, 116, 101, 109, 101, 110, 116, 10, 0]
int CLL.string92 CLL.array_of_string92
byteArray CLL.array_of_string93 66 [69, 82, 82, 79, 82, 58, 32, 68, 105, 100, 32, 110, 111, 116, 32, 101, 120, 112, 101, 99, 116, 32, 97, 32, 115, 101, 109, 105, 99, 111, 108, 111, 110, 32, 119, 104, 101, 110, 32, 99, 111, 109, 112, 105, 108, 105, 110, 103, 32, 97, 110, 32, 105, 102, 32, 115, 116, 97, 116, 101, 109, 101, 110, 116, 10, 0]
int CLL.string93 CLL.array_of_string93
byteArray CLL.array_of_string94 74 [69, 82, 82, 79, 82, 58, 32, 68, 105, 100, 32, 110, 111, 116, 32, 101, 120, 112, 101, 99, 116, 32, 115, 101, 99, 111, 110, 100, 32, 101, 108, 115, 101, 32, 99, 108, 97, 117, 115, 101, 32, 119, 104, 101, 110, 32, 99, 111, 109, 112, 105, 108, 105, 110, 103, 32, 97, 110, 100, 32, 105, 102, 32, 115, 116, 97, 116, 101, 109, 101, 110, 116, 10, 0]
int CLL.string94 CLL.array_of_string94
array CLL.array_of_MALLOC_TREE_PARTITION 393216 []
int CLL.MALLOC_TREE_PARTITION CLL.array_of_MALLOC_TREE_PARTITION
byteArray CLL.array_of_string96 53 [69, 82, 82, 79, 82, 58, 32, 117, 110, 114, 101, 99, 111, 103, 110, 105, 115, 101, 100, 32, 114, 101, 116, 117, 114, 110, 32, 99, 111, 100, 101, 32, 102, 114, 111, 109, 32, 99, 111, 109, 112, 105, 108, 101, 73, 102, 87, 111, 114, 100, 58, 32, 0]
int CLL.string96 CLL.array_of_string96
byteArray CLL.array_of_string97 6 [119, 104, 105, 108, 101, 0]
int CLL.string97 CLL.array_of_string97
array CLL.array_of_ForthStack 65536 []
int CLL.ForthStack CLL.array_of_ForthStack
byteArray CLL.array_of_WORD_BUF 9 []
int CLL.WORD_BUF CLL.array_of_WORD_BUF
byteArray CLL.array_of_string78 2 [125, 0]
int CLL.string78 CLL.array_of_string78
int CLL.MALLOC_POOL 0
byteArray CLL.array_of_string198 7 [73, 78, 84, 69, 82, 80, 0]
int CLL.string198 CLL.array_of_string198
byteArray CLL.array_of_string192 5 [69, 86, 65, 76, 0]
int CLL.string192 CLL.array_of_string192
byteArray CLL.array_of_string193 7 [73, 78, 84, 69, 82, 80, 0]
int CLL.string193 CLL.array_of_string193
byteArray CLL.array_of_string190 5 [69, 86, 65, 76, 0]
int CLL.string190 CLL.array_of_string190
byteArray CLL.array_of_string191 7 [84, 82, 89, 73, 78, 84, 0]
int CLL.string191 CLL.array_of_string191
byteArray CLL.array_of_string196 22 [62, 62, 66, 85, 73, 76, 84, 32, 73, 78, 83, 32, 67, 79, 77, 80, 73, 76, 69, 68, 10, 0]
int CLL.string196 CLL.array_of_string196
byteArray CLL.array_of_string197 79 [79, 75, 10, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 10, 62, 62, 0]
int CLL.string197 CLL.array_of_string197
byteArray CLL.array_of_string194 74 [95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 32, 87, 101, 108, 99, 111, 109, 101, 32, 116, 111, 32, 65, 108, 32, 70, 111, 114, 116, 104, 32, 40, 50, 48, 49, 54, 41, 32, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 95, 10, 0]
int CLL.string194 CLL.array_of_string194
byteArray CLL.array_of_string195 24 [62, 62, 70, 79, 82, 84, 72, 32, 83, 89, 83, 84, 69, 77, 32, 83, 84, 65, 82, 84, 69, 68, 10, 0]
int CLL.string195 CLL.array_of_string195
byteArray CLL.array_of_string89 22 [32, 100, 117, 114, 105, 110, 103, 32, 99, 111, 109, 112, 105, 108, 97, 116, 105, 111, 110, 46, 10, 0]
int CLL.string89 CLL.array_of_string89
byteArray CLL.array_of_string88 32 [69, 82, 82, 79, 82, 58, 32, 99, 111, 117, 108, 100, 32, 110, 111, 116, 32, 101, 120, 101, 99, 117, 116, 101, 32, 119, 111, 114, 100, 58, 32, 0]
int CLL.string88 CLL.array_of_string88
byteArray CLL.array_of_string83 5 [101, 108, 115, 101, 0]
int CLL.string83 CLL.array_of_string83
byteArray CLL.array_of_string82 3 [47, 47, 0]
int CLL.string82 CLL.array_of_string82
byteArray CLL.array_of_string81 32 [10, 67, 111, 117, 108, 100, 32, 110, 111, 116, 32, 99, 111, 109, 112, 108, 101, 116, 101, 32, 99, 111, 109, 112, 105, 108, 97, 116, 105, 111, 110, 0]
int CLL.string81 CLL.array_of_string81
char CLL.dontBreak 0
byteArray CLL.array_of_string87 2 [93, 0]
int CLL.string87 CLL.array_of_string87
byteArray CLL.array_of_string34 30 [69, 82, 82, 79, 82, 58, 32, 70, 111, 114, 116, 104, 32, 83, 116, 97, 99, 107, 32, 85, 110, 100, 101, 114, 102, 108, 111, 119, 10, 0]
int CLL.string34 CLL.array_of_string34
byteArray CLL.array_of_string85 2 [59, 0]
int CLL.string85 CLL.array_of_string85
byteArray CLL.array_of_string84 5 [116, 104, 101, 110, 0]
int CLL.string84 CLL.array_of_string84
byteArray CLL.array_of_string101 37 [69, 82, 82, 79, 82, 58, 32, 117, 110, 114, 101, 99, 111, 103, 110, 105, 115, 101, 100, 32, 119, 111, 114, 100, 32, 99, 111, 109, 112, 105, 108, 101, 100, 58, 32, 34, 0]
int CLL.string101 CLL.array_of_string101
byteArray CLL.array_of_string100 3 [46, 34, 0]
int CLL.string100 CLL.array_of_string100
byteArray CLL.array_of_string103 3 [47, 47, 0]
int CLL.string103 CLL.array_of_string103
byteArray CLL.array_of_string102 3 [34, 10, 0]
int CLL.string102 CLL.array_of_string102
byteArray CLL.array_of_string105 2 [123, 0]
int CLL.string105 CLL.array_of_string105
byteArray CLL.array_of_string104 2 [123, 0]
int CLL.string104 CLL.array_of_string104
byteArray CLL.array_of_string107 32 [69, 82, 82, 79, 82, 58, 32, 99, 111, 117, 108, 100, 32, 110, 111, 116, 32, 101, 120, 101, 99, 117, 116, 101, 32, 119, 111, 114, 100, 58, 32, 0]
int CLL.string107 CLL.array_of_string107
byteArray CLL.array_of_string106 2 [125, 0]
int CLL.string106 CLL.array_of_string106
byteArray CLL.array_of_string109 32 [10, 67, 111, 117, 108, 100, 32, 110, 111, 116, 32, 99, 111, 109, 112, 108, 101, 116, 101, 32, 99, 111, 109, 112, 105, 108, 97, 116, 105, 111, 110, 0]
int CLL.string109 CLL.array_of_string109
byteArray CLL.array_of_string108 22 [32, 100, 117, 114, 105, 110, 103, 32, 99, 111, 109, 112, 105, 108, 97, 116, 105, 111, 110, 46, 10, 0]
int CLL.string108 CLL.array_of_string108
byteArray CLL.array_of_string80 22 [32, 100, 117, 114, 105, 110, 103, 32, 99, 111, 109, 112, 105, 108, 97, 116, 105, 111, 110, 46, 10, 0]
int CLL.string80 CLL.array_of_string80
byteArray CLL.array_of_string36 30 [69, 82, 82, 79, 82, 58, 32, 70, 111, 114, 116, 104, 32, 83, 116, 97, 99, 107, 32, 85, 110, 100, 101, 114, 102, 108, 111, 119, 10, 0]
int CLL.string36 CLL.array_of_string36
byteArray CLL.array_of_string37 30 [69, 82, 82, 79, 82, 58, 32, 70, 111, 114, 116, 104, 32, 83, 116, 97, 99, 107, 32, 85, 110, 100, 101, 114, 102, 108, 111, 119, 10, 0]
int CLL.string37 CLL.array_of_string37
array CLL.array_of_MALLOC_HEAP 1048576 []
int CLL.MALLOC_HEAP CLL.array_of_MALLOC_HEAP
byteArray CLL.array_of_string35 30 [69, 82, 82, 79, 82, 58, 32, 70, 111, 114, 116, 104, 32, 83, 116, 97, 99, 107, 32, 85, 110, 100, 101, 114, 102, 108, 111, 119, 10, 0]
int CLL.string35 CLL.array_of_string35
byteArray CLL.array_of_string32 30 [69, 82, 82, 79, 82, 58, 32, 70, 111, 114, 116, 104, 32, 83, 116, 97, 99, 107, 32, 85, 110, 100, 101, 114, 102, 108, 111, 119, 10, 0]
int CLL.string32 CLL.array_of_string32
byteArray CLL.array_of_string33 30 [69, 82, 82, 79, 82, 58, 32, 70, 111, 114, 116, 104, 32, 83, 116, 97, 99, 107, 32, 85, 110, 100, 101, 114, 102, 108, 111, 119, 10, 0]
int CLL.string33 CLL.array_of_string33
byteArray CLL.array_of_string30 30 [69, 82, 82, 79, 82, 58, 32, 70, 111, 114, 116, 104, 32, 83, 116, 97, 99, 107, 32, 85, 110, 100, 101, 114, 102, 108, 111, 119, 10, 0]
int CLL.string30 CLL.array_of_string30
byteArray CLL.array_of_string31 30 [69, 82, 82, 79, 82, 58, 32, 70, 111, 114, 116, 104, 32, 83, 116, 97, 99, 107, 32, 85, 110, 100, 101, 114, 102, 108, 111, 119, 10, 0]
int CLL.string31 CLL.array_of_string31
byteArray CLL.array_of_string118 3 [105, 102, 0]
int CLL.string118 CLL.array_of_string118
byteArray CLL.array_of_string38 30 [69, 82, 82, 79, 82, 58, 32, 70, 111, 114, 116, 104, 32, 83, 116, 97, 99, 107, 32, 85, 110, 100, 101, 114, 102, 108, 111, 119, 10, 0]
int CLL.string38 CLL.array_of_string38
byteArray CLL.array_of_string39 30 [69, 82, 82, 79, 82, 58, 32, 70, 111, 114, 116, 104, 32, 83, 116, 97, 99, 107, 32, 85, 110, 100, 101, 114, 102, 108, 111, 119, 10, 0]
int CLL.string39 CLL.array_of_string39
byteArray CLL.array_of_string112 2 [59, 0]
int CLL.string112 CLL.array_of_string112
byteArray CLL.array_of_string113 2 [91, 0]
int CLL.string113 CLL.array_of_string113
byteArray CLL.array_of_string110 3 [47, 47, 0]
int CLL.string110 CLL.array_of_string110
byteArray CLL.array_of_string111 5 [108, 111, 111, 112, 0]
int CLL.string111 CLL.array_of_string111
byteArray CLL.array_of_string116 22 [32, 100, 117, 114, 105, 110, 103, 32, 99, 111, 109, 112, 105, 108, 97, 116, 105, 111, 110, 46, 10, 0]
int CLL.string116 CLL.array_of_string116
byteArray CLL.array_of_string117 32 [10, 67, 111, 117, 108, 100, 32, 110, 111, 116, 32, 99, 111, 109, 112, 108, 101, 116, 101, 32, 99, 111, 109, 112, 105, 108, 97, 116, 105, 111, 110, 0]
int CLL.string117 CLL.array_of_string117
byteArray CLL.array_of_string8 17 [32, 78, 79, 84, 32, 65, 76, 76, 79, 67, 65, 84, 69, 68, 58, 32, 0]
int CLL.string8 CLL.array_of_string8
byteArray CLL.array_of_string9 2 [10, 0]
int CLL.string9 CLL.array_of_string9
byteArray CLL.array_of_string6 2 [10, 0]
int CLL.string6 CLL.array_of_string6
byteArray CLL.array_of_string7 13 [32, 65, 76, 76, 79, 67, 65, 84, 69, 68, 58, 32, 0]
int CLL.string7 CLL.array_of_string7
byteArray CLL.array_of_string4 45 [82, 85, 78, 84, 73, 77, 69, 32, 69, 82, 82, 79, 82, 58, 32, 114, 97, 110, 32, 111, 117, 116, 32, 111, 102, 32, 109, 97, 108, 108, 111, 99, 32, 116, 114, 101, 101, 32, 110, 111, 100, 101, 115, 10, 0]
int CLL.string4 CLL.array_of_string4
byteArray CLL.array_of_string5 2 [32, 0]
int CLL.string5 CLL.array_of_string5
byteArray CLL.array_of_string2 51 [82, 85, 78, 84, 73, 77, 69, 32, 69, 82, 82, 79, 82, 58, 32, 97, 108, 108, 111, 99, 97, 116, 105, 111, 110, 32, 115, 105, 122, 101, 32, 116, 111, 111, 32, 98, 105, 103, 32, 102, 111, 114, 32, 109, 97, 108, 108, 111, 99, 10, 0]
int CLL.string2 CLL.array_of_string2
byteArray CLL.array_of_string3 52 [82, 85, 78, 84, 73, 77, 69, 32, 69, 82, 82, 79, 82, 58, 32, 84, 114, 105, 101, 100, 32, 116, 111, 32, 100, 101, 97, 108, 108, 111, 99, 97, 116, 101, 32, 105, 110, 118, 97, 108, 105, 100, 32, 97, 100, 100, 114, 101, 115, 115, 10, 0]
int CLL.string3 CLL.array_of_string3
byteArray CLL.array_of_string0 43 [82, 85, 78, 84, 73, 77, 69, 32, 69, 82, 82, 79, 82, 58, 32, 117, 110, 97, 98, 108, 101, 32, 116, 111, 32, 97, 108, 108, 111, 99, 97, 116, 101, 32, 109, 101, 109, 111, 114, 121, 32, 10, 0]
int CLL.string0 CLL.array_of_string0
byteArray CLL.array_of_string1 44 [82, 85, 78, 84, 73, 77, 69, 32, 69, 82, 82, 79, 82, 58, 32, 99, 111, 117, 108, 100, 32, 110, 111, 116, 32, 100, 101, 97, 108, 108, 111, 99, 97, 116, 101, 32, 109, 101, 109, 111, 114, 121, 10, 0]
int CLL.string1 CLL.array_of_string1
byteArray CLL.array_of_string29 30 [69, 82, 82, 79, 82, 58, 32, 70, 111, 114, 116, 104, 32, 83, 116, 97, 99, 107, 32, 85, 110, 100, 101, 114, 102, 108, 111, 119, 10, 0]
int CLL.string29 CLL.array_of_string29
byteArray CLL.array_of_string28 30 [69, 82, 82, 79, 82, 58, 32, 70, 111, 114, 116, 104, 32, 83, 116, 97, 99, 107, 32, 85, 110, 100, 101, 114, 102, 108, 111, 119, 10, 0]
int CLL.string28 CLL.array_of_string28
byteArray CLL.array_of_string21 2 [9, 0]
int CLL.string21 CLL.array_of_string21
byteArray CLL.array_of_string20 2 [32, 0]
int CLL.string20 CLL.array_of_string20
byteArray CLL.array_of_string23 30 [69, 82, 82, 79, 82, 58, 32, 70, 111, 114, 116, 104, 32, 83, 116, 97, 99, 107, 32, 85, 110, 100, 101, 114, 102, 108, 111, 119, 10, 0]
int CLL.string23 CLL.array_of_string23
byteArray CLL.array_of_string22 30 [69, 82, 82, 79, 82, 58, 32, 70, 111, 114, 116, 104, 32, 83, 116, 97, 99, 107, 32, 79, 118, 101, 114, 102, 108, 111, 119, 46, 10, 0]
int CLL.string22 CLL.array_of_string22
byteArray CLL.array_of_string25 30 [69, 82, 82, 79, 82, 58, 32, 70, 111, 114, 116, 104, 32, 83, 116, 97, 99, 107, 32, 85, 110, 100, 101, 114, 102, 108, 111, 119, 10, 0]
int CLL.string25 CLL.array_of_string25
byteArray CLL.array_of_string24 30 [69, 82, 82, 79, 82, 58, 32, 70, 111, 114, 116, 104, 32, 83, 116, 97, 99, 107, 32, 85, 110, 100, 101, 114, 102, 108, 111, 119, 10, 0]
int CLL.string24 CLL.array_of_string24
byteArray CLL.array_of_string27 30 [69, 82, 82, 79, 82, 58, 32, 70, 111, 114, 116, 104, 32, 83, 116, 97, 99, 107, 32, 79, 118, 101, 114, 102, 108, 111, 119, 46, 10, 0]
int CLL.string27 CLL.array_of_string27
byteArray CLL.array_of_string26 30 [69, 82, 82, 79, 82, 58, 32, 70, 111, 114, 116, 104, 32, 83, 116, 97, 99, 107, 32, 85, 110, 100, 101, 114, 102, 108, 111, 119, 10, 0]
int CLL.string26 CLL.array_of_string26
int CLL.MALLOC_TREE 0
int CLL.frontOfQueue 0
int CLL.READ_IN_MODE 0
byteArray CLL.array_of_string127 3 [46, 34, 0]
int CLL.string127 CLL.array_of_string127
byteArray CLL.array_of_string126 56 [69, 82, 82, 79, 82, 58, 32, 117, 110, 114, 101, 99, 111, 103, 110, 105, 115, 101, 100, 32, 114, 101, 116, 117, 114, 110, 32, 99, 111, 100, 101, 32, 102, 114, 111, 109, 32, 99, 111, 109, 112, 105, 108, 101, 87, 104, 105, 108, 101, 87, 111, 114, 100, 58, 32, 0]
int CLL.string126 CLL.array_of_string126
byteArray CLL.array_of_string125 68 [69, 82, 82, 79, 82, 58, 32, 68, 105, 100, 32, 110, 111, 116, 32, 101, 120, 112, 101, 99, 116, 32, 97, 32, 115, 101, 109, 105, 99, 111, 108, 111, 110, 32, 119, 104, 101, 110, 32, 99, 111, 109, 112, 105, 108, 105, 110, 103, 32, 97, 110, 32, 119, 104, 105, 108, 101, 32, 115, 116, 97, 116, 101, 109, 101, 110, 116, 0]
int CLL.string125 CLL.array_of_string125
byteArray CLL.array_of_string124 6 [119, 104, 105, 108, 101, 0]
int CLL.string124 CLL.array_of_string124
byteArray CLL.array_of_string123 53 [69, 82, 82, 79, 82, 58, 32, 117, 110, 114, 101, 99, 111, 103, 110, 105, 115, 101, 100, 32, 114, 101, 116, 117, 114, 110, 32, 99, 111, 100, 101, 32, 102, 114, 111, 109, 32, 99, 111, 109, 112, 105, 108, 101, 73, 102, 87, 111, 114, 100, 58, 32, 0]
int CLL.string123 CLL.array_of_string123
byteArray CLL.array_of_string122 53 [69, 82, 82, 79, 82, 58, 32, 117, 110, 114, 101, 99, 111, 103, 110, 105, 115, 101, 100, 32, 114, 101, 116, 117, 114, 110, 32, 99, 111, 100, 101, 32, 102, 114, 111, 109, 32, 99, 111, 109, 112, 105, 108, 101, 73, 102, 87, 111, 114, 100, 58, 32, 0]
int CLL.string122 CLL.array_of_string122
byteArray CLL.array_of_string121 74 [69, 82, 82, 79, 82, 58, 32, 68, 105, 100, 32, 110, 111, 116, 32, 101, 120, 112, 101, 99, 116, 32, 115, 101, 99, 111, 110, 100, 32, 101, 108, 115, 101, 32, 99, 108, 97, 117, 115, 101, 32, 119, 104, 101, 110, 32, 99, 111, 109, 112, 105, 108, 105, 110, 103, 32, 97, 110, 100, 32, 105, 102, 32, 115, 116, 97, 116, 101, 109, 101, 110, 116, 10, 0]
int CLL.string121 CLL.array_of_string121
byteArray CLL.array_of_string120 66 [69, 82, 82, 79, 82, 58, 32, 68, 105, 100, 32, 110, 111, 116, 32, 101, 120, 112, 101, 99, 116, 32, 97, 32, 115, 101, 109, 105, 99, 111, 108, 111, 110, 32, 119, 104, 101, 110, 32, 99, 111, 109, 112, 105, 108, 105, 110, 103, 32, 97, 110, 32, 105, 102, 32, 115, 116, 97, 116, 101, 109, 101, 110, 116, 10, 0]
int CLL.string120 CLL.array_of_string120
byteArray CLL.array_of_string174 3 [46, 115, 0]
int CLL.string174 CLL.array_of_string174
byteArray CLL.array_of_string129 3 [34, 10, 0]
int CLL.string129 CLL.array_of_string129
byteArray CLL.array_of_string128 37 [69, 82, 82, 79, 82, 58, 32, 117, 110, 114, 101, 99, 111, 103, 110, 105, 115, 101, 100, 32, 119, 111, 114, 100, 32, 99, 111, 109, 112, 105, 108, 101, 100, 58, 32, 34, 0]
int CLL.string128 CLL.array_of_string128
#########################################################################################################################
																	Scope less
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
def Local.a 8
def @Local.a @8
def Local.b 12
def @Local.b @12
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:less
SUB Stack_pointer @16 									#OVERHEAD FOR FUNCTION less
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION less
Load gp1 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp0 @2
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifless-0endif
Load gp0 CLL.string44 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 @0
AND gp0 @255 													  #CASTING INT TO CHAR
StoreByte gp0 CLL.dontBreak 									#STORE GP0 GLOBAL (CHAR)
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Pass										%ifless-0endif
Load gp0 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp1 @1
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Store gp0 CLL.ForthStackPointer 										#STORE GP0 GLOBAL
Load gp0 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp1 @1
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Move gp0 gp6 						#PUSH gp0 POP gp6
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 CLL.ForthStack 											#LOAD GP0 GLOBAL RELATIVE
Load gp0 0 [gp6]									
Store gp0 Local.a [Stack_pointer] 						#STORE GP0
Load gp6 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 CLL.ForthStack 											#LOAD GP0 GLOBAL RELATIVE
Load gp0 0 [gp6]									
Store gp0 Local.b [Stack_pointer] 						#STORE GP0
Load gp1 Local.a [Stack_pointer] 						#LOAD GP0
Load gp0 @2147483648
AND gp0 gp1 														#AND
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp1 Local.b [Stack_pointer] 						#LOAD GP0
Load gp0 @2147483648
AND gp0 gp1 														#AND
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
AND gp0 gp1
if gp0 then Load PC ifless-3true 									#IF ELSE STATEMENT
Load gp1 Local.a [Stack_pointer] 						#LOAD GP0
Load gp0 @2147483648
AND gp0 gp1 														#AND
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
if gp0 then Load PC ifless-2true 									#IF ELSE STATEMENT
Load gp1 Local.b [Stack_pointer] 						#LOAD GP0
Load gp0 @2147483648
AND gp0 gp1 														#AND
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
if gp0 then Load PC ifless-1true 									#IF ELSE STATEMENT
Load gp0 Local.a [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 Local.b [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:__less 												#CALLING __less
Load gp0 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp1 @1
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Move gp0 gp6 						#PUSH gp0 POP gp6
MUL gp6 @4 														   #INDEXING FOR @INT
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
ADD gp6 CLL.ForthStack 											#STORE GP0 GLOBAL RELATIVE
Store gp0 0 [gp6]
Load PC ifless-1endif
Pass 										%ifless-1true
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp1 @1
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Move gp0 gp6 						#PUSH gp0 POP gp6
MUL gp6 @4 														   #INDEXING FOR @INT
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
ADD gp6 CLL.ForthStack 											#STORE GP0 GLOBAL RELATIVE
Store gp0 0 [gp6]
Pass 										%ifless-1endif           
Load PC ifless-2endif
Pass 										%ifless-2true
Load gp0 @1
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp1 @1
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Move gp0 gp6 						#PUSH gp0 POP gp6
MUL gp6 @4 														   #INDEXING FOR @INT
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
ADD gp6 CLL.ForthStack 											#STORE GP0 GLOBAL RELATIVE
Store gp0 0 [gp6]
Pass 										%ifless-2endif           
Load PC ifless-3endif
Pass 										%ifless-3true
Load gp0 Local.a [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 Local.b [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:__less 												#CALLING __less
Load gp0 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp1 @1
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Move gp0 gp6 						#PUSH gp0 POP gp6
MUL gp6 @4 														   #INDEXING FOR @INT
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
ADD gp6 CLL.ForthStack 											#STORE GP0 GLOBAL RELATIVE
Store gp0 0 [gp6]
Pass 										%ifless-3endif           
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
#########################################################################################################################
																	Scope printChar
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
def Local.TOS 8
def @Local.TOS @8
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:printChar
SUB Stack_pointer @12 									#OVERHEAD FOR FUNCTION printChar
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION printChar
Goto function:Pop 												#CALLING Pop
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.TOS [Stack_pointer] 						#STORE GP0
Load gp0 Local.TOS [Stack_pointer] 						#LOAD GP0
AND gp0 @255 													  #CASTING INT TO CHAR
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:putc 												#CALLING putc
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
#########################################################################################################################
																	Scope __less
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
def Local.a 8
def @Local.a @8
def Local.b 12
def @Local.b @12
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:__less
SUB Stack_pointer @16 									#OVERHEAD FOR FUNCTION __less
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION __less
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.b [Stack_pointer] 						#STORE GP0
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.a [Stack_pointer] 						#STORE GP0
Load gp1 Local.a [Stack_pointer] 						#LOAD GP0
Load gp0 Local.b [Stack_pointer] 						#LOAD GP0
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC if__less-0true 									#IF ELSE STATEMENT
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Load PC if__less-0endif
Pass 										%if__less-0true
Load gp0 @1
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Pass 										%if__less-0endif           
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
#########################################################################################################################
																	Scope checkDictName
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
def Local.i 8
def @Local.i @8
def Local.name 12
def @Local.name @12
def Local.reference 16
def @Local.reference @16
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:checkDictName
SUB Stack_pointer @20 									#OVERHEAD FOR FUNCTION checkDictName
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION checkDictName
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.reference [Stack_pointer] 						#STORE GP0
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.name [Stack_pointer] 						#STORE GP0
Load gp0 @0
Store gp0 Local.i [Stack_pointer] 						#STORE GP0
Pass 										%loopcheckDictName-0entry 		#FOR LOOP
Load gp1 Local.i [Stack_pointer] 						#LOAD GP0
Load gp0 @8
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
NOT gp0
if gp0 then Load PC loopcheckDictName-0exit
Load gp6 Local.i [Stack_pointer] 						#LOAD GP0
ADD gp6 Local.name [Stack_pointer]							#LOAD GP0 RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp6 Local.i [Stack_pointer] 						#LOAD GP0
ADD gp6 Local.reference [Stack_pointer]							#LOAD GP0 RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
Load  gp2 @4294967295 												#COMPARE (NOT EQUAL)
Compare gp1 gp0 
if Equal then Move Zero gp2
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifcheckDictName-0endif
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Pass										%ifcheckDictName-0endif
Load gp6 Local.i [Stack_pointer] 						#LOAD GP0
ADD gp6 Local.name [Stack_pointer]							#LOAD GP0 RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @0
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifcheckDictName-1endif
Load gp0 @1
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Pass										%ifcheckDictName-1endif
Pass 										%loopcheckDictName-0continue
Load gp1 Local.i [Stack_pointer] 						#LOAD GP0
Load gp0 @1
ADD gp0 gp1 														#ADD
Store gp0 Local.i [Stack_pointer] 						#STORE GP0
Load PC loopcheckDictName-0entry
Pass 										%loopcheckDictName-0exit
Load gp6 @8
ADD gp6 Local.name [Stack_pointer]							#LOAD GP0 RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @0
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifcheckDictName-2endif
Load gp0 @1
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Pass										%ifcheckDictName-2endif
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
#########################################################################################################################
																	Scope setDict
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:setDict
SUB Stack_pointer @8 									#OVERHEAD FOR FUNCTION setDict
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION setDict
Goto function:Pop 												#CALLING Pop
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 CLL.ForthDictHead 										#STORE GP0 GLOBAL
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
#########################################################################################################################
																	Scope SUB
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:SUB
SUB Stack_pointer @8 									#OVERHEAD FOR FUNCTION SUB
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION SUB
Load gp1 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp0 @2
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifSUB-0endif
Load gp0 CLL.string30 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 @0
AND gp0 @255 													  #CASTING INT TO CHAR
StoreByte gp0 CLL.dontBreak 									#STORE GP0 GLOBAL (CHAR)
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Pass										%ifSUB-0endif
Load gp0 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp1 @1
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Store gp0 CLL.ForthStackPointer 										#STORE GP0 GLOBAL
Load gp0 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp1 @1
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Move gp0 gp6 						#PUSH gp0 POP gp6
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 CLL.ForthStack 											#LOAD GP0 GLOBAL RELATIVE
Load gp0 0 [gp6]									
Load gp6 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 CLL.ForthStack 											#LOAD GP0 GLOBAL RELATIVE
Load gp1 0 [gp6]									
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp1 @1
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Move gp0 gp6 						#PUSH gp0 POP gp6
MUL gp6 @4 														   #INDEXING FOR @INT
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
ADD gp6 CLL.ForthStack 											#STORE GP0 GLOBAL RELATIVE
Store gp0 0 [gp6]
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
#########################################################################################################################
																	Scope getDict
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:getDict
SUB Stack_pointer @8 									#OVERHEAD FOR FUNCTION getDict
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION getDict
Load gp0 CLL.ForthDictHead 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:Push 												#CALLING Push
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
#########################################################################################################################
																	Scope malloc_init
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
def Local.i 8
def @Local.i @8
def Local.next_address 12
def @Local.next_address @12
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:malloc_init
SUB Stack_pointer @16 									#OVERHEAD FOR FUNCTION malloc_init
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION malloc_init
Load gp0 @0
Store gp0 Local.i [Stack_pointer] 						#STORE GP0
Pass 										%loopmalloc_init-0entry 		#FOR LOOP
Load gp1 Local.i [Stack_pointer] 						#LOAD GP0
Load gp0 @393216
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
NOT gp0
if gp0 then Load PC loopmalloc_init-0exit
Load gp1 Local.i [Stack_pointer] 						#LOAD GP0
Load gp0 @6
ADD gp0 gp1 														#ADD
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @393216
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifmalloc_init-0true 									#IF ELSE STATEMENT
Load gp0 @0
Store gp0 Local.next_address [Stack_pointer] 						#STORE GP0
Load PC ifmalloc_init-0endif
Pass 										%ifmalloc_init-0true
Load gp0 CLL.MALLOC_TREE_PARTITION 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp1 Local.i [Stack_pointer] 						#LOAD GP0
Load gp0 @6
ADD gp0 gp1 														#ADD
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @4
MUL gp0 gp1 														#MULTIPLY
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Store gp0 Local.next_address [Stack_pointer] 						#STORE GP0
Pass 										%ifmalloc_init-0endif           
Load gp0 Local.next_address [Stack_pointer] 						#LOAD GP0
Load gp6 Local.i [Stack_pointer] 						#LOAD GP0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 CLL.MALLOC_TREE_PARTITION 											#STORE GP0 GLOBAL RELATIVE
Store gp0 0 [gp6]
Pass 										%loopmalloc_init-0continue
Load gp1 Local.i [Stack_pointer] 						#LOAD GP0
Load gp0 @6
ADD gp0 gp1 														#ADD
Store gp0 Local.i [Stack_pointer] 						#STORE GP0
Load PC loopmalloc_init-0entry
Pass 										%loopmalloc_init-0exit
Load gp0 @1048576
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
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
#########################################################################################################################
																	Scope newByteCodeNode
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
def Local.field2 8
def @Local.field2 @8
def Local.returnPTR 12
def @Local.returnPTR @12
def Local.field1 16
def @Local.field1 @16
def Local.type 20
def @Local.type @20
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:newByteCodeNode
SUB Stack_pointer @24 									#OVERHEAD FOR FUNCTION newByteCodeNode
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION newByteCodeNode
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.field2 [Stack_pointer] 						#STORE GP0
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.field1 [Stack_pointer] 						#STORE GP0
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.type [Stack_pointer] 						#STORE GP0
Load gp0 @4
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:malloc 												#CALLING malloc
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.returnPTR [Stack_pointer] 						#STORE GP0
Load gp0 Local.type [Stack_pointer] 						#LOAD GP0
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.returnPTR [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 Local.field1 [Stack_pointer] 						#LOAD GP0
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.returnPTR [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 Local.field2 [Stack_pointer] 						#LOAD GP0
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.returnPTR [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @0
Load gp6 @3
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.returnPTR [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 Local.returnPTR [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
#########################################################################################################################
																	Scope create_tree_node
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
def Local.parent_link 8
def @Local.parent_link @8
def Local.new_pointer 12
def @Local.new_pointer @12
def Local.address 20
def @Local.address @20
def Local.size 16
def @Local.size @16
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:create_tree_node
SUB Stack_pointer @24 									#OVERHEAD FOR FUNCTION create_tree_node
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION create_tree_node
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.parent_link [Stack_pointer] 						#STORE GP0
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.address [Stack_pointer] 						#STORE GP0
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.size [Stack_pointer] 						#STORE GP0
Load gp0 CLL.MALLOC_POOL 										#LOAD GP0 GLOBAL
Store gp0 Local.new_pointer [Stack_pointer] 						#STORE GP0
Load gp0 Local.new_pointer [Stack_pointer] 						#LOAD GP0
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
ADD gp6 Local.new_pointer [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 CLL.MALLOC_POOL 										#STORE GP0 GLOBAL
Load gp0 Local.parent_link [Stack_pointer] 						#LOAD GP0
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.new_pointer [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @0
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.new_pointer [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 Local.address [Stack_pointer] 						#LOAD GP0
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.new_pointer [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 Local.size [Stack_pointer] 						#LOAD GP0
Load gp6 @3
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.new_pointer [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @0
Load gp6 @4
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.new_pointer [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @0
Load gp6 @5
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.new_pointer [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 Local.new_pointer [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Pass 										%ifcreate_tree_node-0endif           
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
#########################################################################################################################
																	Scope getWordName
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
def Local.thisChar 8
def @Local.thisChar @8
def Local.i 9
def @Local.i @9
def Local.done 13
def @Local.done @13
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:getWordName
SUB Stack_pointer @17 									#OVERHEAD FOR FUNCTION getWordName
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION getWordName
Load gp0 @0
Store gp0 Local.done [Stack_pointer] 						#STORE GP0
Goto function:scrollWhiteSpaceAndLine 												#CALLING scrollWhiteSpaceAndLine
Load gp0 @0
Store gp0 Local.i [Stack_pointer] 						#STORE GP0
Pass 										%loopgetWordName-0entry 		#FOR LOOP
Load gp1 Local.i [Stack_pointer] 						#LOAD GP0
Load gp0 @8
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
NOT gp0
if gp0 then Load PC loopgetWordName-0exit
Load gp0 Local.done [Stack_pointer] 						#LOAD GP0
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
if gp0 then Load PC ifgetWordName-1true 									#IF ELSE STATEMENT
Goto function:readStringChar 												#CALLING readStringChar
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
StoreByte gp0 Local.thisChar [Stack_pointer] 					#STORE GP0 (CHAR)
LoadByte gp0 Local.thisChar [Stack_pointer] 					#LOAD GP0 (CHAR)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:isWhiteSpace 												#CALLING isWhiteSpace
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
if gp0 then Load PC ifgetWordName-0true 									#IF ELSE STATEMENT
LoadByte gp0 Local.thisChar [Stack_pointer] 					#LOAD GP0 (CHAR)
Load gp6 Local.i [Stack_pointer] 						#LOAD GP0
ADD gp6 CLL.WORD_BUF 											#STORE GP0 GLOBAL RELATIVE (CHAR)
StoreByte gp0 0 [gp6]
Load PC ifgetWordName-0endif
Pass 										%ifgetWordName-0true
Load gp0 @1
Store gp0 Local.done [Stack_pointer] 						#STORE GP0
Load gp0 @0
AND gp0 @255 													  #CASTING INT TO CHAR
Load gp6 Local.i [Stack_pointer] 						#LOAD GP0
ADD gp6 CLL.WORD_BUF 											#STORE GP0 GLOBAL RELATIVE (CHAR)
StoreByte gp0 0 [gp6]
Pass 										%ifgetWordName-0endif           
Load PC ifgetWordName-1endif
Pass 										%ifgetWordName-1true
Load gp0 @0
AND gp0 @255 													  #CASTING INT TO CHAR
Load gp6 Local.i [Stack_pointer] 						#LOAD GP0
ADD gp6 CLL.WORD_BUF 											#STORE GP0 GLOBAL RELATIVE (CHAR)
StoreByte gp0 0 [gp6]
Pass 										%ifgetWordName-1endif           
Pass 										%loopgetWordName-0continue
Load gp1 Local.i [Stack_pointer] 						#LOAD GP0
Load gp0 @1
ADD gp0 gp1 														#ADD
Store gp0 Local.i [Stack_pointer] 						#STORE GP0
Load PC loopgetWordName-0entry
Pass 										%loopgetWordName-0exit
Load gp0 @0
AND gp0 @255 													  #CASTING INT TO CHAR
Load gp6 @8
ADD gp6 CLL.WORD_BUF 											#STORE GP0 GLOBAL RELATIVE (CHAR)
StoreByte gp0 0 [gp6]
Load gp0 Local.done [Stack_pointer] 						#LOAD GP0
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifgetWordName-2endif
Goto function:readStringChar 												#CALLING readStringChar
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
StoreByte gp0 Local.thisChar [Stack_pointer] 					#STORE GP0 (CHAR)
Pass 										%loopgetWordName-1entry 		#FOR LOOP
LoadByte gp0 Local.thisChar [Stack_pointer] 					#LOAD GP0 (CHAR)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:isWhiteSpace 												#CALLING isWhiteSpace
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														
NOT gp0
if gp0 then Load PC loopgetWordName-1exit
Load PC loopgetWordName-1continue
Pass 										%loopgetWordName-1continue
Goto function:readStringChar 												#CALLING readStringChar
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
StoreByte gp0 Local.thisChar [Stack_pointer] 					#STORE GP0 (CHAR)
Load PC loopgetWordName-1entry
Pass 										%loopgetWordName-1exit
Pass										%ifgetWordName-2endif
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
#########################################################################################################################
																	Scope readIn
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
def Local.diskAddress 12
def @Local.diskAddress @12
def Local.character 18
def @Local.character @18
def Local.lineFeed 19
def @Local.lineFeed @19
def Local.failed 8
def @Local.failed @8
def Local.backSpace 16
def @Local.backSpace @16
def Local.blank 17
def @Local.blank @17
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:readIn
SUB Stack_pointer @20 									#OVERHEAD FOR FUNCTION readIn
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION readIn
Load gp1 CLL.READ_IN_MODE 										#LOAD GP0 GLOBAL
Load gp0 @1
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifreadIn-7true 									#IF ELSE STATEMENT
Load gp0 @0
Store gp0 CLL.linePtr 										#STORE GP0 GLOBAL
Load gp0 @10
AND gp0 @255 													  #CASTING INT TO CHAR
StoreByte gp0 Local.lineFeed [Stack_pointer] 					#STORE GP0 (CHAR)
Load gp0 @0
AND gp0 @255 													  #CASTING INT TO CHAR
StoreByte gp0 Local.blank [Stack_pointer] 					#STORE GP0 (CHAR)
Load gp0 @8
AND gp0 @255 													  #CASTING INT TO CHAR
StoreByte gp0 Local.backSpace [Stack_pointer] 					#STORE GP0 (CHAR)
Pass 										%loopreadIn-1entry
Load gp0 @1
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0
if gp0 then Load PC loopreadIn-1exit 								#WHILE LOOP
Goto function:getw 												#CALLING getw
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
StoreByte gp0 Local.character [Stack_pointer] 					#STORE GP0 (CHAR)
LoadByte gp0 Local.character [Stack_pointer] 					#LOAD GP0 (CHAR)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:putc 												#CALLING putc
LoadByte gp0 Local.character [Stack_pointer] 					#LOAD GP0 (CHAR)
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @13
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifreadIn-6true 									#IF ELSE STATEMENT
LoadByte gp0 Local.character [Stack_pointer] 					#LOAD GP0 (CHAR)
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @8
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifreadIn-5endif
Load gp1 CLL.linePtr 										#LOAD GP0 GLOBAL
Load gp0 @0
Move Zero gp2 														#COMPARE (IS GREATER)
Compare gp1 gp0
if Greater then Load gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifreadIn-4true 									#IF ELSE STATEMENT
Load gp0 @62
AND gp0 @255 													  #CASTING INT TO CHAR
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:putc 												#CALLING putc
Load PC ifreadIn-4endif
Pass 										%ifreadIn-4true
Load gp0 @0
AND gp0 @255 													  #CASTING INT TO CHAR
Load gp6 CLL.linePtr 										#LOAD GP0 GLOBAL
ADD gp6 CLL.lineBuff 											#STORE GP0 GLOBAL RELATIVE (CHAR)
StoreByte gp0 0 [gp6]
Load gp0 CLL.linePtr 										#LOAD GP0 GLOBAL
Load gp1 @1
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Store gp0 CLL.linePtr 										#STORE GP0 GLOBAL
LoadByte gp0 Local.blank [Stack_pointer] 					#LOAD GP0 (CHAR)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:putc 												#CALLING putc
LoadByte gp0 Local.backSpace [Stack_pointer] 					#LOAD GP0 (CHAR)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:putc 												#CALLING putc
Pass 										%ifreadIn-4endif           
Load PC loopreadIn-1continue
Pass										%ifreadIn-5endif
LoadByte gp0 Local.character [Stack_pointer] 					#LOAD GP0 (CHAR)
Load gp6 CLL.linePtr 										#LOAD GP0 GLOBAL
ADD gp6 CLL.lineBuff 											#STORE GP0 GLOBAL RELATIVE (CHAR)
StoreByte gp0 0 [gp6]
Load gp1 CLL.linePtr 										#LOAD GP0 GLOBAL
Load gp0 @1
ADD gp0 gp1 														#ADD
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @255
AND gp0 gp1 														#AND
Store gp0 CLL.linePtr 										#STORE GP0 GLOBAL
Load PC ifreadIn-6endif
Pass 										%ifreadIn-6true
Load gp0 @0
AND gp0 @255 													  #CASTING INT TO CHAR
Load gp6 CLL.linePtr 										#LOAD GP0 GLOBAL
ADD gp6 CLL.lineBuff 											#STORE GP0 GLOBAL RELATIVE (CHAR)
StoreByte gp0 0 [gp6]
LoadByte gp0 Local.lineFeed [Stack_pointer] 					#LOAD GP0 (CHAR)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:putc 												#CALLING putc
Load PC loopreadIn-1exit
Pass 										%ifreadIn-6endif           
Load PC loopreadIn-1entry					%loopreadIn-1continue
Pass 										%loopreadIn-1exit
Load gp1 CLL.linePtr 										#LOAD GP0 GLOBAL
Load gp0 @1
ADD gp0 gp1 														#ADD
Store gp0 CLL.linePtr 										#STORE GP0 GLOBAL
Pass 										%loopreadIn-2entry
Load gp0 CLL.linePtr 										#LOAD GP0 GLOBAL
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0
if gp0 then Load PC loopreadIn-2exit 								#WHILE LOOP
Load gp0 @0
AND gp0 @255 													  #CASTING INT TO CHAR
Load gp6 CLL.linePtr 										#LOAD GP0 GLOBAL
ADD gp6 CLL.lineBuff 											#STORE GP0 GLOBAL RELATIVE (CHAR)
StoreByte gp0 0 [gp6]
Load gp1 CLL.linePtr 										#LOAD GP0 GLOBAL
Load gp0 @1
ADD gp0 gp1 														#ADD
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @255
AND gp0 gp1 														#AND
Store gp0 CLL.linePtr 										#STORE GP0 GLOBAL
Load PC loopreadIn-2entry					%loopreadIn-2continue
Pass 										%loopreadIn-2exit
Load gp0 @0
Store gp0 CLL.linePtr 										#STORE GP0 GLOBAL
Load gp0 @1
Store gp0 CLL.READ_IN_STATE 										#STORE GP0 GLOBAL
Load PC ifreadIn-7endif
Pass 										%ifreadIn-7true
Load gp1 CLL.linePtr 										#LOAD GP0 GLOBAL
Load gp0 @4095
Load gp2 @4294967295  												#COMPARE (NOT LESS)
Compare gp1 gp0
if Less then Move Zero gp2
Move gp2 gp0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp6 CLL.linePtr 										#LOAD GP0 GLOBAL
ADD gp6 CLL.lineBuff 											#LOAD GP0 GLOBAL RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @0
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
OR gp0 gp1
if gp0 then Load PC ifreadIn-3true 									#IF ELSE STATEMENT
Load gp6 CLL.linePtr 										#LOAD GP0 GLOBAL
ADD gp6 CLL.lineBuff 											#LOAD GP0 GLOBAL RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @10
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifreadIn-2endif
Load gp1 CLL.linePtr 										#LOAD GP0 GLOBAL
Load gp0 @1
ADD gp0 gp1 														#ADD
Load gp1 @4097
MOD gp0 gp1 														#MODULO
if DivByZero then Load PC DIV_BY_ZERO
Store gp0 CLL.linePtr 										#STORE GP0 GLOBAL
Pass										%ifreadIn-2endif
Pass 										%loopreadIn-0entry
Load gp6 CLL.linePtr 										#LOAD GP0 GLOBAL
ADD gp6 CLL.lineBuff 											#LOAD GP0 GLOBAL RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @13
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0
if gp0 then Load PC loopreadIn-0exit 								#WHILE LOOP
Load gp1 CLL.linePtr 										#LOAD GP0 GLOBAL
Load gp0 @1
ADD gp0 gp1 														#ADD
Load gp1 @4097
MOD gp0 gp1 														#MODULO
if DivByZero then Load PC DIV_BY_ZERO
Store gp0 CLL.linePtr 										#STORE GP0 GLOBAL
Load PC loopreadIn-0entry					%loopreadIn-0continue
Pass 										%loopreadIn-0exit
Load gp0 @1
Store gp0 CLL.READ_IN_STATE 										#STORE GP0 GLOBAL
Load PC ifreadIn-3endif
Pass 										%ifreadIn-3true
Goto function:QueueEmpty 												#CALLING QueueEmpty
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
if gp0 then Load PC ifreadIn-1true 									#IF ELSE STATEMENT
Goto function:GetFromQueue 												#CALLING GetFromQueue
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.diskAddress [Stack_pointer] 						#STORE GP0
Load gp0 Local.diskAddress [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 CLL.diskBuff 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @4096
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:dRead 												#CALLING dRead
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.failed [Stack_pointer] 						#STORE GP0
Load gp0 Local.failed [Stack_pointer] 						#LOAD GP0
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifreadIn-0endif
Load gp0 CLL.string130 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 Local.diskAddress [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:print_i 												#CALLING print_i
Load gp0 CLL.string131 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:changeMode 												#CALLING changeMode
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Pass										%ifreadIn-0endif
Load gp0 @0
Store gp0 CLL.linePtr 										#STORE GP0 GLOBAL
Load gp0 @1
Store gp0 CLL.READ_IN_STATE 										#STORE GP0 GLOBAL
Load PC ifreadIn-1endif
Pass 										%ifreadIn-1true
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:changeMode 												#CALLING changeMode
Load gp0 @1
Store gp0 CLL.EOL 										#STORE GP0 GLOBAL
Load gp0 @1
Store gp0 CLL.READ_IN_STATE 										#STORE GP0 GLOBAL
Pass 										%ifreadIn-1endif           
Pass 										%ifreadIn-3endif           
Pass 										%ifreadIn-7endif           
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
################## built in function dWrite ##############################################

SUB gp7 @4 		 		 %function:dWrite									
								# disk addr, start, length ==> success?
Load gp3 Expression_stack [gp7] #len
SUB gp7 @4
Load gp2 Expression_stack [gp7] #start
SUB gp7 @4						
Load gp1 Expression_stack [gp7] #addr
HDScan gp1 						#scan to the right position
HDWrite gp3 gp2 0 				# write l characters from memory at addr s
Move Zero gp0 		
if EOF then Move One gp0 			#test for EOF
Store gp0 Expression_stack [gp7]  #push flag
ADD gp7 @4
Move Jump PC 
################################################################################################################################################################################################################
																	Scope READDISK
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
def Local.START 8
def @Local.START @8
def Local.LENGTH 12
def @Local.LENGTH @12
def Local.DISK_ADDRESS 16
def @Local.DISK_ADDRESS @16
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:READDISK
SUB Stack_pointer @20 									#OVERHEAD FOR FUNCTION READDISK
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION READDISK
Goto function:Pop 												#CALLING Pop
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.LENGTH [Stack_pointer] 						#STORE GP0
Goto function:Pop 												#CALLING Pop
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.START [Stack_pointer] 						#STORE GP0
Goto function:Pop 												#CALLING Pop
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.DISK_ADDRESS [Stack_pointer] 						#STORE GP0
Load gp0 Local.DISK_ADDRESS [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 Local.START [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 Local.LENGTH [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:dRead 												#CALLING dRead
Goto function:Push 												#CALLING Push
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
#########################################################################################################################
																	Scope dalloc
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
def Local.success 8
def @Local.success @8
def Local.address 12
def @Local.address @12
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:dalloc
SUB Stack_pointer @16 									#OVERHEAD FOR FUNCTION dalloc
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION dalloc
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.address [Stack_pointer] 						#STORE GP0
Load gp0 Local.address [Stack_pointer] 						#LOAD GP0
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
Store gp0 Local.success [Stack_pointer] 						#STORE GP0
Load gp0 Local.success [Stack_pointer] 						#LOAD GP0
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
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
#########################################################################################################################
																	Scope __dump_malloc
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
def Local.node 8
def @Local.node @8
def Local.offset 12
def @Local.offset @12
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:__dump_malloc
SUB Stack_pointer @16 									#OVERHEAD FOR FUNCTION __dump_malloc
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION __dump_malloc
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.offset [Stack_pointer] 						#STORE GP0
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.node [Stack_pointer] 						#STORE GP0
Load gp0 Local.offset [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:ntab 												#CALLING ntab
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.node [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:print_i 												#CALLING print_i
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.node [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
if gp0 then Load PC if__dump_malloc-0true 									#IF ELSE STATEMENT
Load gp0 CLL.string8 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load PC if__dump_malloc-0endif
Pass 										%if__dump_malloc-0true
Load gp0 CLL.string7 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Pass 										%if__dump_malloc-0endif           
Load gp6 @4
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.node [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
if gp0 then Load PC if__dump_malloc-1true 									#IF ELSE STATEMENT
Load gp6 @3
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.node [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:print_i 												#CALLING print_i
Load PC if__dump_malloc-1endif
Pass 										%if__dump_malloc-1true
Load gp0 CLL.string9 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp6 @4
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.node [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp1 Local.offset [Stack_pointer] 						#LOAD GP0
Load gp0 @1
ADD gp0 gp1 														#ADD
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:__dump_malloc 												#CALLING __dump_malloc
Load gp0 CLL.string10 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp6 @5
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.node [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp1 Local.offset [Stack_pointer] 						#LOAD GP0
Load gp0 @1
ADD gp0 gp1 														#ADD
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:__dump_malloc 												#CALLING __dump_malloc
Pass 										%if__dump_malloc-1endif           
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
#########################################################################################################################
																	Scope collectGarbage
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
def Local.node 8
def @Local.node @8
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:collectGarbage
SUB Stack_pointer @12 									#OVERHEAD FOR FUNCTION collectGarbage
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION collectGarbage
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.node [Stack_pointer] 						#STORE GP0
Load gp6 @3
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.node [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifcollectGarbage-1endif
Load gp0 @1
Load gp6 @3
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.node [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.node [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp1 0 [gp6]
Load gp0 @5
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifcollectGarbage-0endif
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.node [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:collectGarbage 												#CALLING collectGarbage
Pass										%ifcollectGarbage-0endif
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.node [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:collectGarbage 												#CALLING collectGarbage
Load gp0 Local.node [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:dalloc 												#CALLING dalloc
Pass										%ifcollectGarbage-1endif
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
#########################################################################################################################
																	Scope editDictEntry
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
def Local.dict 16
def @Local.dict @16
def Local.newEntry 12
def @Local.newEntry @12
def Local.codePtr 8
def @Local.codePtr @8
def Local.name 20
def @Local.name @20
def Local.address 24
def @Local.address @24
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:editDictEntry
SUB Stack_pointer @28 									#OVERHEAD FOR FUNCTION editDictEntry
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION editDictEntry
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.codePtr [Stack_pointer] 						#STORE GP0
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.name [Stack_pointer] 						#STORE GP0
Load gp0 CLL.ForthDictHead 										#LOAD GP0 GLOBAL
Store gp0 Local.dict [Stack_pointer] 						#STORE GP0
Load gp0 Local.name [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 Local.dict [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:isInDict 												#CALLING isInDict
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.address [Stack_pointer] 						#STORE GP0
Load gp0 Local.address [Stack_pointer] 						#LOAD GP0
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
if gp0 then Load PC ifeditDictEntry-1true 									#IF ELSE STATEMENT
Load gp0 Local.name [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 Local.codePtr [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:newDictInst 												#CALLING newDictInst
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.newEntry [Stack_pointer] 						#STORE GP0
Load gp0 CLL.ForthDictHead 										#LOAD GP0 GLOBAL
Load gp6 @3
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.newEntry [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 Local.newEntry [Stack_pointer] 						#LOAD GP0
Store gp0 CLL.ForthDictHead 										#STORE GP0 GLOBAL
Load PC ifeditDictEntry-1endif
Pass 										%ifeditDictEntry-1true
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.address [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.address [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp1 0 [gp6]
Load gp0 Local.codePtr [Stack_pointer] 						#LOAD GP0
Load  gp2 @4294967295 												#COMPARE (NOT EQUAL)
Compare gp1 gp0 
if Equal then Move Zero gp2
Move gp2 gp0
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
AND gp0 gp1
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifeditDictEntry-0endif
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.address [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:collectGarbage 												#CALLING collectGarbage
Load gp0 Local.codePtr [Stack_pointer] 						#LOAD GP0
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.address [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Pass										%ifeditDictEntry-0endif
Pass 										%ifeditDictEntry-1endif           
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
#########################################################################################################################
																	Scope AddToQueue
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
def Local.new 8
def @Local.new @8
def Local.blockAddress 12
def @Local.blockAddress @12
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:AddToQueue
SUB Stack_pointer @16 									#OVERHEAD FOR FUNCTION AddToQueue
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION AddToQueue
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.blockAddress [Stack_pointer] 						#STORE GP0
Load gp0 @2
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:malloc 												#CALLING malloc
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.new [Stack_pointer] 						#STORE GP0
Load gp0 @0
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.new [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 Local.blockAddress [Stack_pointer] 						#LOAD GP0
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.new [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Goto function:QueueEmpty 												#CALLING QueueEmpty
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
if gp0 then Load PC ifAddToQueue-0true 									#IF ELSE STATEMENT
Load gp0 Local.new [Stack_pointer] 						#LOAD GP0
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 CLL.BackOfQueue 											#STORE GP0 GLOBAL RELATIVE
Store gp0 0 [gp6]
Load gp0 Local.new [Stack_pointer] 						#LOAD GP0
Store gp0 CLL.BackOfQueue 										#STORE GP0 GLOBAL
Load PC ifAddToQueue-0endif
Pass 										%ifAddToQueue-0true
Load gp0 Local.new [Stack_pointer] 						#LOAD GP0
Store gp0 CLL.frontOfQueue 										#STORE GP0 GLOBAL
Load gp0 Local.new [Stack_pointer] 						#LOAD GP0
Store gp0 CLL.BackOfQueue 										#STORE GP0 GLOBAL
Pass 										%ifAddToQueue-0endif           
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
#########################################################################################################################
																	Scope primAlloc
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:primAlloc
SUB Stack_pointer @8 									#OVERHEAD FOR FUNCTION primAlloc
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION primAlloc
Load gp0 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp1 @1
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Move gp0 gp6 						#PUSH gp0 POP gp6
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 CLL.ForthStack 											#LOAD GP0 GLOBAL RELATIVE
Load gp0 0 [gp6]									
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:malloc 												#CALLING malloc
Load gp0 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp1 @1
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Move gp0 gp6 						#PUSH gp0 POP gp6
MUL gp6 @4 														   #INDEXING FOR @INT
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
ADD gp6 CLL.ForthStack 											#STORE GP0 GLOBAL RELATIVE
Store gp0 0 [gp6]
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
#########################################################################################################################
																	Scope printBUF
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:printBUF
SUB Stack_pointer @8 									#OVERHEAD FOR FUNCTION printBUF
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION printBUF
Load gp0 CLL.WORD_BUF 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
#########################################################################################################################
																	Scope isWhiteSpace
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
def Local.input 8
def @Local.input @8
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:isWhiteSpace
SUB Stack_pointer @9 									#OVERHEAD FOR FUNCTION isWhiteSpace
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION isWhiteSpace
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
StoreByte gp0 Local.input [Stack_pointer] 					#STORE GP0 (CHAR)
LoadByte gp0 Local.input [Stack_pointer] 					#LOAD GP0 (CHAR)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
AND gp0 @255 													  #CASTING INT TO CHAR
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifisWhiteSpace-0endif
Load gp0 @1
Store gp0 CLL.EOL 										#STORE GP0 GLOBAL
Load gp0 @1
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Pass										%ifisWhiteSpace-0endif
LoadByte gp0 Local.input [Stack_pointer] 					#LOAD GP0 (CHAR)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @32
AND gp0 @255 													  #CASTING INT TO CHAR
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifisWhiteSpace-1endif
Load gp0 @1
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Pass										%ifisWhiteSpace-1endif
LoadByte gp0 Local.input [Stack_pointer] 					#LOAD GP0 (CHAR)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @10
AND gp0 @255 													  #CASTING INT TO CHAR
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifisWhiteSpace-2endif
Load gp0 @1
Store gp0 CLL.EOL 										#STORE GP0 GLOBAL
Load gp0 @1
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Pass										%ifisWhiteSpace-2endif
LoadByte gp0 Local.input [Stack_pointer] 					#LOAD GP0 (CHAR)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @9
AND gp0 @255 													  #CASTING INT TO CHAR
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifisWhiteSpace-3endif
Load gp0 @1
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Pass										%ifisWhiteSpace-3endif
LoadByte gp0 Local.input [Stack_pointer] 					#LOAD GP0 (CHAR)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @13
AND gp0 @255 													  #CASTING INT TO CHAR
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifisWhiteSpace-4endif
Load gp0 @1
Store gp0 CLL.EOL 										#STORE GP0 GLOBAL
Load gp0 @1
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Pass										%ifisWhiteSpace-4endif
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
#########################################################################################################################
																	Scope dump_malloc_partition
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:dump_malloc_partition
SUB Stack_pointer @8 									#OVERHEAD FOR FUNCTION dump_malloc_partition
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION dump_malloc_partition
Load gp0 CLL.MALLOC_TREE 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:__dump_malloc 												#CALLING __dump_malloc
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
#########################################################################################################################
																	Scope Over
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:Over
SUB Stack_pointer @8 									#OVERHEAD FOR FUNCTION Over
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION Over
Load gp1 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp0 @1
Move Zero gp2 														#COMPARE (IS GREATER)
Compare gp1 gp0
if Greater then Load gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifOver-1true 									#IF ELSE STATEMENT
Load gp0 CLL.string28 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 @0
AND gp0 @255 													  #CASTING INT TO CHAR
StoreByte gp0 CLL.dontBreak 									#STORE GP0 GLOBAL (CHAR)
Load PC ifOver-1endif
Pass 										%ifOver-1true
Load gp0 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp1 @2
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Move gp0 gp6 						#PUSH gp0 POP gp6
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 CLL.ForthStack 											#LOAD GP0 GLOBAL RELATIVE
Load gp0 0 [gp6]									
Load gp6 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 CLL.ForthStack 											#STORE GP0 GLOBAL RELATIVE
Store gp0 0 [gp6]
Load gp1 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp0 @1
ADD gp0 gp1 														#ADD
Store gp0 CLL.ForthStackPointer 										#STORE GP0 GLOBAL
Load gp1 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp0 @65536
Move Zero gp2 														#COMPARE (IS GREATER)
Compare gp1 gp0
if Greater then Load gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifOver-0endif
Load gp0 CLL.string27 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 @0
AND gp0 @255 													  #CASTING INT TO CHAR
StoreByte gp0 CLL.dontBreak 									#STORE GP0 GLOBAL (CHAR)
Pass										%ifOver-0endif
Pass 										%ifOver-1endif           
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
#########################################################################################################################
																	Scope delete_tree_node
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
def Local.node 8
def @Local.node @8
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:delete_tree_node
SUB Stack_pointer @12 									#OVERHEAD FOR FUNCTION delete_tree_node
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION delete_tree_node
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.node [Stack_pointer] 						#STORE GP0
Load gp0 CLL.MALLOC_POOL 										#LOAD GP0 GLOBAL
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.node [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 Local.node [Stack_pointer] 						#LOAD GP0
Store gp0 CLL.MALLOC_POOL 										#STORE GP0 GLOBAL
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
#########################################################################################################################
																	Scope __greater
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
def Local.a 8
def @Local.a @8
def Local.b 12
def @Local.b @12
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:__greater
SUB Stack_pointer @16 									#OVERHEAD FOR FUNCTION __greater
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION __greater
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.b [Stack_pointer] 						#STORE GP0
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.a [Stack_pointer] 						#STORE GP0
Load gp1 Local.a [Stack_pointer] 						#LOAD GP0
Load gp0 Local.b [Stack_pointer] 						#LOAD GP0
Move Zero gp2 														#COMPARE (IS GREATER)
Compare gp1 gp0
if Greater then Load gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC if__greater-0true 									#IF ELSE STATEMENT
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Load PC if__greater-0endif
Pass 										%if__greater-0true
Load gp0 @1
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Pass 										%if__greater-0endif           
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
#########################################################################################################################
																	Scope QueueEmpty
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:QueueEmpty
SUB Stack_pointer @8 									#OVERHEAD FOR FUNCTION QueueEmpty
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION QueueEmpty
Load gp1 CLL.frontOfQueue 										#LOAD GP0 GLOBAL
Load gp0 @0
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifQueueEmpty-0true 									#IF ELSE STATEMENT
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load PC ifQueueEmpty-0endif
Pass 										%ifQueueEmpty-0true
Load gp0 @1
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Pass 										%ifQueueEmpty-0endif           
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
#########################################################################################################################
																	Scope createTable
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
def Local.Array_ofname 8
def @Local.Array_ofname @8
def Local.name 17
def @Local.name @17
def Local.address 21
def @Local.address @21
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:createTable
SUB Stack_pointer @25 									#OVERHEAD FOR FUNCTION createTable
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION createTable
Move Stack_pointer gp0 											#GETTING POINTER
ADD gp0 @Local.Array_ofname
Store gp0 Local.name [Stack_pointer] 						#STORE GP0
Goto function:getWordName 												#CALLING getWordName
Load gp0 Local.name [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:copyName 												#CALLING copyName
Goto function:Pop 												#CALLING Pop
Goto function:malloc 												#CALLING malloc
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.address [Stack_pointer] 						#STORE GP0
Load gp0 Local.name [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @2
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 Local.address [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:editDictEntry 												#CALLING editDictEntry
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
#########################################################################################################################
																	Scope split_tree_node
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
def Local.child_size 20
def @Local.child_size @20
def Local.right_address 12
def @Local.right_address @12
def Local.parent_size 24
def @Local.parent_size @24
def Local.parent_node 8
def @Local.parent_node @8
def Local.parent_address 16
def @Local.parent_address @16
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:split_tree_node
SUB Stack_pointer @28 									#OVERHEAD FOR FUNCTION split_tree_node
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION split_tree_node
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.parent_node [Stack_pointer] 						#STORE GP0
Load gp6 @3
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.parent_node [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Local.parent_size [Stack_pointer] 						#STORE GP0
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.parent_node [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Local.parent_address [Stack_pointer] 						#STORE GP0
Load gp0 Local.parent_size [Stack_pointer] 						#LOAD GP0
Load gp1 @2
DIV gp0 gp1 														#DIVIDE
if DivByZero then Load PC DIV_BY_ZERO
Store gp0 Local.child_size [Stack_pointer] 						#STORE GP0
Load gp0 Local.parent_address [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp1 Local.child_size [Stack_pointer] 						#LOAD GP0
Load gp0 @4
MUL gp0 gp1 														#MULTIPLY
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Store gp0 Local.right_address [Stack_pointer] 						#STORE GP0
Load gp0 Local.child_size [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 Local.parent_address [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 Local.parent_node [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:create_tree_node 												#CALLING create_tree_node
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Load gp6 @4
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.parent_node [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 Local.child_size [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 Local.right_address [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 Local.parent_node [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:create_tree_node 												#CALLING create_tree_node
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Load gp6 @5
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.parent_node [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
#########################################################################################################################
																	Scope OR
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:OR
SUB Stack_pointer @8 									#OVERHEAD FOR FUNCTION OR
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION OR
Load gp1 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp0 @2
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifOR-0endif
Load gp0 CLL.string35 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 @0
AND gp0 @255 													  #CASTING INT TO CHAR
StoreByte gp0 CLL.dontBreak 									#STORE GP0 GLOBAL (CHAR)
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Pass										%ifOR-0endif
Load gp0 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp1 @1
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Store gp0 CLL.ForthStackPointer 										#STORE GP0 GLOBAL
Load gp0 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp1 @1
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Move gp0 gp6 						#PUSH gp0 POP gp6
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 CLL.ForthStack 											#LOAD GP0 GLOBAL RELATIVE
Load gp0 0 [gp6]									
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp6 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 CLL.ForthStack 											#LOAD GP0 GLOBAL RELATIVE
Load gp0 0 [gp6]									
OR gp0 gp1 															#OR
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp1 @1
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Move gp0 gp6 						#PUSH gp0 POP gp6
MUL gp6 @4 														   #INDEXING FOR @INT
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
ADD gp6 CLL.ForthStack 											#STORE GP0 GLOBAL RELATIVE
Store gp0 0 [gp6]
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC

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
#########################################################################################################################
																	Scope copyName
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
def Local.intWORD_BUF 8
def @Local.intWORD_BUF @8
def Local.name 12
def @Local.name @12
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:copyName
SUB Stack_pointer @16 									#OVERHEAD FOR FUNCTION copyName
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION copyName
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.name [Stack_pointer] 						#STORE GP0
Load gp0 CLL.WORD_BUF 										#LOAD GP0 GLOBAL
Store gp0 Local.intWORD_BUF [Stack_pointer] 						#STORE GP0
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.intWORD_BUF [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.name [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.intWORD_BUF [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.name [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
#########################################################################################################################
																	Scope addToDict
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
def Local.newEntry 8
def @Local.newEntry @8
def Local.codePtr 12
def @Local.codePtr @12
def Local.name 16
def @Local.name @16
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:addToDict
SUB Stack_pointer @20 									#OVERHEAD FOR FUNCTION addToDict
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION addToDict
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.codePtr [Stack_pointer] 						#STORE GP0
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.name [Stack_pointer] 						#STORE GP0
Load gp0 Local.name [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 Local.codePtr [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:newDictInst 												#CALLING newDictInst
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.newEntry [Stack_pointer] 						#STORE GP0
Load gp0 CLL.ForthDictHead 										#LOAD GP0 GLOBAL
Load gp6 @3
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.newEntry [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 Local.newEntry [Stack_pointer] 						#LOAD GP0
Store gp0 CLL.ForthDictHead 										#STORE GP0 GLOBAL
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
################## built in function dRead ##############################################

SUB gp7 @4 		 		 %function:dRead									
								# disk addr, start, length ==> success?
Load gp3 Expression_stack [gp7] #len
SUB gp7 @4
Load gp2 Expression_stack [gp7] #start
SUB gp7 @4						
Load gp1 Expression_stack [gp7] #addr
HDScan gp1 						#scan to the right position
HDRead gp3 gp2 0 				# read l characters to memory at addr s
Move Zero gp0 		
if EOF then Move One gp0 			#test for EOF
Store gp0 Expression_stack [gp7]  #push flag
ADD gp7 @4
Move Jump PC 
################################################################################################################################################################################################################
																	Scope createEval
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:createEval
SUB Stack_pointer @8 									#OVERHEAD FOR FUNCTION createEval
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION createEval
Load gp0 CLL.string190 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @6
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @30
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @6
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @3
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @5
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @6
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @29
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Load gp0 @6
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @7
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @1
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 CLL.string191 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 CLL.ForthDictHead 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:isInDict 												#CALLING isInDict
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:addToDict 												#CALLING addToDict
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
#########################################################################################################################
																	Scope GetFromQueue
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
def Local.new 8
def @Local.new @8
def Local.val 12
def @Local.val @12
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:GetFromQueue
SUB Stack_pointer @16 									#OVERHEAD FOR FUNCTION GetFromQueue
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION GetFromQueue
Goto function:QueueEmpty 												#CALLING QueueEmpty
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
if gp0 then Load PC ifGetFromQueue-1true 									#IF ELSE STATEMENT
Load gp0 CLL.frontOfQueue 										#LOAD GP0 GLOBAL
Store gp0 Local.new [Stack_pointer] 						#STORE GP0
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 CLL.frontOfQueue 											#LOAD GP0 GLOBAL RELATIVE
Load gp0 0 [gp6]									
Store gp0 CLL.frontOfQueue 										#STORE GP0 GLOBAL
Goto function:QueueEmpty 												#CALLING QueueEmpty
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifGetFromQueue-0endif
Load gp0 @0
Store gp0 CLL.BackOfQueue 										#STORE GP0 GLOBAL
Pass										%ifGetFromQueue-0endif
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.new [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Local.val [Stack_pointer] 						#STORE GP0
Load gp0 Local.new [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:dalloc 												#CALLING dalloc
Load gp0 Local.val [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Load PC ifGetFromQueue-1endif
Pass 										%ifGetFromQueue-1true
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Pass 										%ifGetFromQueue-1endif           
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
#########################################################################################################################
																	Scope primRead
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:primRead
SUB Stack_pointer @8 									#OVERHEAD FOR FUNCTION primRead
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION primRead
Load gp0 CLL.EOL 										#LOAD GP0 GLOBAL
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp1 CLL.READ_IN_MODE 										#LOAD GP0 GLOBAL
Load gp0 @0
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
AND gp0 gp1
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifprimRead-0endif
Load gp0 CLL.string13 										#LOAD GP0 GLOBAL
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
Load gp0 @0
Store gp0 CLL.EOL 										#STORE GP0 GLOBAL
Pass										%ifprimRead-0endif
Goto function:getWordName 												#CALLING getWordName
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
#########################################################################################################################
																	Scope createVariable
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
def Local.Array_ofname 8
def @Local.Array_ofname @8
def Local.name 17
def @Local.name @17
def Local.address 21
def @Local.address @21
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:createVariable
SUB Stack_pointer @25 									#OVERHEAD FOR FUNCTION createVariable
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION createVariable
Move Stack_pointer gp0 											#GETTING POINTER
ADD gp0 @Local.Array_ofname
Store gp0 Local.name [Stack_pointer] 						#STORE GP0
Goto function:getWordName 												#CALLING getWordName
Load gp0 Local.name [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:copyName 												#CALLING copyName
Load gp0 @1
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:malloc 												#CALLING malloc
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.address [Stack_pointer] 						#STORE GP0
Load gp0 Local.name [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @2
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 Local.address [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:editDictEntry 												#CALLING editDictEntry
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
#########################################################################################################################
																	Scope isEOLChar
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
def Local.thisChar 8
def @Local.thisChar @8
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:isEOLChar
SUB Stack_pointer @9 									#OVERHEAD FOR FUNCTION isEOLChar
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION isEOLChar
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
StoreByte gp0 Local.thisChar [Stack_pointer] 					#STORE GP0 (CHAR)
LoadByte gp0 Local.thisChar [Stack_pointer] 					#LOAD GP0 (CHAR)
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @0
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifisEOLChar-0endif
Load gp0 @1
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Pass										%ifisEOLChar-0endif
LoadByte gp0 Local.thisChar [Stack_pointer] 					#LOAD GP0 (CHAR)
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @10
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifisEOLChar-1endif
Load gp0 @1
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Pass										%ifisEOLChar-1endif
LoadByte gp0 Local.thisChar [Stack_pointer] 					#LOAD GP0 (CHAR)
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @13
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifisEOLChar-2endif
Load gp0 @1
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Pass										%ifisEOLChar-2endif
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
#########################################################################################################################
																	Scope backChar
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:backChar
SUB Stack_pointer @8 									#OVERHEAD FOR FUNCTION backChar
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION backChar
Load gp1 CLL.linePtr 										#LOAD GP0 GLOBAL
Load gp0 @0
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifbackChar-0endif
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Pass										%ifbackChar-0endif
Load gp0 CLL.linePtr 										#LOAD GP0 GLOBAL
Load gp1 @1
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Store gp0 CLL.linePtr 										#STORE GP0 GLOBAL
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
#########################################################################################################################
																	Scope compileIfWord
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
def Local.placeholderNode 8
def @Local.placeholderNode @8
def Local.dictEntry 12
def @Local.dictEntry @12
def Local.reference 16
def @Local.reference @16
def Local.bottom 20
def @Local.bottom @20
def Local.referenceNode 28
def @Local.referenceNode @28
def Local.ifRetArray 32
def @Local.ifRetArray @32
def Local.Array_ofwhileRetArray 48
def @Local.Array_ofwhileRetArray @48
def Local.start 36
def @Local.start @36
def Local.elseRetArray 40
def @Local.elseRetArray @40
def Local.retArray 44
def @Local.retArray @44
def Local.whileRetArray 24
def @Local.whileRetArray @24
def Local.Array_ofifRetArray 60
def @Local.Array_ofifRetArray @60
def Local.Array_ofelseRetArray 72
def @Local.Array_ofelseRetArray @72
def Local.previous 84
def @Local.previous @84
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:compileIfWord
SUB Stack_pointer @88 									#OVERHEAD FOR FUNCTION compileIfWord
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION compileIfWord
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.retArray [Stack_pointer] 						#STORE GP0
Load gp0 @6
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @36
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.start [Stack_pointer] 						#STORE GP0
Load gp0 Local.start [Stack_pointer] 						#LOAD GP0
Store gp0 Local.previous [Stack_pointer] 						#STORE GP0
Load gp0 @0
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Pass 										%loopcompileIfWord-3entry
Load gp0 @1
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0
if gp0 then Load PC loopcompileIfWord-3exit 								#WHILE LOOP
Load gp0 @0
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Goto function:primRead 												#CALLING primRead
Pass 										%loopcompileIfWord-1entry
Load gp0 CLL.WORD_BUF 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 CLL.string75 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:checkDictName 												#CALLING checkDictName
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 CLL.WORD_BUF 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 CLL.string76 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:checkDictName 												#CALLING checkDictName
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
OR gp0 gp1
NOT gp0
if gp0 then Load PC loopcompileIfWord-1exit 								#WHILE LOOP
Load gp0 CLL.WORD_BUF 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 CLL.string77 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:checkDictName 												#CALLING checkDictName
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifcompileIfWord-4endif
Pass 										%loopcompileIfWord-0entry
Load gp0 @1
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0
if gp0 then Load PC loopcompileIfWord-0exit 								#WHILE LOOP
Goto function:primRead 												#CALLING primRead
Load gp0 CLL.WORD_BUF 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 CLL.string78 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:checkDictName 												#CALLING checkDictName
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifcompileIfWord-0endif
Load PC loopcompileIfWord-0exit
Pass										%ifcompileIfWord-0endif
Load gp0 CLL.WORD_BUF 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 CLL.ForthDictHead 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:isInDict 												#CALLING isInDict
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.dictEntry [Stack_pointer] 						#STORE GP0
Load gp0 Local.dictEntry [Stack_pointer] 						#LOAD GP0
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														
if gp0 then Load PC ifcompileIfWord-2true 									#IF ELSE STATEMENT
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.dictEntry [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:bytecodeInterp 												#CALLING bytecodeInterp
Load PC ifcompileIfWord-2endif
Pass 										%ifcompileIfWord-2true
Goto function:isInt 												#CALLING isInt
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
if gp0 then Load PC ifcompileIfWord-1true 									#IF ELSE STATEMENT
Load gp0 CLL.string79 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 CLL.WORD_BUF 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 CLL.string80 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 @0
AND gp0 @255 													  #CASTING INT TO CHAR
StoreByte gp0 CLL.dontBreak 									#STORE GP0 GLOBAL (CHAR)
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Load PC ifcompileIfWord-1endif
Pass 										%ifcompileIfWord-1true
Goto function:convertInt 												#CALLING convertInt
Goto function:Push 												#CALLING Push
Pass 										%ifcompileIfWord-1endif           
Pass 										%ifcompileIfWord-2endif           
LoadByte gp0 CLL.dontBreak 									#LOAD GP0 GLOBAL (CHAR)
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @0
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifcompileIfWord-3endif
Load gp0 CLL.string81 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Pass										%ifcompileIfWord-3endif
Load PC loopcompileIfWord-0entry					%loopcompileIfWord-0continue
Pass 										%loopcompileIfWord-0exit
Goto function:primRead 												#CALLING primRead
Pass										%ifcompileIfWord-4endif
Load gp0 CLL.WORD_BUF 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 CLL.string82 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:checkDictName 												#CALLING checkDictName
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifcompileIfWord-5endif
Goto function:comment 												#CALLING comment
Goto function:primRead 												#CALLING primRead
Pass										%ifcompileIfWord-5endif
Load PC loopcompileIfWord-1entry					%loopcompileIfWord-1continue
Pass 										%loopcompileIfWord-1exit
Load gp0 CLL.WORD_BUF 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 CLL.string83 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:checkDictName 												#CALLING checkDictName
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifcompileIfWord-6endif
Load gp0 Local.start [Stack_pointer] 						#LOAD GP0
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 Local.previous [Stack_pointer] 						#LOAD GP0
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @1
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Pass										%ifcompileIfWord-6endif
Load gp0 CLL.WORD_BUF 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 CLL.string84 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:checkDictName 												#CALLING checkDictName
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifcompileIfWord-7endif
Load gp0 Local.start [Stack_pointer] 						#LOAD GP0
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 Local.previous [Stack_pointer] 						#LOAD GP0
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @0
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Pass										%ifcompileIfWord-7endif
Load gp0 CLL.WORD_BUF 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 CLL.string85 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:checkDictName 												#CALLING checkDictName
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
if gp0 then Load PC ifcompileIfWord-31true 									#IF ELSE STATEMENT
Load gp0 CLL.WORD_BUF 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 CLL.string86 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:checkDictName 												#CALLING checkDictName
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
if gp0 then Load PC ifcompileIfWord-30true 									#IF ELSE STATEMENT
Load gp0 CLL.WORD_BUF 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 CLL.string91 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:checkDictName 												#CALLING checkDictName
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
if gp0 then Load PC ifcompileIfWord-29true 									#IF ELSE STATEMENT
Load gp0 CLL.WORD_BUF 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 CLL.string97 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:checkDictName 												#CALLING checkDictName
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
if gp0 then Load PC ifcompileIfWord-28true 									#IF ELSE STATEMENT
Load gp0 CLL.WORD_BUF 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 CLL.string100 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:checkDictName 												#CALLING checkDictName
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
if gp0 then Load PC ifcompileIfWord-27true 									#IF ELSE STATEMENT
Goto function:isInt 												#CALLING isInt
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
if gp0 then Load PC ifcompileIfWord-26true 									#IF ELSE STATEMENT
Load gp0 CLL.WORD_BUF 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 CLL.ForthDictHead 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:isInDict 												#CALLING isInDict
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.reference [Stack_pointer] 						#STORE GP0
Load gp0 Local.reference [Stack_pointer] 						#LOAD GP0
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
if gp0 then Load PC ifcompileIfWord-25true 									#IF ELSE STATEMENT
Load gp0 CLL.string101 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 CLL.WORD_BUF 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 CLL.string102 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 @0
AND gp0 @255 													  #CASTING INT TO CHAR
StoreByte gp0 CLL.dontBreak 									#STORE GP0 GLOBAL (CHAR)
Load gp0 @1
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @1
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load PC ifcompileIfWord-25endif
Pass 										%ifcompileIfWord-25true
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.reference [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Local.referenceNode [Stack_pointer] 						#STORE GP0
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.referenceNode [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp1 0 [gp6]
Load gp0 @6
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.referenceNode [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp1 0 [gp6]
Load gp0 @2
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
OR gp0 gp1
if gp0 then Load PC ifcompileIfWord-24true 									#IF ELSE STATEMENT
Load gp0 @1
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 Local.reference [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load PC ifcompileIfWord-24endif
Pass 										%ifcompileIfWord-24true
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.referenceNode [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp1 0 [gp6]
Load gp0 @0
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifcompileIfWord-23true 									#IF ELSE STATEMENT
Load gp0 @1
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 Local.reference [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load PC ifcompileIfWord-23endif
Pass 										%ifcompileIfWord-23true
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.referenceNode [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.referenceNode [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.referenceNode [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Pass 										%ifcompileIfWord-23endif           
Pass 										%ifcompileIfWord-24endif           
Pass 										%ifcompileIfWord-25endif           
Load PC ifcompileIfWord-26endif
Pass 										%ifcompileIfWord-26true
Load gp0 @2
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:convertInt 												#CALLING convertInt
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Pass 										%ifcompileIfWord-26endif           
Load PC ifcompileIfWord-27endif
Pass 										%ifcompileIfWord-27true
Load gp0 Local.retArray [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:compileStringPrint 												#CALLING compileStringPrint
Pass 										%ifcompileIfWord-27endif           
Load PC ifcompileIfWord-28endif
Pass 										%ifcompileIfWord-28true
Move Stack_pointer gp0 											#GETTING POINTER
ADD gp0 @Local.Array_ofwhileRetArray
Store gp0 Local.whileRetArray [Stack_pointer] 						#STORE GP0
Load gp0 Local.whileRetArray [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:compileWhileWord 												#CALLING compileWhileWord
LoadByte gp0 CLL.dontBreak 									#LOAD GP0 GLOBAL (CHAR)
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @0
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifcompileIfWord-20endif
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Pass										%ifcompileIfWord-20endif
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.whileRetArray [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp1 0 [gp6]
Load gp0 @2
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifcompileIfWord-21endif
Load gp0 CLL.string98 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 @0
AND gp0 @255 													  #CASTING INT TO CHAR
StoreByte gp0 CLL.dontBreak 									#STORE GP0 GLOBAL (CHAR)
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Pass										%ifcompileIfWord-21endif
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.whileRetArray [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp1 0 [gp6]
Load gp0 @0
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifcompileIfWord-22true 									#IF ELSE STATEMENT
Load gp0 CLL.string99 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.whileRetArray [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:print_i 												#CALLING print_i
Load gp0 @0
AND gp0 @255 													  #CASTING INT TO CHAR
StoreByte gp0 CLL.dontBreak 									#STORE GP0 GLOBAL (CHAR)
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Load PC ifcompileIfWord-22endif
Pass 										%ifcompileIfWord-22true
Load gp0 @5
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.whileRetArray [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.whileRetArray [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Local.bottom [Stack_pointer] 						#STORE GP0
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.bottom [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Pass 										%ifcompileIfWord-22endif           
Pass 										%ifcompileIfWord-28endif           
Load PC ifcompileIfWord-29endif
Pass 										%ifcompileIfWord-29true
Move Stack_pointer gp0 											#GETTING POINTER
ADD gp0 @Local.Array_ofifRetArray
Store gp0 Local.ifRetArray [Stack_pointer] 						#STORE GP0
Load gp0 Local.ifRetArray [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:compileIfWord 												#CALLING compileIfWord
LoadByte gp0 CLL.dontBreak 									#LOAD GP0 GLOBAL (CHAR)
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @0
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifcompileIfWord-12endif
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Pass										%ifcompileIfWord-12endif
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.ifRetArray [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp1 0 [gp6]
Load gp0 @2
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifcompileIfWord-13endif
Load gp0 CLL.string92 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 @0
AND gp0 @255 													  #CASTING INT TO CHAR
StoreByte gp0 CLL.dontBreak 									#STORE GP0 GLOBAL (CHAR)
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Pass										%ifcompileIfWord-13endif
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.ifRetArray [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp1 0 [gp6]
Load gp0 @0
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifcompileIfWord-19true 									#IF ELSE STATEMENT
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.ifRetArray [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp1 0 [gp6]
Load gp0 @1
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifcompileIfWord-18true 									#IF ELSE STATEMENT
Load gp0 CLL.string96 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.ifRetArray [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:print_i 												#CALLING print_i
Load gp0 @0
AND gp0 @255 													  #CASTING INT TO CHAR
StoreByte gp0 CLL.dontBreak 									#STORE GP0 GLOBAL (CHAR)
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Load PC ifcompileIfWord-18endif
Pass 										%ifcompileIfWord-18true
Move Stack_pointer gp0 											#GETTING POINTER
ADD gp0 @Local.Array_ofelseRetArray
Store gp0 Local.elseRetArray [Stack_pointer] 						#STORE GP0
Load gp0 Local.elseRetArray [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:compileIfWord 												#CALLING compileIfWord
LoadByte gp0 CLL.dontBreak 									#LOAD GP0 GLOBAL (CHAR)
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @0
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifcompileIfWord-14endif
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Pass										%ifcompileIfWord-14endif
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.elseRetArray [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp1 0 [gp6]
Load gp0 @2
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifcompileIfWord-15endif
Load gp0 CLL.string93 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 @0
AND gp0 @255 													  #CASTING INT TO CHAR
StoreByte gp0 CLL.dontBreak 									#STORE GP0 GLOBAL (CHAR)
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Pass										%ifcompileIfWord-15endif
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.elseRetArray [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp1 0 [gp6]
Load gp0 @1
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifcompileIfWord-16endif
Load gp0 CLL.string94 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 @0
AND gp0 @255 													  #CASTING INT TO CHAR
StoreByte gp0 CLL.dontBreak 									#STORE GP0 GLOBAL (CHAR)
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Pass										%ifcompileIfWord-16endif
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.elseRetArray [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp1 0 [gp6]
Load gp0 @0
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifcompileIfWord-17true 									#IF ELSE STATEMENT
Load gp0 CLL.string95 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.ifRetArray [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:print_i 												#CALLING print_i
Load gp0 @0
AND gp0 @255 													  #CASTING INT TO CHAR
StoreByte gp0 CLL.dontBreak 									#STORE GP0 GLOBAL (CHAR)
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Load PC ifcompileIfWord-17endif
Pass 										%ifcompileIfWord-17true
Load gp0 @5
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.ifRetArray [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.elseRetArray [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @6
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @36
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.placeholderNode [Stack_pointer] 						#STORE GP0
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.ifRetArray [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Local.bottom [Stack_pointer] 						#STORE GP0
Load gp0 Local.placeholderNode [Stack_pointer] 						#LOAD GP0
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.bottom [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.elseRetArray [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Local.bottom [Stack_pointer] 						#STORE GP0
Load gp0 Local.placeholderNode [Stack_pointer] 						#LOAD GP0
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.bottom [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 Local.placeholderNode [Stack_pointer] 						#LOAD GP0
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Pass 										%ifcompileIfWord-17endif           
Pass 										%ifcompileIfWord-18endif           
Load PC ifcompileIfWord-19endif
Pass 										%ifcompileIfWord-19true
Load gp0 @6
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @36
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.placeholderNode [Stack_pointer] 						#STORE GP0
Load gp0 @5
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.ifRetArray [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 Local.placeholderNode [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.ifRetArray [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Local.bottom [Stack_pointer] 						#STORE GP0
Load gp0 Local.placeholderNode [Stack_pointer] 						#LOAD GP0
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.bottom [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 Local.placeholderNode [Stack_pointer] 						#LOAD GP0
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Pass 										%ifcompileIfWord-19endif           
Pass 										%ifcompileIfWord-29endif           
Load PC ifcompileIfWord-30endif
Pass 										%ifcompileIfWord-30true
Pass 										%loopcompileIfWord-2entry
Load gp0 @1
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0
if gp0 then Load PC loopcompileIfWord-2exit 								#WHILE LOOP
Goto function:primRead 												#CALLING primRead
Load gp0 CLL.WORD_BUF 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 CLL.string87 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:checkDictName 												#CALLING checkDictName
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifcompileIfWord-8endif
Load PC loopcompileIfWord-2exit
Pass										%ifcompileIfWord-8endif
Load gp0 CLL.WORD_BUF 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 CLL.ForthDictHead 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:isInDict 												#CALLING isInDict
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.dictEntry [Stack_pointer] 						#STORE GP0
Load gp0 Local.dictEntry [Stack_pointer] 						#LOAD GP0
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														
if gp0 then Load PC ifcompileIfWord-10true 									#IF ELSE STATEMENT
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.dictEntry [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:bytecodeInterp 												#CALLING bytecodeInterp
Load PC ifcompileIfWord-10endif
Pass 										%ifcompileIfWord-10true
Goto function:isInt 												#CALLING isInt
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
if gp0 then Load PC ifcompileIfWord-9true 									#IF ELSE STATEMENT
Load gp0 CLL.string88 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 CLL.WORD_BUF 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 CLL.string89 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 @0
AND gp0 @255 													  #CASTING INT TO CHAR
StoreByte gp0 CLL.dontBreak 									#STORE GP0 GLOBAL (CHAR)
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Load PC ifcompileIfWord-9endif
Pass 										%ifcompileIfWord-9true
Goto function:convertInt 												#CALLING convertInt
Goto function:Push 												#CALLING Push
Pass 										%ifcompileIfWord-9endif           
Pass 										%ifcompileIfWord-10endif           
LoadByte gp0 CLL.dontBreak 									#LOAD GP0 GLOBAL (CHAR)
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @0
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifcompileIfWord-11endif
Load gp0 CLL.string90 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Pass										%ifcompileIfWord-11endif
Load PC loopcompileIfWord-2entry					%loopcompileIfWord-2continue
Pass 										%loopcompileIfWord-2exit
Load gp0 @2
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:Pop 												#CALLING Pop
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Pass 										%ifcompileIfWord-30endif           
Load PC ifcompileIfWord-31endif
Pass 										%ifcompileIfWord-31true
Load gp0 @0
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @0
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @2
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Pass 										%ifcompileIfWord-31endif           
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.previous [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Local.previous [Stack_pointer] 						#STORE GP0
Load PC loopcompileIfWord-3entry					%loopcompileIfWord-3continue
Pass 										%loopcompileIfWord-3exit
Load gp0 Local.start [Stack_pointer] 						#LOAD GP0
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 Local.previous [Stack_pointer] 						#LOAD GP0
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
#########################################################################################################################
																	Scope XNOR
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:XNOR
SUB Stack_pointer @8 									#OVERHEAD FOR FUNCTION XNOR
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION XNOR
Load gp1 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp0 @2
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifXNOR-0endif
Load gp0 CLL.string40 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 @0
AND gp0 @255 													  #CASTING INT TO CHAR
StoreByte gp0 CLL.dontBreak 									#STORE GP0 GLOBAL (CHAR)
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Pass										%ifXNOR-0endif
Load gp0 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp1 @1
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Store gp0 CLL.ForthStackPointer 										#STORE GP0 GLOBAL
Load gp0 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp1 @1
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Move gp0 gp6 						#PUSH gp0 POP gp6
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 CLL.ForthStack 											#LOAD GP0 GLOBAL RELATIVE
Load gp0 0 [gp6]									
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp6 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 CLL.ForthStack 											#LOAD GP0 GLOBAL RELATIVE
Load gp0 0 [gp6]									
XOR gp0 gp1 														#XOR
NOT gp0 															#NOT
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp1 @1
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Move gp0 gp6 						#PUSH gp0 POP gp6
MUL gp6 @4 														   #INDEXING FOR @INT
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
ADD gp6 CLL.ForthStack 											#STORE GP0 GLOBAL RELATIVE
Store gp0 0 [gp6]
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
#########################################################################################################################
																	Scope SHR
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:SHR
SUB Stack_pointer @8 									#OVERHEAD FOR FUNCTION SHR
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION SHR
Load gp1 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp0 @2
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifSHR-0endif
Load gp0 CLL.string41 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 @0
AND gp0 @255 													  #CASTING INT TO CHAR
StoreByte gp0 CLL.dontBreak 									#STORE GP0 GLOBAL (CHAR)
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Pass										%ifSHR-0endif
Load gp0 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp1 @1
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Store gp0 CLL.ForthStackPointer 										#STORE GP0 GLOBAL
Load gp0 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp1 @1
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Move gp0 gp6 						#PUSH gp0 POP gp6
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 CLL.ForthStack 											#LOAD GP0 GLOBAL RELATIVE
Load gp0 0 [gp6]									
Load gp6 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 CLL.ForthStack 											#LOAD GP0 GLOBAL RELATIVE
Load gp1 0 [gp6]									
SHR gp0 gp1 														#SHIFT RIGHT
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp1 @1
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Move gp0 gp6 						#PUSH gp0 POP gp6
MUL gp6 @4 														   #INDEXING FOR @INT
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
ADD gp6 CLL.ForthStack 											#STORE GP0 GLOBAL RELATIVE
Store gp0 0 [gp6]
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
#########################################################################################################################
																	Scope isInDict
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
def Local.dict 8
def @Local.dict @8
def Local.name 12
def @Local.name @12
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:isInDict
SUB Stack_pointer @16 									#OVERHEAD FOR FUNCTION isInDict
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION isInDict
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.dict [Stack_pointer] 						#STORE GP0
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.name [Stack_pointer] 						#STORE GP0
Pass 										%loopisInDict-0entry
Load gp0 Local.dict [Stack_pointer] 						#LOAD GP0
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0
if gp0 then Load PC loopisInDict-0exit 								#WHILE LOOP
Load gp0 Local.name [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 Local.dict [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:checkDictName 												#CALLING checkDictName
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifisInDict-0endif
Load gp0 Local.dict [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Pass										%ifisInDict-0endif
Load gp6 @3
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.dict [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Local.dict [Stack_pointer] 						#STORE GP0
Load PC loopisInDict-0entry					%loopisInDict-0continue
Pass 										%loopisInDict-0exit
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
#########################################################################################################################
																	Scope checkForEnd
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
def Local.input 8
def @Local.input @8
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:checkForEnd
SUB Stack_pointer @9 									#OVERHEAD FOR FUNCTION checkForEnd
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION checkForEnd
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
StoreByte gp0 Local.input [Stack_pointer] 					#STORE GP0 (CHAR)
Load gp1 CLL.READ_IN_STATE 										#LOAD GP0 GLOBAL
Load gp0 @0
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifcheckForEnd-3true 									#IF ELSE STATEMENT
LoadByte gp0 Local.input [Stack_pointer] 					#LOAD GP0 (CHAR)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
AND gp0 @255 													  #CASTING INT TO CHAR
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifcheckForEnd-0endif
Goto function:readIn 												#CALLING readIn
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Pass										%ifcheckForEnd-0endif
LoadByte gp0 Local.input [Stack_pointer] 					#LOAD GP0 (CHAR)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @10
AND gp0 @255 													  #CASTING INT TO CHAR
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifcheckForEnd-1endif
Goto function:readIn 												#CALLING readIn
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Pass										%ifcheckForEnd-1endif
LoadByte gp0 Local.input [Stack_pointer] 					#LOAD GP0 (CHAR)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @13
AND gp0 @255 													  #CASTING INT TO CHAR
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifcheckForEnd-2endif
Goto function:readIn 												#CALLING readIn
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Pass										%ifcheckForEnd-2endif
Load PC ifcheckForEnd-3endif
Pass 										%ifcheckForEnd-3true
Goto function:readIn 												#CALLING readIn
Pass 										%ifcheckForEnd-3endif           
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
#########################################################################################################################
																	Scope primExecute
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
def Local.ref 8
def @Local.ref @8
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:primExecute
SUB Stack_pointer @12 									#OVERHEAD FOR FUNCTION primExecute
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION primExecute
Goto function:Pop 												#CALLING Pop
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.ref [Stack_pointer] 						#STORE GP0
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.ref [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:bytecodeInterp 												#CALLING bytecodeInterp
Load gp0 @1
AND gp0 @255 													  #CASTING INT TO CHAR
StoreByte gp0 CLL.dontBreak 									#STORE GP0 GLOBAL (CHAR)
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
#########################################################################################################################
																	Scope scrollWhiteSpaceAndLine
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
def Local.thisChar 8
def @Local.thisChar @8
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:scrollWhiteSpaceAndLine
SUB Stack_pointer @9 									#OVERHEAD FOR FUNCTION scrollWhiteSpaceAndLine
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION scrollWhiteSpaceAndLine
Goto function:readStringChar 												#CALLING readStringChar
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
StoreByte gp0 Local.thisChar [Stack_pointer] 					#STORE GP0 (CHAR)
Pass 										%loopscrollWhiteSpaceAndLine-0entry 		#FOR LOOP
LoadByte gp0 Local.thisChar [Stack_pointer] 					#LOAD GP0 (CHAR)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:isWhiteSpace 												#CALLING isWhiteSpace
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0
if gp0 then Load PC loopscrollWhiteSpaceAndLine-0exit
LoadByte gp0 Local.thisChar [Stack_pointer] 					#LOAD GP0 (CHAR)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:checkForEnd 												#CALLING checkForEnd
Pass 										%loopscrollWhiteSpaceAndLine-0continue
Goto function:readStringChar 												#CALLING readStringChar
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
StoreByte gp0 Local.thisChar [Stack_pointer] 					#STORE GP0 (CHAR)
Load PC loopscrollWhiteSpaceAndLine-0entry
Pass 										%loopscrollWhiteSpaceAndLine-0exit
Goto function:backChar 												#CALLING backChar
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
#########################################################################################################################
																	Scope changeMode
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
def Local.newMode 8
def @Local.newMode @8
def Local.failed 12
def @Local.failed @12
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:changeMode
SUB Stack_pointer @16 									#OVERHEAD FOR FUNCTION changeMode
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION changeMode
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.newMode [Stack_pointer] 						#STORE GP0
Load gp1 Local.newMode [Stack_pointer] 						#LOAD GP0
Load gp0 @0
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifchangeMode-4true 									#IF ELSE STATEMENT
Load gp1 CLL.READ_IN_MODE 										#LOAD GP0 GLOBAL
Load gp0 @0
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifchangeMode-3true 									#IF ELSE STATEMENT
Load gp0 @1
Store gp0 CLL.READ_IN_MODE 										#STORE GP0 GLOBAL
Load gp0 CLL.diskBuff 										#LOAD GP0 GLOBAL
Store gp0 CLL.lineBuff 										#STORE GP0 GLOBAL
Load gp0 CLL.diskPtr 										#LOAD GP0 GLOBAL
Store gp0 CLL.linePtr 										#STORE GP0 GLOBAL
Load PC ifchangeMode-3endif
Pass 										%ifchangeMode-3true
Load gp0 CLL.linePtr 										#LOAD GP0 GLOBAL
Store gp0 CLL.keyboardPtr 										#STORE GP0 GLOBAL
Load gp0 @1
Store gp0 CLL.READ_IN_MODE 										#STORE GP0 GLOBAL
Load gp0 CLL.diskBuff 										#LOAD GP0 GLOBAL
Store gp0 CLL.lineBuff 										#STORE GP0 GLOBAL
Load gp0 @0
Store gp0 CLL.linePtr 										#STORE GP0 GLOBAL
Goto function:QueueEmpty 												#CALLING QueueEmpty
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
if gp0 then Load PC ifchangeMode-2true 									#IF ELSE STATEMENT
Goto function:GetFromQueue 												#CALLING GetFromQueue
Load gp0 CLL.diskBuff 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @4096
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:dRead 												#CALLING dRead
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.failed [Stack_pointer] 						#STORE GP0
Load gp0 Local.failed [Stack_pointer] 						#LOAD GP0
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifchangeMode-1endif
Load gp0 CLL.string132 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Pass										%ifchangeMode-1endif
Load gp0 @0
Store gp0 CLL.linePtr 										#STORE GP0 GLOBAL
Load gp0 @1
Store gp0 CLL.READ_IN_STATE 										#STORE GP0 GLOBAL
Load PC ifchangeMode-2endif
Pass 										%ifchangeMode-2true
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:changeMode 												#CALLING changeMode
Pass 										%ifchangeMode-2endif           
Pass 										%ifchangeMode-3endif           
Load PC ifchangeMode-4endif
Pass 										%ifchangeMode-4true
Load gp1 CLL.READ_IN_MODE 										#LOAD GP0 GLOBAL
Load gp0 @1
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifchangeMode-0endif
Load gp0 CLL.linePtr 										#LOAD GP0 GLOBAL
Store gp0 CLL.diskPtr 										#STORE GP0 GLOBAL
Pass										%ifchangeMode-0endif
Load gp0 @0
Store gp0 CLL.READ_IN_MODE 										#STORE GP0 GLOBAL
Load gp0 CLL.keyboardBuff 										#LOAD GP0 GLOBAL
Store gp0 CLL.lineBuff 										#STORE GP0 GLOBAL
Load gp0 CLL.keyboardPtr 										#LOAD GP0 GLOBAL
Store gp0 CLL.linePtr 										#STORE GP0 GLOBAL
Load gp0 @0
Store gp0 CLL.blockOverFlowFlag 										#STORE GP0 GLOBAL
Pass 										%ifchangeMode-4endif           
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
#########################################################################################################################
																	Scope primConvertInt
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:primConvertInt
SUB Stack_pointer @8 									#OVERHEAD FOR FUNCTION primConvertInt
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION primConvertInt
Goto function:convertInt 												#CALLING convertInt
Goto function:Push 												#CALLING Push
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
#########################################################################################################################
																	Scope SHL
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:SHL
SUB Stack_pointer @8 									#OVERHEAD FOR FUNCTION SHL
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION SHL
Load gp1 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp0 @2
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifSHL-0endif
Load gp0 CLL.string42 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 @0
AND gp0 @255 													  #CASTING INT TO CHAR
StoreByte gp0 CLL.dontBreak 									#STORE GP0 GLOBAL (CHAR)
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Pass										%ifSHL-0endif
Load gp0 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp1 @1
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Store gp0 CLL.ForthStackPointer 										#STORE GP0 GLOBAL
Load gp0 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp1 @1
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Move gp0 gp6 						#PUSH gp0 POP gp6
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 CLL.ForthStack 											#LOAD GP0 GLOBAL RELATIVE
Load gp0 0 [gp6]									
Load gp6 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 CLL.ForthStack 											#LOAD GP0 GLOBAL RELATIVE
Load gp1 0 [gp6]									
SHL gp0 gp1 														#SHIFT LEFT
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp1 @1
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Move gp0 gp6 						#PUSH gp0 POP gp6
MUL gp6 @4 														   #INDEXING FOR @INT
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
ADD gp6 CLL.ForthStack 											#STORE GP0 GLOBAL RELATIVE
Store gp0 0 [gp6]
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
#########################################################################################################################
																	Scope AND
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:AND
SUB Stack_pointer @8 									#OVERHEAD FOR FUNCTION AND
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION AND
Load gp1 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp0 @2
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifAND-0endif
Load gp0 CLL.string34 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 @0
AND gp0 @255 													  #CASTING INT TO CHAR
StoreByte gp0 CLL.dontBreak 									#STORE GP0 GLOBAL (CHAR)
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Pass										%ifAND-0endif
Load gp0 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp1 @1
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Store gp0 CLL.ForthStackPointer 										#STORE GP0 GLOBAL
Load gp0 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp1 @1
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Move gp0 gp6 						#PUSH gp0 POP gp6
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 CLL.ForthStack 											#LOAD GP0 GLOBAL RELATIVE
Load gp0 0 [gp6]									
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp6 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 CLL.ForthStack 											#LOAD GP0 GLOBAL RELATIVE
Load gp0 0 [gp6]									
AND gp0 gp1 														#AND
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp1 @1
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Move gp0 gp6 						#PUSH gp0 POP gp6
MUL gp6 @4 														   #INDEXING FOR @INT
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
ADD gp6 CLL.ForthStack 											#STORE GP0 GLOBAL RELATIVE
Store gp0 0 [gp6]
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
#########################################################################################################################
																	Scope printTOS
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
def Local.TOS 8
def @Local.TOS @8
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:printTOS
SUB Stack_pointer @12 									#OVERHEAD FOR FUNCTION printTOS
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION printTOS
Goto function:Pop 												#CALLING Pop
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.TOS [Stack_pointer] 						#STORE GP0
Load gp1 Local.TOS [Stack_pointer] 						#LOAD GP0
Load gp0 @2147483648
AND gp0 gp1 														#AND
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifprintTOS-0endif
Load gp0 CLL.string17 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 @0
Load gp1 Local.TOS [Stack_pointer] 						#LOAD GP0
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:print_i 												#CALLING print_i
Load gp0 CLL.string18 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Pass										%ifprintTOS-0endif
Load gp0 Local.TOS [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:print_i 												#CALLING print_i
Load gp0 CLL.string19 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
#########################################################################################################################
																	Scope equal
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:equal
SUB Stack_pointer @8 									#OVERHEAD FOR FUNCTION equal
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION equal
Load gp1 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp0 @2
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifequal-0endif
Load gp0 CLL.string45 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 @0
AND gp0 @255 													  #CASTING INT TO CHAR
StoreByte gp0 CLL.dontBreak 									#STORE GP0 GLOBAL (CHAR)
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Pass										%ifequal-0endif
Load gp0 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp1 @1
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Store gp0 CLL.ForthStackPointer 										#STORE GP0 GLOBAL
Load gp0 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp1 @1
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Move gp0 gp6 						#PUSH gp0 POP gp6
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 CLL.ForthStack 											#LOAD GP0 GLOBAL RELATIVE
Load gp0 0 [gp6]									
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp6 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 CLL.ForthStack 											#LOAD GP0 GLOBAL RELATIVE
Load gp0 0 [gp6]									
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:__equal 												#CALLING __equal
Load gp0 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp1 @1
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Move gp0 gp6 						#PUSH gp0 POP gp6
MUL gp6 @4 														   #INDEXING FOR @INT
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
ADD gp6 CLL.ForthStack 											#STORE GP0 GLOBAL RELATIVE
Store gp0 0 [gp6]
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
#########################################################################################################################
																	Scope createConstant
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
def Local.Array_ofname 8
def @Local.Array_ofname @8
def Local.name 17
def @Local.name @17
def Local.n 21
def @Local.n @21
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:createConstant
SUB Stack_pointer @25 									#OVERHEAD FOR FUNCTION createConstant
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION createConstant
Move Stack_pointer gp0 											#GETTING POINTER
ADD gp0 @Local.Array_ofname
Store gp0 Local.name [Stack_pointer] 						#STORE GP0
Goto function:getWordName 												#CALLING getWordName
Load gp0 Local.name [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:copyName 												#CALLING copyName
Goto function:Pop 												#CALLING Pop
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.n [Stack_pointer] 						#STORE GP0
Load gp0 Local.name [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @2
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 Local.n [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:editDictEntry 												#CALLING editDictEntry
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
#########################################################################################################################
																	Scope scrollWhiteSpace
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
def Local.thisChar 8
def @Local.thisChar @8
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:scrollWhiteSpace
SUB Stack_pointer @9 									#OVERHEAD FOR FUNCTION scrollWhiteSpace
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION scrollWhiteSpace
Load gp1 CLL.READ_IN_STATE 										#LOAD GP0 GLOBAL
Load gp0 @0
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifscrollWhiteSpace-0endif
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Pass										%ifscrollWhiteSpace-0endif
Goto function:readStringChar 												#CALLING readStringChar
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
StoreByte gp0 Local.thisChar [Stack_pointer] 					#STORE GP0 (CHAR)
Pass 										%loopscrollWhiteSpace-0entry 		#FOR LOOP
LoadByte gp0 Local.thisChar [Stack_pointer] 					#LOAD GP0 (CHAR)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:isWhiteSpace 												#CALLING isWhiteSpace
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0
if gp0 then Load PC loopscrollWhiteSpace-0exit
Load gp1 CLL.READ_IN_STATE 										#LOAD GP0 GLOBAL
Load gp0 @0
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifscrollWhiteSpace-1endif
Load PC loopscrollWhiteSpace-0exit
Pass										%ifscrollWhiteSpace-1endif
Pass 										%loopscrollWhiteSpace-0continue
Goto function:readStringChar 												#CALLING readStringChar
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
StoreByte gp0 Local.thisChar [Stack_pointer] 					#STORE GP0 (CHAR)
Load PC loopscrollWhiteSpace-0entry
Pass 										%loopscrollWhiteSpace-0exit
Goto function:backChar 												#CALLING backChar
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
#########################################################################################################################
																	Scope __equal
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
def Local.a 8
def @Local.a @8
def Local.b 12
def @Local.b @12
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:__equal
SUB Stack_pointer @16 									#OVERHEAD FOR FUNCTION __equal
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION __equal
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.b [Stack_pointer] 						#STORE GP0
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.a [Stack_pointer] 						#STORE GP0
Load gp1 Local.a [Stack_pointer] 						#LOAD GP0
Load gp0 Local.b [Stack_pointer] 						#LOAD GP0
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC if__equal-0true 									#IF ELSE STATEMENT
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Load PC if__equal-0endif
Pass 										%if__equal-0true
Load gp0 @1
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Pass 										%if__equal-0endif           
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
#########################################################################################################################
																	Scope NOT
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:NOT
SUB Stack_pointer @8 									#OVERHEAD FOR FUNCTION NOT
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION NOT
Load gp1 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp0 @1
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifNOT-0endif
Load gp0 CLL.string37 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 @0
AND gp0 @255 													  #CASTING INT TO CHAR
StoreByte gp0 CLL.dontBreak 									#STORE GP0 GLOBAL (CHAR)
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Pass										%ifNOT-0endif
Load gp0 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp1 @1
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Move gp0 gp6 						#PUSH gp0 POP gp6
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 CLL.ForthStack 											#LOAD GP0 GLOBAL RELATIVE
Load gp0 0 [gp6]									
NOT gp0 															#NOT
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp1 @1
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Move gp0 gp6 						#PUSH gp0 POP gp6
MUL gp6 @4 														   #INDEXING FOR @INT
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
ADD gp6 CLL.ForthStack 											#STORE GP0 GLOBAL RELATIVE
Store gp0 0 [gp6]
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
#########################################################################################################################
																	Scope primPass
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:primPass
SUB Stack_pointer @8 									#OVERHEAD FOR FUNCTION primPass
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION primPass
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
#########################################################################################################################
																	Scope Rot
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
def Local.temp 8
def @Local.temp @8
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:Rot
SUB Stack_pointer @12 									#OVERHEAD FOR FUNCTION Rot
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION Rot
Load gp1 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp0 @2
Move Zero gp2 														#COMPARE (IS GREATER)
Compare gp1 gp0
if Greater then Load gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifRot-0true 									#IF ELSE STATEMENT
Load gp0 CLL.string26 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 @0
AND gp0 @255 													  #CASTING INT TO CHAR
StoreByte gp0 CLL.dontBreak 									#STORE GP0 GLOBAL (CHAR)
Load PC ifRot-0endif
Pass 										%ifRot-0true
Load gp0 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp1 @1
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Move gp0 gp6 						#PUSH gp0 POP gp6
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 CLL.ForthStack 											#LOAD GP0 GLOBAL RELATIVE
Load gp0 0 [gp6]									
Store gp0 Local.temp [Stack_pointer] 						#STORE GP0
Load gp0 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp1 @2
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Move gp0 gp6 						#PUSH gp0 POP gp6
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 CLL.ForthStack 											#LOAD GP0 GLOBAL RELATIVE
Load gp0 0 [gp6]									
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp1 @1
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Move gp0 gp6 						#PUSH gp0 POP gp6
MUL gp6 @4 														   #INDEXING FOR @INT
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
ADD gp6 CLL.ForthStack 											#STORE GP0 GLOBAL RELATIVE
Store gp0 0 [gp6]
Load gp0 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp1 @3
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Move gp0 gp6 						#PUSH gp0 POP gp6
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 CLL.ForthStack 											#LOAD GP0 GLOBAL RELATIVE
Load gp0 0 [gp6]									
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp1 @2
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Move gp0 gp6 						#PUSH gp0 POP gp6
MUL gp6 @4 														   #INDEXING FOR @INT
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
ADD gp6 CLL.ForthStack 											#STORE GP0 GLOBAL RELATIVE
Store gp0 0 [gp6]
Load gp0 Local.temp [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp1 @3
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Move gp0 gp6 						#PUSH gp0 POP gp6
MUL gp6 @4 														   #INDEXING FOR @INT
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
ADD gp6 CLL.ForthStack 											#STORE GP0 GLOBAL RELATIVE
Store gp0 0 [gp6]
Pass 										%ifRot-0endif           
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
#########################################################################################################################
																	Scope NOR
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:NOR
SUB Stack_pointer @8 									#OVERHEAD FOR FUNCTION NOR
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION NOR
Load gp1 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp0 @2
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifNOR-0endif
Load gp0 CLL.string39 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 @0
AND gp0 @255 													  #CASTING INT TO CHAR
StoreByte gp0 CLL.dontBreak 									#STORE GP0 GLOBAL (CHAR)
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Pass										%ifNOR-0endif
Load gp0 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp1 @1
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Store gp0 CLL.ForthStackPointer 										#STORE GP0 GLOBAL
Load gp0 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp1 @1
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Move gp0 gp6 						#PUSH gp0 POP gp6
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 CLL.ForthStack 											#LOAD GP0 GLOBAL RELATIVE
Load gp0 0 [gp6]									
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp6 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 CLL.ForthStack 											#LOAD GP0 GLOBAL RELATIVE
Load gp0 0 [gp6]									
OR gp0 gp1 															#OR
NOT gp0 															#NOT
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp1 @1
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Move gp0 gp6 						#PUSH gp0 POP gp6
MUL gp6 @4 														   #INDEXING FOR @INT
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
ADD gp6 CLL.ForthStack 											#STORE GP0 GLOBAL RELATIVE
Store gp0 0 [gp6]
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
#########################################################################################################################
																	Scope MOD
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:MOD
SUB Stack_pointer @8 									#OVERHEAD FOR FUNCTION MOD
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION MOD
Load gp1 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp0 @2
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifMOD-0endif
Load gp0 CLL.string33 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 @0
AND gp0 @255 													  #CASTING INT TO CHAR
StoreByte gp0 CLL.dontBreak 									#STORE GP0 GLOBAL (CHAR)
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Pass										%ifMOD-0endif
Load gp0 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp1 @1
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Store gp0 CLL.ForthStackPointer 										#STORE GP0 GLOBAL
Load gp0 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp1 @1
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Move gp0 gp6 						#PUSH gp0 POP gp6
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 CLL.ForthStack 											#LOAD GP0 GLOBAL RELATIVE
Load gp0 0 [gp6]									
Load gp6 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 CLL.ForthStack 											#LOAD GP0 GLOBAL RELATIVE
Load gp1 0 [gp6]									
MOD gp0 gp1 														#MODULO
if DivByZero then Load PC DIV_BY_ZERO
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp1 @1
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Move gp0 gp6 						#PUSH gp0 POP gp6
MUL gp6 @4 														   #INDEXING FOR @INT
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
ADD gp6 CLL.ForthStack 											#STORE GP0 GLOBAL RELATIVE
Store gp0 0 [gp6]
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
#########################################################################################################################
																	Scope comment
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:comment
SUB Stack_pointer @8 									#OVERHEAD FOR FUNCTION comment
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION comment
Goto function:scrollLine 												#CALLING scrollLine
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
#########################################################################################################################
																	Scope __dalloc
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
def Local.right_child 8
def @Local.right_child @8
def Local.address 12
def @Local.address @12
def Local.parent_allocate 16
def @Local.parent_allocate @16
def Local.child_size 28
def @Local.child_size @28
def Local.parent_size 24
def @Local.parent_size @24
def Local.return_value 20
def @Local.return_value @20
def Local.left_child 32
def @Local.left_child @32
def Local.parent_node 36
def @Local.parent_node @36
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:__dalloc
SUB Stack_pointer @40 									#OVERHEAD FOR FUNCTION __dalloc
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION __dalloc
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.parent_node [Stack_pointer] 						#STORE GP0
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.address [Stack_pointer] 						#STORE GP0
Load gp6 @3
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.parent_node [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Local.parent_size [Stack_pointer] 						#STORE GP0
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.parent_node [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Local.parent_allocate [Stack_pointer] 						#STORE GP0
Load gp0 Local.parent_size [Stack_pointer] 						#LOAD GP0
Load gp1 @2
DIV gp0 gp1 														#DIVIDE
if DivByZero then Load PC DIV_BY_ZERO
Store gp0 Local.child_size [Stack_pointer] 						#STORE GP0
Load gp6 @4
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.parent_node [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Local.left_child [Stack_pointer] 						#STORE GP0
Load gp6 @5
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.parent_node [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Local.right_child [Stack_pointer] 						#STORE GP0
Load gp0 Local.address [Stack_pointer] 						#LOAD GP0
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.parent_node [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Load gp2 @4294967295  												#COMPARE (NOT LESS)
Compare gp1 gp0
if Less then Move Zero gp2
Move gp2 gp0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 Local.address [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.parent_node [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp1 Local.parent_size [Stack_pointer] 						#LOAD GP0
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
if gp0 then Load PC if__dalloc-5true 									#IF ELSE STATEMENT
Load gp0 CLL.string3 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Goto function:quit 												#CALLING quit
Load PC if__dalloc-5endif
Pass 										%if__dalloc-5true
Load gp1 Local.left_child [Stack_pointer] 						#LOAD GP0
Load gp0 @0
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC if__dalloc-1endif
Load gp0 Local.address [Stack_pointer] 						#LOAD GP0
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.parent_node [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC if__dalloc-0true 									#IF ELSE STATEMENT
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Load PC if__dalloc-0endif
Pass 										%if__dalloc-0true
Load gp0 @0
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.parent_node [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @1
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Pass 										%if__dalloc-0endif           
Pass										%if__dalloc-1endif
Load gp0 Local.address [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.parent_node [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp1 Local.child_size [Stack_pointer] 						#LOAD GP0
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
Load gp0 Local.address [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 Local.right_child [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:__dalloc 												#CALLING __dalloc
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.return_value [Stack_pointer] 						#STORE GP0
Load PC if__dalloc-2endif
Pass 										%if__dalloc-2true
Load gp0 Local.address [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 Local.left_child [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:__dalloc 												#CALLING __dalloc
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.return_value [Stack_pointer] 						#STORE GP0
Pass 										%if__dalloc-2endif           
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.left_child [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.right_child [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
OR gp0 gp1
NOT gp0 														
if gp0 then Load PC if__dalloc-4true 									#IF ELSE STATEMENT
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.left_child [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.right_child [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
AND gp0 gp1 														#AND
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.parent_node [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load PC if__dalloc-4endif
Pass 										%if__dalloc-4true
Load gp6 @4
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.left_child [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp6 @4
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.right_child [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
OR gp0 gp1
NOT gp0 														
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC if__dalloc-3endif
Load gp0 Local.left_child [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:delete_tree_node 												#CALLING delete_tree_node
Load gp0 Local.right_child [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:delete_tree_node 												#CALLING delete_tree_node
Load gp0 @0
Load gp6 @4
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.parent_node [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @0
Load gp6 @5
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.parent_node [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @0
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.parent_node [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Pass										%if__dalloc-3endif
Pass 										%if__dalloc-4endif           
Load gp0 Local.return_value [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Pass 										%if__dalloc-5endif           
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
#########################################################################################################################
																	Scope PushLit
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
def Local.number 8
def @Local.number @8
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:PushLit
SUB Stack_pointer @12 									#OVERHEAD FOR FUNCTION PushLit
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION PushLit
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.number [Stack_pointer] 						#STORE GP0
Load gp0 Local.number [Stack_pointer] 						#LOAD GP0
Load gp6 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 CLL.ForthStack 											#STORE GP0 GLOBAL RELATIVE
Store gp0 0 [gp6]
Load gp1 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp0 @1
ADD gp0 gp1 														#ADD
Store gp0 CLL.ForthStackPointer 										#STORE GP0 GLOBAL
Load gp1 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp0 @65536
Move Zero gp2 														#COMPARE (IS GREATER)
Compare gp1 gp0
if Greater then Load gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifPushLit-0endif
Load gp0 CLL.string47 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 @0
AND gp0 @255 													  #CASTING INT TO CHAR
StoreByte gp0 CLL.dontBreak 									#STORE GP0 GLOBAL (CHAR)
Pass										%ifPushLit-0endif
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
#########################################################################################################################
																	Scope readStringChar
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:readStringChar
SUB Stack_pointer @8 									#OVERHEAD FOR FUNCTION readStringChar
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION readStringChar
Load gp1 CLL.READ_IN_STATE 										#LOAD GP0 GLOBAL
Load gp0 @0
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifreadStringChar-0endif
Goto function:readIn 												#CALLING readIn
Pass										%ifreadStringChar-0endif
Load gp6 CLL.linePtr 										#LOAD GP0 GLOBAL
ADD gp6 CLL.lineBuff 											#LOAD GP0 GLOBAL RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @0
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifreadStringChar-1endif
Load gp0 @0
Store gp0 CLL.READ_IN_STATE 										#STORE GP0 GLOBAL
Pass										%ifreadStringChar-1endif
Load gp1 CLL.linePtr 										#LOAD GP0 GLOBAL
Load gp0 @4096
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifreadStringChar-2endif
Goto function:readIn 												#CALLING readIn
Pass										%ifreadStringChar-2endif
Load gp1 CLL.linePtr 										#LOAD GP0 GLOBAL
Load gp0 @1
ADD gp0 gp1 														#ADD
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp1 CLL.READ_IN_MODE 										#LOAD GP0 GLOBAL
Load gp0 @0
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifreadStringChar-3true 									#IF ELSE STATEMENT
Load gp0 @4097
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load PC ifreadStringChar-3endif
Pass 										%ifreadStringChar-3true
Load gp0 @256
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Pass 										%ifreadStringChar-3endif           
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
MOD gp0 gp1 														#MODULO
if DivByZero then Load PC DIV_BY_ZERO
Store gp0 CLL.linePtr 										#STORE GP0 GLOBAL
Load gp0 CLL.linePtr 										#LOAD GP0 GLOBAL
Load gp1 @1
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Move gp0 gp6 						#PUSH gp0 POP gp6
ADD gp6 CLL.lineBuff 											#LOAD GP0 GLOBAL RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC

#################################### Built in function print_integer ####################################
SUB gp7 @4 		 		 %function:print_i										#Pops into gp0
Load gp0 Expression_stack [gp7]  				
Outd gp0
Move Jump PC  			
####################################################################################################

#########################################################################################################################
																	Scope print_h
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
def Local.i 8
def @Local.i @8
def Local.lookup 12
def @Local.lookup @12
def Local.n 16
def @Local.n @16
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:print_h
SUB Stack_pointer @20 									#OVERHEAD FOR FUNCTION print_h
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION print_h
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.n [Stack_pointer] 						#STORE GP0
Load gp0 CLL.string12 										#LOAD GP0 GLOBAL
Store gp0 Local.lookup [Stack_pointer] 						#STORE GP0
Load gp0 @48
AND gp0 @255 													  #CASTING INT TO CHAR
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:putc 												#CALLING putc
Load gp0 @120
AND gp0 @255 													  #CASTING INT TO CHAR
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:putc 												#CALLING putc
Load gp0 @28
Store gp0 Local.i [Stack_pointer] 						#STORE GP0
Pass 										%loopprint_h-0entry 		#FOR LOOP
Load gp1 Local.i [Stack_pointer] 						#LOAD GP0
Load gp0 @0
Load  gp2 @4294967295 												#COMPARE (NOT EQUAL)
Compare gp1 gp0 
if Equal then Move Zero gp2
Move gp2 gp0
NOT gp0
if gp0 then Load PC loopprint_h-0exit
Load gp0 Local.n [Stack_pointer] 						#LOAD GP0
Load gp1 Local.i [Stack_pointer] 						#LOAD GP0
SHR gp0 gp1 														#SHIFT RIGHT
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @15
AND gp0 gp1 														#AND
Move gp0 gp6 						#PUSH gp0 POP gp6
ADD gp6 Local.lookup [Stack_pointer]							#LOAD GP0 RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:putc 												#CALLING putc
Pass 										%loopprint_h-0continue
Load gp0 Local.i [Stack_pointer] 						#LOAD GP0
Load gp1 @4
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Store gp0 Local.i [Stack_pointer] 						#STORE GP0
Load PC loopprint_h-0entry
Pass 										%loopprint_h-0exit
Load gp0 Local.n [Stack_pointer] 						#LOAD GP0
Load gp1 Local.i [Stack_pointer] 						#LOAD GP0
SHR gp0 gp1 														#SHIFT RIGHT
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @15
AND gp0 gp1 														#AND
Move gp0 gp6 						#PUSH gp0 POP gp6
ADD gp6 Local.lookup [Stack_pointer]							#LOAD GP0 RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:putc 												#CALLING putc
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
#########################################################################################################################
																	Scope Dup
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:Dup
SUB Stack_pointer @8 									#OVERHEAD FOR FUNCTION Dup
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION Dup
Load gp1 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp0 @0
Move Zero gp2 														#COMPARE (IS GREATER)
Compare gp1 gp0
if Greater then Load gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifDup-1true 									#IF ELSE STATEMENT
Load gp0 CLL.string23 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 @0
AND gp0 @255 													  #CASTING INT TO CHAR
StoreByte gp0 CLL.dontBreak 									#STORE GP0 GLOBAL (CHAR)
Load PC ifDup-1endif
Pass 										%ifDup-1true
Load gp0 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp1 @1
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Move gp0 gp6 						#PUSH gp0 POP gp6
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 CLL.ForthStack 											#LOAD GP0 GLOBAL RELATIVE
Load gp0 0 [gp6]									
Load gp6 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 CLL.ForthStack 											#STORE GP0 GLOBAL RELATIVE
Store gp0 0 [gp6]
Load gp1 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp0 @1
ADD gp0 gp1 														#ADD
Store gp0 CLL.ForthStackPointer 										#STORE GP0 GLOBAL
Load gp1 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp0 @65536
Move Zero gp2 														#COMPARE (IS GREATER)
Compare gp1 gp0
if Greater then Load gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifDup-0endif
Load gp0 CLL.string22 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 @0
AND gp0 @255 													  #CASTING INT TO CHAR
StoreByte gp0 CLL.dontBreak 									#STORE GP0 GLOBAL (CHAR)
Pass										%ifDup-0endif
Pass 										%ifDup-1endif           
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
#########################################################################################################################
																	Scope MUL
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:MUL
SUB Stack_pointer @8 									#OVERHEAD FOR FUNCTION MUL
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION MUL
Load gp1 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp0 @2
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifMUL-0endif
Load gp0 CLL.string31 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 @0
AND gp0 @255 													  #CASTING INT TO CHAR
StoreByte gp0 CLL.dontBreak 									#STORE GP0 GLOBAL (CHAR)
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Pass										%ifMUL-0endif
Load gp0 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp1 @1
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Store gp0 CLL.ForthStackPointer 										#STORE GP0 GLOBAL
Load gp0 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp1 @1
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Move gp0 gp6 						#PUSH gp0 POP gp6
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 CLL.ForthStack 											#LOAD GP0 GLOBAL RELATIVE
Load gp0 0 [gp6]									
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp6 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 CLL.ForthStack 											#LOAD GP0 GLOBAL RELATIVE
Load gp0 0 [gp6]									
MUL gp0 gp1 														#MULTIPLY
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp1 @1
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Move gp0 gp6 						#PUSH gp0 POP gp6
MUL gp6 @4 														   #INDEXING FOR @INT
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
ADD gp6 CLL.ForthStack 											#STORE GP0 GLOBAL RELATIVE
Store gp0 0 [gp6]
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
#########################################################################################################################
																	Scope print_b
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
def Local.i 8
def @Local.i @8
def Local.n 12
def @Local.n @12
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:print_b
SUB Stack_pointer @16 									#OVERHEAD FOR FUNCTION print_b
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION print_b
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.n [Stack_pointer] 						#STORE GP0
Load gp0 @48
AND gp0 @255 													  #CASTING INT TO CHAR
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:putc 												#CALLING putc
Load gp0 @98
AND gp0 @255 													  #CASTING INT TO CHAR
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:putc 												#CALLING putc
Load gp0 @31
Store gp0 Local.i [Stack_pointer] 						#STORE GP0
Pass 										%loopprint_b-0entry 		#FOR LOOP
Load gp1 Local.i [Stack_pointer] 						#LOAD GP0
Load gp0 @4294967295
Load  gp2 @4294967295 												#COMPARE (NOT EQUAL)
Compare gp1 gp0 
if Equal then Move Zero gp2
Move gp2 gp0
NOT gp0
if gp0 then Load PC loopprint_b-0exit
Load gp0 @1
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 Local.n [Stack_pointer] 						#LOAD GP0
Load gp1 Local.i [Stack_pointer] 						#LOAD GP0
SHR gp0 gp1 														#SHIFT RIGHT
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
AND gp0 gp1 														#AND
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
if gp0 then Load PC ifprint_b-0true 									#IF ELSE STATEMENT
Load gp0 @48
AND gp0 @255 													  #CASTING INT TO CHAR
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load PC ifprint_b-0endif
Pass 										%ifprint_b-0true
Load gp0 @49
AND gp0 @255 													  #CASTING INT TO CHAR
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Pass 										%ifprint_b-0endif           
Goto function:putc 												#CALLING putc
Pass 										%loopprint_b-0continue
Load gp0 Local.i [Stack_pointer] 						#LOAD GP0
Load gp1 @1
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Store gp0 Local.i [Stack_pointer] 						#STORE GP0
Load PC loopprint_b-0entry
Pass 										%loopprint_b-0exit
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
#########################################################################################################################
																	Scope Store
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
def Local.address 8
def @Local.address @8
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:Store
SUB Stack_pointer @12 									#OVERHEAD FOR FUNCTION Store
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION Store
Load gp1 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp0 @2
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifStore-0endif
Load gp0 CLL.string16 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 @0
AND gp0 @255 													  #CASTING INT TO CHAR
StoreByte gp0 CLL.dontBreak 									#STORE GP0 GLOBAL (CHAR)
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Pass										%ifStore-0endif
Load gp0 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp1 @2
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Store gp0 CLL.ForthStackPointer 										#STORE GP0 GLOBAL
Load gp1 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp0 @1
ADD gp0 gp1 														#ADD
Move gp0 gp6 						#PUSH gp0 POP gp6
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 CLL.ForthStack 											#LOAD GP0 GLOBAL RELATIVE
Load gp0 0 [gp6]									
Store gp0 Local.address [Stack_pointer] 						#STORE GP0
Load gp6 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 CLL.ForthStack 											#LOAD GP0 GLOBAL RELATIVE
Load gp0 0 [gp6]									
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.address [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
#########################################################################################################################
																	Scope primIsInDict
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:primIsInDict
SUB Stack_pointer @8 									#OVERHEAD FOR FUNCTION primIsInDict
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION primIsInDict
Load gp0 CLL.WORD_BUF 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 CLL.ForthDictHead 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:isInDict 												#CALLING isInDict
Goto function:Push 												#CALLING Push
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
#########################################################################################################################
																	Scope primCompile
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:primCompile
SUB Stack_pointer @8 									#OVERHEAD FOR FUNCTION primCompile
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION primCompile
Goto function:compileWord 												#CALLING compileWord
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
#########################################################################################################################
																	Scope convertInt
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
def Local.i 8
def @Local.i @8
def Local.dec 12
def @Local.dec @12
def Local.negative 16
def @Local.negative @16
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:convertInt
SUB Stack_pointer @20 									#OVERHEAD FOR FUNCTION convertInt
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION convertInt
Load gp0 @0
Store gp0 Local.negative [Stack_pointer] 						#STORE GP0
Load gp0 @0
Store gp0 Local.dec [Stack_pointer] 						#STORE GP0
Load gp0 @0
Store gp0 Local.i [Stack_pointer] 						#STORE GP0
Pass 										%loopconvertInt-0entry 		#FOR LOOP
Load gp6 Local.i [Stack_pointer] 						#LOAD GP0
ADD gp6 CLL.WORD_BUF 											#LOAD GP0 GLOBAL RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0
if gp0 then Load PC loopconvertInt-0exit
Load gp1 Local.i [Stack_pointer] 						#LOAD GP0
Load gp0 @0
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp6 Local.i [Stack_pointer] 						#LOAD GP0
ADD gp6 CLL.WORD_BUF 											#LOAD GP0 GLOBAL RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @45
AND gp0 @255 													  #CASTING INT TO CHAR
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
if gp0 then Load PC ifconvertInt-0endif
Load gp0 @1
Store gp0 Local.negative [Stack_pointer] 						#STORE GP0
Load PC loopconvertInt-0continue
Pass										%ifconvertInt-0endif
Load gp1 Local.dec [Stack_pointer] 						#LOAD GP0
Load gp0 @10
MUL gp0 gp1 														#MULTIPLY
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp6 Local.i [Stack_pointer] 						#LOAD GP0
ADD gp6 CLL.WORD_BUF 											#LOAD GP0 GLOBAL RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @48
AND gp0 @255 													  #CASTING INT TO CHAR
Move gp0 gp1 						#PUSH gp0 POP gp1
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
AND gp0 @255 														#SUBTRACT (CHARS)
AND gp1 @255
SUB gp0 gp1
AND gp0 @255
Load Flags_reset @4294967287  
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Store gp0 Local.dec [Stack_pointer] 						#STORE GP0
Pass 										%loopconvertInt-0continue
Load gp1 Local.i [Stack_pointer] 						#LOAD GP0
Load gp0 @1
ADD gp0 gp1 														#ADD
Store gp0 Local.i [Stack_pointer] 						#STORE GP0
Load PC loopconvertInt-0entry
Pass 										%loopconvertInt-0exit
Load gp0 Local.negative [Stack_pointer] 						#LOAD GP0
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
if gp0 then Load PC ifconvertInt-1true 									#IF ELSE STATEMENT
Load gp0 Local.dec [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load PC ifconvertInt-1endif
Pass 										%ifconvertInt-1true
Load gp0 @0
Load gp1 Local.dec [Stack_pointer] 						#LOAD GP0
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Pass 										%ifconvertInt-1endif           
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
#########################################################################################################################
																	Scope executePrimitive
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
def Local.primitive_opcode 8
def @Local.primitive_opcode @8
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:executePrimitive
SUB Stack_pointer @12 									#OVERHEAD FOR FUNCTION executePrimitive
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION executePrimitive
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.primitive_opcode [Stack_pointer] 						#STORE GP0
Load gp1 Local.primitive_opcode [Stack_pointer] 						#LOAD GP0
Load gp0 @32
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifexecutePrimitive-51true 									#IF ELSE STATEMENT
Load gp1 Local.primitive_opcode [Stack_pointer] 						#LOAD GP0
Load gp0 @48
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifexecutePrimitive-50true 									#IF ELSE STATEMENT
Load gp1 Local.primitive_opcode [Stack_pointer] 						#LOAD GP0
Load gp0 @48
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifexecutePrimitive-49true 									#IF ELSE STATEMENT
Load gp1 Local.primitive_opcode [Stack_pointer] 						#LOAD GP0
Load gp0 @49
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifexecutePrimitive-48true 									#IF ELSE STATEMENT
Load gp1 Local.primitive_opcode [Stack_pointer] 						#LOAD GP0
Load gp0 @50
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifexecutePrimitive-47true 									#IF ELSE STATEMENT
Load gp0 CLL.string48 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 Local.primitive_opcode [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:print_h 												#CALLING print_h
Load gp0 @0
AND gp0 @255 													  #CASTING INT TO CHAR
StoreByte gp0 CLL.dontBreak 									#STORE GP0 GLOBAL (CHAR)
Load PC ifexecutePrimitive-47endif
Pass 										%ifexecutePrimitive-47true
Goto function:getDict 												#CALLING getDict
Pass 										%ifexecutePrimitive-47endif           
Load PC ifexecutePrimitive-48endif
Pass 										%ifexecutePrimitive-48true
Goto function:SWITCH 												#CALLING SWITCH
Pass 										%ifexecutePrimitive-48endif           
Load PC ifexecutePrimitive-49endif
Pass 										%ifexecutePrimitive-49true
Goto function:WRITEDISK 												#CALLING WRITEDISK
Pass 										%ifexecutePrimitive-49endif           
Load PC ifexecutePrimitive-50endif
Pass 										%ifexecutePrimitive-50true
Load gp1 Local.primitive_opcode [Stack_pointer] 						#LOAD GP0
Load gp0 @40
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifexecutePrimitive-46true 									#IF ELSE STATEMENT
Load gp1 Local.primitive_opcode [Stack_pointer] 						#LOAD GP0
Load gp0 @44
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifexecutePrimitive-45true 									#IF ELSE STATEMENT
Load gp1 Local.primitive_opcode [Stack_pointer] 						#LOAD GP0
Load gp0 @46
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifexecutePrimitive-44true 									#IF ELSE STATEMENT
Load gp1 Local.primitive_opcode [Stack_pointer] 						#LOAD GP0
Load gp0 @47
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifexecutePrimitive-43true 									#IF ELSE STATEMENT
Goto function:READDISK 												#CALLING READDISK
Load PC ifexecutePrimitive-43endif
Pass 										%ifexecutePrimitive-43true
Goto function:ADDBLOCK 												#CALLING ADDBLOCK
Pass 										%ifexecutePrimitive-43endif           
Load PC ifexecutePrimitive-44endif
Pass 										%ifexecutePrimitive-44true
Load gp1 Local.primitive_opcode [Stack_pointer] 						#LOAD GP0
Load gp0 @45
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifexecutePrimitive-42true 									#IF ELSE STATEMENT
Goto function:setDict 												#CALLING setDict
Load PC ifexecutePrimitive-42endif
Pass 										%ifexecutePrimitive-42true
Goto function:primDalloc 												#CALLING primDalloc
Pass 										%ifexecutePrimitive-42endif           
Pass 										%ifexecutePrimitive-44endif           
Load PC ifexecutePrimitive-45endif
Pass 										%ifexecutePrimitive-45true
Load gp1 Local.primitive_opcode [Stack_pointer] 						#LOAD GP0
Load gp0 @42
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifexecutePrimitive-41true 									#IF ELSE STATEMENT
Load gp1 Local.primitive_opcode [Stack_pointer] 						#LOAD GP0
Load gp0 @43
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifexecutePrimitive-40true 									#IF ELSE STATEMENT
Goto function:primAlloc 												#CALLING primAlloc
Load PC ifexecutePrimitive-40endif
Pass 										%ifexecutePrimitive-40true
Goto function:readC 												#CALLING readC
Pass 										%ifexecutePrimitive-40endif           
Load PC ifexecutePrimitive-41endif
Pass 										%ifexecutePrimitive-41true
Load gp1 Local.primitive_opcode [Stack_pointer] 						#LOAD GP0
Load gp0 @41
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifexecutePrimitive-39true 									#IF ELSE STATEMENT
Goto function:comment 												#CALLING comment
Load PC ifexecutePrimitive-39endif
Pass 										%ifexecutePrimitive-39true
Goto function:dropAll 												#CALLING dropAll
Pass 										%ifexecutePrimitive-39endif           
Pass 										%ifexecutePrimitive-41endif           
Pass 										%ifexecutePrimitive-45endif           
Load PC ifexecutePrimitive-46endif
Pass 										%ifexecutePrimitive-46true
Load gp1 Local.primitive_opcode [Stack_pointer] 						#LOAD GP0
Load gp0 @36
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifexecutePrimitive-38true 									#IF ELSE STATEMENT
Load gp1 Local.primitive_opcode [Stack_pointer] 						#LOAD GP0
Load gp0 @36
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifexecutePrimitive-37true 									#IF ELSE STATEMENT
Load gp1 Local.primitive_opcode [Stack_pointer] 						#LOAD GP0
Load gp0 @37
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifexecutePrimitive-36true 									#IF ELSE STATEMENT
Load gp1 Local.primitive_opcode [Stack_pointer] 						#LOAD GP0
Load gp0 @38
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifexecutePrimitive-35true 									#IF ELSE STATEMENT
Goto function:halt 												#CALLING halt
Load PC ifexecutePrimitive-35endif
Pass 										%ifexecutePrimitive-35true
Goto function:printDict 												#CALLING printDict
Pass 										%ifexecutePrimitive-35endif           
Load PC ifexecutePrimitive-36endif
Pass 										%ifexecutePrimitive-36true
Goto function:printStack 												#CALLING printStack
Pass 										%ifexecutePrimitive-36endif           
Load PC ifexecutePrimitive-37endif
Pass 										%ifexecutePrimitive-37true
Goto function:primPass 												#CALLING primPass
Pass 										%ifexecutePrimitive-37endif           
Load PC ifexecutePrimitive-38endif
Pass 										%ifexecutePrimitive-38true
Load gp1 Local.primitive_opcode [Stack_pointer] 						#LOAD GP0
Load gp0 @32
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifexecutePrimitive-34true 									#IF ELSE STATEMENT
Load gp1 Local.primitive_opcode [Stack_pointer] 						#LOAD GP0
Load gp0 @33
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifexecutePrimitive-33true 									#IF ELSE STATEMENT
Load gp1 Local.primitive_opcode [Stack_pointer] 						#LOAD GP0
Load gp0 @34
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifexecutePrimitive-32true 									#IF ELSE STATEMENT
Load gp1 Local.primitive_opcode [Stack_pointer] 						#LOAD GP0
Load gp0 @35
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifexecutePrimitive-31endif
Goto function:printChar 												#CALLING printChar
Pass										%ifexecutePrimitive-31endif
Load PC ifexecutePrimitive-32endif
Pass 										%ifexecutePrimitive-32true
Goto function:printBUF 												#CALLING printBUF
Pass 										%ifexecutePrimitive-32endif           
Load PC ifexecutePrimitive-33endif
Pass 										%ifexecutePrimitive-33true
Goto function:primConvertInt 												#CALLING primConvertInt
Pass 										%ifexecutePrimitive-33endif           
Load PC ifexecutePrimitive-34endif
Pass 										%ifexecutePrimitive-34true
Goto function:primIsInt 												#CALLING primIsInt
Pass 										%ifexecutePrimitive-34endif           
Pass 										%ifexecutePrimitive-38endif           
Pass 										%ifexecutePrimitive-46endif           
Pass 										%ifexecutePrimitive-50endif           
Load PC ifexecutePrimitive-51endif
Pass 										%ifexecutePrimitive-51true
Load gp1 Local.primitive_opcode [Stack_pointer] 						#LOAD GP0
Load gp0 @16
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifexecutePrimitive-30true 									#IF ELSE STATEMENT
Load gp1 Local.primitive_opcode [Stack_pointer] 						#LOAD GP0
Load gp0 @24
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifexecutePrimitive-29true 									#IF ELSE STATEMENT
Load gp1 Local.primitive_opcode [Stack_pointer] 						#LOAD GP0
Load gp0 @28
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifexecutePrimitive-28true 									#IF ELSE STATEMENT
Load gp1 Local.primitive_opcode [Stack_pointer] 						#LOAD GP0
Load gp0 @30
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifexecutePrimitive-27true 									#IF ELSE STATEMENT
Load gp1 Local.primitive_opcode [Stack_pointer] 						#LOAD GP0
Load gp0 @31
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifexecutePrimitive-26true 									#IF ELSE STATEMENT
Goto function:primCompile 												#CALLING primCompile
Load PC ifexecutePrimitive-26endif
Pass 										%ifexecutePrimitive-26true
Goto function:primIsInDict 												#CALLING primIsInDict
Pass 										%ifexecutePrimitive-26endif           
Load PC ifexecutePrimitive-27endif
Pass 										%ifexecutePrimitive-27true
Load gp1 Local.primitive_opcode [Stack_pointer] 						#LOAD GP0
Load gp0 @29
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifexecutePrimitive-25true 									#IF ELSE STATEMENT
Goto function:primExecute 												#CALLING primExecute
Load PC ifexecutePrimitive-25endif
Pass 										%ifexecutePrimitive-25true
Goto function:primRead 												#CALLING primRead
Pass 										%ifexecutePrimitive-25endif           
Pass 										%ifexecutePrimitive-27endif           
Load PC ifexecutePrimitive-28endif
Pass 										%ifexecutePrimitive-28true
Load gp1 Local.primitive_opcode [Stack_pointer] 						#LOAD GP0
Load gp0 @26
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifexecutePrimitive-24true 									#IF ELSE STATEMENT
Load gp1 Local.primitive_opcode [Stack_pointer] 						#LOAD GP0
Load gp0 @27
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifexecutePrimitive-23true 									#IF ELSE STATEMENT
Goto function:createTable 												#CALLING createTable
Load PC ifexecutePrimitive-23endif
Pass 										%ifexecutePrimitive-23true
Goto function:createConstant 												#CALLING createConstant
Pass 										%ifexecutePrimitive-23endif           
Load PC ifexecutePrimitive-24endif
Pass 										%ifexecutePrimitive-24true
Load gp1 Local.primitive_opcode [Stack_pointer] 						#LOAD GP0
Load gp0 @25
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifexecutePrimitive-22true 									#IF ELSE STATEMENT
Goto function:createVariable 												#CALLING createVariable
Load PC ifexecutePrimitive-22endif
Pass 										%ifexecutePrimitive-22true
Goto function:equal 												#CALLING equal
Pass 										%ifexecutePrimitive-22endif           
Pass 										%ifexecutePrimitive-24endif           
Pass 										%ifexecutePrimitive-28endif           
Load PC ifexecutePrimitive-29endif
Pass 										%ifexecutePrimitive-29true
Load gp1 Local.primitive_opcode [Stack_pointer] 						#LOAD GP0
Load gp0 @20
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifexecutePrimitive-21true 									#IF ELSE STATEMENT
Load gp1 Local.primitive_opcode [Stack_pointer] 						#LOAD GP0
Load gp0 @22
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifexecutePrimitive-20true 									#IF ELSE STATEMENT
Load gp1 Local.primitive_opcode [Stack_pointer] 						#LOAD GP0
Load gp0 @23
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifexecutePrimitive-19true 									#IF ELSE STATEMENT
Goto function:greater 												#CALLING greater
Load PC ifexecutePrimitive-19endif
Pass 										%ifexecutePrimitive-19true
Goto function:less 												#CALLING less
Pass 										%ifexecutePrimitive-19endif           
Load PC ifexecutePrimitive-20endif
Pass 										%ifexecutePrimitive-20true
Load gp1 Local.primitive_opcode [Stack_pointer] 						#LOAD GP0
Load gp0 @21
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifexecutePrimitive-18true 									#IF ELSE STATEMENT
Goto function:SHR 												#CALLING SHR
Load PC ifexecutePrimitive-18endif
Pass 										%ifexecutePrimitive-18true
Goto function:SHL 												#CALLING SHL
Pass 										%ifexecutePrimitive-18endif           
Pass 										%ifexecutePrimitive-20endif           
Load PC ifexecutePrimitive-21endif
Pass 										%ifexecutePrimitive-21true
Load gp1 Local.primitive_opcode [Stack_pointer] 						#LOAD GP0
Load gp0 @18
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifexecutePrimitive-17true 									#IF ELSE STATEMENT
Load gp1 Local.primitive_opcode [Stack_pointer] 						#LOAD GP0
Load gp0 @19
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifexecutePrimitive-16true 									#IF ELSE STATEMENT
Goto function:XNOR 												#CALLING XNOR
Load PC ifexecutePrimitive-16endif
Pass 										%ifexecutePrimitive-16true
Goto function:NOR 												#CALLING NOR
Pass 										%ifexecutePrimitive-16endif           
Load PC ifexecutePrimitive-17endif
Pass 										%ifexecutePrimitive-17true
Load gp1 Local.primitive_opcode [Stack_pointer] 						#LOAD GP0
Load gp0 @17
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifexecutePrimitive-15true 									#IF ELSE STATEMENT
Goto function:NAND 												#CALLING NAND
Load PC ifexecutePrimitive-15endif
Pass 										%ifexecutePrimitive-15true
Goto function:NOT 												#CALLING NOT
Pass 										%ifexecutePrimitive-15endif           
Pass 										%ifexecutePrimitive-17endif           
Pass 										%ifexecutePrimitive-21endif           
Pass 										%ifexecutePrimitive-29endif           
Load PC ifexecutePrimitive-30endif
Pass 										%ifexecutePrimitive-30true
Load gp1 Local.primitive_opcode [Stack_pointer] 						#LOAD GP0
Load gp0 @8
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifexecutePrimitive-14true 									#IF ELSE STATEMENT
Load gp1 Local.primitive_opcode [Stack_pointer] 						#LOAD GP0
Load gp0 @12
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifexecutePrimitive-13true 									#IF ELSE STATEMENT
Load gp1 Local.primitive_opcode [Stack_pointer] 						#LOAD GP0
Load gp0 @14
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifexecutePrimitive-12true 									#IF ELSE STATEMENT
Load gp1 Local.primitive_opcode [Stack_pointer] 						#LOAD GP0
Load gp0 @15
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifexecutePrimitive-11true 									#IF ELSE STATEMENT
Goto function:XOR 												#CALLING XOR
Load PC ifexecutePrimitive-11endif
Pass 										%ifexecutePrimitive-11true
Goto function:OR 												#CALLING OR
Pass 										%ifexecutePrimitive-11endif           
Load PC ifexecutePrimitive-12endif
Pass 										%ifexecutePrimitive-12true
Load gp1 Local.primitive_opcode [Stack_pointer] 						#LOAD GP0
Load gp0 @13
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifexecutePrimitive-10true 									#IF ELSE STATEMENT
Goto function:AND 												#CALLING AND
Load PC ifexecutePrimitive-10endif
Pass 										%ifexecutePrimitive-10true
Goto function:MOD 												#CALLING MOD
Pass 										%ifexecutePrimitive-10endif           
Pass 										%ifexecutePrimitive-12endif           
Load PC ifexecutePrimitive-13endif
Pass 										%ifexecutePrimitive-13true
Load gp1 Local.primitive_opcode [Stack_pointer] 						#LOAD GP0
Load gp0 @10
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifexecutePrimitive-9true 									#IF ELSE STATEMENT
Load gp1 Local.primitive_opcode [Stack_pointer] 						#LOAD GP0
Load gp0 @11
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifexecutePrimitive-8true 									#IF ELSE STATEMENT
Goto function:DIV 												#CALLING DIV
Load PC ifexecutePrimitive-8endif
Pass 										%ifexecutePrimitive-8true
Goto function:MUL 												#CALLING MUL
Pass 										%ifexecutePrimitive-8endif           
Load PC ifexecutePrimitive-9endif
Pass 										%ifexecutePrimitive-9true
Load gp1 Local.primitive_opcode [Stack_pointer] 						#LOAD GP0
Load gp0 @9
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifexecutePrimitive-7true 									#IF ELSE STATEMENT
Goto function:SUB 												#CALLING SUB
Load PC ifexecutePrimitive-7endif
Pass 										%ifexecutePrimitive-7true
Goto function:ADD 												#CALLING ADD
Pass 										%ifexecutePrimitive-7endif           
Pass 										%ifexecutePrimitive-9endif           
Pass 										%ifexecutePrimitive-13endif           
Load PC ifexecutePrimitive-14endif
Pass 										%ifexecutePrimitive-14true
Load gp1 Local.primitive_opcode [Stack_pointer] 						#LOAD GP0
Load gp0 @4
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifexecutePrimitive-6true 									#IF ELSE STATEMENT
Load gp1 Local.primitive_opcode [Stack_pointer] 						#LOAD GP0
Load gp0 @6
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifexecutePrimitive-5true 									#IF ELSE STATEMENT
Load gp1 Local.primitive_opcode [Stack_pointer] 						#LOAD GP0
Load gp0 @7
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifexecutePrimitive-4true 									#IF ELSE STATEMENT
Goto function:Drop 												#CALLING Drop
Load PC ifexecutePrimitive-4endif
Pass 										%ifexecutePrimitive-4true
Goto function:Over 												#CALLING Over
Pass 										%ifexecutePrimitive-4endif           
Load PC ifexecutePrimitive-5endif
Pass 										%ifexecutePrimitive-5true
Load gp1 Local.primitive_opcode [Stack_pointer] 						#LOAD GP0
Load gp0 @5
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifexecutePrimitive-3true 									#IF ELSE STATEMENT
Goto function:Rot 												#CALLING Rot
Load PC ifexecutePrimitive-3endif
Pass 										%ifexecutePrimitive-3true
Goto function:Swap 												#CALLING Swap
Pass 										%ifexecutePrimitive-3endif           
Pass 										%ifexecutePrimitive-5endif           
Load PC ifexecutePrimitive-6endif
Pass 										%ifexecutePrimitive-6true
Load gp1 Local.primitive_opcode [Stack_pointer] 						#LOAD GP0
Load gp0 @2
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifexecutePrimitive-2true 									#IF ELSE STATEMENT
Load gp1 Local.primitive_opcode [Stack_pointer] 						#LOAD GP0
Load gp0 @3
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifexecutePrimitive-1true 									#IF ELSE STATEMENT
Goto function:Dup 												#CALLING Dup
Load PC ifexecutePrimitive-1endif
Pass 										%ifexecutePrimitive-1true
Goto function:printTOS 												#CALLING printTOS
Pass 										%ifexecutePrimitive-1endif           
Load PC ifexecutePrimitive-2endif
Pass 										%ifexecutePrimitive-2true
Load gp1 Local.primitive_opcode [Stack_pointer] 						#LOAD GP0
Load gp0 @1
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifexecutePrimitive-0true 									#IF ELSE STATEMENT
Goto function:Store 												#CALLING Store
Load PC ifexecutePrimitive-0endif
Pass 										%ifexecutePrimitive-0true
Goto function:Fetch 												#CALLING Fetch
Pass 										%ifexecutePrimitive-0endif           
Pass 										%ifexecutePrimitive-2endif           
Pass 										%ifexecutePrimitive-6endif           
Pass 										%ifexecutePrimitive-14endif           
Pass 										%ifexecutePrimitive-30endif           
Pass 										%ifexecutePrimitive-51endif           
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
#########################################################################################################################
																	Scope compileWhileWord
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
def Local.placeholderNode 8
def @Local.placeholderNode @8
def Local.dummy 12
def @Local.dummy @12
def Local.dictEntry 16
def @Local.dictEntry @16
def Local.reference 20
def @Local.reference @20
def Local.bottom 24
def @Local.bottom @24
def Local.referenceNode 32
def @Local.referenceNode @32
def Local.ifRetArray 36
def @Local.ifRetArray @36
def Local.Array_ofwhileRetArray 52
def @Local.Array_ofwhileRetArray @52
def Local.start 40
def @Local.start @40
def Local.elseRetArray 44
def @Local.elseRetArray @44
def Local.retArray 48
def @Local.retArray @48
def Local.whileRetArray 28
def @Local.whileRetArray @28
def Local.Array_ofifRetArray 64
def @Local.Array_ofifRetArray @64
def Local.Array_ofelseRetArray 76
def @Local.Array_ofelseRetArray @76
def Local.previous 88
def @Local.previous @88
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:compileWhileWord
SUB Stack_pointer @92 									#OVERHEAD FOR FUNCTION compileWhileWord
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION compileWhileWord
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.retArray [Stack_pointer] 						#STORE GP0
Load gp0 @6
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @36
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.start [Stack_pointer] 						#STORE GP0
Load gp0 Local.start [Stack_pointer] 						#LOAD GP0
Store gp0 Local.previous [Stack_pointer] 						#STORE GP0
Pass 										%loopcompileWhileWord-3entry
Load gp0 @1
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0
if gp0 then Load PC loopcompileWhileWord-3exit 								#WHILE LOOP
Load gp0 @0
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Goto function:primRead 												#CALLING primRead
Pass 										%loopcompileWhileWord-1entry
Load gp0 CLL.WORD_BUF 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 CLL.string103 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:checkDictName 												#CALLING checkDictName
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 CLL.WORD_BUF 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 CLL.string104 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:checkDictName 												#CALLING checkDictName
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
OR gp0 gp1
NOT gp0
if gp0 then Load PC loopcompileWhileWord-1exit 								#WHILE LOOP
Load gp0 CLL.WORD_BUF 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 CLL.string105 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:checkDictName 												#CALLING checkDictName
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifcompileWhileWord-4endif
Pass 										%loopcompileWhileWord-0entry
Load gp0 @1
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0
if gp0 then Load PC loopcompileWhileWord-0exit 								#WHILE LOOP
Goto function:primRead 												#CALLING primRead
Load gp0 CLL.WORD_BUF 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 CLL.string106 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:checkDictName 												#CALLING checkDictName
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifcompileWhileWord-0endif
Load PC loopcompileWhileWord-0exit
Pass										%ifcompileWhileWord-0endif
Load gp0 CLL.WORD_BUF 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 CLL.ForthDictHead 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:isInDict 												#CALLING isInDict
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.dictEntry [Stack_pointer] 						#STORE GP0
Load gp0 Local.dictEntry [Stack_pointer] 						#LOAD GP0
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														
if gp0 then Load PC ifcompileWhileWord-2true 									#IF ELSE STATEMENT
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.dictEntry [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:bytecodeInterp 												#CALLING bytecodeInterp
Load PC ifcompileWhileWord-2endif
Pass 										%ifcompileWhileWord-2true
Goto function:isInt 												#CALLING isInt
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
if gp0 then Load PC ifcompileWhileWord-1true 									#IF ELSE STATEMENT
Load gp0 CLL.string107 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 CLL.WORD_BUF 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 CLL.string108 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 @0
AND gp0 @255 													  #CASTING INT TO CHAR
StoreByte gp0 CLL.dontBreak 									#STORE GP0 GLOBAL (CHAR)
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Load PC ifcompileWhileWord-1endif
Pass 										%ifcompileWhileWord-1true
Goto function:convertInt 												#CALLING convertInt
Goto function:Push 												#CALLING Push
Pass 										%ifcompileWhileWord-1endif           
Pass 										%ifcompileWhileWord-2endif           
LoadByte gp0 CLL.dontBreak 									#LOAD GP0 GLOBAL (CHAR)
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @0
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifcompileWhileWord-3endif
Load gp0 CLL.string109 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Pass										%ifcompileWhileWord-3endif
Load PC loopcompileWhileWord-0entry					%loopcompileWhileWord-0continue
Pass 										%loopcompileWhileWord-0exit
Goto function:primRead 												#CALLING primRead
Pass										%ifcompileWhileWord-4endif
Load gp0 CLL.WORD_BUF 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 CLL.string110 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:checkDictName 												#CALLING checkDictName
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifcompileWhileWord-5endif
Goto function:comment 												#CALLING comment
Goto function:primRead 												#CALLING primRead
Pass										%ifcompileWhileWord-5endif
Load PC loopcompileWhileWord-1entry					%loopcompileWhileWord-1continue
Pass 										%loopcompileWhileWord-1exit
Load gp0 CLL.WORD_BUF 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 CLL.string111 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:checkDictName 												#CALLING checkDictName
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifcompileWhileWord-6endif
Load gp0 @0
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 Local.start [Stack_pointer] 						#LOAD GP0
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 Local.previous [Stack_pointer] 						#LOAD GP0
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Pass										%ifcompileWhileWord-6endif
Load gp0 CLL.WORD_BUF 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 CLL.string112 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:checkDictName 												#CALLING checkDictName
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
if gp0 then Load PC ifcompileWhileWord-30true 									#IF ELSE STATEMENT
Load gp0 CLL.WORD_BUF 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 CLL.string113 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:checkDictName 												#CALLING checkDictName
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
if gp0 then Load PC ifcompileWhileWord-29true 									#IF ELSE STATEMENT
Load gp0 CLL.WORD_BUF 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 CLL.string118 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:checkDictName 												#CALLING checkDictName
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
if gp0 then Load PC ifcompileWhileWord-28true 									#IF ELSE STATEMENT
Load gp0 CLL.WORD_BUF 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 CLL.string124 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:checkDictName 												#CALLING checkDictName
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
if gp0 then Load PC ifcompileWhileWord-27true 									#IF ELSE STATEMENT
Load gp0 CLL.WORD_BUF 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 CLL.string127 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:checkDictName 												#CALLING checkDictName
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
if gp0 then Load PC ifcompileWhileWord-26true 									#IF ELSE STATEMENT
Goto function:isInt 												#CALLING isInt
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
if gp0 then Load PC ifcompileWhileWord-25true 									#IF ELSE STATEMENT
Load gp0 CLL.WORD_BUF 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 CLL.ForthDictHead 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:isInDict 												#CALLING isInDict
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.reference [Stack_pointer] 						#STORE GP0
Load gp0 Local.reference [Stack_pointer] 						#LOAD GP0
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
if gp0 then Load PC ifcompileWhileWord-24true 									#IF ELSE STATEMENT
Load gp0 CLL.string128 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 CLL.WORD_BUF 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 CLL.string129 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 @0
AND gp0 @255 													  #CASTING INT TO CHAR
StoreByte gp0 CLL.dontBreak 									#STORE GP0 GLOBAL (CHAR)
Load gp0 @1
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @1
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load PC ifcompileWhileWord-24endif
Pass 										%ifcompileWhileWord-24true
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.reference [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Local.referenceNode [Stack_pointer] 						#STORE GP0
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.referenceNode [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp1 0 [gp6]
Load gp0 @6
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.referenceNode [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp1 0 [gp6]
Load gp0 @2
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
OR gp0 gp1
if gp0 then Load PC ifcompileWhileWord-23true 									#IF ELSE STATEMENT
Load gp0 @1
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 Local.reference [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load PC ifcompileWhileWord-23endif
Pass 										%ifcompileWhileWord-23true
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.referenceNode [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp1 0 [gp6]
Load gp0 @0
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifcompileWhileWord-22true 									#IF ELSE STATEMENT
Load gp0 @1
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 Local.reference [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load PC ifcompileWhileWord-22endif
Pass 										%ifcompileWhileWord-22true
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.referenceNode [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.referenceNode [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.referenceNode [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Pass 										%ifcompileWhileWord-22endif           
Pass 										%ifcompileWhileWord-23endif           
Pass 										%ifcompileWhileWord-24endif           
Load PC ifcompileWhileWord-25endif
Pass 										%ifcompileWhileWord-25true
Load gp0 @2
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:convertInt 												#CALLING convertInt
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Pass 										%ifcompileWhileWord-25endif           
Load PC ifcompileWhileWord-26endif
Pass 										%ifcompileWhileWord-26true
Load gp0 Local.retArray [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:compileStringPrint 												#CALLING compileStringPrint
Pass 										%ifcompileWhileWord-26endif           
Load PC ifcompileWhileWord-27endif
Pass 										%ifcompileWhileWord-27true
Move Stack_pointer gp0 											#GETTING POINTER
ADD gp0 @Local.Array_ofwhileRetArray
Store gp0 Local.whileRetArray [Stack_pointer] 						#STORE GP0
Load gp0 Local.whileRetArray [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:compileWhileWord 												#CALLING compileWhileWord
LoadByte gp0 CLL.dontBreak 									#LOAD GP0 GLOBAL (CHAR)
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @0
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifcompileWhileWord-19endif
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Pass										%ifcompileWhileWord-19endif
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.whileRetArray [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp1 0 [gp6]
Load gp0 @2
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifcompileWhileWord-20endif
Load gp0 CLL.string125 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 @0
AND gp0 @255 													  #CASTING INT TO CHAR
StoreByte gp0 CLL.dontBreak 									#STORE GP0 GLOBAL (CHAR)
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Pass										%ifcompileWhileWord-20endif
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.whileRetArray [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp1 0 [gp6]
Load gp0 @0
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifcompileWhileWord-21true 									#IF ELSE STATEMENT
Load gp0 CLL.string126 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.whileRetArray [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:print_i 												#CALLING print_i
Load gp0 @0
AND gp0 @255 													  #CASTING INT TO CHAR
StoreByte gp0 CLL.dontBreak 									#STORE GP0 GLOBAL (CHAR)
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Load PC ifcompileWhileWord-21endif
Pass 										%ifcompileWhileWord-21true
Load gp0 @5
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.whileRetArray [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.whileRetArray [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Local.bottom [Stack_pointer] 						#STORE GP0
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.bottom [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Pass 										%ifcompileWhileWord-21endif           
Pass 										%ifcompileWhileWord-27endif           
Load PC ifcompileWhileWord-28endif
Pass 										%ifcompileWhileWord-28true
Move Stack_pointer gp0 											#GETTING POINTER
ADD gp0 @Local.Array_ofifRetArray
Store gp0 Local.ifRetArray [Stack_pointer] 						#STORE GP0
Load gp0 Local.ifRetArray [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:compileIfWord 												#CALLING compileIfWord
LoadByte gp0 CLL.dontBreak 									#LOAD GP0 GLOBAL (CHAR)
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @0
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifcompileWhileWord-11endif
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Pass										%ifcompileWhileWord-11endif
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.ifRetArray [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp1 0 [gp6]
Load gp0 @2
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifcompileWhileWord-12endif
Load gp0 CLL.string119 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 @0
AND gp0 @255 													  #CASTING INT TO CHAR
StoreByte gp0 CLL.dontBreak 									#STORE GP0 GLOBAL (CHAR)
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Pass										%ifcompileWhileWord-12endif
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.ifRetArray [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp1 0 [gp6]
Load gp0 @0
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifcompileWhileWord-18true 									#IF ELSE STATEMENT
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.ifRetArray [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp1 0 [gp6]
Load gp0 @1
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifcompileWhileWord-17true 									#IF ELSE STATEMENT
Load gp0 CLL.string123 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.ifRetArray [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:print_i 												#CALLING print_i
Load gp0 @0
AND gp0 @255 													  #CASTING INT TO CHAR
StoreByte gp0 CLL.dontBreak 									#STORE GP0 GLOBAL (CHAR)
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Load PC ifcompileWhileWord-17endif
Pass 										%ifcompileWhileWord-17true
Move Stack_pointer gp0 											#GETTING POINTER
ADD gp0 @Local.Array_ofelseRetArray
Store gp0 Local.elseRetArray [Stack_pointer] 						#STORE GP0
Load gp0 Local.elseRetArray [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:compileIfWord 												#CALLING compileIfWord
LoadByte gp0 CLL.dontBreak 									#LOAD GP0 GLOBAL (CHAR)
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @0
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifcompileWhileWord-13endif
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Pass										%ifcompileWhileWord-13endif
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.elseRetArray [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp1 0 [gp6]
Load gp0 @2
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifcompileWhileWord-14endif
Load gp0 CLL.string120 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 @0
AND gp0 @255 													  #CASTING INT TO CHAR
StoreByte gp0 CLL.dontBreak 									#STORE GP0 GLOBAL (CHAR)
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Pass										%ifcompileWhileWord-14endif
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.elseRetArray [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp1 0 [gp6]
Load gp0 @1
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifcompileWhileWord-15endif
Load gp0 CLL.string121 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 @0
AND gp0 @255 													  #CASTING INT TO CHAR
StoreByte gp0 CLL.dontBreak 									#STORE GP0 GLOBAL (CHAR)
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Pass										%ifcompileWhileWord-15endif
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.elseRetArray [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp1 0 [gp6]
Load gp0 @0
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifcompileWhileWord-16true 									#IF ELSE STATEMENT
Load gp0 CLL.string122 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.ifRetArray [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:print_i 												#CALLING print_i
Load gp0 @0
AND gp0 @255 													  #CASTING INT TO CHAR
StoreByte gp0 CLL.dontBreak 									#STORE GP0 GLOBAL (CHAR)
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Load PC ifcompileWhileWord-16endif
Pass 										%ifcompileWhileWord-16true
Load gp0 @5
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.ifRetArray [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.elseRetArray [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @6
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @36
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.placeholderNode [Stack_pointer] 						#STORE GP0
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.ifRetArray [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Local.bottom [Stack_pointer] 						#STORE GP0
Load gp0 Local.placeholderNode [Stack_pointer] 						#LOAD GP0
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.bottom [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.elseRetArray [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Local.bottom [Stack_pointer] 						#STORE GP0
Load gp0 Local.placeholderNode [Stack_pointer] 						#LOAD GP0
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.bottom [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 Local.placeholderNode [Stack_pointer] 						#LOAD GP0
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Pass 										%ifcompileWhileWord-16endif           
Pass 										%ifcompileWhileWord-17endif           
Load PC ifcompileWhileWord-18endif
Pass 										%ifcompileWhileWord-18true
Load gp0 @6
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @36
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.placeholderNode [Stack_pointer] 						#STORE GP0
Load gp0 @5
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.ifRetArray [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 Local.placeholderNode [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.ifRetArray [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Local.bottom [Stack_pointer] 						#STORE GP0
Load gp0 Local.placeholderNode [Stack_pointer] 						#LOAD GP0
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.bottom [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 Local.placeholderNode [Stack_pointer] 						#LOAD GP0
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Pass 										%ifcompileWhileWord-18endif           
Pass 										%ifcompileWhileWord-28endif           
Load PC ifcompileWhileWord-29endif
Pass 										%ifcompileWhileWord-29true
Pass 										%loopcompileWhileWord-2entry
Load gp0 @1
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0
if gp0 then Load PC loopcompileWhileWord-2exit 								#WHILE LOOP
Goto function:primRead 												#CALLING primRead
Load gp0 CLL.WORD_BUF 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 CLL.string114 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:checkDictName 												#CALLING checkDictName
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifcompileWhileWord-7endif
Load PC loopcompileWhileWord-2exit
Pass										%ifcompileWhileWord-7endif
Load gp0 CLL.WORD_BUF 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 CLL.ForthDictHead 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:isInDict 												#CALLING isInDict
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.dictEntry [Stack_pointer] 						#STORE GP0
Load gp0 Local.dictEntry [Stack_pointer] 						#LOAD GP0
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														
if gp0 then Load PC ifcompileWhileWord-9true 									#IF ELSE STATEMENT
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.dictEntry [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:bytecodeInterp 												#CALLING bytecodeInterp
Load PC ifcompileWhileWord-9endif
Pass 										%ifcompileWhileWord-9true
Goto function:isInt 												#CALLING isInt
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
if gp0 then Load PC ifcompileWhileWord-8true 									#IF ELSE STATEMENT
Load gp0 CLL.string115 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 CLL.WORD_BUF 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 CLL.string116 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 @0
AND gp0 @255 													  #CASTING INT TO CHAR
StoreByte gp0 CLL.dontBreak 									#STORE GP0 GLOBAL (CHAR)
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Load PC ifcompileWhileWord-8endif
Pass 										%ifcompileWhileWord-8true
Goto function:convertInt 												#CALLING convertInt
Goto function:Push 												#CALLING Push
Pass 										%ifcompileWhileWord-8endif           
Pass 										%ifcompileWhileWord-9endif           
LoadByte gp0 CLL.dontBreak 									#LOAD GP0 GLOBAL (CHAR)
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @0
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifcompileWhileWord-10endif
Load gp0 CLL.string117 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Pass										%ifcompileWhileWord-10endif
Load PC loopcompileWhileWord-2entry					%loopcompileWhileWord-2continue
Pass 										%loopcompileWhileWord-2exit
Load gp0 @2
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:Pop 												#CALLING Pop
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Pass 										%ifcompileWhileWord-29endif           
Load PC ifcompileWhileWord-30endif
Pass 										%ifcompileWhileWord-30true
Load gp0 @0
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @0
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @2
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Pass 										%ifcompileWhileWord-30endif           
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.previous [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Local.previous [Stack_pointer] 						#STORE GP0
Load PC loopcompileWhileWord-3entry					%loopcompileWhileWord-3continue
Pass 										%loopcompileWhileWord-3exit
Load gp0 Local.start [Stack_pointer] 						#LOAD GP0
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 Local.previous [Stack_pointer] 						#LOAD GP0
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
#########################################################################################################################
																	Scope SWITCH
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:SWITCH
SUB Stack_pointer @8 									#OVERHEAD FOR FUNCTION SWITCH
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION SWITCH
Load gp1 CLL.READ_IN_MODE 										#LOAD GP0 GLOBAL
Load gp0 @0
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifSWITCH-0true 									#IF ELSE STATEMENT
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:changeMode 												#CALLING changeMode
Load PC ifSWITCH-0endif
Pass 										%ifSWITCH-0true
Load gp0 @1
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:changeMode 												#CALLING changeMode
Pass 										%ifSWITCH-0endif           
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
#########################################################################################################################
																	Scope WRITEDISK
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
def Local.START 8
def @Local.START @8
def Local.LENGTH 12
def @Local.LENGTH @12
def Local.DISK_ADDRESS 16
def @Local.DISK_ADDRESS @16
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:WRITEDISK
SUB Stack_pointer @20 									#OVERHEAD FOR FUNCTION WRITEDISK
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION WRITEDISK
Goto function:Pop 												#CALLING Pop
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.LENGTH [Stack_pointer] 						#STORE GP0
Goto function:Pop 												#CALLING Pop
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.START [Stack_pointer] 						#STORE GP0
Goto function:Pop 												#CALLING Pop
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.DISK_ADDRESS [Stack_pointer] 						#STORE GP0
Load gp0 Local.DISK_ADDRESS [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 Local.START [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 Local.LENGTH [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:dWrite 												#CALLING dWrite
Goto function:Push 												#CALLING Push
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC

########################## built in function putc ########################################
SUB gp7 @4 															%function:putc
Load gp0  Expression_stack [gp7]
Out gp0
Move Jump PC
#########################################################################################################################################################################################################
																	Scope ntab
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
def Local.i 8
def @Local.i @8
def Local.tabs 12
def @Local.tabs @12
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:ntab
SUB Stack_pointer @16 									#OVERHEAD FOR FUNCTION ntab
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION ntab
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.tabs [Stack_pointer] 						#STORE GP0
Load gp0 @0
Store gp0 Local.i [Stack_pointer] 						#STORE GP0
Pass 										%loopntab-0entry 		#FOR LOOP
Load gp1 Local.i [Stack_pointer] 						#LOAD GP0
Load gp0 Local.tabs [Stack_pointer] 						#LOAD GP0
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
NOT gp0
if gp0 then Load PC loopntab-0exit
Load gp0 CLL.string11 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Pass 										%loopntab-0continue
Load gp1 Local.i [Stack_pointer] 						#LOAD GP0
Load gp0 @1
ADD gp0 gp1 														#ADD
Store gp0 Local.i [Stack_pointer] 						#STORE GP0
Load PC loopntab-0entry
Pass 										%loopntab-0exit
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
#########################################################################################################################
																	Scope print_pool
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
def Local.node 8
def @Local.node @8
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:print_pool
SUB Stack_pointer @12 									#OVERHEAD FOR FUNCTION print_pool
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION print_pool
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.node [Stack_pointer] 						#STORE GP0
Load gp0 Local.node [Stack_pointer] 						#LOAD GP0
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifprint_pool-0endif
Load gp0 Local.node [Stack_pointer] 						#LOAD GP0
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
ADD gp6 Local.node [Stack_pointer] 							#LOAD GP0 RELATIVE
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
ADD gp6 Local.node [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:print_pool 												#CALLING print_pool
Pass										%ifprint_pool-0endif
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
#########################################################################################################################
																	Scope scanToEndOfDef
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
def Local.character 8
def @Local.character @8
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:scanToEndOfDef
SUB Stack_pointer @9 									#OVERHEAD FOR FUNCTION scanToEndOfDef
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION scanToEndOfDef
Load gp0 CLL.string133 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Pass 										%loopscanToEndOfDef-0entry
Load gp0 @1
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0
if gp0 then Load PC loopscanToEndOfDef-0exit 								#WHILE LOOP
Goto function:readStringChar 												#CALLING readStringChar
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
StoreByte gp0 Local.character [Stack_pointer] 					#STORE GP0 (CHAR)
LoadByte gp0 Local.character [Stack_pointer] 					#LOAD GP0 (CHAR)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @59
AND gp0 @255 													  #CASTING INT TO CHAR
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifscanToEndOfDef-0endif
Load PC loopscanToEndOfDef-0exit
Pass										%ifscanToEndOfDef-0endif
LoadByte gp0 Local.character [Stack_pointer] 					#LOAD GP0 (CHAR)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @10
AND gp0 @255 													  #CASTING INT TO CHAR
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifscanToEndOfDef-1endif
Load PC loopscanToEndOfDef-0exit
Load gp0 @0
Store gp0 CLL.READ_IN_STATE 										#STORE GP0 GLOBAL
Pass										%ifscanToEndOfDef-1endif
LoadByte gp0 Local.character [Stack_pointer] 					#LOAD GP0 (CHAR)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
AND gp0 @255 													  #CASTING INT TO CHAR
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifscanToEndOfDef-2endif
Load PC loopscanToEndOfDef-0exit
Load gp0 @0
Store gp0 CLL.READ_IN_STATE 										#STORE GP0 GLOBAL
Pass										%ifscanToEndOfDef-2endif
Load PC loopscanToEndOfDef-0entry					%loopscanToEndOfDef-0continue
Pass 										%loopscanToEndOfDef-0exit
Load gp0 @1
Store gp0 CLL.EOL 										#STORE GP0 GLOBAL
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
#########################################################################################################################
																	Scope primIsInt
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:primIsInt
SUB Stack_pointer @8 									#OVERHEAD FOR FUNCTION primIsInt
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION primIsInt
Goto function:isInt 												#CALLING isInt
Goto function:Push 												#CALLING Push
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
#########################################################################################################################
																	Scope __malloc
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
def Local.node 8
def @Local.node @8
def Local.right_child 20
def @Local.right_child @20
def Local.node_size 12
def @Local.node_size @12
def Local.return_value 16
def @Local.return_value @16
def Local.left_child 24
def @Local.left_child @24
def Local.size 28
def @Local.size @28
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:__malloc
SUB Stack_pointer @32 									#OVERHEAD FOR FUNCTION __malloc
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION __malloc
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.size [Stack_pointer] 						#STORE GP0
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.node [Stack_pointer] 						#STORE GP0
Load gp6 @3
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.node [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Local.node_size [Stack_pointer] 						#STORE GP0
Load gp1 Local.size [Stack_pointer] 						#LOAD GP0
Load gp0 Local.node_size [Stack_pointer] 						#LOAD GP0
Move Zero gp2 														#COMPARE (IS GREATER)
Compare gp1 gp0
if Greater then Load gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC if__malloc-11true 									#IF ELSE STATEMENT
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.node [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC if__malloc-0endif
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Pass										%if__malloc-0endif
Load gp0 Local.size [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 Local.node_size [Stack_pointer] 						#LOAD GP0
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
ADD gp6 Local.node [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC if__malloc-1endif
Load gp0 @1
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.node [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.node [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Pass										%if__malloc-1endif
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Pass										%if__malloc-2endif
Load gp1 Local.node_size [Stack_pointer] 						#LOAD GP0
Load gp0 @1
Move Zero gp2 														#COMPARE (IS GREATER)
Compare gp1 gp0
if Greater then Load gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC if__malloc-10endif
Load gp6 @4
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.node [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Local.left_child [Stack_pointer] 						#STORE GP0
Load gp0 Local.left_child [Stack_pointer] 						#LOAD GP0
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC if__malloc-3endif
Load gp0 Local.node [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:split_tree_node 												#CALLING split_tree_node
Load gp6 @4
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.node [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Local.left_child [Stack_pointer] 						#STORE GP0
Pass										%if__malloc-3endif
Load gp6 @5
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.node [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Local.right_child [Stack_pointer] 						#STORE GP0
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.left_child [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC if__malloc-6endif
Load gp0 Local.left_child [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 Local.size [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:__malloc 												#CALLING __malloc
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.return_value [Stack_pointer] 						#STORE GP0
Load gp0 Local.return_value [Stack_pointer] 						#LOAD GP0
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC if__malloc-5endif
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.left_child [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.right_child [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
AND gp0 gp1 														#AND
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC if__malloc-4endif
Load gp0 @1
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.node [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Pass										%if__malloc-4endif
Load gp0 Local.return_value [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Pass										%if__malloc-5endif
Pass										%if__malloc-6endif
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.right_child [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC if__malloc-9endif
Load gp0 Local.right_child [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 Local.size [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:__malloc 												#CALLING __malloc
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.return_value [Stack_pointer] 						#STORE GP0
Load gp0 Local.return_value [Stack_pointer] 						#LOAD GP0
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC if__malloc-8endif
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.left_child [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.right_child [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
AND gp0 gp1 														#AND
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC if__malloc-7endif
Load gp0 @1
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.node [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Pass										%if__malloc-7endif
Load gp0 Local.return_value [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Pass										%if__malloc-8endif
Pass										%if__malloc-9endif
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Pass										%if__malloc-10endif
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Load PC if__malloc-11endif
Pass 										%if__malloc-11true
Load gp0 CLL.string2 										#LOAD GP0 GLOBAL
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
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
#########################################################################################################################
																	Scope ADD
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:ADD
SUB Stack_pointer @8 									#OVERHEAD FOR FUNCTION ADD
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION ADD
Load gp1 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp0 @2
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifADD-0endif
Load gp0 CLL.string29 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 @0
AND gp0 @255 													  #CASTING INT TO CHAR
StoreByte gp0 CLL.dontBreak 									#STORE GP0 GLOBAL (CHAR)
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Pass										%ifADD-0endif
Load gp0 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp1 @1
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Store gp0 CLL.ForthStackPointer 										#STORE GP0 GLOBAL
Load gp0 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp1 @1
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Move gp0 gp6 						#PUSH gp0 POP gp6
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 CLL.ForthStack 											#LOAD GP0 GLOBAL RELATIVE
Load gp0 0 [gp6]									
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp6 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 CLL.ForthStack 											#LOAD GP0 GLOBAL RELATIVE
Load gp0 0 [gp6]									
ADD gp0 gp1 														#ADD
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp1 @1
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Move gp0 gp6 						#PUSH gp0 POP gp6
MUL gp6 @4 														   #INDEXING FOR @INT
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
ADD gp6 CLL.ForthStack 											#STORE GP0 GLOBAL RELATIVE
Store gp0 0 [gp6]
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
#########################################################################################################################
																	Scope Push
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
def Local.val 8
def @Local.val @8
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:Push
SUB Stack_pointer @12 									#OVERHEAD FOR FUNCTION Push
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION Push
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.val [Stack_pointer] 						#STORE GP0
Load gp0 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @65536
Load gp1 @1
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
Move Zero gp2 														#COMPARE (IS GREATER)
Compare gp1 gp0
if Greater then Load gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifPush-0endif
Load gp0 CLL.string134 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 @0
AND gp0 @255 													  #CASTING INT TO CHAR
StoreByte gp0 CLL.dontBreak 									#STORE GP0 GLOBAL (CHAR)
Pass										%ifPush-0endif
Load gp0 Local.val [Stack_pointer] 						#LOAD GP0
Load gp6 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 CLL.ForthStack 											#STORE GP0 GLOBAL RELATIVE
Store gp0 0 [gp6]
Load gp1 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp0 @1
ADD gp0 gp1 														#ADD
Store gp0 CLL.ForthStackPointer 										#STORE GP0 GLOBAL
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
#########################################################################################################################
																	Scope printDict
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
def Local.ref 8
def @Local.ref @8
def Local.name 12
def @Local.name @12
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:printDict
SUB Stack_pointer @16 									#OVERHEAD FOR FUNCTION printDict
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION printDict
Load gp0 CLL.ForthDictHead 										#LOAD GP0 GLOBAL
Store gp0 Local.ref [Stack_pointer] 						#STORE GP0
Pass 										%loopprintDict-0entry 		#FOR LOOP
Load gp0 Local.ref [Stack_pointer] 						#LOAD GP0
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0
if gp0 then Load PC loopprintDict-0exit
Load gp0 Local.ref [Stack_pointer] 						#LOAD GP0
Store gp0 Local.name [Stack_pointer] 						#STORE GP0
Load gp0 Local.name [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 CLL.string21 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Pass 										%loopprintDict-0continue
Load gp6 @3
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.ref [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Local.ref [Stack_pointer] 						#STORE GP0
Load PC loopprintDict-0entry
Pass 										%loopprintDict-0exit
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
#########################################################################################################################
																	Scope ADDBLOCK
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:ADDBLOCK
SUB Stack_pointer @8 									#OVERHEAD FOR FUNCTION ADDBLOCK
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION ADDBLOCK
Goto function:Pop 												#CALLING Pop
Goto function:AddToQueue 												#CALLING AddToQueue
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
#########################################################################################################################
																	Scope Fetch
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
def Local.address 8
def @Local.address @8
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:Fetch
SUB Stack_pointer @12 									#OVERHEAD FOR FUNCTION Fetch
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION Fetch
Load gp1 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp0 @0
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifFetch-0endif
Load gp0 CLL.string15 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 @0
AND gp0 @255 													  #CASTING INT TO CHAR
StoreByte gp0 CLL.dontBreak 									#STORE GP0 GLOBAL (CHAR)
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Pass										%ifFetch-0endif
Load gp0 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp1 @1
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Move gp0 gp6 						#PUSH gp0 POP gp6
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 CLL.ForthStack 											#LOAD GP0 GLOBAL RELATIVE
Load gp0 0 [gp6]									
Store gp0 Local.address [Stack_pointer] 						#STORE GP0
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.address [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp1 @1
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Move gp0 gp6 						#PUSH gp0 POP gp6
MUL gp6 @4 														   #INDEXING FOR @INT
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
ADD gp6 CLL.ForthStack 											#STORE GP0 GLOBAL RELATIVE
Store gp0 0 [gp6]
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC

################## built in function char ##############################################

SUB gp7 @4 		 		 %function:char									#Pops into gp0
Load gp0 Expression_stack [gp7]  				
AND gp0 @255
Store gp0 Expression_stack [gp7] 
ADD gp7 @4
Move Jump PC 
#######################################################################################
#########################################################################################################################
																	Scope main
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
def Local.replWordReference 8
def @Local.replWordReference @8
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:main
SUB Stack_pointer @12 									#OVERHEAD FOR FUNCTION main
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION main
Load gp0 CLL.MALLOC_TREE_PARTITION 										#LOAD GP0 GLOBAL
Store gp0 CLL.MALLOC_POOL 										#STORE GP0 GLOBAL
Load gp0 @1
AND gp0 @255 													  #CASTING INT TO CHAR
StoreByte gp0 CLL.dontBreak 									#STORE GP0 GLOBAL (CHAR)
Load gp0 @0
Store gp0 CLL.ForthStackPointer 										#STORE GP0 GLOBAL
Load gp0 @0
Store gp0 CLL.ForthDictHead 										#STORE GP0 GLOBAL
Load gp0 @0
Store gp0 CLL.diskPtr 										#STORE GP0 GLOBAL
Load gp0 CLL.keyboardBuff 										#LOAD GP0 GLOBAL
Store gp0 CLL.lineBuff 										#STORE GP0 GLOBAL
Load gp0 @0
Store gp0 CLL.linePtr 										#STORE GP0 GLOBAL
Load gp0 @0
Store gp0 CLL.READ_IN_STATE 										#STORE GP0 GLOBAL
Load gp0 @0
Store gp0 CLL.READ_IN_MODE 										#STORE GP0 GLOBAL
Load gp0 @0
Store gp0 CLL.EOL 										#STORE GP0 GLOBAL
Load gp0 @0
Store gp0 CLL.blockOverFlowFlag 										#STORE GP0 GLOBAL
Load gp0 @0
Store gp0 CLL.frontOfQueue 										#STORE GP0 GLOBAL
Load gp0 @0
Store gp0 CLL.BackOfQueue 										#STORE GP0 GLOBAL
Load gp0 CLL.string194 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 CLL.string195 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Goto function:init_primitives 												#CALLING init_primitives
Load gp0 CLL.string196 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 CLL.string197 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 CLL.string198 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 CLL.ForthDictHead 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:isInDict 												#CALLING isInDict
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.replWordReference [Stack_pointer] 						#STORE GP0
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.replWordReference [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:bytecodeInterp 												#CALLING bytecodeInterp
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
#########################################################################################################################
																	Scope bytecodeInterp
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
def Local.opType 8
def @Local.opType @8
def Local.currentFSP 12
def @Local.currentFSP @12
def Local.new_reference 16
def @Local.new_reference @16
def Local.reference 20
def @Local.reference @20
def Local.branchIfTrue 24
def @Local.branchIfTrue @24
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:bytecodeInterp
SUB Stack_pointer @28 									#OVERHEAD FOR FUNCTION bytecodeInterp
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION bytecodeInterp
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.reference [Stack_pointer] 						#STORE GP0
Load gp0 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Store gp0 Local.currentFSP [Stack_pointer] 						#STORE GP0
Load gp0 @1
AND gp0 @255 													  #CASTING INT TO CHAR
StoreByte gp0 CLL.dontBreak 									#STORE GP0 GLOBAL (CHAR)
Pass 										%loopbytecodeInterp-0entry
Load gp0 Local.reference [Stack_pointer] 						#LOAD GP0
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
LoadByte gp0 CLL.dontBreak 									#LOAD GP0 GLOBAL (CHAR)
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
AND gp0 gp1
NOT gp0
if gp0 then Load PC loopbytecodeInterp-0exit 								#WHILE LOOP
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.reference [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Local.opType [Stack_pointer] 						#STORE GP0
Load gp1 Local.opType [Stack_pointer] 						#LOAD GP0
Load gp0 @1
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifbytecodeInterp-4true 									#IF ELSE STATEMENT
Load gp1 Local.opType [Stack_pointer] 						#LOAD GP0
Load gp0 @2
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifbytecodeInterp-3true 									#IF ELSE STATEMENT
Load gp1 Local.opType [Stack_pointer] 						#LOAD GP0
Load gp0 @5
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifbytecodeInterp-2true 									#IF ELSE STATEMENT
Load gp1 Local.opType [Stack_pointer] 						#LOAD GP0
Load gp0 @6
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifbytecodeInterp-1true 									#IF ELSE STATEMENT
Load gp0 CLL.string46 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 Local.opType [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:print_i 												#CALLING print_i
Load gp0 @0
AND gp0 @255 													  #CASTING INT TO CHAR
StoreByte gp0 CLL.dontBreak 									#STORE GP0 GLOBAL (CHAR)
Load PC ifbytecodeInterp-1endif
Pass 										%ifbytecodeInterp-1true
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.reference [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:executePrimitive 												#CALLING executePrimitive
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.reference [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Local.reference [Stack_pointer] 						#STORE GP0
Pass 										%ifbytecodeInterp-1endif           
Load PC ifbytecodeInterp-2endif
Pass 										%ifbytecodeInterp-2true
Goto function:Pop 												#CALLING Pop
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.branchIfTrue [Stack_pointer] 						#STORE GP0
Load gp0 Local.branchIfTrue [Stack_pointer] 						#LOAD GP0
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
if gp0 then Load PC ifbytecodeInterp-0true 									#IF ELSE STATEMENT
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.reference [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load PC ifbytecodeInterp-0endif
Pass 										%ifbytecodeInterp-0true
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.reference [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Pass 										%ifbytecodeInterp-0endif           
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.reference [Stack_pointer] 						#STORE GP0
Pass 										%ifbytecodeInterp-2endif           
Load PC ifbytecodeInterp-3endif
Pass 										%ifbytecodeInterp-3true
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.reference [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:PushLit 												#CALLING PushLit
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.reference [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Local.reference [Stack_pointer] 						#STORE GP0
Pass 										%ifbytecodeInterp-3endif           
Load PC ifbytecodeInterp-4endif
Pass 										%ifbytecodeInterp-4true
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.reference [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Local.new_reference [Stack_pointer] 						#STORE GP0
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.new_reference [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:bytecodeInterp 												#CALLING bytecodeInterp
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.reference [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Local.reference [Stack_pointer] 						#STORE GP0
Pass 										%ifbytecodeInterp-4endif           
Load PC loopbytecodeInterp-0entry					%loopbytecodeInterp-0continue
Pass 										%loopbytecodeInterp-0exit
LoadByte gp0 CLL.dontBreak 									#LOAD GP0 GLOBAL (CHAR)
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifbytecodeInterp-5endif
Load gp0 Local.currentFSP [Stack_pointer] 						#LOAD GP0
Store gp0 CLL.ForthStackPointer 										#STORE GP0 GLOBAL
Pass										%ifbytecodeInterp-5endif
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
#########################################################################################################################
																	Scope createTryInt
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:createTryInt
SUB Stack_pointer @8 									#OVERHEAD FOR FUNCTION createTryInt
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION createTryInt
Load gp0 CLL.string189 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @6
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @32
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @5
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @6
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @33
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Load gp0 @2
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @69
AND gp0 @255 													  #CASTING INT TO CHAR
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @6
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @35
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @2
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @82
AND gp0 @255 													  #CASTING INT TO CHAR
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @6
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @35
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @2
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @82
AND gp0 @255 													  #CASTING INT TO CHAR
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @6
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @35
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @2
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @79
AND gp0 @255 													  #CASTING INT TO CHAR
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @6
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @35
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @2
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @82
AND gp0 @255 													  #CASTING INT TO CHAR
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @6
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @35
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @2
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @58
AND gp0 @255 													  #CASTING INT TO CHAR
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @6
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @35
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @2
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @32
AND gp0 @255 													  #CASTING INT TO CHAR
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @6
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @35
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @2
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @85
AND gp0 @255 													  #CASTING INT TO CHAR
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @6
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @35
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @2
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @78
AND gp0 @255 													  #CASTING INT TO CHAR
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @6
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @35
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @2
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @82
AND gp0 @255 													  #CASTING INT TO CHAR
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @6
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @35
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @2
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @69
AND gp0 @255 													  #CASTING INT TO CHAR
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @6
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @35
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @2
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @67
AND gp0 @255 													  #CASTING INT TO CHAR
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @6
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @35
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @2
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @79
AND gp0 @255 													  #CASTING INT TO CHAR
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @6
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @35
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @2
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @71
AND gp0 @255 													  #CASTING INT TO CHAR
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @6
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @35
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @2
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @78
AND gp0 @255 													  #CASTING INT TO CHAR
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @6
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @35
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @2
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @73
AND gp0 @255 													  #CASTING INT TO CHAR
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @6
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @35
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @2
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @83
AND gp0 @255 													  #CASTING INT TO CHAR
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @6
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @35
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @2
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @69
AND gp0 @255 													  #CASTING INT TO CHAR
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @6
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @35
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @2
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @68
AND gp0 @255 													  #CASTING INT TO CHAR
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @6
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @35
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @2
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @32
AND gp0 @255 													  #CASTING INT TO CHAR
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @6
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @35
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @2
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @87
AND gp0 @255 													  #CASTING INT TO CHAR
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @6
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @35
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @2
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @79
AND gp0 @255 													  #CASTING INT TO CHAR
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @6
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @35
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @2
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @82
AND gp0 @255 													  #CASTING INT TO CHAR
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @6
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @35
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @2
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @68
AND gp0 @255 													  #CASTING INT TO CHAR
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @6
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @35
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @2
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @58
AND gp0 @255 													  #CASTING INT TO CHAR
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @6
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @35
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @2
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @32
AND gp0 @255 													  #CASTING INT TO CHAR
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @6
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @35
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @2
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @34
AND gp0 @255 													  #CASTING INT TO CHAR
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @6
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @35
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @6
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @34
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @2
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @34
AND gp0 @255 													  #CASTING INT TO CHAR
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @6
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @35
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @2
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @10
AND gp0 @255 													  #CASTING INT TO CHAR
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
ADD gp0 gp1 														#ADD
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @6
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @35
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:addToDict 												#CALLING addToDict
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
#########################################################################################################################
																	Scope halt
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:halt
SUB Stack_pointer @8 									#OVERHEAD FOR FUNCTION halt
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION halt
Goto function:quit 												#CALLING quit
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
#########################################################################################################################
																	Scope printStack
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
def Local.i 8
def @Local.i @8
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:printStack
SUB Stack_pointer @12 									#OVERHEAD FOR FUNCTION printStack
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION printStack
Load gp0 @0
Store gp0 Local.i [Stack_pointer] 						#STORE GP0
Pass 										%loopprintStack-0entry 		#FOR LOOP
Load gp1 Local.i [Stack_pointer] 						#LOAD GP0
Load gp0 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
NOT gp0
if gp0 then Load PC loopprintStack-0exit
Load gp6 Local.i [Stack_pointer] 						#LOAD GP0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 CLL.ForthStack 											#LOAD GP0 GLOBAL RELATIVE
Load gp0 0 [gp6]									
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:print_h 												#CALLING print_h
Load gp0 CLL.string20 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Pass 										%loopprintStack-0continue
Load gp1 Local.i [Stack_pointer] 						#LOAD GP0
Load gp0 @1
ADD gp0 gp1 														#ADD
Store gp0 Local.i [Stack_pointer] 						#STORE GP0
Load PC loopprintStack-0entry
Pass 										%loopprintStack-0exit
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
#########################################################################################################################
																	Scope __isAllocated
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
def Local.right_child 16
def @Local.right_child @16
def Local.parent_size 20
def @Local.parent_size @20
def Local.parent_allocate 8
def @Local.parent_allocate @8
def Local.child_size 12
def @Local.child_size @12
def Local.address 28
def @Local.address @28
def Local.left_child 24
def @Local.left_child @24
def Local.parent_node 32
def @Local.parent_node @32
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:__isAllocated
SUB Stack_pointer @36 									#OVERHEAD FOR FUNCTION __isAllocated
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION __isAllocated
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.parent_node [Stack_pointer] 						#STORE GP0
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.address [Stack_pointer] 						#STORE GP0
Load gp6 @3
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.parent_node [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Local.parent_size [Stack_pointer] 						#STORE GP0
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.parent_node [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Local.parent_allocate [Stack_pointer] 						#STORE GP0
Load gp0 Local.parent_size [Stack_pointer] 						#LOAD GP0
Load gp1 @2
DIV gp0 gp1 														#DIVIDE
if DivByZero then Load PC DIV_BY_ZERO
Store gp0 Local.child_size [Stack_pointer] 						#STORE GP0
Load gp6 @4
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.parent_node [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Local.left_child [Stack_pointer] 						#STORE GP0
Load gp6 @5
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.parent_node [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Local.right_child [Stack_pointer] 						#STORE GP0
Load gp0 Local.address [Stack_pointer] 						#LOAD GP0
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.parent_node [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Load gp2 @4294967295  												#COMPARE (NOT LESS)
Compare gp1 gp0
if Less then Move Zero gp2
Move gp2 gp0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 Local.address [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.parent_node [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp1 Local.parent_size [Stack_pointer] 						#LOAD GP0
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
if gp0 then Load PC if__isAllocated-3true 									#IF ELSE STATEMENT
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Load PC if__isAllocated-3endif
Pass 										%if__isAllocated-3true
Load gp1 Local.left_child [Stack_pointer] 						#LOAD GP0
Load gp0 @0
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC if__isAllocated-1endif
Load gp0 Local.address [Stack_pointer] 						#LOAD GP0
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.parent_node [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC if__isAllocated-0true 									#IF ELSE STATEMENT
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Load PC if__isAllocated-0endif
Pass 										%if__isAllocated-0true
Load gp0 @1
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Pass 										%if__isAllocated-0endif           
Pass										%if__isAllocated-1endif
Load gp0 Local.address [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.parent_node [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp1 Local.child_size [Stack_pointer] 						#LOAD GP0
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
if gp0 then Load PC if__isAllocated-2true 									#IF ELSE STATEMENT
Load gp0 Local.address [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 Local.right_child [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:__dalloc 												#CALLING __dalloc
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Load PC if__isAllocated-2endif
Pass 										%if__isAllocated-2true
Load gp0 Local.address [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 Local.left_child [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:__isAllocated 												#CALLING __isAllocated
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Pass 										%if__isAllocated-2endif           
Pass 										%if__isAllocated-3endif           
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
#########################################################################################################################
																	Scope malloc
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
def Local.return_value 8
def @Local.return_value @8
def Local.size 12
def @Local.size @12
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:malloc
SUB Stack_pointer @16 									#OVERHEAD FOR FUNCTION malloc
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION malloc
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.size [Stack_pointer] 						#STORE GP0
Load gp0 Local.size [Stack_pointer] 						#LOAD GP0
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifmalloc-0endif
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Pass										%ifmalloc-0endif
Load gp0 CLL.MALLOC_TREE 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 Local.size [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:__malloc 												#CALLING __malloc
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.return_value [Stack_pointer] 						#STORE GP0
Load gp0 Local.return_value [Stack_pointer] 						#LOAD GP0
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
Load gp0 Local.return_value [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
#########################################################################################################################
																	Scope compileStringPrint
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
def Local.newChar 8
def @Local.newChar @8
def Local.prev 9
def @Local.prev @9
def Local.retArray 13
def @Local.retArray @13
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:compileStringPrint
SUB Stack_pointer @17 									#OVERHEAD FOR FUNCTION compileStringPrint
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION compileStringPrint
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.retArray [Stack_pointer] 						#STORE GP0
Load gp0 @6
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @36
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.prev [Stack_pointer] 						#STORE GP0
Load gp0 Local.prev [Stack_pointer] 						#LOAD GP0
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Pass 										%loopcompileStringPrint-0entry
Load gp0 @1
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0
if gp0 then Load PC loopcompileStringPrint-0exit 								#WHILE LOOP
Goto function:readStringChar 												#CALLING readStringChar
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
StoreByte gp0 Local.newChar [Stack_pointer] 					#STORE GP0 (CHAR)
LoadByte gp0 Local.newChar [Stack_pointer] 					#LOAD GP0 (CHAR)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @34
AND gp0 @255 													  #CASTING INT TO CHAR
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifcompileStringPrint-0endif
Load gp0 Local.prev [Stack_pointer] 						#LOAD GP0
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Pass										%ifcompileStringPrint-0endif
LoadByte gp0 Local.newChar [Stack_pointer] 					#LOAD GP0 (CHAR)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @92
AND gp0 @255 													  #CASTING INT TO CHAR
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifcompileStringPrint-1endif
Goto function:readStringChar 												#CALLING readStringChar
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
StoreByte gp0 Local.newChar [Stack_pointer] 					#STORE GP0 (CHAR)
Pass										%ifcompileStringPrint-1endif
Load gp0 @2
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
LoadByte gp0 Local.newChar [Stack_pointer] 					#LOAD GP0 (CHAR)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @6
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @35
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.prev [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.prev [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Local.prev [Stack_pointer] 						#STORE GP0
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.prev [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Local.prev [Stack_pointer] 						#STORE GP0
Load PC loopcompileStringPrint-0entry					%loopcompileStringPrint-0continue
Pass 										%loopcompileStringPrint-0exit
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
#########################################################################################################################
																	Scope isAllocated
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
def Local.address 8
def @Local.address @8
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:isAllocated
SUB Stack_pointer @12 									#OVERHEAD FOR FUNCTION isAllocated
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION isAllocated
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.address [Stack_pointer] 						#STORE GP0
Load gp0 Local.address [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 CLL.MALLOC_TREE 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:__isAllocated 												#CALLING __isAllocated
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
#########################################################################################################################
																	Scope primDalloc
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:primDalloc
SUB Stack_pointer @8 									#OVERHEAD FOR FUNCTION primDalloc
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION primDalloc
Load gp0 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp1 @1
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Store gp0 CLL.ForthStackPointer 										#STORE GP0 GLOBAL
Load gp6 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 CLL.ForthStack 											#LOAD GP0 GLOBAL RELATIVE
Load gp0 0 [gp6]									
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:dalloc 												#CALLING dalloc
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
#########################################################################################################################
																	Scope Swap
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
def Local.temp 8
def @Local.temp @8
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:Swap
SUB Stack_pointer @12 									#OVERHEAD FOR FUNCTION Swap
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION Swap
Load gp1 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp0 @1
Move Zero gp2 														#COMPARE (IS GREATER)
Compare gp1 gp0
if Greater then Load gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifSwap-0true 									#IF ELSE STATEMENT
Load gp0 CLL.string25 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 @0
AND gp0 @255 													  #CASTING INT TO CHAR
StoreByte gp0 CLL.dontBreak 									#STORE GP0 GLOBAL (CHAR)
Load PC ifSwap-0endif
Pass 										%ifSwap-0true
Load gp0 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp1 @2
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Move gp0 gp6 						#PUSH gp0 POP gp6
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 CLL.ForthStack 											#LOAD GP0 GLOBAL RELATIVE
Load gp0 0 [gp6]									
Store gp0 Local.temp [Stack_pointer] 						#STORE GP0
Load gp0 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp1 @1
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Move gp0 gp6 						#PUSH gp0 POP gp6
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 CLL.ForthStack 											#LOAD GP0 GLOBAL RELATIVE
Load gp0 0 [gp6]									
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp1 @2
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Move gp0 gp6 						#PUSH gp0 POP gp6
MUL gp6 @4 														   #INDEXING FOR @INT
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
ADD gp6 CLL.ForthStack 											#STORE GP0 GLOBAL RELATIVE
Store gp0 0 [gp6]
Load gp0 Local.temp [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp1 @1
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Move gp0 gp6 						#PUSH gp0 POP gp6
MUL gp6 @4 														   #INDEXING FOR @INT
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
ADD gp6 CLL.ForthStack 											#STORE GP0 GLOBAL RELATIVE
Store gp0 0 [gp6]
Pass 										%ifSwap-0endif           
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
#########################################################################################################################
																	Scope DIV
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:DIV
SUB Stack_pointer @8 									#OVERHEAD FOR FUNCTION DIV
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION DIV
Load gp1 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp0 @2
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifDIV-0endif
Load gp0 CLL.string32 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 @0
AND gp0 @255 													  #CASTING INT TO CHAR
StoreByte gp0 CLL.dontBreak 									#STORE GP0 GLOBAL (CHAR)
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Pass										%ifDIV-0endif
Load gp0 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp1 @1
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Store gp0 CLL.ForthStackPointer 										#STORE GP0 GLOBAL
Load gp0 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp1 @1
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Move gp0 gp6 						#PUSH gp0 POP gp6
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 CLL.ForthStack 											#LOAD GP0 GLOBAL RELATIVE
Load gp0 0 [gp6]									
Load gp6 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 CLL.ForthStack 											#LOAD GP0 GLOBAL RELATIVE
Load gp1 0 [gp6]									
DIV gp0 gp1 														#DIVIDE
if DivByZero then Load PC DIV_BY_ZERO
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp1 @1
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Move gp0 gp6 						#PUSH gp0 POP gp6
MUL gp6 @4 														   #INDEXING FOR @INT
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
ADD gp6 CLL.ForthStack 											#STORE GP0 GLOBAL RELATIVE
Store gp0 0 [gp6]
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
#########################################################################################################################
																	Scope greater
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
def Local.a 8
def @Local.a @8
def Local.b 12
def @Local.b @12
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:greater
SUB Stack_pointer @16 									#OVERHEAD FOR FUNCTION greater
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION greater
Load gp1 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp0 @2
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifgreater-0endif
Load gp0 CLL.string43 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 @0
AND gp0 @255 													  #CASTING INT TO CHAR
StoreByte gp0 CLL.dontBreak 									#STORE GP0 GLOBAL (CHAR)
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Pass										%ifgreater-0endif
Load gp0 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp1 @1
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Store gp0 CLL.ForthStackPointer 										#STORE GP0 GLOBAL
Load gp0 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp1 @1
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Move gp0 gp6 						#PUSH gp0 POP gp6
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 CLL.ForthStack 											#LOAD GP0 GLOBAL RELATIVE
Load gp0 0 [gp6]									
Store gp0 Local.a [Stack_pointer] 						#STORE GP0
Load gp6 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 CLL.ForthStack 											#LOAD GP0 GLOBAL RELATIVE
Load gp0 0 [gp6]									
Store gp0 Local.b [Stack_pointer] 						#STORE GP0
Load gp1 Local.a [Stack_pointer] 						#LOAD GP0
Load gp0 @2147483648
AND gp0 gp1 														#AND
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp1 Local.b [Stack_pointer] 						#LOAD GP0
Load gp0 @2147483648
AND gp0 gp1 														#AND
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
AND gp0 gp1
if gp0 then Load PC ifgreater-3true 									#IF ELSE STATEMENT
Load gp1 Local.a [Stack_pointer] 						#LOAD GP0
Load gp0 @2147483648
AND gp0 gp1 														#AND
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
if gp0 then Load PC ifgreater-2true 									#IF ELSE STATEMENT
Load gp1 Local.b [Stack_pointer] 						#LOAD GP0
Load gp0 @2147483648
AND gp0 gp1 														#AND
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
if gp0 then Load PC ifgreater-1true 									#IF ELSE STATEMENT
Load gp0 Local.a [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 Local.b [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:__greater 												#CALLING __greater
Load gp0 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp1 @1
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Move gp0 gp6 						#PUSH gp0 POP gp6
MUL gp6 @4 														   #INDEXING FOR @INT
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
ADD gp6 CLL.ForthStack 											#STORE GP0 GLOBAL RELATIVE
Store gp0 0 [gp6]
Load PC ifgreater-1endif
Pass 										%ifgreater-1true
Load gp0 @1
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp1 @1
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Move gp0 gp6 						#PUSH gp0 POP gp6
MUL gp6 @4 														   #INDEXING FOR @INT
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
ADD gp6 CLL.ForthStack 											#STORE GP0 GLOBAL RELATIVE
Store gp0 0 [gp6]
Pass 										%ifgreater-1endif           
Load PC ifgreater-2endif
Pass 										%ifgreater-2true
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp1 @1
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Move gp0 gp6 						#PUSH gp0 POP gp6
MUL gp6 @4 														   #INDEXING FOR @INT
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
ADD gp6 CLL.ForthStack 											#STORE GP0 GLOBAL RELATIVE
Store gp0 0 [gp6]
Pass 										%ifgreater-2endif           
Load PC ifgreater-3endif
Pass 										%ifgreater-3true
Load gp0 Local.a [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 Local.b [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:__greater 												#CALLING __greater
Load gp0 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp1 @1
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Move gp0 gp6 						#PUSH gp0 POP gp6
MUL gp6 @4 														   #INDEXING FOR @INT
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
ADD gp6 CLL.ForthStack 											#STORE GP0 GLOBAL RELATIVE
Store gp0 0 [gp6]
Pass 										%ifgreater-3endif           
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
#########################################################################################################################
																	Scope readC
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:readC
SUB Stack_pointer @8 									#OVERHEAD FOR FUNCTION readC
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION readC
Goto function:readStringChar 												#CALLING readStringChar
Goto function:Push 												#CALLING Push
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
#########################################################################################################################
																	Scope isInt
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
def Local.i 8
def @Local.i @8
def Local.digCount 12
def @Local.digCount @12
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:isInt
SUB Stack_pointer @16 									#OVERHEAD FOR FUNCTION isInt
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION isInt
Load gp0 @0
Store gp0 Local.i [Stack_pointer] 						#STORE GP0
Load gp0 @0
Store gp0 Local.digCount [Stack_pointer] 						#STORE GP0
Pass 										%loopisInt-0entry
Load gp6 Local.i [Stack_pointer] 						#LOAD GP0
ADD gp6 CLL.WORD_BUF 											#LOAD GP0 GLOBAL RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0
if gp0 then Load PC loopisInt-0exit 								#WHILE LOOP
Load gp6 Local.i [Stack_pointer] 						#LOAD GP0
ADD gp6 CLL.WORD_BUF 											#LOAD GP0 GLOBAL RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @48
AND gp0 @255 													  #CASTING INT TO CHAR
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
Load gp6 Local.i [Stack_pointer] 						#LOAD GP0
ADD gp6 CLL.WORD_BUF 											#LOAD GP0 GLOBAL RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @57
AND gp0 @255 													  #CASTING INT TO CHAR
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
Load gp2 @4294967295 												#COMPARE (NOT GREATER)
Compare gp1 gp0
if Greater then Move Zero gp2
Move gp2 gp0
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
AND gp0 gp1
NOT gp0 														
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifisInt-1endif
Load gp1 Local.i [Stack_pointer] 						#LOAD GP0
Load gp0 @0
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp6 Local.i [Stack_pointer] 						#LOAD GP0
ADD gp6 CLL.WORD_BUF 											#LOAD GP0 GLOBAL RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @45
AND gp0 @255 													  #CASTING INT TO CHAR
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
AND gp0 gp1
NOT gp0 														
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifisInt-0endif
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Pass										%ifisInt-0endif
Pass										%ifisInt-1endif
Load gp6 Local.i [Stack_pointer] 						#LOAD GP0
ADD gp6 CLL.WORD_BUF 											#LOAD GP0 GLOBAL RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @45
AND gp0 @255 													  #CASTING INT TO CHAR
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifisInt-2endif
Load gp1 Local.digCount [Stack_pointer] 						#LOAD GP0
Load gp0 @1
ADD gp0 gp1 														#ADD
Store gp0 Local.digCount [Stack_pointer] 						#STORE GP0
Pass										%ifisInt-2endif
Load gp1 Local.i [Stack_pointer] 						#LOAD GP0
Load gp0 @1
ADD gp0 gp1 														#ADD
Store gp0 Local.i [Stack_pointer] 						#STORE GP0
Load PC loopisInt-0entry					%loopisInt-0continue
Pass 										%loopisInt-0exit
Load gp0 Local.digCount [Stack_pointer] 						#LOAD GP0
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
if gp0 then Load PC ifisInt-3true 									#IF ELSE STATEMENT
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Load PC ifisInt-3endif
Pass 										%ifisInt-3true
Load gp0 @1
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Pass 										%ifisInt-3endif           
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC

##################### built in function getc ###############################################
#returns a char
In gp0 %function:getc #gets a char without waiting (state of keyboard)
Store gp0 Expression_stack [gp7]
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Move Jump PC
##########################################################################
#########################################################################################################################
																	Scope NAND
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:NAND
SUB Stack_pointer @8 									#OVERHEAD FOR FUNCTION NAND
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION NAND
Load gp1 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp0 @2
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifNAND-0endif
Load gp0 CLL.string38 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 @0
AND gp0 @255 													  #CASTING INT TO CHAR
StoreByte gp0 CLL.dontBreak 									#STORE GP0 GLOBAL (CHAR)
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Pass										%ifNAND-0endif
Load gp0 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp1 @1
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Store gp0 CLL.ForthStackPointer 										#STORE GP0 GLOBAL
Load gp0 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp1 @1
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Move gp0 gp6 						#PUSH gp0 POP gp6
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 CLL.ForthStack 											#LOAD GP0 GLOBAL RELATIVE
Load gp0 0 [gp6]									
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp6 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 CLL.ForthStack 											#LOAD GP0 GLOBAL RELATIVE
Load gp0 0 [gp6]									
AND gp0 gp1 														#AND
NOT gp0 															#NOT
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp1 @1
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Move gp0 gp6 						#PUSH gp0 POP gp6
MUL gp6 @4 														   #INDEXING FOR @INT
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
ADD gp6 CLL.ForthStack 											#STORE GP0 GLOBAL RELATIVE
Store gp0 0 [gp6]
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
#########################################################################################################################
																	Scope scrollLine
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
def Local.thisChar 8
def @Local.thisChar @8
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:scrollLine
SUB Stack_pointer @9 									#OVERHEAD FOR FUNCTION scrollLine
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION scrollLine
Goto function:backChar 												#CALLING backChar
Goto function:readStringChar 												#CALLING readStringChar
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
StoreByte gp0 Local.thisChar [Stack_pointer] 					#STORE GP0 (CHAR)
Pass 										%loopscrollLine-0entry 		#FOR LOOP
Load gp0 @1
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0
if gp0 then Load PC loopscrollLine-0exit
LoadByte gp0 Local.thisChar [Stack_pointer] 					#LOAD GP0 (CHAR)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:isEOLChar 												#CALLING isEOLChar
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifscrollLine-0endif
Load PC loopscrollLine-0exit
Pass										%ifscrollLine-0endif
Pass 										%loopscrollLine-0continue
Goto function:readStringChar 												#CALLING readStringChar
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
StoreByte gp0 Local.thisChar [Stack_pointer] 					#STORE GP0 (CHAR)
Load PC loopscrollLine-0entry
Pass 										%loopscrollLine-0exit
Goto function:backChar 												#CALLING backChar
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC

############################## built in function getw ################################
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
#########################################################################################################################
																	Scope compileSingleWord
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
def Local.placeholderNode 8
def @Local.placeholderNode @8
def Local.dictEntry 12
def @Local.dictEntry @12
def Local.reference 16
def @Local.reference @16
def Local.ifRetArray 28
def @Local.ifRetArray @28
def Local.referenceNode 24
def @Local.referenceNode @24
def Local.bottom 20
def @Local.bottom @20
def Local.Array_ofwhileRetArray 32
def @Local.Array_ofwhileRetArray @32
def Local.elseRetArray 44
def @Local.elseRetArray @44
def Local.retArray 48
def @Local.retArray @48
def Local.whileRetArray 52
def @Local.whileRetArray @52
def Local.Array_ofifRetArray 56
def @Local.Array_ofifRetArray @56
def Local.Array_ofelseRetArray 68
def @Local.Array_ofelseRetArray @68
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:compileSingleWord
SUB Stack_pointer @80 									#OVERHEAD FOR FUNCTION compileSingleWord
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION compileSingleWord
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.retArray [Stack_pointer] 						#STORE GP0
Load gp0 @0
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Goto function:primRead 												#CALLING primRead
Pass 										%loopcompileSingleWord-1entry
Load gp0 CLL.WORD_BUF 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 CLL.string49 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:checkDictName 												#CALLING checkDictName
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 CLL.WORD_BUF 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 CLL.string50 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:checkDictName 												#CALLING checkDictName
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
OR gp0 gp1
NOT gp0
if gp0 then Load PC loopcompileSingleWord-1exit 								#WHILE LOOP
Load gp0 CLL.WORD_BUF 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 CLL.string51 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:checkDictName 												#CALLING checkDictName
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifcompileSingleWord-4endif
Pass 										%loopcompileSingleWord-0entry
Load gp0 @1
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0
if gp0 then Load PC loopcompileSingleWord-0exit 								#WHILE LOOP
Goto function:primRead 												#CALLING primRead
Load gp0 CLL.WORD_BUF 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 CLL.string52 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:checkDictName 												#CALLING checkDictName
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifcompileSingleWord-0endif
Load PC loopcompileSingleWord-0exit
Pass										%ifcompileSingleWord-0endif
Load gp0 CLL.WORD_BUF 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 CLL.ForthDictHead 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:isInDict 												#CALLING isInDict
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.dictEntry [Stack_pointer] 						#STORE GP0
Load gp0 Local.dictEntry [Stack_pointer] 						#LOAD GP0
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														
if gp0 then Load PC ifcompileSingleWord-2true 									#IF ELSE STATEMENT
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.dictEntry [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:bytecodeInterp 												#CALLING bytecodeInterp
Load PC ifcompileSingleWord-2endif
Pass 										%ifcompileSingleWord-2true
Goto function:isInt 												#CALLING isInt
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
if gp0 then Load PC ifcompileSingleWord-1true 									#IF ELSE STATEMENT
Load gp0 CLL.string53 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 CLL.WORD_BUF 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 CLL.string54 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 @0
AND gp0 @255 													  #CASTING INT TO CHAR
StoreByte gp0 CLL.dontBreak 									#STORE GP0 GLOBAL (CHAR)
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Load PC ifcompileSingleWord-1endif
Pass 										%ifcompileSingleWord-1true
Goto function:convertInt 												#CALLING convertInt
Goto function:Push 												#CALLING Push
Pass 										%ifcompileSingleWord-1endif           
Pass 										%ifcompileSingleWord-2endif           
LoadByte gp0 CLL.dontBreak 									#LOAD GP0 GLOBAL (CHAR)
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @0
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifcompileSingleWord-3endif
Load gp0 CLL.string55 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Pass										%ifcompileSingleWord-3endif
Load PC loopcompileSingleWord-0entry					%loopcompileSingleWord-0continue
Pass 										%loopcompileSingleWord-0exit
Goto function:primRead 												#CALLING primRead
Pass										%ifcompileSingleWord-4endif
Load gp0 CLL.WORD_BUF 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 CLL.string56 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:checkDictName 												#CALLING checkDictName
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifcompileSingleWord-5endif
Goto function:comment 												#CALLING comment
Goto function:primRead 												#CALLING primRead
Pass										%ifcompileSingleWord-5endif
Load PC loopcompileSingleWord-1entry					%loopcompileSingleWord-1continue
Pass 										%loopcompileSingleWord-1exit
Load gp0 CLL.WORD_BUF 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 CLL.string57 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:checkDictName 												#CALLING checkDictName
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
if gp0 then Load PC ifcompileSingleWord-29true 									#IF ELSE STATEMENT
Load gp0 CLL.WORD_BUF 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 CLL.string58 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:checkDictName 												#CALLING checkDictName
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
if gp0 then Load PC ifcompileSingleWord-28true 									#IF ELSE STATEMENT
Load gp0 CLL.WORD_BUF 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 CLL.string63 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:checkDictName 												#CALLING checkDictName
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
if gp0 then Load PC ifcompileSingleWord-27true 									#IF ELSE STATEMENT
Load gp0 CLL.WORD_BUF 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 CLL.string69 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:checkDictName 												#CALLING checkDictName
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
if gp0 then Load PC ifcompileSingleWord-26true 									#IF ELSE STATEMENT
Load gp0 CLL.WORD_BUF 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 CLL.string72 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:checkDictName 												#CALLING checkDictName
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
if gp0 then Load PC ifcompileSingleWord-25true 									#IF ELSE STATEMENT
Goto function:isInt 												#CALLING isInt
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
if gp0 then Load PC ifcompileSingleWord-24true 									#IF ELSE STATEMENT
Load gp0 CLL.WORD_BUF 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 CLL.ForthDictHead 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:isInDict 												#CALLING isInDict
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.reference [Stack_pointer] 						#STORE GP0
Load gp0 Local.reference [Stack_pointer] 						#LOAD GP0
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
if gp0 then Load PC ifcompileSingleWord-23true 									#IF ELSE STATEMENT
Load gp0 CLL.string73 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 CLL.WORD_BUF 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 CLL.string74 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 @0
AND gp0 @255 													  #CASTING INT TO CHAR
StoreByte gp0 CLL.dontBreak 									#STORE GP0 GLOBAL (CHAR)
Load gp0 @1
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @1
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load PC ifcompileSingleWord-23endif
Pass 										%ifcompileSingleWord-23true
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.reference [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Local.referenceNode [Stack_pointer] 						#STORE GP0
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.referenceNode [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp1 0 [gp6]
Load gp0 @6
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.referenceNode [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp1 0 [gp6]
Load gp0 @2
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
OR gp0 gp1
if gp0 then Load PC ifcompileSingleWord-22true 									#IF ELSE STATEMENT
Load gp0 @1
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 Local.reference [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load PC ifcompileSingleWord-22endif
Pass 										%ifcompileSingleWord-22true
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.referenceNode [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp1 0 [gp6]
Load gp0 @0
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifcompileSingleWord-21true 									#IF ELSE STATEMENT
Load gp0 @1
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 Local.reference [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load PC ifcompileSingleWord-21endif
Pass 										%ifcompileSingleWord-21true
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.referenceNode [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.referenceNode [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.referenceNode [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Pass 										%ifcompileSingleWord-21endif           
Pass 										%ifcompileSingleWord-22endif           
Pass 										%ifcompileSingleWord-23endif           
Load PC ifcompileSingleWord-24endif
Pass 										%ifcompileSingleWord-24true
Load gp0 @2
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:convertInt 												#CALLING convertInt
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Pass 										%ifcompileSingleWord-24endif           
Load PC ifcompileSingleWord-25endif
Pass 										%ifcompileSingleWord-25true
Load gp0 Local.retArray [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:compileStringPrint 												#CALLING compileStringPrint
Pass 										%ifcompileSingleWord-25endif           
Load PC ifcompileSingleWord-26endif
Pass 										%ifcompileSingleWord-26true
Move Stack_pointer gp0 											#GETTING POINTER
ADD gp0 @Local.Array_ofwhileRetArray
Store gp0 Local.whileRetArray [Stack_pointer] 						#STORE GP0
Load gp0 Local.whileRetArray [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:compileWhileWord 												#CALLING compileWhileWord
LoadByte gp0 CLL.dontBreak 									#LOAD GP0 GLOBAL (CHAR)
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @0
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifcompileSingleWord-18endif
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Pass										%ifcompileSingleWord-18endif
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.whileRetArray [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp1 0 [gp6]
Load gp0 @2
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifcompileSingleWord-19endif
Load gp0 CLL.string70 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 @0
AND gp0 @255 													  #CASTING INT TO CHAR
StoreByte gp0 CLL.dontBreak 									#STORE GP0 GLOBAL (CHAR)
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Pass										%ifcompileSingleWord-19endif
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.whileRetArray [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp1 0 [gp6]
Load gp0 @0
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifcompileSingleWord-20true 									#IF ELSE STATEMENT
Load gp0 CLL.string71 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.whileRetArray [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:print_i 												#CALLING print_i
Load PC ifcompileSingleWord-20endif
Pass 										%ifcompileSingleWord-20true
Load gp0 @5
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.whileRetArray [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.whileRetArray [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Local.bottom [Stack_pointer] 						#STORE GP0
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.bottom [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Pass 										%ifcompileSingleWord-20endif           
Pass 										%ifcompileSingleWord-26endif           
Load PC ifcompileSingleWord-27endif
Pass 										%ifcompileSingleWord-27true
Move Stack_pointer gp0 											#GETTING POINTER
ADD gp0 @Local.Array_ofifRetArray
Store gp0 Local.ifRetArray [Stack_pointer] 						#STORE GP0
Load gp0 Local.ifRetArray [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:compileIfWord 												#CALLING compileIfWord
LoadByte gp0 CLL.dontBreak 									#LOAD GP0 GLOBAL (CHAR)
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @0
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifcompileSingleWord-10endif
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Pass										%ifcompileSingleWord-10endif
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.ifRetArray [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp1 0 [gp6]
Load gp0 @2
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifcompileSingleWord-11endif
Load gp0 CLL.string64 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 @0
AND gp0 @255 													  #CASTING INT TO CHAR
StoreByte gp0 CLL.dontBreak 									#STORE GP0 GLOBAL (CHAR)
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Pass										%ifcompileSingleWord-11endif
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.ifRetArray [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp1 0 [gp6]
Load gp0 @0
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifcompileSingleWord-17true 									#IF ELSE STATEMENT
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.ifRetArray [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp1 0 [gp6]
Load gp0 @1
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifcompileSingleWord-16true 									#IF ELSE STATEMENT
Load gp0 CLL.string68 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.ifRetArray [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:print_i 												#CALLING print_i
Load gp0 @0
AND gp0 @255 													  #CASTING INT TO CHAR
StoreByte gp0 CLL.dontBreak 									#STORE GP0 GLOBAL (CHAR)
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Load PC ifcompileSingleWord-16endif
Pass 										%ifcompileSingleWord-16true
Move Stack_pointer gp0 											#GETTING POINTER
ADD gp0 @Local.Array_ofelseRetArray
Store gp0 Local.elseRetArray [Stack_pointer] 						#STORE GP0
Load gp0 Local.elseRetArray [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:compileIfWord 												#CALLING compileIfWord
LoadByte gp0 CLL.dontBreak 									#LOAD GP0 GLOBAL (CHAR)
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @0
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifcompileSingleWord-12endif
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Pass										%ifcompileSingleWord-12endif
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.elseRetArray [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp1 0 [gp6]
Load gp0 @2
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifcompileSingleWord-13endif
Load gp0 CLL.string65 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 @0
AND gp0 @255 													  #CASTING INT TO CHAR
StoreByte gp0 CLL.dontBreak 									#STORE GP0 GLOBAL (CHAR)
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Pass										%ifcompileSingleWord-13endif
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.elseRetArray [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp1 0 [gp6]
Load gp0 @1
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifcompileSingleWord-14endif
Load gp0 CLL.string66 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 @0
AND gp0 @255 													  #CASTING INT TO CHAR
StoreByte gp0 CLL.dontBreak 									#STORE GP0 GLOBAL (CHAR)
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Pass										%ifcompileSingleWord-14endif
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.elseRetArray [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp1 0 [gp6]
Load gp0 @0
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifcompileSingleWord-15true 									#IF ELSE STATEMENT
Load gp0 CLL.string67 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.ifRetArray [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:print_i 												#CALLING print_i
Load gp0 @0
AND gp0 @255 													  #CASTING INT TO CHAR
StoreByte gp0 CLL.dontBreak 									#STORE GP0 GLOBAL (CHAR)
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Load PC ifcompileSingleWord-15endif
Pass 										%ifcompileSingleWord-15true
Load gp0 @5
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.ifRetArray [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.elseRetArray [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @6
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @36
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.placeholderNode [Stack_pointer] 						#STORE GP0
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.ifRetArray [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Local.bottom [Stack_pointer] 						#STORE GP0
Load gp0 Local.placeholderNode [Stack_pointer] 						#LOAD GP0
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.bottom [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.elseRetArray [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Local.bottom [Stack_pointer] 						#STORE GP0
Load gp0 Local.placeholderNode [Stack_pointer] 						#LOAD GP0
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.bottom [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 Local.placeholderNode [Stack_pointer] 						#LOAD GP0
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Pass 										%ifcompileSingleWord-15endif           
Pass 										%ifcompileSingleWord-16endif           
Load PC ifcompileSingleWord-17endif
Pass 										%ifcompileSingleWord-17true
Load gp0 @6
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @36
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.placeholderNode [Stack_pointer] 						#STORE GP0
Load gp0 @5
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.ifRetArray [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 Local.placeholderNode [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.ifRetArray [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Local.bottom [Stack_pointer] 						#STORE GP0
Load gp0 Local.placeholderNode [Stack_pointer] 						#LOAD GP0
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.bottom [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 Local.placeholderNode [Stack_pointer] 						#LOAD GP0
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Pass 										%ifcompileSingleWord-17endif           
Pass 										%ifcompileSingleWord-27endif           
Load PC ifcompileSingleWord-28endif
Pass 										%ifcompileSingleWord-28true
Pass 										%loopcompileSingleWord-2entry
Load gp0 @1
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0
if gp0 then Load PC loopcompileSingleWord-2exit 								#WHILE LOOP
Goto function:primRead 												#CALLING primRead
Load gp0 CLL.WORD_BUF 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 CLL.string59 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:checkDictName 												#CALLING checkDictName
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifcompileSingleWord-6endif
Load PC loopcompileSingleWord-2exit
Pass										%ifcompileSingleWord-6endif
Load gp0 CLL.WORD_BUF 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 CLL.ForthDictHead 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:isInDict 												#CALLING isInDict
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.dictEntry [Stack_pointer] 						#STORE GP0
Load gp0 Local.dictEntry [Stack_pointer] 						#LOAD GP0
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														
if gp0 then Load PC ifcompileSingleWord-8true 									#IF ELSE STATEMENT
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.dictEntry [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:bytecodeInterp 												#CALLING bytecodeInterp
Load PC ifcompileSingleWord-8endif
Pass 										%ifcompileSingleWord-8true
Goto function:isInt 												#CALLING isInt
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
if gp0 then Load PC ifcompileSingleWord-7true 									#IF ELSE STATEMENT
Load gp0 CLL.string60 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 CLL.WORD_BUF 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 CLL.string61 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 @0
AND gp0 @255 													  #CASTING INT TO CHAR
StoreByte gp0 CLL.dontBreak 									#STORE GP0 GLOBAL (CHAR)
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Load PC ifcompileSingleWord-7endif
Pass 										%ifcompileSingleWord-7true
Goto function:convertInt 												#CALLING convertInt
Goto function:Push 												#CALLING Push
Pass 										%ifcompileSingleWord-7endif           
Pass 										%ifcompileSingleWord-8endif           
LoadByte gp0 CLL.dontBreak 									#LOAD GP0 GLOBAL (CHAR)
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @0
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifcompileSingleWord-9endif
Load gp0 CLL.string62 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Pass										%ifcompileSingleWord-9endif
Load PC loopcompileSingleWord-2entry					%loopcompileSingleWord-2continue
Pass 										%loopcompileSingleWord-2exit
Load gp0 @2
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:Pop 												#CALLING Pop
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Pass 										%ifcompileSingleWord-28endif           
Load PC ifcompileSingleWord-29endif
Pass 										%ifcompileSingleWord-29true
Load gp0 @0
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @0
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @1
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.retArray [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Pass 										%ifcompileSingleWord-29endif           
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
#########################################################################################################################
																	Scope XOR
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:XOR
SUB Stack_pointer @8 									#OVERHEAD FOR FUNCTION XOR
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION XOR
Load gp1 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp0 @2
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifXOR-0endif
Load gp0 CLL.string36 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 @0
AND gp0 @255 													  #CASTING INT TO CHAR
StoreByte gp0 CLL.dontBreak 									#STORE GP0 GLOBAL (CHAR)
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Pass										%ifXOR-0endif
Load gp0 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp1 @1
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Store gp0 CLL.ForthStackPointer 										#STORE GP0 GLOBAL
Load gp0 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp1 @1
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Move gp0 gp6 						#PUSH gp0 POP gp6
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 CLL.ForthStack 											#LOAD GP0 GLOBAL RELATIVE
Load gp0 0 [gp6]									
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp6 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 CLL.ForthStack 											#LOAD GP0 GLOBAL RELATIVE
Load gp0 0 [gp6]									
XOR gp0 gp1 														#XOR
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp1 @1
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Move gp0 gp6 						#PUSH gp0 POP gp6
MUL gp6 @4 														   #INDEXING FOR @INT
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
ADD gp6 CLL.ForthStack 											#STORE GP0 GLOBAL RELATIVE
Store gp0 0 [gp6]
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
#########################################################################################################################
																	Scope Drop
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:Drop
SUB Stack_pointer @8 									#OVERHEAD FOR FUNCTION Drop
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION Drop
Load gp1 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp0 @0
Move Zero gp2 														#COMPARE (IS GREATER)
Compare gp1 gp0
if Greater then Load gp2 @4294967295
Move gp2 gp0
if gp0 then Load PC ifDrop-0true 									#IF ELSE STATEMENT
Load gp0 CLL.string24 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 @0
AND gp0 @255 													  #CASTING INT TO CHAR
StoreByte gp0 CLL.dontBreak 									#STORE GP0 GLOBAL (CHAR)
Load PC ifDrop-0endif
Pass 										%ifDrop-0true
Load gp0 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp1 @1
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Store gp0 CLL.ForthStackPointer 										#STORE GP0 GLOBAL
Pass 										%ifDrop-0endif           
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
#########################################################################################################################
																	Scope createInterp
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
def Local.first 8
def @Local.first @8
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:createInterp
SUB Stack_pointer @12 									#OVERHEAD FOR FUNCTION createInterp
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION createInterp
Load gp0 @6
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @28
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.first [Stack_pointer] 						#STORE GP0
Load gp0 @1
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 CLL.string192 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 CLL.ForthDictHead 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:isInDict 												#CALLING isInDict
Load gp0 Local.first [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.first [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 CLL.string193 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 Local.first [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:addToDict 												#CALLING addToDict
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC

Halt %function:quit
#########################################################################################################################
																	Scope newDictInst
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
def Local.i 8
def @Local.i @8
def Local.returnPTR 12
def @Local.returnPTR @12
def Local.name_pointer 16
def @Local.name_pointer @16
def Local.codePtr 20
def @Local.codePtr @20
def Local.name 24
def @Local.name @24
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:newDictInst
SUB Stack_pointer @28 									#OVERHEAD FOR FUNCTION newDictInst
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION newDictInst
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.codePtr [Stack_pointer] 						#STORE GP0
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.name [Stack_pointer] 						#STORE GP0
Load gp0 @4
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:malloc 												#CALLING malloc
SUB gp7 @4 															#POP GP0
Load gp0 Expression_stack [gp7]
Store gp0 Local.returnPTR [Stack_pointer] 						#STORE GP0
Load gp0 Local.returnPTR [Stack_pointer] 						#LOAD GP0
Store gp0 Local.name_pointer [Stack_pointer] 						#STORE GP0
Load gp0 @0
Store gp0 Local.i [Stack_pointer] 						#STORE GP0
Pass 										%loopnewDictInst-0entry
Load gp1 Local.i [Stack_pointer] 						#LOAD GP0
Load gp0 @8
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
NOT gp0
if gp0 then Load PC loopnewDictInst-0exit 								#WHILE LOOP
Load gp6 Local.i [Stack_pointer] 						#LOAD GP0
ADD gp6 Local.name [Stack_pointer]							#LOAD GP0 RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
if gp0 then Load PC ifnewDictInst-0true 									#IF ELSE STATEMENT
Load PC loopnewDictInst-0exit
Load PC ifnewDictInst-0endif
Pass 										%ifnewDictInst-0true
Load gp6 Local.i [Stack_pointer] 						#LOAD GP0
ADD gp6 Local.name [Stack_pointer]							#LOAD GP0 RELATIVE (CHAR)
LoadByte gp0 0 [gp6]
Load gp6 Local.i [Stack_pointer] 						#LOAD GP0
ADD gp6 Local.name_pointer [Stack_pointer] 							#STORE GP0 RELATIVE (CHAR)
StoreByte gp0 0 [gp6]
Pass 										%ifnewDictInst-0endif           
Load gp1 Local.i [Stack_pointer] 						#LOAD GP0
Load gp0 @1
ADD gp0 gp1 														#ADD
Store gp0 Local.i [Stack_pointer] 						#STORE GP0
Load PC loopnewDictInst-0entry					%loopnewDictInst-0continue
Pass 										%loopnewDictInst-0exit
Pass 										%loopnewDictInst-1entry
Load gp1 Local.i [Stack_pointer] 						#LOAD GP0
Load gp0 @8
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
NOT gp0
if gp0 then Load PC loopnewDictInst-1exit 								#WHILE LOOP
Load gp0 @0
AND gp0 @255 													  #CASTING INT TO CHAR
Load gp6 Local.i [Stack_pointer] 						#LOAD GP0
ADD gp6 Local.name_pointer [Stack_pointer] 							#STORE GP0 RELATIVE (CHAR)
StoreByte gp0 0 [gp6]
Load gp1 Local.i [Stack_pointer] 						#LOAD GP0
Load gp0 @1
ADD gp0 gp1 														#ADD
Store gp0 Local.i [Stack_pointer] 						#STORE GP0
Load PC loopnewDictInst-1entry					%loopnewDictInst-1continue
Pass 										%loopnewDictInst-1exit
Load gp0 Local.codePtr [Stack_pointer] 						#LOAD GP0
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.returnPTR [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 @0
Load gp6 @3
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.returnPTR [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp0 Local.returnPTR [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
#########################################################################################################################
																	Scope compileWord
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
def Local.last 8
def @Local.last @8
def Local.name 12
def @Local.name @12
def Local.Array_oftop 16
def @Local.Array_oftop @16
def Local.top 28
def @Local.top @28
def Local.Array_ofname 32
def @Local.Array_ofname @32
def Local.Array_ofnewWord 41
def @Local.Array_ofnewWord @41
def Local.newWord 53
def @Local.newWord @53
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:compileWord
SUB Stack_pointer @57 									#OVERHEAD FOR FUNCTION compileWord
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION compileWord
Move Stack_pointer gp0 											#GETTING POINTER
ADD gp0 @Local.Array_ofname
Store gp0 Local.name [Stack_pointer] 						#STORE GP0
Goto function:getWordName 												#CALLING getWordName
Load gp0 Local.name [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:copyName 												#CALLING copyName
Move Stack_pointer gp0 											#GETTING POINTER
ADD gp0 @Local.Array_oftop
Store gp0 Local.top [Stack_pointer] 						#STORE GP0
Load gp0 Local.top [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:compileSingleWord 												#CALLING compileSingleWord
LoadByte gp0 CLL.dontBreak 									#LOAD GP0 GLOBAL (CHAR)
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @0
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifcompileWord-0endif
Goto function:scanToEndOfDef 												#CALLING scanToEndOfDef
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Pass										%ifcompileWord-0endif
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.top [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifcompileWord-1endif
Load gp0 Local.name [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.top [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:addToDict 												#CALLING addToDict
Pass										%ifcompileWord-1endif
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.top [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Local.last [Stack_pointer] 						#STORE GP0
Move Stack_pointer gp0 											#GETTING POINTER
ADD gp0 @Local.Array_ofnewWord
Store gp0 Local.newWord [Stack_pointer] 						#STORE GP0
Pass 										%loopcompileWord-0entry
Load gp0 @1
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0
if gp0 then Load PC loopcompileWord-0exit 								#WHILE LOOP
Load gp0 Local.newWord [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:compileSingleWord 												#CALLING compileSingleWord
LoadByte gp0 CLL.dontBreak 									#LOAD GP0 GLOBAL (CHAR)
Move gp0 gp1 						#PUSH gp0 POP gp1
Load gp0 @0
Move Zero gp2 														#COMPARE (IS EQUAL)
Compare gp1 gp0
if Equal then Load  gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifcompileWord-2endif
Goto function:scanToEndOfDef 												#CALLING scanToEndOfDef
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Pass										%ifcompileWord-2endif
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.newWord [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
if gp0 then Load gp0 @4294967295 									#COMPARE (IS TRUE)
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifcompileWord-3endif
Load PC loopcompileWord-0exit
Pass										%ifcompileWord-3endif
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.newWord [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Load gp6 @2
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.last [Stack_pointer] 							#STORE GP0 RELATIVE
Store gp0 0 [gp6]
Load gp6 @1
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.newWord [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Local.last [Stack_pointer] 						#STORE GP0
Load PC loopcompileWord-0entry					%loopcompileWord-0continue
Pass 										%loopcompileWord-0exit
Load gp0 Local.name [Stack_pointer] 						#LOAD GP0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp6 @0
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 Local.top [Stack_pointer] 							#LOAD GP0 RELATIVE
Load gp0 0 [gp6]
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:addToDict 												#CALLING addToDict
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
#########################################################################################################################
																	Scope Pop
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:Pop
SUB Stack_pointer @8 									#OVERHEAD FOR FUNCTION Pop
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION Pop
Load gp1 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp0 @1
Move Zero gp2 														#COMPARE (IS LESS)
Compare gp1 gp0
if Less then Load gp2 @4294967295
Move gp2 gp0
NOT gp0 														    #IF STATEMENT
if gp0 then Load PC ifPop-0endif
Load gp0 CLL.string135 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 @0
AND gp0 @255 													  #CASTING INT TO CHAR
StoreByte gp0 CLL.dontBreak 									#STORE GP0 GLOBAL (CHAR)
Pass										%ifPop-0endif
Load gp0 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
Load gp1 @1
SUB gp0 gp1 														#SUBTRACT
Load Flags_reset @4294967287 
Store gp0 CLL.ForthStackPointer 										#STORE GP0 GLOBAL
Load gp6 CLL.ForthStackPointer 										#LOAD GP0 GLOBAL
MUL gp6 @4 														   #INDEXING FOR @INT
ADD gp6 CLL.ForthStack 											#LOAD GP0 GLOBAL RELATIVE
Load gp0 0 [gp6]									
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
#########################################################################################################################
																	Scope init_primitives
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:init_primitives
SUB Stack_pointer @8 									#OVERHEAD FOR FUNCTION init_primitives
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION init_primitives
Goto function:malloc_init 												#CALLING malloc_init
Load gp0 CLL.string136 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Load gp0 CLL.string137 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @6
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
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:addToDict 												#CALLING addToDict
Load gp0 CLL.string138 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @6
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @1
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:addToDict 												#CALLING addToDict
Load gp0 CLL.string139 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @6
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @2
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:addToDict 												#CALLING addToDict
Load gp0 CLL.string140 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @6
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @3
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:addToDict 												#CALLING addToDict
Load gp0 CLL.string141 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @6
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @4
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:addToDict 												#CALLING addToDict
Load gp0 CLL.string142 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @6
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @5
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:addToDict 												#CALLING addToDict
Load gp0 CLL.string143 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @6
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @6
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:addToDict 												#CALLING addToDict
Load gp0 CLL.string144 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @6
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @7
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:addToDict 												#CALLING addToDict
Load gp0 CLL.string145 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @6
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @8
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:addToDict 												#CALLING addToDict
Load gp0 CLL.string146 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @6
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @9
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:addToDict 												#CALLING addToDict
Load gp0 CLL.string147 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @6
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @10
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:addToDict 												#CALLING addToDict
Load gp0 CLL.string148 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @6
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @11
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:addToDict 												#CALLING addToDict
Load gp0 CLL.string149 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @6
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @12
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:addToDict 												#CALLING addToDict
Load gp0 CLL.string150 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @6
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @13
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:addToDict 												#CALLING addToDict
Load gp0 CLL.string151 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @6
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @14
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:addToDict 												#CALLING addToDict
Load gp0 CLL.string152 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @6
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @15
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:addToDict 												#CALLING addToDict
Load gp0 CLL.string153 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @6
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @16
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:addToDict 												#CALLING addToDict
Load gp0 CLL.string154 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @6
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @17
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:addToDict 												#CALLING addToDict
Load gp0 CLL.string155 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @6
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @18
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:addToDict 												#CALLING addToDict
Load gp0 CLL.string156 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @6
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @19
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:addToDict 												#CALLING addToDict
Load gp0 CLL.string157 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @6
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @20
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:addToDict 												#CALLING addToDict
Load gp0 CLL.string158 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @6
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @21
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:addToDict 												#CALLING addToDict
Load gp0 CLL.string159 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @6
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @22
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:addToDict 												#CALLING addToDict
Load gp0 CLL.string160 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @6
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @23
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:addToDict 												#CALLING addToDict
Load gp0 CLL.string161 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @6
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @24
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:addToDict 												#CALLING addToDict
Load gp0 CLL.string162 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @6
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @25
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:addToDict 												#CALLING addToDict
Load gp0 CLL.string163 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @6
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @26
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:addToDict 												#CALLING addToDict
Load gp0 CLL.string164 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @6
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @27
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:addToDict 												#CALLING addToDict
Load gp0 CLL.string165 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @6
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @28
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:addToDict 												#CALLING addToDict
Load gp0 CLL.string166 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @6
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @29
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:addToDict 												#CALLING addToDict
Load gp0 CLL.string167 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @6
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @30
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:addToDict 												#CALLING addToDict
Load gp0 CLL.string168 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @6
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @31
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:addToDict 												#CALLING addToDict
Load gp0 CLL.string169 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @6
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @32
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:addToDict 												#CALLING addToDict
Load gp0 CLL.string170 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @6
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @33
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:addToDict 												#CALLING addToDict
Load gp0 CLL.string171 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @6
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @34
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:addToDict 												#CALLING addToDict
Load gp0 CLL.string172 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @6
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @35
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:addToDict 												#CALLING addToDict
Load gp0 CLL.string173 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @6
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @36
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:addToDict 												#CALLING addToDict
Load gp0 CLL.string174 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @6
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @37
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:addToDict 												#CALLING addToDict
Load gp0 CLL.string175 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @6
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @38
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:addToDict 												#CALLING addToDict
Load gp0 CLL.string176 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @6
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @39
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:addToDict 												#CALLING addToDict
Load gp0 CLL.string177 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @6
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @40
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:addToDict 												#CALLING addToDict
Load gp0 CLL.string178 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @6
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @41
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:addToDict 												#CALLING addToDict
Load gp0 CLL.string179 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @6
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @42
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:addToDict 												#CALLING addToDict
Load gp0 CLL.string180 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @6
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @43
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:addToDict 												#CALLING addToDict
Load gp0 CLL.string181 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @6
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @44
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:addToDict 												#CALLING addToDict
Load gp0 CLL.string182 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @6
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @45
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:addToDict 												#CALLING addToDict
Load gp0 CLL.string183 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @6
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @46
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:addToDict 												#CALLING addToDict
Load gp0 CLL.string184 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @6
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @47
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:addToDict 												#CALLING addToDict
Load gp0 CLL.string185 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @6
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @48
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:addToDict 												#CALLING addToDict
Load gp0 CLL.string186 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @6
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @49
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:addToDict 												#CALLING addToDict
Load gp0 CLL.string187 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @6
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @50
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Load gp0 @0
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:newByteCodeNode 												#CALLING newByteCodeNode
Goto function:addToDict 												#CALLING addToDict
Load gp0 CLL.string188 										#LOAD GP0 GLOBAL
Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
Goto function:printf 												#CALLING printf
Goto function:createTryInt 												#CALLING createTryInt
Goto function:createEval 												#CALLING createEval
Goto function:createInterp 												#CALLING createInterp
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
#########################################################################################################################
																	Scope dropAll
def expression_stack_ptr gp7
def ret_addr Jump
def previous_stack_ptr gp5
#__________ Defining offsets of local variables __________#
#__________ End of local variable definitions __________#
Move Stack_pointer previous_stack_ptr								%function:dropAll
SUB Stack_pointer @8 									#OVERHEAD FOR FUNCTION dropAll
Compare Stack_pointer Callstack_ptr
if Less then Load PC Recursion_limit_reached
Store ret_addr 0 [Stack_pointer]
Store previous_stack_ptr 4 [Stack_pointer]							#GETTING PARAMETERS FOR FUNCTION dropAll
Load gp0 @0
Store gp0 CLL.ForthStackPointer 										#STORE GP0 GLOBAL
Load ret_addr 0 [Stack_pointer]										#RETURNING
Load Stack_pointer 4 [Stack_pointer] 
Move ret_addr PC
