split([],_,[],[]).
split([H|T], Pivot, [H|L], R) :- H<Pivot, split(T,Pivot,L,R).
split([H|T], Pivot, L, [H|R]) :- H>=Pivot, split(T,Pivot,L,R).

quicksort([],[]).
quicksort([A],[A]) :- !.
quicksort([H|T], Result) :- split(T, H, L, R),
							quicksort(L, LSorted),
							quicksort(R, RSorted),
							append(LSorted, [H|RSorted], Result).





splitDif(A-A1,_,L-L1,R-A1) :- unify_with_occurs_check(A,A1), unify_with_occurs_check(L,L1), unify_with_occurs_check(R,R1).
splitDif([H|T]-Next, Pivot, [H|L]-LNext, R-RNext) :- H<Pivot, splitDif(T-Next,Pivot,L-Next,R-Next).
splitDif([H|T]-Next, Pivot, L-LNext, [H|R]-RNext) :- H<Pivot, splitDif(T-Next,Pivot,L-Next,R-Next).

quicksort(A-A1, A-A1) :- unify_with_occurs_check(A,A1).
quicksort([H|T]-Next, Result-ResNext) :- 
						split(T-Next, H, Left-LNext, Right-Next)
