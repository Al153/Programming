Name: Alexander Taylor
CRSID: at736
College: St John's
Supervision Number: 2
Group Number: 3
Date/time of supervision: Wednesday 28th October, 1900-20:00



(*_________________________ Exercise 1 _________________________*)
	(*returns true if the elements in x are found in y in order but not necessarily together *)
	fun sublist([],y) = true |
		sublist(x,[]) = false |
		sublist((x::xs),(y::ys)) = 	if (x = y) then
										sublist(xs,ys)
									else
										sublist(x::xs,ys);
	(*
		sublist([1,3],[0,1,2,3]) ==> true
	


	*)


	(*Alternate version... *)
	(*Only returns true if the elements in x are all in y in order and together *)


	fun sublist_found([],y) = true |
		sublist_found(x,[]) = false |
		sublist_found((x::xs),(y::ys)) = if (x = y) then
											sublist_found(xs,ys)
										else
											false;

	fun sublist([],y) = true |  (*This function scans list until it finds the first value of x in y, then switches state to sublist found*)
		sublist(x,[]) = false |
		sublist((x::xs),(y::ys)) = if (x=y) then sublist_found(xs,ys) 
									else sublist(x::xs,ys);




	(*
		sublist([1,3],[0,1,2,3]) ==> false
	*)

(*_________________________ Exercise 2 _________________________*)
	fun reverse([],ys) = ys |
		reverse(x::xs, ys) = reverse(xs, x::ys) ;

	fun cmp_list([],[]) = true |
		cmp_list(x,[]) = false |
		cmp_list([],y) = false |
		cmp_list(x::xs,y::ys) = if x = y then cmp_list(xs,ys) else false;

	fun is_palindrome(L) = cmp_list(L,reverse(L));


(*_________________________ Exercise 4 _________________________*)


	fun smallest(x,y) = if (x<y) then x else y;

	fun min([x]) = x |
		min(x::xs) = smallest(x,min(xs));

	fun remove_min(m,[]) = [] |
		remove_min(m,[x]) = if m = x then [] else [x] |
		remove_min(m,x::xs) = if m = x then xs else x::remove_min(m,xs);

	fun construct(m,L) = m::sel_sort(remove_min(m,L))

	and sel_sort([]) = [] |
		sel_sort(L) = construct(min(L),L);

(*_________________________ Exercise 4 _________________________*)
	fun hd x::xs = x;
	fun tl x::xs = xs;



	fun bubble_run(x,[]) = [x] |  (*Bubble run does a swapping pass*)
		bubble_run(y,x::xs) = if x>y then x::bubble_run(y,xs) else
										  y::bubble_run(x,xs); 
	fun bubble_sort_i([],L) = L |
		bubble_sort_i(x::xs,y::ys) = bubble_sort_i(xs,bubble_run(y,ys));

	fun bubblesort (x) = bubble_sort_i(x,x);


