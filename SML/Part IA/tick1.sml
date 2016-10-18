(*Number for first task = ~2.77555756156E~17 *)

fun evalquad (a:real,b:real,c:real,x:real) = (a*x*x + b*x + c);

fun facr(n:int) =
      if (n<0) then 0
      else if (n=0) then 1
      else n * facr(n-1)
;

fun faci2(n:int,total:int) = if n = 0 then total else faci2(n-1,total*n);  (*tail recursive iterating function*)
fun faci(n:int) = if n<0 then 0 else faci2(n,1);  (*Wrapper function for iterator*)


fun sumt(n:int)  = if n = 1 then 1.0 else 1.0 + 0.5*sumt(n-1);