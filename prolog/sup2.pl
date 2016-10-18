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

% _______________________________ Q3 _______________________________
tName(acr31,'Andrew Rice').
tName(arb33,'Alastair Beresford').
tName(at736,'Alexander Taylor').
tName(rkh23,'Robert Harle').

tCollege(acr31, 'Churchill').
tCollege(arb33, 'Robinson').
tCollege(at736, 'St John\'s').
tNoCollege(rkh23)

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
:- qFullName(A).
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
qNameOrCollegeOrNone('blank',College) :- tCollege(CRSID,College),!,\+tName(CRSID,X).
qNameOrCollegeOrNone('blank','blank').


% Deeper Find the lowest (numerically) grade where the CRSID is specified by the user. Note that this
% predicate should only return one result even when backtracking.

% SELECT min(grade) from tGrade
	% WHERE crsid = ?


% Deeper Find the number First class marks given out
	% SELECT count(grade) from tGrade
		% WHERE grade = 1

% Deeper (Hard) Find the number of First class marks awarded to each person. Your output should consist
% of a tuple (CRSID,NumFirsts) which iterates through all CRSIDs which have at least one First class mark
% upon backtracking
	% SELECT crsid,count(grade) from tGrade
		% WHERE grade=1 GROUP BY crsid

% Hint: This is not the number of rows with First class marks in the tGrade table. You will need build a list of
% First class CRSIDs by repeatedly querying tGrade and checking if the result is already in your list. Every
% time you find a new unique CRSID, increment an accumulator which will form the result
% 3

% __________________________________ Q4 __________________________________

% Missionaries and Cannibals:
%	there are three missionaries, three cannibals who need to cross a river.
%	They have one boat which can hold at most two people.
% 	If, at any point, the cannibals outnumber the missionaries then they will eat them.
%	Discover the procedure for a safe crossing. [10  marks]

safe(b(0,_)).
safe(b(Missionaries,Cannibals)) :- Missionaries >= Cannibals.


moveFrom(b(OldM,OldC),b(NewM,OldC),p(2,0)) :- NewM is  OldM - 2, safe(b(NewM, OldC)), NewM >= 0.
moveFrom(b(OldM,OldC),b(OldM,NewC),p(0,2)) :- NewC is OldC - 2, NewC >= 0. % (this move is always safe at this end)
moveFrom(b(OldM,OldC),b(NewM,NewC),p(1,1)) :- NewM is OldM - 1, NewC is OldC - 1, NewC >= 0, NewM >= 0.
moveFrom(b(OldM,OldC),b(OldM,NewC),p(0,1)) :- NewC is OldC - 1, NewC >= 0. % (this move is always safe at this end)
moveFrom(b(OldM,OldC),b(NewM,OldC),p(1,0)) :- NewM is OldM - 1, safe(b(NewM, OldC)), NewM >= 0.


moveTo(b(OldM,OldC),p(DifM,DifC),b(NewM,NewC)) :- NewM is OldM + DifM, NewC is OldC + DifC, safe(b(NewM,NewC)).

doMoves(Start,Start,[],_,_).
doMoves(c(LeftBank,RightBank),c(EndLeftBank,EndRightBank),[Party|T],PastMoves,left) :-
				moveFrom(LeftBank,NewL,Party),					% find a safe move from the left bank
				moveTo(RightBank,Party,NewR),					% that's safe on the right bank
				\+member(c(NewL,NewR),PastMoves),
				doMoves(c(NewR,NewL),c(EndRightBank,EndLeftBank),T,[c(LeftBank,RightBank)|PastMoves],right). % find a set of moves that complete the current puzzle.
																	% the boat is now on the right bank, so need to swap


doMoves(c(LeftBank,RightBank),c(EndLeftBank,EndRightBank),[Party|T],PastMoves,right) :-
				moveFrom(LeftBank,NewL,Party),					% find a safe move from the left bank
				moveTo(RightBank,Party,NewR),					% that's safe on the right bank
				\+member(c(NewL,NewR),PastMoves),
				doMoves(c(NewR,NewL),c(EndRightBank,EndLeftBank),T,[c(RightBank,LeftBank)|PastMoves],left). % find a set of moves that complete the current puzzle.
% doMoves(c(b(3,3),b(0,0)),c(b(0,0),b(3,3)),L,[],left).


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
% __________________________________ Q6 _______________________
remove([V|T],V,T). % last param is the resulting list when second param is removed from the first
remove([H|T],V,[H|T_new]) :- remove(T,V,T_new).

member(H,[H|_]). % checks if H is a member of a list
member(H,[_|T]) :- member(H,T).

perm([],[]).
perm(L,[H|T]) :- remove(L,H,L_New), perm(L_New,T).
				 % Checks if top value is a member of L
				 % if it is, then finds the list L_New that is the result
				 % of removing the top value from L
				 % then check if the tail is a permutation of the new L
% a)



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
% Z = [0, 3, 1, 8, 7] .

solve2([S,E,N,D],[M,O,R,E],[M,O,N,E,Y]) :-   
	Var = [S,E,N,D,M,O,R,Y|_],
	NoFirstDigits = [E,N,D,O,R,Y|_],
	perm(NoFirstDigits,[0,1,2,3,4,5,6,7,8,9]),
	perm(Var,[0,1,2,3,4,5,6,7,8,9]),
	sum([D,N,E,S],Top), sum([E,R,O,M],Middle), sum([Y,E,N,O,M], Bottom),
	Bottom is Top+Middle.

% _______________________________

sumb([],0,_).
sumb([H|T],Res,Base) :- sumb(T,Im,Base), Res is H + (Im * Base).



% [1] 2 ?- solve1(X,Y,Z).
% X = [2, 8, 1, 7],
% Y = [0, 3, 6, 8],
% Z = [0, 3, 1, 8, 5] ;
% X = [2, 8, 1, 9],
% Y = [0, 3, 6, 8],
% Z = [0, 3, 1, 8, 7] .

solve2([S,E,N,D],[M,O,R,E],[M,O,N,E,Y]) :-   
	Var = [S,E,N,D,M,O,R,Y|_],
	NoFirstDigits = [E,N,D,O,R,Y|_],
	perm(NoFirstDigits,[0,1,2,3,4,5,6,7,8,9])
	perm(Var,[0,1,2,3,4,5,6,7,8,9]),
	sum([D,N,E,S],Top), sum([E,R,O,M],Middle), sum([Y,E,N,O,M], Bottom),
	Bottom is Top+Middle.
