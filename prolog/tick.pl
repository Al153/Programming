% 2.1

piece(['74', [[1,1,0,0,1,0], [0,1,0,1,0,0], [0,1,0,0,1,0], [0,1,0,0,1,1]]]).
piece(['65', [[1,1,0,0,1,1], [1,0,1,1,0,0], [0,0,1,1,0,0], [0,1,0,1,0,1]]]).
piece(['13', [[0,1,0,1,0,1], [1,1,0,1,0,1], [1,1,0,0,1,1], [1,1,0,0,1,0]]]).
piece(['Cc', [[0,0,1,1,0,0], [0,0,1,1,0,0], [0,1,0,0,1,0], [0,0,1,1,0,0]]]).
piece(['98', [[1,1,0,0,1,0], [0,1,0,0,1,0], [0,0,1,1,0,0], [0,0,1,1,0,1]]]).
piece(['02', [[0,0,1,1,0,0], [0,1,0,0,1,1], [1,0,1,1,0,0], [0,0,1,1,0,0]]]).

%2.2


rotate([A,B,C,D],[B,C,D,A]).
rotate(A,0,A).
rotate(A,N,A_out) :- M is N-1, rotate(A,B), rotate(B,M,A_out).

%2.3

reverse([],[],V).
reverse([H|T],L,V) :- reverse(T,RT,[H|V])


%2.4

xor(0,1).
xor(1,0).

%2.5

xorList([],[]).
xorList([H|T],[I|U]) :- xor(H,I), xorList(T,U).

%2.6

range(M,M,[]).
range(Min,Max,[Min|Range]) :- NewMin is Min + 1, range(NewMin,Max,Range).

% 3

flipped([Name,[A,B,C,D]],[Name,[AR,DR,CR,BR]]) :- reverse(A,AR), reverse(B,BR), reverse(C,CR),reverse(D,DR).


orientation([N,L],0,[N,L]).
orientation([N,L],Or,[N,L_New]) :- Or > 0. 
orientation([N,L],Or,[N,L_New]) :- Or < 0.