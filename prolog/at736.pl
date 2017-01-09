% 2.1
% Simply list the pieces. This predicate is unused.
piece(['74', [[1,1,0,0,1,0], [0,1,0,1,0,0], [0,1,0,0,1,0], [0,1,0,0,1,1]]]).
piece(['65', [[1,1,0,0,1,1], [1,0,1,1,0,0], [0,0,1,1,0,0], [0,1,0,1,0,1]]]).
piece(['13', [[0,1,0,1,0,1], [1,1,0,1,0,1], [1,1,0,0,1,1], [1,1,0,0,1,0]]]).
piece(['Cc', [[0,0,1,1,0,0], [0,0,1,1,0,0], [0,1,0,0,1,0], [0,0,1,1,0,0]]]).
piece(['98', [[1,1,0,0,1,0], [0,1,0,0,1,0], [0,0,1,1,0,0], [0,0,1,1,0,1]]]).
piece(['02', [[0,0,1,1,0,0], [0,1,0,0,1,1], [1,0,1,1,0,0], [0,0,1,1,0,0]]]).

%2.2

% putLast appends a value to the far end of the list (would be easy with a difference list)
putLast([],A,[A]).
putLast([H|T],Val,[H|Res]) :- format('~w~n', [H]), putLast(T,Val,Res). % places value at bottom of list

% a general single rotate.
rotate([H|T],Result) :- putLast(T,H,Result). 	% Take top value and put it to the bottom of the list


% A repeated rotate predicate
rotate(L,0,L). % basis case
rotate(L,N,Result) :- N > 0, M is N-1, rotate(L,L_New), rotate(L_New,M,Result). % repeat the rotate by recursion

testRotate() :- rotate([0,1,2,3],0,X0), 	% demonstrates the rotate
				rotate([0,1,2,3],1,X1),
				rotate([0,1,2,3],2,X2),
				rotate([0,1,2,3],3,X3),
				rotate([0,1,2,3],4,X4),
				format('X0: ~w~n',[X0]),
				format('X1: ~w~n',[X1]),
				format('X2: ~w~n',[X2]),
				format('X3: ~w~n',[X3]),
				format('X4: ~w~n',[X4]).

%2.3
% a tail recursive reverse
reverse([],Acc,Acc). 				% if we get to the empty list, return the accumulator																			
reverse([H|T],Acc,Return) :- reverse(T,[H|Acc],Return).  % add the head to the accumulator						

%determines if two lists are the same length.
sameLength([],[]).
sameLength([_|T1],[_|T2]) :- sameLength(T1,T2).

% wrapper predicate
% Calls same length to instantiate the size of List and Res to be equal to prevent backtracking in reverse/3
reverse(List,Res) :- sameLength(List,Res), reverse(List,[],Res).	

testReverse() :- reverse([1,2,3,4,5,6,7],X),
				format('Reversed: ~w~n',[X]).


%2.4

xor(0,1).		% simple case enumeration
xor(1,0).

nand(0,0).		% a similar predicate used later
nand(0,1).
nand(1,0).

%2.5

xorlist([],[]).	% Maps xor to a list. This predicate is not actually used
xorlist([H|T],[I|U]) :- xor(H,I), xorlist(T,U).

%2.6
 
range(Min, Max, Min) :- Min < Max. 		% return Min
% then under backtracking increase min so that all values are created
range(Min, Max, Val) :- NewMin is Min + 1, NewMin < Max, range(NewMin, Max, Val).

% 3
% Sides are enumerated from top left, clockwise
% teeth are enumerated from top left, clockwise (ie along the orientation of the side that they are on)
% the left and right sides are swapped, and the orientation of all sides is flipped
flipped([Name,[A,B,C,D]],[Name,[AR,DR,CR,BR]]) :- reverse(A,AR), reverse(B,BR), reverse(C,CR),reverse(D,DR).


% Orientation: 0: return the piece, +ve: rotate by Or, -ve: flip, rotate by -Or
orientation([N,L],0,[N,L]).
orientation([N,L],Or,[N,L_New]) :- Or > 0, rotate(L,Or,L_New). 		% orthogonality of cases 
																	% ( =0, >0, <0 ) enforced to prevent
																	% an infinite loop in rotate.
