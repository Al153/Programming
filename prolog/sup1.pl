% __________________ Q2 __________________

member1(H,[H|_]).
member1(H,[_|T]) :- member1(H,T).
member2(X,Y) :- append(_,[X|_],Y).

% Traces using the built-in append

%        2 ?- trace, member1(4,[1,2,3,4]).
%        	Call: (8) member1(4, [1, 2, 3, 4]) ? creep
%        	Call: (9) member1(4, [2, 3, 4]) ? creep
%        	Call: (10) member1(4, [3, 4]) ? creep
%        	Call: (11) member1(4, [4]) ? creep
%        	Exit: (11) member1(4, [4]) ? creep
%       	Exit: (10) member1(4, [3, 4]) ? creep
%        	Exit: (9) member1(4, [2, 3, 4]) ? creep
%        	Exit: (8) member1(4, [1, 2, 3, 4]) ? creep
%        true .
%        
%        [trace] 3 ?- trace, member2(4,[1,2,3,4]).
%       	 Call: (8) member2(4, [1, 2, 3, 4]) ? creep
%       	 Call: (9) lists:append(_G2740, [4|_G2731], [1, 2, 3, 4]) ? creep
%   	     Exit: (9) lists:append([1, 2, 3], [4], [1, 2, 3, 4]) ? creep
%	        Exit: (8) member2(4, [1, 2, 3, 4]) ? creep
%        true .

% __________________ Q3, 4 _______________________________

a([]). % The empty list is already sorted
a([H|T]) :- a(T,H). % otherwise use a/2

a([],_). 			% a list containing no elements is sorted, and all values in it (none) are larger than 
					% any arbitary value
a([H|T],Prev) :- H >= Prev, a(T,H). % a list is in ascending order and larger than prev if its head is larger than
									% prev, and all values in the tail are in order and larger than
									% h

b(X,X) :- a(X). 					% X is X sorted if X is in order
b(X,Y) :- append(A,[H1,H2|B],X), 	% Y is X sorted if there is a way of splitting X into [...,H1,H2,...]
			H1 > H2, 				% Where H1,H2 is out of order
			append(A,[H2,H1|B],X1), % and X reformed with H1,H2 in order as X1
			b(X1,Y).				% and Y is also X1 sorted


% __________________ Q5 _______________________________

remove([V|T],V,T). % last param is the resulting list when second param is removed from the first
remove([H|T],V,[H|T_new]) :- remove(T,V,T_new).

member(H,[H|_]). % checks if H is a member of a list
member(H,[_|T]) :- member(H,T).

perm([],[]).
perm(L,[H|T]) :- member(H,L), remove(L,H,L_New), perm(L_New,T).
				 % Checks if top value is a member of L
				 % if it is, then finds the list L_New that is the result
				 % of removing the top value from L
				 % then check if the tail is a permutation of the new L

% __________________ Q7 _______________________________
% Pre-Nexthi (warmup: find highest element in a list):
	% determines if H is the highest element in a list
	highest([H], H).
	highest([H|T], V) :- highest(T,U), (U>H, V is U; U<H, V is H).

	% slower implementation
	h2([H], H).
	h2([H|T], H) :- h2(T,U), H>U.
	h2([H|T], U) :- h2(T,U), U>H.

% stuff for nexthi
minMax(A,A,A,A). % minMax is essentially a 2 input sorting network
minMax(A,B,A,B) :- A<B.
minMax(A,B,B,A) :- B<A.


n([X,Y],Max,Next) :- minMax(X,Y,Next,Max). % if a list is two elements, pick the smaller to be next
n([Head|Tail], Max, Next) :- n(Tail, M2, N2), 		% get max and next of the tail (M2,N2)
								minMax(Head,M2,Min,Max),	% Max of head and M2 is The max of [H|T] 
									minMax(Min,N2,_,Next).  % Max of min(Head,M2) and N2 is the new next

nexthi([Head|Tail], Next) :- n([Head|Tail],_,Next).



% __________________________ Q8 _________________________
% Leaf (empty tree),		Populated node 
% 			lf, br(U,N,T)
insert(Item, lf, br(lf, Item, lf)). %inserting an item into a leaf gives a new branch with leaves
insert(Item, br(U, Item, T), br(U, Item, T)).	% inserting an item into a tree with node item gives the tree
insert(Item, br(U, N, T), br(U, N, NewT)) :- Item > N, insert(Item, T, NewT). % inserting an item otherwise: if the item is larger than the node,insert the item into the right hand tree
insert(Item, br(U, N, T), br(NewU, N, T)) :- Item < N, insert(Item, U, NewU). % otherwise insert into the other tree

% Can't lookup an item in a node: fail
lookup(Item, br(_, Item, _)). % if an item is found, then return true
lookup(Item, br(U, N, _)) :- Item < N, lookup(Item, U). % else search an appropriate branch
lookup(Item, br(_, N, T)) :- Item > N, lookup(Item, T).
% if the Item < N and Item > N terms were not present, the algorithm would still be correct, but would take O(N)
% time to return an answer rather than O(log N) time
% However lookup(X, <someTree>) would return the elements of someTree in prefix order

% example query.
% insert(4,br(br(br(br(lf,1,lf),2,lf),3,lf),5,br(br(lf,6,br(lf,7,lf)),9,br(lf,10,lf))),X).