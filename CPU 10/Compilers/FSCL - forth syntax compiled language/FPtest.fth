using std.hlib
using math.hlib
using debug.hlib

0f DUP 6.283175307f f< while
	DUP DUP "Theta = " ECHO .f
	" Cos Theta = " ECHO cos .f
	CR 
	0.7853981634f f+ 
	DUP 6.283175307f f<
loop