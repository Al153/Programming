
fun last [a] = a |
	last (x::xs) = last(xs);

fun butlast [a] = [] |
	butlast (x::xs) = x::butlast(xs)
;

fun nth (x::xs, 0) = x |
	nth (x::xs, n) = nth (xs,n-1);