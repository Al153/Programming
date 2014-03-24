import Stack

int test1 111
int test2 222
int test3 333
int test1_ptr @test1
int return 10


Push @test1


Push @test2
Push @test3

Call @test_function
Halt



ptr test_function

Pop gp0 %test_function
Outd gp0
Out @return
Pop gp0 
Outd gp0
Out @return
Call @test_function2
Return

ptr test_function2
Pop gp0 %test_function2
Outd  gp0
Return