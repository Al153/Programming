% _______________________________ Q1 _______________________________

%	1 ?- X=1, print(X).
%	1 					- X unifies to 1.
%	X = 1.
%	
%	2 ?- not(X=1), print(X).  - X unifies to 1, then not(true) yields a fail
%	false.			
%	
%	3 ?- not(not(X=1)), print(X).
%	_G2403
%	true.
%	
%	4 ?- not(not(not(X=1))), print(X).
%	false.

% _______________________________ Q2 _____________________________________

% Non logical behaviour occurs because of the macro nature of negation.

% consider the following world

red(w).
blue(x).
blue(y).
orange(z).

square(w).
square(x).
triangle(y).
triangle(z).

% let's now try to find a triangle that's not blue

notBlueTriangle(S) :- \+blue(S),triangle(S).

% the "logical" way of resolving this is \+blue instantiates S to a member of {w,z}, then triangle narrows that down to z.
% (that is \+blue returns S=w, then S=z), however:
	
	% [1] 2 ?- notBlueTriangle(S).
	% false.
% this is because
	% \+blue(S)
% expands to
	% blue(S), !, fail,

% So instead, blue(S) returns true with S unified to {x,y}, then a cut occurs and the
% fail predicate is reached, which fails the whole notBlueTriangle(S) clause.

% if S were fully instantiated, then the predicate would work fine

notBlueTriangle2(S) :- triangle(S), \+blue(S).

%	?- notBlueTriangle2(S).
% 	S = z. 

% _______________________________ Q3 _______________________________
tName(acr31,'Andrew Rice').
tName(arb33,'Alastair Beresford').
tName(at736,'Alexander Taylor').
tName(rkh23,'Robert Harle').

tCollege(acr31, 'Churchill').
tCollege(arb33, 'Robinson').
tCollege(at736, 'St John\'s').
tNoCollege(rkh23).

tGrade(acr31,'IA',2.1).
tGrade(acr31,'IB',1).
tGrade(acr31,'II',1).
tGrade(arb33,'IA',2.1).
tGrade(arb33,'IB',1).
tGrade(arb33,'II',1).
tGrade(at736,'IA',1).

tDOB(at736,'11/05/1997').
tDOB(arb33,'23/07/1978').
tDOB(acr31,'28/10/1980').



%Bookwork Add your own details to the database.
%Bookwork Add a new table tDOB which contains CRSID and DOB.
%Bookwork Alter the database such that for some users their college is not present (this final step is necessary
%for testing your answers to the questions in Part 2)


% Supervision work
% The next task is to provide rules and show queries which implement various queries of the database. By
% answering these questions you are demonstrating that you understand how backtracking works and how
% to control it. You should answer each question with the Prolog facts and rules required to implement the
% query and also an example invocation of these rules. For example:
% % The full name of each person in the database
qFullName(A) :- tName(_,A).
% 1

% Each query should return one row of the answer at a time, subsequent rows should be returned by backtracking.
% For the example above:
	% ?- qFullName(A).
	% A = ’Andrew Rice’ ;
	% A = ’Alastair Beresford’
	% Yes
% The descriptions that follow provide a plain English description of the query you should implement followed
% by the same query in SQL. SQL (Structured Query Language) is the industry standard language used
% to query relational databases—you will see more on this in the Databases course. The ? notation in the
% SQL statements derives from the use of prepared statements in relational databases where (for efficiency) a
% single statement is sent to the database server and repeatedly evaluated with different values replacing the
% ?. Interested students can consult the Java PreparedStatement documentation or wait for the Further Java
% course.

% Bookwork Full name and College attended.
	% SELECT name,college from tName, tCollege
	% WHERE tName.crsid = tCollege.crsid

qNameAndCollege(Name, College) :- qFullName(Name), tName(CRSID, Name), tCollege(CRSID,College).


% Bookwork Full name and College attended only including entries where the user can choose a single
% CRSID to include in the results.
	% SELECT name,college from tName, tCollege
		% WHERE tName.crsid = tCollege.crsid and tName.crsid = ?

qNameAndCollegeWithCRSID(CRSID,Name,College) :- tName(CRSID,Name), tCollege(CRSID,College).

% Shallow Full name and College attended or blank if the college is unknown.
	
	 %SELECT name,college from tName
		% LEFT OUTER JOIN tCollege
			% ON tName.crsid = tCollege.crsid
				% 2
