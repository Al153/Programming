fun invfact(n:int) = if n = 0 then 1.0 else invfact(n-1)/real(n); (*slow way of calculatingt terms *)
fun eapprox(n:int) = if n = 1 then 1.0 else invfact(n-1) + eapprox(n-1); (*Uses an inverse factorial function, could probably be more efficient*)


(*alternative iterative approach*)
fun eapproxi(i:int,n:int,total:real,last_term:real) =
    if i = n then total else
    eapproxi(i+1,n,total + (last_term/(real i)), last_term/(real i));

(*Wrapper function *)
fun eapprox2(n:int) = if n<1 then 1.0 else eapproxi(1,n,1.0,1.0);

(* Exponential *)
fun expi(i:int,n:int,total:real,last_term:real,z:real) =
    if i = n then total else
    expi(i+1,n,total + (last_term*z/(real i)), last_term*z/(real i),z);

fun exp(z:real,n:int) = 
	if n<1 then 1.0 else
	expi(1,n,1.0,1.0,z);

fun even(n:int) = (n mod 2 = 0);

fun gcd(a,b) =
	if (b>a) then gcd(b,a) else
	if a = 0 then b else
	if b = 0 then a else
	if a = b then a else
	if even(a) andalso even(b) then 2*gcd(a div 2, b div 2) else
	if even(b) then gcd(a,b div 2) else (*if a is not even but b is*)
	if even(a) then gcd(a div 2, b) else
	gcd(b,(a-b)div 2)
;