orientation([N,L],Or,[N,L_New]) :- 	Or < 0, O is 0 - Or,			% here we invert Or to get rotation number
									flipped([N,L],[N,L_Next]), rotate(L_Next,O,L_New).

% 4

% gets a value from a particular index in the list
getList([H|_],0,H).	
getList([_|T],N,V) :- N > 0, M is N - 1, getList(T,M,V).

% Checks that sides fit
sideFits([A],[B]) :- nand(A,B).						% Modification of xorlist
sideFits([H|T],[I|U]) :- xor(H,I), sideFits(T,U).	% We use nand on the ends of the side,
													% since the third piece in a corner can have a tooth
													% so it's okay not to have a tooth on either side

% check the lists representing sides are compatible.
compatible_side([H1|T1],[H2|T2]) :- nand(H1,H2), sideFits(T1,T2). % check the top of lists (corners) NAND each other,
																 % then check rest of side fits

% check that the specified sides of two pieces fit
compatible([_,L1],S1,[_,L2],S2) :-
	
	getList(L1,S1,Teeth1),	% extract the side from the list of sides
	getList(L2,S2,Teeth2),	% extract other side.
	reverse(Teeth2,Teeth2R), % since teeth are enumerated clockwise, and edges align in opposite directions when they meet, one needs to be reversed
	compatible_side(Teeth1,Teeth2R). % check that they are compatible

% This predicate makes sure that a maximum of one value of the three is on.
threeXor(A,B,C) :- R is A + B + C, R < 2.

% Check that the first corner on each side are all compatible.
compatible_corner([_,L1],S1,[_,L2],S2,[_,L3],S3) :- 	getList(L1,S1,Teeth1), getList(L2,S2,Teeth2),
														getList(L3,S3,Teeth3), getList(Teeth1,0,F1),
														getList(Teeth2,0,F2), getList(Teeth3,0,F3),
														threeXor(F1,F2,F3).



% Solution predicate
% this simply enumerates the rules in the workbook.
solution([OP0,OP1,OP2,OP3,OP4,OP5]) :-
		compatible(OP0,2,OP1,0),
		compatible(OP0,3,OP2,0),
		compatible(OP1,3,OP2,1),
		compatible(OP0,1,OP3,0),
		compatible(OP1,1,OP3,3),
		compatible(OP1,2,OP4,0),
		compatible(OP2,2,OP4,3),
		compatible(OP3,2,OP4,1),
		compatible(OP4,2,OP5,0),
		compatible(OP2,3,OP5,3),
		compatible(OP0,0,OP5,2),
		compatible(OP3,1,OP5,1),
		compatible_corner(OP0,3,OP1,0,OP2,1),
		compatible_corner(OP0,2,OP1,1,OP3,0),
		compatible_corner(OP2,2,OP1,3,OP4,0),
		compatible_corner(OP3,3,OP1,2,OP4,1),
		compatible_corner(OP5,0,OP4,3,OP2,3),
		compatible_corner(OP5,1,OP4,2,OP3,2),
		compatible_corner(OP5,2,OP0,1,OP3,1),
		compatible_corner(OP5,3,OP0,0,OP2,0).



% For speed's sake, I've broken up the solution predicate into
% separate predicates that check that it is to valid to add each piece
% (I.E. check each piece against those that have been added already)
% All rules in solution/6 are in the union of the addn/(n+1) predicates

% Conversely, if one simply generated a permutation of the input pieces,
% generated an orientation for each, calculated the orientation on that piece
% and then called solution/6 on the piece, lots of unecessary permutations and 
% orientations would be calculated and tested. (eg if pieces a and b do not fit
% as pieces P0 and P1 in any way, that is that no edge of b, flipped or not, is
% compatitible with edge 2 of P0, then all possible orientations for b and the remaining
% four pieces will be calculated, when they will all fail.)

% Each addn predicate tests the sides and corners required to fit the nth piece other
% than the starting piece to the existing n pieces of the puzzle. 
% By testing addn/n+1 after generating an orientation, if that orientation fails,
% we cull the generation of orientations for all following pieces on that branch.


add1(P0,P1) :-
	compatible(P0,2,P1,0).