qNameAndCollegePlus(Name, College) :- qNameAndCollege(Name, College).
qNameAndCollegePlus(Name,'blank') :- qFullName(Name), tName(CRSID, Name), tNoCollege(CRSID).

% Shallow Full name and College attended. The full name or the college should be blank if either is unknown.
	
	% SELECT name,college from tName
		% FULL OUTER JOIN tCollege
			% ON tName.crsid = tCollege.crsid

qNameOrCollegeOrNone(Name,College) :- qNameAndCollegePlus(Name,College).
qNameOrCollegeOrNone('blank',College) :- tCollege(CRSID,College),\+tName(CRSID,_).


% Deeper Find the lowest (numerically) grade where the CRSID is specified by the user. Note that this
% predicate should only return one result even when backtracking.

% SELECT min(grade) from tGrade
	% WHERE crsid = ?


qMinGrade(CRSID,Grade) :-
	tGrade(CRSID,_,Grade),
  \+ (tGrade(CRSID,_,OtherGrade), OtherGrade < Grade).

% Deeper Find the number First class marks given out
	% SELECT count(grade) from tGrade
		% WHERE grade = 1

countFirsts(Count) :- aggregate_all(count, tGrade(_,_,1), Count).

% Deeper (Hard) Find the number of First class marks awarded to each person. Your output should consist
% of a tuple (CRSID,NumFirsts) which iterates through all CRSIDs which have at least one First class mark
% upon backtracking
	% SELECT crsid,count(grade) from tGrade
		% WHERE grade=1 GROUP BY crsid

countList([], 0). % predicate to count instances of X in a list
countList([_|T], N) :- countList(T,M), N is M+1. 
numFirsts2((CRSID,Count)) :- findall(Part, tGrade(CRSID,Part,1), List), countList(List,Count).

% Hint: This is not the number of rows with First class marks in the tGrade table. You will need build a list of
% First class CRSIDs by repeatedly querying tGrade and checking if the result is already in your list. Every
% time you find a new unique CRSID, increment an accumulator which will form the result
% 3.

% __________________________________ Q4 __________________________________

% Missionaries and Cannibals:
%	there are three missionaries, three cannibals who need to cross a river.
%	They have one boat which can hold at most two people.
% 	If, at any point, the cannibals outnumber the missionaries then they will eat them.
%	Discover the procedure for a safe crossing. [10  marks]

safe(b(0,_)).
safe(b(Missionaries,Cannibals)) :- Missionaries >= Cannibals.


moveFrom(b(OldM,OldC),b(NewM,OldC),p(2,0)) :- NewM is  OldM - 2, NewM >= 0, safe(b(NewM, OldC)).
moveFrom(b(OldM,OldC),b(OldM,NewC),p(0,2)) :- NewC is OldC - 2, NewC >= 0. % (this move is always safe at this end)
moveFrom(b(OldM,OldC),b(NewM,NewC),p(1,1)) :- NewM is OldM - 1, NewC is OldC - 1, NewC >= 0, NewM >= 0.
moveFrom(b(OldM,OldC),b(OldM,NewC),p(0,1)) :- NewC is OldC - 1, NewC >= 0. % (this move is always safe at this end)
moveFrom(b(OldM,OldC),b(NewM,OldC),p(1,0)) :- NewM is OldM - 1,  NewM >= 0, safe(b(NewM, OldC)).


moveTo(b(OldM,OldC),p(DifM,DifC),b(NewM,NewC)) :- NewM is OldM + DifM, NewC is OldC + DifC, safe(b(NewM,NewC)).

notMember(_,[]).
notMember(X,[H|_]) :- X=H, !, fail.
notMember(X,[_|T]) :- notMember(X,T).


doMoves(Start,Start,[],_,_).
doMoves(c(LeftBank,RightBank),c(EndLeftBank,EndRightBank),[Party|T],PastStates,left) :-
				moveFrom(LeftBank,NewL,Party),					% find a safe move from the left bank
				moveTo(RightBank,Party,NewR),					% that's safe on the right bank
				\+member((c(NewL,NewR),left),PastStates),
				doMoves(c(NewL,NewR),c(EndLeftBank,EndRightBank),T,[(c(NewL,NewR),left)|PastStates],right). % find a set of moves that complete the current puzzle.
																	% the boat is now on the right bank, so need to swap


