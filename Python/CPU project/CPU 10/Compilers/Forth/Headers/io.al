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
