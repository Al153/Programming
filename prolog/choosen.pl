chooseN([],0,[]).
chooseN([H|T],N,[H|T2]) :- M is N-1, chooseN(T,M,T2).
chooseN([_|T],N,L) :- chooseN(T,N,L).