doMoves(c(LeftBank,RightBank),c(EndLeftBank,EndRightBank),[Party|T],PastStates,right) :-
				moveFrom(RightBank,NewR,Party),					% find a safe move from the left bank
				moveTo(LeftBank,Party,NewL),					% that's safe on the right bank
				\+member((c(NewL,NewR),right),PastStates),
				doMoves(c(NewL,NewR),c(EndLeftBank,EndRightBank),T,[(c(NewL,NewR),right)|PastStates],left). % find a set of moves that complete the current puzzle.

solve(Start,End,Side,Moves) :- doMoves(Start, End, Moves, [(Start, Side)], Side).



% solve(  c(b(3,3),b(0,0)),       c(b(0,0),b(3,3)), left, M), print(M).
% [p(0,2),p(0,2),p(1,1),p(1,0),p(0,2),p(0,1),p(2,0),p(1,1),p(2,0),p(0,1),p(0,2),p(0,1),p(0,2)]
% [p(0,2),p(0,2),p(1,1),p(1,0),p(0,2),p(0,1),p(2,0),p(1,1),p(2,0),p(0,1),p(0,2),p(1,0),p(1,1)]
% [p(0,2),p(0,1),p(0,2),p(0,1),p(2,0),p(1,1),p(2,0),p(0,1),p(0,2),p(0,1),p(0,2)]
% [p(0,2),p(0,1),p(0,2),p(0,1),p(2,0),p(1,1),p(2,0),p(0,1),p(0,2),p(1,0),p(1,1)]
% [p(1,1),p(1,1),p(0,2),p(0,1),p(0,2),p(0,1),p(2,0),p(1,1),p(2,0),p(0,1),p(0,2),p(0,1),p(0,2)]
% [p(1,1),p(1,1),p(0,2),p(0,1),p(0,2),p(0,1),p(2,0),p(1,1),p(2,0),p(0,1),p(0,2),p(1,0),p(1,1)]
% [p(1,1),p(1,0),p(0,2),p(0,1),p(2,0),p(1,1),p(2,0),p(0,1),p(0,2),p(0,1),p(0,2)]
% [p(1,1),p(1,0),p(0,2),p(0,1),p(2,0),p(1,1),p(2,0),p(0,1),p(0,2),p(1,0),p(1,1)]
% [p(0,1),p(0,1),p(0,2),p(0,1),p(0,2),p(0,1),p(2,0),p(1,1),p(2,0),p(0,1),p(0,2),p(0,1),p(0,2)]
% [p(0,1),p(0,1),p(0,2),p(0,1),p(0,2),p(0,1),p(2,0),p(1,1),p(2,0),p(0,1),p(0,2),p(1,0),p(1,1)]
% [p(0,1),p(0,1),p(1,1),p(1,0),p(0,2),p(0,1),p(2,0),p(1,1),p(2,0),p(0,1),p(0,2),p(0,1),p(0,2)]
% [p(0,1),p(0,1),p(1,1),p(1,0),p(0,2),p(0,1),p(2,0),p(1,1),p(2,0),p(0,1),p(0,2),p(1,0),p(1,1)]
% false.

% (I've removed where the unification for m is printed)
% I have struggled to remove the duplicated move at the start from the list of moves

% __________________________________ Q5 __________________________________

% Regular Quicksort:

split([],_,[],[]).
split([H|T], Pivot, [H|L], R) :- H<Pivot, split(T,Pivot,L,R).
split([H|T], Pivot, L, [H|R]) :- H>=Pivot, split(T,Pivot,L,R).

quicksort([],[]).
quicksort([A],[A]).
quicksort([H|T], Result) :- split(T, H, L, R),
							quicksort(L, LSorted),
							quicksort(R,RSorted),
							append(LSorted, [H|RSorted], Result).

% now with difference lists

split(A-A1,_,B-B1,C-C1) :- unify_with_occurs_check(A,A1), unify_with_occurs_check(B,B1), unify_with_occurs_check(C,C1). 
split([H|T]-N1, Pivot, [H|L]-N2, R-N3) :- H<Pivot, split(T-N1,Pivot,L-N2,R-N3).
split([H|T]-N1, Pivot, L-N2, [H|R]-N3) :- H>=Pivot, split(T-N1,Pivot,L-N2,R-N3).

quicksort(A-A1,A-A1) :- unify_with_occurs_check(A,A1).
quicksort([H|T]-N, Result) :- split(T-N, H, L, R),
							quicksort(R,RSorted-RN),
							quicksort(L, LSorted-[H|RSorted]),
							Result = LSorted - RN.

% [1] 2 ?- quicksort([3,4,7,6,5,1,2,9,8|R]-R,Result).
% Result = [1, 2, 3, 4, 5, 6, 7, 8|...]-_G90 ;
% ERROR: </2: Arguments are not sufficiently instantiated

% __________________________________ Q6 _______________________
remove([V|T],V,T). % last param is the resulting list when second param is removed from the first
remove([H|T],V,[H|T_new]) :- remove(T,V,T_new).

perm([],[]).
perm(L,[H|T]) :- remove(L,H,L_New), perm(L_New,T).
				 % Checks if top value is a member of L
				 % if it is, then finds the list L_New that is the result
				 % of removing the top value from L
				 % then check if the tail is a permutation of the new L
% a)

