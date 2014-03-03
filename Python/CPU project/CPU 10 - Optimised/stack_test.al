int trial1 111
int trial2 222

Load gp0 @trial1
Load gp1 @trial2

Store gp0 @stack.io
Goto @stack.push

Store gp1 @stack.io
Goto @stack.push

Goto @stack.pop
Load gp0 @stack.io
Goto @stack.pop
Load gp1 @stack.io
Halt

import Stack