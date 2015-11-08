datatype Expr =
	cnst of real |
	sum of Expr * Expr |
	prod of Expr * Expr |
	quotient of Expr * Expr |
	neg of Expr |
	sub of Expr * Expr |
	chain of Expr * Expr |
	eSin | eCos | eTan |
	eExp | eLn |
	polynomial of int;

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
	diff eExp = eExp |
	diff eLn = quotient(cnst 1.0,polynomial 1) |
	diff (polynomial n) = if n <= 1 then cnst (Real.fromInt n) else prod(cnst (Real.fromInt n), polynomial (n-1));

fun realEq (a,b) = abs(a-b) < 0.0001;

fun clean eSin = eSin | 
	clean eCos = eCos | 
	clean eTan = eTan | 
	clean eLn = eLn | 
	clean eExp = eExp |
	clean (sum((cnst(n)),g)) = if realEq(n,0.0) then clean g else sum((cnst(n)),clean g)| 
	clean (sum(f,cnst(m))) = if realEq(m,0.0) then clean f else (sum(clean f,cnst(m))) | 
	clean (sum(f,g)) = sum(clean f,	clean g) |
	clean (prod(cnst(n), g)) = if realEq(n,0.0) then cnst (0.0) else if realEq(n,1.0) then clean g else prod(cnst(n), clean g) | 
	clean (prod(f, cnst (m))) = if realEq(m,0.0) then cnst (0.0) else if realEq(m,1.0) then clean f else prod(clean f, cnst(m)) | 
	clean (prod(f, g)) = prod(clean f,clean g) |
	clean (sub(cnst (n),g)) = if realEq(n,0.0) then neg (clean g) else (sub(cnst (n), clean g))| 
	clean (sub(f,cnst (m))) = if realEq(m,0.0) then clean f else sub(clean f, cnst(m))| 
	clean (sub(f,neg(g))) = sum(clean f,clean g) |
	clean (sub(f,g)) = sub(clean f,	clean g) |
	clean (polynomial 0) = cnst (1.0) | 
	clean (polynomial n) = polynomial n |
	clean (neg (neg f)) = clean f | 
	clean (neg f) = neg (clean f) | 
	clean (quotient(f, g)) = quotient(clean f, clean g) |
	clean (chain(f,g)) = chain(clean f, clean g)|
	clean (cnst n) = cnst n;

fun pr x eSin = "eSin("^x^")" |
	pr x eCos = "eCos("^x^")" |
	pr x eTan = "eTan("^x^")" |
	pr x eExp = "eExp("^x^")" |
	pr x eLn  = "eLn("^x^")" |
	pr x (cnst n) = Real.toString n |
	pr x (sum(f,g)) = "("^(pr x f)^")+("^(pr x g)^")" |
	pr x (sub(f,g)) = "("^(pr x f)^")-("^(pr x g)^")" |
	pr x (prod(f,g)) = "("^(pr x f)^")*("^(pr x g)^")" |
	pr x (quotient(f,g)) = "("^(pr x f)^")/("^(pr x g)^")" |
  
	pr x (neg f) = "-("^(pr x f)^")" |
	pr x (polynomial n) = "("^x^")^"^(Int.toString n) |
	pr x (chain(f,g)) = (pr (pr x g) f);





open Math;

fun eval (cnst n) x = n |  						(*Evals an eExpression at zero*)
	eval eSin x = sin x |
	eval eCos x = cos x |
	eval eTan x = tan x |
	eval eExp x = exp x |
	eval eLn x = ln x |
	eval (sum(a,b)) x = (eval a x) + (eval b x) |
	eval (sub(a,b)) x = (eval a x) - (eval b x) |
	eval (prod(a,b)) x = (eval a x) * (eval b x) |
	eval (quotient(a,b)) x = (eval a x) / (eval b x) |
	eval (neg a) x = ~(eval a x) |
	eval (chain(f,g)) x = (eval f) (eval g x) |
	eval (polynomial n) x = pow(x, Real.fromInt n);

datatype series = cons of Expr * (unit -> series);
fun maclaurinSeriesIter expr n d = cons(prod(poly(n),quotient(cnst(eval expr 0.0),cnst(d*(Real.fromInt n)))), fun () => (maclaurinSeriesIter (diff expr), n+1, d*(Real.fromInt n)));


val a = (diff eTan);