choose(0, _, []).
choose(N, L, [H|T]) :- remove(L,H,L_New), M is N-1, choose(M,L_New,T).


sum([],0).
sum([H|T],Res) :- sum(T,Im), Res is H + (Im * 10).


solve1([S,E,N,D],[M,O,R,E],[M,O,N,E,Y]) :-   
	Var = [S,E,N,D,M,O,R,Y,_,_],
	perm(Var,[0,1,2,3,4,5,6,7,8,9]),
	sum([D,N,E,S],Top), sum([E,R,O,M],Middle), sum([Y,E,N,O,M], Bottom),
	Bottom is Top+Middle.

% [1] 2 ?- solve1(X,Y,Z).
% X = [2, 8, 1, 7],
% Y = [0, 3, 6, 8],
% Z = [0, 3, 1, 8, 5] ;
% X = [2, 8, 1, 9],
% Y = [0, 3, 6, 8],
% Z = [0, 3, 1, 8, 7] ;
% X = [2, 8, 1, 7],
% Y = [0, 3, 6, 8],
% Z = [0, 3, 1, 8, 5] ;
% . . . 
% false.
% 50 solutions

% there are lots of first-digit-zeroes in the solutions
solve2([S,E,N,D],[M,O,R,E],[M,O,N,E,Y]) :-   
	Var = [S,E,N,D,M,O,R,Y|_],
	choose(2,[1,2,3,4,5,6,7,8,9], [S,M]),
	perm([0,1,2,3,4,5,6,7,8,9],Var),
	sum([D,N,E,S],Top), sum([E,R,O,M],Middle), sum([Y,E,N,O,M], Bottom),
	Bottom is Top+Middle.

% [1] 2 ?- solve2(X,Y,Z).
% X = [9, 5, 6, 7],
% Y = [1, 0, 8, 5],
% Z = [1, 0, 6, 5, 2] ;

% X = [9, 5, 6, 7],
% Y = [1, 0, 8, 5],
% Z = [1, 0, 6, 5, 2] ;
% false



% _______________________________

sumb([],0,_).
sumb([H|T],Res,Base) :- sumb(T,Im,Base), Res is H + (Im * Base).


range(1,[0]).
range(N,[M|T]) :- N > 1, M is N-1, range(M,T).

noZeroes(2,[1]).
noZeroes(N,[M|T]) :- N > 2, M is N-1, noZeroes(M,T).

solveBase([S,E,N,D],[M,O,R,E],[M,O,N,E,Y],B) :-
	range(B,All), noZeroes(B,FirstDigit),
	Var = [S,M,E,N,D,O,R,Y],
	choose(2,FirstDigit, [S,M]),
	choose(8,All,Var),
	sumb([D,N,E,S],Top,B), sumb([E,R,O,M],Middle,B), sumb([Y,E,N,O,M],Bottom,B),
	Bottom is Top+Middle.
