fun allcons (k, []) = [] |
	allcons(k, x::xs) = (k::x)::allcons(k,xs);

fun concat([],xs) = xs |
	concat(k::ks,xs) = k::concat(ks,xs);

fun choose(0,xs) = [[]] |
	choose(k,[]) = [] |
	choose(k,x::xs) = concat(
		allcons(x,choose(k-1,xs)),
		choose(k,xs)
		);