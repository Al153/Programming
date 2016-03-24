def constructed_char gp3
def constructed_char2 gp4
def next_string_pointer gp2
def input_char gp1

Load PC get_code

<Python> "\n".join(["Halt" for i in xrange(120000)])



Load PC loop_1                              %get_code
Compare input_char @120                     %Block1             #'x'
if Equal then Load PC start_execution
Load PC get_hex1
Move constructed_char constructed_char2                                            %construct_char1
SHL constructed_char2 @4

Load PC  loop_2                             %return_to_here_if_not_valid
Compare input_char @120                     %Block2  
if Equal then Load PC start_execution
Load PC get_hex2
ADD constructed_char construct_char2                                            %construct_char2
StoreByte constructed_char 0 [next_string_pointer]
ADD next_string_pointer @1
Load PC get_code




Move Zero Jump %start_execution 
Move Zero gp0
Move Zero gp1

Move Zero gp2
Move Zero gp3
Move Zero gp4
Move Zero Accumulator
Move Zero Flags_reset



Move Zero PC





In input_char %loop_1

if input_char then Out input_char
if input_char then Load PC Block1
Load PC loop_1

In input_char %loop_2
if input_char then Out input_char
if input_char then Load PC Block2
Load PC loop_2


Load Jump return_to_here_if_not_valid %get_hex1
Compare input_char @48 
if Equal then Load PC get_hex_0
Compare input_char @49
if Equal then Load PC get_hex_1
Compare input_char @50
if Equal then Load PC get_hex_2
Compare input_char @51 
if Equal then Load PC get_hex_3
Compare input_char @52
if Equal then Load PC get_hex_4
Compare input_char @53 
if Equal then Load PC get_hex_5
Compare input_char @54 
if Equal then Load PC get_hex_6
Compare input_char @55 
if Equal then Load PC get_hex_7
Compare input_char @56 
if Equal then Load PC get_hex_8
Compare input_char @57 
if Equal then Load PC get_hex_9
Compare input_char @65
if Equal then Load PC get_hex_a
Compare input_char @66 
if Equal then Load PC get_hex_b
Compare input_char @67 
if Equal then Load PC get_hex_c
Compare input_char @68 
if Equal then Load PC get_hex_d
Compare input_char @69 
if Equal then Load PC get_hex_e
Compare input_char @70 
if Equal then Load PC get_hex_f
Load PC get_code


Load Jump get_code %get_hex2
Compare input_char @48 
if Equal then Load PC get_hex_0
Compare input_char @49
if Equal then Load PC get_hex_1
Compare input_char @50
if Equal then Load PC get_hex_2
Compare input_char @51 
if Equal then Load PC get_hex_3
Compare input_char @52
if Equal then Load PC get_hex_4
Compare input_char @53 
if Equal then Load PC get_hex_5
Compare input_char @54 
if Equal then Load PC get_hex_6
Compare input_char @55 
if Equal then Load PC get_hex_7
Compare input_char @56 
if Equal then Load PC get_hex_8
Compare input_char @57 
if Equal then Load PC get_hex_9
Compare input_char @65
if Equal then Load PC get_hex_a
Compare input_char @66 
if Equal then Load PC get_hex_b
Compare input_char @67 
if Equal then Load PC get_hex_c
Compare input_char @68 
if Equal then Load PC get_hex_d
Compare input_char @69 
if Equal then Load PC get_hex_e
Compare input_char @70 
if Equal then Load PC get_hex_f
Load PC return_to_here_if_not_valid


Load constructed_char @0 %get_hex_0
Move Jump PC
Load constructed_char @1 %get_hex_1
Move Jump PC
Load constructed_char @2 %get_hex_2
Move Jump PC
Load constructed_char @3 %get_hex_3
Move Jump PC
Load constructed_char @4 %get_hex_4
Move Jump PC
Load constructed_char @5 %get_hex_5
Move Jump PC
Load constructed_char @6 %get_hex_6
Move Jump PC
Load constructed_char @7 %get_hex_7
Move Jump PC
Load constructed_char @8 %get_hex_8
Move Jump PC
Load constructed_char @9 %get_hex_9
Move Jump PC
Load constructed_char @10 %get_hex_a
Move Jump PC
Load constructed_char @11 %get_hex_b
Move Jump PC
Load constructed_char @12 %get_hex_c
Move Jump PC
Load constructed_char @13 %get_hex_d
Move Jump PC
Load constructed_char @14 %get_hex_e
Move Jump PC
Load constructed_char @15 %get_hex_f
Move Jump PC
