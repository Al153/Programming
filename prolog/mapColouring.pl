adjacent(a,b).
adjacent(a,c).
adjacent(a,d).

adjacent(b,a).
adjacent(b,c).
adjacent(b,e).
adjacent(b,f).
adjacent(b,h).
adjacent(b,i).

adjacent(c,a).
adjacent(c,b).
adjacent(c,e).
adjacent(c,d).

adjacent(d,a).
adjacent(d,c).
adjacent(d,e).

adjacent(e,d).
adjacent(e,c).
adjacent(e,b).
adjacent(e,f).
adjacent(e,g).

adjacent(f,e).
adjacent(f,b).
adjacent(f,h).
adjacent(f,g).

adjacent(g,e).
adjacent(g,f).
adjacent(g,h).

adjacent(h,f).
adjacent(h,b).
adjacent(h,i).
adjacent(h,g).

adjacent(i,b).
adjacent(i,h).


isColour(red).
isColour(green).
isColour(blue).
isColour(yellow).

%try to colour in this order
colour(X,Colour, [(X,Colour)|_]) :- isColour(Colour).
colour(X,yellow).
colour(X,green).
colour(X,blue).

conflicted(Colouring) :-
	adjacent(X,Y),
	colour(X,Colour,Colouring),
	colour(Y,Colour,Colouring)