using std.hlib

0 fib .
1 fib .
2 fib .
3 fib .



: fib

	int n 0

	*n POP 
	n 1 = n 0 = OR
	if 
		1
	else
		n n 2 - fib  SWAP 1 - fib +
	endif
;