add2(P0,P1,P2) :-
	compatible(P0,3,P2,0),
	compatible(P1,3,P2,1),
	compatible_corner(P0,3,P1,0,P2,1).

add3(P0,P1,_,P3) :-
	compatible(P0,1,P3,0),
	compatible(P1,1,P3,3),
	compatible_corner(P0,2,P1,1,P3,0).

add4(_,P1,P2,P3,P4) :- 
	compatible(P1,2,P4,0),
	compatible(P2,2,P4,3),
	compatible(P3,2,P4,1),
	compatible_corner(P2,2,P1,3,P4,0),
	compatible_corner(P3,3,P1,2,P4,1).

add5(P0,_,P2,P3,P4,P5) :-
	compatible(P4,2,P5,0),
	compatible(P2,3,P5,3),
	compatible(P0,0,P5,2),
	compatible(P3,1,P5,1),
	compatible_corner(P5,0,P4,3,P2,3),
	compatible_corner(P5,1,P4,2,P3,2),
	compatible_corner(P5,2,P0,1,P3,1),
	compatible_corner(P5,3,P0,0,P2,0).


% simple implementation of the perm predicate

take([H|T],H,T).
take([H|T],V,[H|L]) :- take(T,V,L).

perm([],[]).
perm(L,[V|T]) :- take(L,V,S), perm(S,T).


puzzle([P0|Pieces],[[P0,0],[P1,Or1],[P2,Or2],[P3,Or3],[P4,Or4],[P5,Or5]]) :-
	perm(Pieces,[P1,P2,P3,P4,P5]), % fix P0 to be the first piece
	range(-4,4,Or1),				% here we lazily calculate orientations of each piece and try to add it
	orientation(P1,Or1,OP1),		% this culls off a lot of the state space and search tree, leading to better speed
	add1(P0,OP1),
	range(-4,4,Or2),				% It would also be possible to avoid the initial perm call and instead call "take"
	orientation(P2,Or2,OP2),		% before each "orientation" call on the remaining list, though the extra time taken
	add2(P0,OP1,OP2),			% to eagerly calculate the permutation for 6 elements is relatively small, and the 
	range(-4,4,Or3),				% solution is already found nearly instantaneously. To implement a repeated take solution
	orientation(P3,Or3,OP3),		% would require a new set of variables to represent the list of remaining pieces as it gets
	add3(P0,OP1,OP2,OP3),			% smaller, which would make this predicate even longer and more messy.
	range(-4,4,Or4),
	orientation(P4,Or4,OP4),
	add4(P0,OP1,OP2,OP3,OP4),
	range(-4,4,Or5),
	orientation(P5,Or5,OP5),
	add5(P0,OP1,OP2,OP3,OP4,OP5).




% wrapper predicate to quickly run the puzzle solver and print the Result
solve() :- puzzle( 
	[
		['74', [[1,1,0,0,1,0], [0,1,0,1,0,0], [0,1,0,0,1,0], [0,1,0,0,1,1]]],
		['65', [[1,1,0,0,1,1], [1,0,1,1,0,0], [0,0,1,1,0,0], [0,1,0,1,0,1]]],
		['13', [[0,1,0,1,0,1], [1,1,0,1,0,1], [1,1,0,0,1,1], [1,1,0,0,1,0]]],
		['Cc', [[0,0,1,1,0,0], [0,0,1,1,0,0], [0,1,0,0,1,0], [0,0,1,1,0,0]]],
		['98', [[1,1,0,0,1,0], [0,1,0,0,1,0], [0,0,1,1,0,0], [0,0,1,1,0,1]]],
		['02', [[0,0,1,1,0,0], [0,1,0,0,1,1], [1,0,1,1,0,0], [0,0,1,1,0,0]]]
	],[[P0,O0],[P1,O1],[P2,O2],[P3,O3],[P4,O4],[P5,O5]]),
	format('~w at ~w~n', [P0, O0]),
	format('~w at ~w~n', [P1, O1]),
	format('~w at ~w~n', [P2, O2]),
	format('~w at ~w~n', [P3, O3]),
	format('~w at ~w~n', [P4, O4]),
	format('~w at ~w~n', [P5, O5]).
