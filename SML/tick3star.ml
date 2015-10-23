datatype 'a Tree = Lf | Br of 'a * 'a Tree * 'a Tree;

fun insert (a:string, Lf) = Br(a,Lf,Lf) |
	insert (a,(Br(b,t1,t2))) =	if a=b then Br(b,t1,t2) else
								if a<b then Br(b,insert(a,t1), t2) else
											Br(b,t1,insert(a,t2));

fun member (_,Lf) = false |
	member (a:string,Br(b,t1,t2)) = (a=b) orelse if (a<b) then member(a,t1) else member(a,t2);

fun tree_to_list(Lf,vs) = vs |
	tree_to_list (Br((v:string),t1,t2), vs) = v::tree_to_list(t1,tree_to_list(t2,vs));

fun union_list([],T) = T |
	union_list (x::xs, T) = insert (x,union_list(xs,T));

fun union (t1,t2) = union_list(tree_to_list(t1,[]),t2);

fun inter_list([],_) = Lf |
	inter_list (x::xs, t) = if member (x,t) then insert(x,inter_list(xs, t)) else
												inter_list(xs,t);

fun inter(t1,t2) = inter_list (tree_to_list(t1,[]), t2);

fun remove (_,Lf) = Lf |
	remove (a,Br(b,t1,t2)) = if a=b then union(t1,t2) else
							if a<b then Br(b,remove(a,t1), t2) else
								 		Br(b,t1,remove(a,t2));

(*Testing *)
val a = insert("a", insert("b",insert("c",insert("d",insert("e", Lf)     ))));
val b = insert("b", insert("d",insert("e",insert("f",insert("g", Lf)     ))));