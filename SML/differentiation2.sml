open Math; (*Uses Math's functions for evaluation*)

(*Expr datatype*)

datatype Expr =
	cnst of real |
	sum of Expr * Expr |
	prod of Expr * Expr |
	quotient of Expr * Expr |
	neg of Expr |
	sub of Expr * Expr |
	chain of Expr * Expr |
	eSqrt |
	eSin | eCos | eTan |
	eExp | eLn |
	eAsin | eAcos | eAtan |
	polynomial of int;


(* Differentiates an expression *)
fun diff (cnst _) = cnst 0.0 |
	diff (sum(f,g)) = sum(diff f, diff g) |
	diff (prod(f,g)) = sum(prod(diff f,g),prod(f,diff g)) |
	diff (quotient(f,g)) = quotient(sub(prod(diff f,g),prod(f,diff g)),prod(g,g)) |
	diff (neg f) = neg(diff f) |
	diff (sub(f,g)) = sub(diff f,diff g) |
	diff (chain(f,g)) = prod(diff g,chain(diff f,g)) |
	diff eSin = eCos |
	diff eCos = neg eSin |
	diff eTan = quotient(cnst 1.0, chain(polynomial 2,eCos)) |
	diff eAsin = quotient(cnst 1.0, chain(eSqrt,sub(cnst 1.0,polynomial 2))) |
	diff eAcos = neg (quotient(cnst 1.0, chain(eSqrt,sub(cnst 1.0,polynomial 2)))) |
	diff eAtan = quotient(cnst 1.0, sum(cnst 1.0, polynomial 2)) |
	diff eSqrt = quotient(cnst 0.5,eSqrt) |
	diff eExp = eExp |
	diff eLn = quotient(cnst 1.0,polynomial 1) |
	diff (polynomial n) = if n <= 1 then cnst (Real.fromInt n) else prod(cnst (Real.fromInt n), polynomial (n-1));

fun realEq (a,b) = abs(a-b) < 0.0001;

(*Evaluates an expression at a point*)
fun eval (cnst n) x = n |  						(*Evals an eExpression at zero*)
	eval eSin x = sin x |
	eval eCos x = cos x |
	eval eTan x = tan x |
	eval eExp x = exp x |
	eval eLn x = ln x |
	eval eAsin x = asin x |
	eval eAcos x = acos x |
	eval eAtan x = atan x |
	eval eSqrt x = sqrt x |
	eval (sum(a,b)) x = (eval a x) + (eval b x) |
	eval (sub(a,b)) x = (eval a x) - (eval b x) |
	eval (prod(a,b)) x = (eval a x) * (eval b x) |
	eval (quotient(a,b)) x = (eval a x) / (eval b x) |
	eval (neg a) x = ~(eval a x) |
	eval (chain(f,g)) x = (eval f) (eval g x) |
	eval (polynomial n) x = pow(x, Real.fromInt n);

(*Tidies up expression by removing zero products, terms etc*)
fun clean eSin = eSin | 
	clean eCos = eCos | 
	clean eTan = eTan | 
	clean eLn = eLn | 
	clean eExp = eExp |
	clean eAsin = eAsin | 
	clean eAcos = eAcos |
	clean eAtan = eAtan |
	clean eSqrt = eSqrt |
	clean (sum(cnst n, cnst m)) = cnst (n+m) |
	clean (sum((cnst(n)),g)) = if realEq(n,0.0) then clean g else sum((cnst(n)),clean g)| 
	clean (sum(f,cnst(m))) = if realEq(m,0.0) then clean f else (sum(clean f,cnst(m))) | 
	clean (sum(f,g)) = sum(clean f,	clean g) |
	clean (prod(cnst n ,cnst m)) = cnst(n*m) |
	clean (prod(cnst(n), g)) = if realEq(n,0.0) then cnst (0.0) else if realEq(n,1.0) then clean g else prod(cnst(n), clean g) | 
	clean (prod(f, cnst (m))) = if realEq(m,0.0) then cnst (0.0) else if realEq(m,1.0) then clean f else prod(clean f, cnst(m)) | 
	clean (prod(f, g)) = prod(clean f,clean g) |
	clean (sub(cnst n, cnst m)) = cnst (n-m) |
	clean (sub(cnst (n),g)) = if realEq(n,0.0) then neg (clean g) else (sub(cnst (n), clean g))| 
	clean (sub(f,cnst (m))) = if realEq(m,0.0) then clean f else sub(clean f, cnst(m))| 
	clean (sub(f,neg(g))) = sum(clean f,clean g) |
	clean (sub(f,g)) = sub(clean f,	clean g) |
	clean (polynomial 0) = cnst (1.0) | 
	clean (polynomial n) = polynomial n |
	clean (neg (neg f)) = clean f | 
	clean (neg f) = neg (clean f) |
	clean (quotient(cnst n, cnst m)) = cnst (n/m) |
	clean (quotient(cnst n ,g)) = if realEq(n,0.0) then cnst 0.0 else quotient(cnst n, clean g) |
	clean (quotient(f, g)) = quotient(clean f, clean g) |
	clean (chain(f,cnst n)) = cnst (eval f n) | clean (chain(f,g)) = chain(clean f, clean g)|
	clean (cnst n) = cnst n;

(*Prints an expression in x *)
fun pr x eSin = "Sin("^x^")" |
	pr x eCos = "Cos("^x^")" |
	pr x eTan = "Tan("^x^")" |
	pr x eExp = "Exp("^x^")" |
	pr x eLn  = "Ln("^x^")" |
	pr x eAsin = "Arcsin("^x^")" |
	pr x eAcos = "Arccos("^x^")" |
	pr x eAtan = "Arctan("^x^")" |
	pr x eSqrt = "Sqrt("^x^")" |
	pr x (cnst n) = Real.toString n |
	pr x (sum(f,g)) = "("^(pr x f)^")+("^(pr x g)^")" |
	pr x (sub(f,g)) = "("^(pr x f)^")-("^(pr x g)^")" |
	pr x (prod(f,g)) = "("^(pr x f)^")*("^(pr x g)^")" |
	pr x (quotient(f,g)) = "("^(pr x f)^")/("^(pr x g)^")" |
  
	pr x (neg f) = "-("^(pr x f)^")" |
	pr x (polynomial n) = "("^x^")^"^(Int.toString n) |
	pr x (chain(f,g)) = (pr (pr x g) f);










(*Datatype and manipulation of the series data type (lazy list) *)
datatype series = cons of Expr * (unit -> series);
fun head (cons(x,xf)) = x;
fun tail (cons(x,xf)) = xf();

(*Maclaurin series generating code code*)
fun maclaurinSeriesIter expr n d = cons(prod(polynomial(n),quotient(cnst(eval expr 0.0),cnst( if n = 0 then 1.0 else d*(Real.fromInt n)))), (fn () => (maclaurinSeriesIter (diff expr) (n+1) (if n = 0 then 1.0 else d*(Real.fromInt n)))));
fun maclaurinSeries expr = maclaurinSeriesIter expr 0 1.0;

	(*Reduces a series to just its non zero terms*)
fun reduceSeries (cons(prod(a,quotient(cnst n, b)),xf)) = if realEq(n,0.0) then reduceSeries (xf()) else cons(prod(a,quotient(cnst n, b)),(fn () => (reduceSeries (xf()))));

fun printMac 0 _ = "" | (*Prints n terms of a maclaurin series*)
	printMac n (cons(x,xf)) = (pr "x" x) ^ " + " ^ (printMac (n-1) (xf ()));

val a = (diff eTan);

print (printMac 5 (reduceSeries (maclaurinSeries eSin))); (*Prints the first five terms of the series (maclaurin series of sin x, reduced - only non zero terms)*)
print (printMac 5 (reduceSeries (maclaurinSeries (chain(eLn,sum(cnst 1.0,polynomial 1)))))); (*prints out the series of ln(1+x)   *)


(* could still be buggy
*)