fun twice f = (fn x => f (f x));

fun nfold _ 0 = (fn x => x) | (*uses twice to do the calculation in O(log n) time*)
	nfold f n = if n mod 2 = 0  then (twice (nfold f (n div 2)))
				else (fn x => f((twice (nfold f (n div 2))) x));

fun s x = x + 1;
fun sum x y = (nfold s x) y;
fun product x y = (nfold (sum y) x) 0;
fun power x y = (nfold (product x) y) 1;



datatype 'a stream = Cons of 'a * (unit -> 'a stream);
fun from k = Cons(k, fn()=> from(k+1));

fun nth(Cons(a,_),1) = a |
	nth(Cons(_,tail),n) = nth(tail(),(n-1));

fun create_squares n = Cons(n*n,fn()=>create_squares (n+1));

val squares = create_squares 1;

fun map2 f (Cons(x,xs)) (Cons(y,ys)) = Cons((f x y), (fn()=>((map2 f) (xs()) (ys()))));