fun xor(x,false) = x |
	xor(false,y) = y |
	xor(x,y) = false;

fun shift(start,(q1,q2,q3,q4,q5)) = if start = (q1,q2,q3,q4,q5) then [start]
	else (q1,q2,q3,q4,q5) :: shift(start,((xor(q3,q5)) ,q1,q2,q3,q4));