% [1] 2 ?- solveBase(X,Y,Z,16).
% X = [15, 12, 13, 11],
% Y = [1, 0, 14, 12],
% Z = [1, 0, 13, 12, 7] ;
% X = [15, 12, 13, 10],
% Y = [1, 0, 14, 12],
% Z = [1, 0, 13, 12, 6] ;
% X = [15, 12, 13, 9],
% Y = [1, 0, 14, 12],
% Z = [1, 0, 13, 12, 5] ;
% X = [15, 12, 13, 8],
% Y = [1, 0, 14, 12],
% Z = [1, 0, 13, 12, 4] ;
% X = [15, 12, 13, 7],
% Y = [1, 0, 14, 12],
% Z = [1, 0, 13, 12, 3] ;
% X = [15, 12, 13, 6],
% Y = [1, 0, 14, 12],
% Z = [1, 0, 13, 12, 2] ;
% X = [15, 11, 12, 13],
% Y = [1, 0, 14, 11],
% Z = [1, 0, 12, 11, 8] ;
% X = [15, 11, 12, 10],
% Y = [1, 0, 14, 11],
% Z = [1, 0, 12, 11, 5]
% X = [15, 11, 12, 9],
% Y = [1, 0, 14, 11],
% Z = [1, 0, 12, 11, 4] ;
% X = [15, 11, 12, 8],
% Y = [1, 0, 14, 11],
% Z = [1, 0, 12, 11, 3] ;
% X = [15, 11, 12, 7],
% Y = [1, 0, 14, 11],
% Z = [1, 0, 12, 11, 2] ;
% X = [15, 10, 11, 13],
% Y = [1, 0, 14, 10],
% Z = [1, 0, 11, 10, 7] ;
% X = [15, 10, 11, 12],
% Y = [1, 0, 14, 10],
% Z = [1, 0, 11, 10, 6] ;
% X = [15, 10, 11, 9],
% Y = [1, 0, 14, 10],
% Z = [1, 0, 11, 10, 3] ;
% X = [15, 10, 11, 8],
% Y = [1, 0, 14, 10],
% Z = [1, 0, 11, 10, 2] ;
% X = [15, 9, 10, 13],
% Y = [1, 0, 14, 9],
% Z = [1, 0, 10, 9, 6] ;
% X = [15, 9, 10, 12],
% Y = [1, 0, 14, 9],
% Z = [1, 0, 10, 9, 5]
% X = [15, 9, 10, 11],
% Y = [1, 0, 14, 9],
% Z = [1, 0, 10, 9, 4] ;
% X = [15, 8, 9, 13],
% Y = [1, 0, 14, 8],
% Z = [1, 0, 9, 8, 5] ;
% X = [15, 8, 9, 12],
% Y = [1, 0, 14, 8],
% Z = [1, 0, 9, 8, 4]
% X = [15, 8, 9, 11],
% Y = [1, 0, 14, 8],
% Z = [1, 0, 9, 8, 3] ;
% X = [15, 8, 9, 10],
% Y = [1, 0, 14, 8],
% Z = [1, 0, 9, 8, 2] ;
% X = [15, 7, 8, 13],
% Y = [1, 0, 14, 7],
% Z = [1, 0, 8, 7, 4] ;
% X = [15, 7, 8, 12],
% Y = [1, 0, 14, 7],
% Z = [1, 0, 8, 7, 3] ;
% X = [15, 7, 8, 11],
% Y = [1, 0, 14, 7],
% Z = [1, 0, 8, 7, 2] ;
% X = [15, 6, 7, 13],
% Y = [1, 0, 14, 6],
% Z = [1, 0, 7, 6, 3] ;
% X = [15, 6, 7, 12],
% Y = [1, 0, 14, 6],
% Z = [1, 0, 7, 6, 2] ;
% X = [15, 5, 6, 13],
% Y = [1, 0, 14, 5],
% Z = [1, 0, 6, 5, 2] ;
% false.

% ______________________________________ Q7 __________________________________________

max(X, Y, X) :- X >= Y, !.
max(X, Y, Y).

% a)
%  	max(3,2,2). returns true.
% b)
%	doesn't unify with top clause, but does unify trivially with the bottom.
%  	this error could be introduced because the programmer may think that the 
%  	cut is enough to prevent the bottom case from being entered if X >= Y.

%  This is valid thinking if the query is used to lookup the max of X and Y
%  rather than to test the validity of a result.

% c)
	max2(X, Y, X) :- X >= Y, !. % make the cut a green cut.
	max2(X, Y, Y) :- Y >= X.
% d)
	maxList([V], V).
	maxList([H|T], V) :- maxList(T, Max), max2(H,Max,V).