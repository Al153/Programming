datatype 'a Tree = Lf | Br of 'a * 'a Tree * 'a Tree;


fun tcons v Lf = Br (v, Lf, Lf)
      | tcons v (Br (w, t1, t2)) = Br (v, tcons w t2, t1);


fun arrayoflist [] = Lf |
	arrayoflist (x::xs) = tcons x (arrayoflist xs);

exception EmptyArray;

fun remove Lf = raise EmptyArray | (*Can't remove from an empty array*)
		remove (Br(x,t1,Lf))  = t1 | 		(*Removing from an array of size one gives a leaf*)
		remove (Br(x,Br(y,t11,t12),t2))  = Br(y,t2,remove (Br(y,t11,t12)));  (*Complex recursive step*)


fun listofarray Lf = [] |
	listofarray (Br(x,t1,t2)) = x::(listofarray (remove (Br(x,t1,t2))));


fun getSubsOfEvensList [] _ = [] |
	getSubsOfEvensList (x::xs) k = if x mod 2 = 0 then k::(getSubsOfEvensList xs (k+1))
													else (getSubsOfEvensList xs (k+1));

fun getSubsOfEvens T = getSubsOfEvensList (listofarray T) 1; 