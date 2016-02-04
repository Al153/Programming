datatype person = human of int * string * ( int -> person );

fun class age name = human(age,name,(fn i => class (age+i) name));


fun getf (human(a,n,f)) = f;