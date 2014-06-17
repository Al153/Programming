#Pool_generator

<Python> "\n".join(["char pool"+str(i)+" 0\nint pool_ptr"+str(i)+" "+("pool"+str(i-1) if i else "0") for i in xrange(256)]+["int pool pool255"])

import lib\Strings
int input_temp 0
int input_start 0
int input_end 0

Call insert_to_pool %main
Push pool
Call Strings.copy
Call insert_to_pool
Push pool
Call Strings.copy
Call insert_to_pool 
Push pool
Call Strings.copy

Call input_to_ints
Pop input_end
Pop gp0   #get rid of position in string

Call input_to_ints
Pop input_start
Pop gp0   #get rid of position in string

Push input_start
Push input_end

Outd input_start
Out @32
Outd input_end
Out @32


Call Strings.splice
Call Strings.print
Halt

#Call input_to_ints
#Pop gp6
#Outd gp6
#Out @32 
#Out @43
#Out @32
#Call insert_to_pool 
#Push pool
#Call input_to_ints
#Pop gp5
#Outd gp5
#Out @32
#Out @61
#Out @32
#ADD gp5 gp6
#Outd gp5
#Halt
#Call clear_pool
#Goto main


Load gp0 pool %clear_pool
    StoreByte Zero 0 [gp0] %clear_pool_loop
    Load gp0 1 [gp0]
    if gp0 then Load PC clear_pool_loop
Return

Load gp0 pool               %insert_to_pool
    
    StoreByte Zero 0 [gp0] %clear_pool_loop
    Load gp0 1 [gp0]
    if gp0 then Load PC clear_pool_loop

Load gp0 pool

    In gp1                  %insert_to_pool_loop
    if gp1 then StoreByte gp1 0 [gp0]
    if gp1 then Load gp0 1 [gp0]
        Compare gp1 @13
        if Equal then Load PC insert_to_pool_return
    if gp0 then Load PC insert_to_pool_loop 
    Return

Load gp1 @10 %insert_to_pool_return
if gp0 then StoreByte gp1 0 [gp0]
Return 

Pop gp0 %input_to_ints      #Gets string pointer into gp0
Move Zero gp3               #counting register

        Load gp4 1 [gp0]     %input_to_ints_loop
        Compare gp4 Zero
        if Equal then Load PC input_to_ints_return
        LoadByte gp2 0 [gp0]  
        Move gp4 gp0

        Load gp1 @48                         
        Compare gp1 gp2
        if Equal then Load PC input_to_ints_add0
        
        
        Load gp1 @49
        Compare gp1 gp2
        if Equal then Load PC input_to_ints_add1
        
        Load gp1 @50
        Compare gp1 gp2
        if Equal then Load PC input_to_ints_add2
        
        Load gp1 @51
        Compare gp1 gp2
        if Equal then Load PC input_to_ints_add3
        
        Load gp1 @52
        Compare gp1 gp2
        if Equal then Load PC input_to_ints_add4
        
        Load gp1 @53
        Compare gp1 gp2
        if Equal then Load PC input_to_ints_add5
        
        Load gp1 @54
        Compare gp1 gp2
        if Equal then Load PC input_to_ints_add6
        
        Load gp1 @55
        Compare gp1 gp2
        if Equal then Load PC input_to_ints_add7
        
        Load gp1 @56
        Compare gp1 gp2
        if Equal then Load PC input_to_ints_add8
        
        Load gp1 @57
        Compare gp1 gp2
        if Equal then Load PC input_to_ints_add9

Push gp0                                                    %input_to_ints_return #pushes position on string 
Push gp3 #pushes total value
Return

MUL gp3 @10 %input_to_ints_add0
Load PC input_to_ints_loop

MUL gp3 @10 %input_to_ints_add1
ADD gp3 @1
Load PC input_to_ints_loop

MUL gp3 @10 %input_to_ints_add2
ADD gp3 @2
Load PC input_to_ints_loop

MUL gp3 @10 %input_to_ints_add3
ADD gp3 @3
Load PC input_to_ints_loop

MUL gp3 @10 %input_to_ints_add4
ADD gp3 @4
Load PC input_to_ints_loop

MUL gp3 @10 %input_to_ints_add5
ADD gp3 @5
Load PC input_to_ints_loop

MUL gp3 @10 %input_to_ints_add6
ADD gp3 @6
Load PC input_to_ints_loop

MUL gp3 @10 %input_to_ints_add7
ADD gp3 @7
Load PC input_to_ints_loop

MUL gp3 @10 %input_to_ints_add8
ADD gp3 @8
Load PC input_to_ints_loop

MUL gp3 @10 %input_to_ints_add9
ADD gp3 @9
Load PC input_to_ints_loop
