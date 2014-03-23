import Stack

int test1 111
int test2 222
int test3  333
int return 10

Load gp0 @test1
Goto @Datastack.push
Load gp0 @test2
Goto @Datastack.push
Load gp0 @test3
Goto @Datastack.push

Load gp0 @test_function
Goto @Programstack.call
Halt



ptr test_function

Goto @Datastack.pop %test_function
Outd gp0
Out @return
Goto @Datastack.pop
Outd gp0
Out @return
Load gp0 @test_function2
Goto @Programstack.call
Goto @Programstack.return

ptr test_function2
Goto @Datastack.pop %test_function2
Outd  gp0
Goto @Programstack.return