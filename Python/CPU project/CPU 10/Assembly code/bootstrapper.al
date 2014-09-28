def constructed_char gp3
def next_string_pointer gp2
def input_char gp1

Load PC input_loop_1

<Python> "\n".join(["Halt" for i in xrange(131000)])



    Outd input_char %get_code
    Out @32
    AND input_char @15           													
    SHL input_char @4
    Move input_char constructed_char
    Load PC input_loop_2

    Outd input_char %store_byte
    Out @32
    AND input_char @15                                                              
    OR constructed_char input_char                                      
    StoreByte constructed_char 0  [next_string_pointer]
    ADD next_string_pointer One
    Load PC input_loop_1

													








In input_char %input_loop_1
Compare input_char @127
if Greater then Load PC start_execution
Compare input_char @15
if Greater then Load PC get_code
Load PC input_loop_1

In input_char %input_loop_2
Compare input_char @15
if Greater then Load PC store_byte
Load PC input_loop_2


Move Zero Flags_reset                   %start_execution                    #returns to start to execute program
Out @'S'

Move Zero gp1
Move Zero gp2
Move Zero gp3


Move Zero PC        