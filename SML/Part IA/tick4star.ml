datatype 'a stream = Cons of 'a * (unit -> 'a stream);

fun map2 f (Cons(x,xs)) (Cons(y,ys)) = Cons((f x y), (fn()=>((map2 f) (xs()) (ys()))));
fun plus x y = x + y;
fun tail (Cons(x,xs)) = xs();
	
fun fibs() =
    Cons(1, fn()=> Cons(1, fn()=>   map2  plus  (fibs())  (tail(fibs())) ));

fun merge(Cons(x,xs),Cons(y,ys)) = 
	if x<y then
		Cons(x, fn() => merge(xs(),Cons(y,ys)))
	else if x = y then 
		Cons(x, fn() => merge(xs(),ys()))
	else
		Cons(y, fn() => merge(Cons(x,xs),ys()));

fun raiseBy2 (Cons(x,xs)) = Cons(2*x,(fn()=> raiseBy2 (xs()))); (*Multiplies all values in the stream by 2*)
fun raiseBy3 (Cons(x,xs)) = Cons(3*x,(fn()=> raiseBy2 (xs()))); (*Multiplies all values in the stream by 3*)

fun mul x y = x*y;

fun mapl f (Cons(x,xs)) = Cons((f x),fn()=> (mapl f) (xs()));

fun createPows23 () = Cons(1,fn()=> (merge(
	mapl (mul 2) (createPows23()),
	mapl (mul 3) (createPows23()) )));

fun createPows235 () = Cons(1,fn()=> (merge(merge(
	mapl (mul 2) (createPows235()),
	mapl (mul 3) (createPows235())),
	mapl (mul 5) (createPows235()))
));


val pows23 = createPows23 ();
val pows235 = createPows235 ();
fun nth(Cons(a,_),1) = a |
	nth(Cons(_,tail),n) = nth(tail(),(n-1));