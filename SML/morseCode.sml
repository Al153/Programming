
datatype signal = Dit | Dah;
datatype trie =
	Lf0
	| Lf1 of char
	| Br0 of trie * trie
	| Br1 of char * trie * trie;



(* signal list * char -> trie -> trie *)
(* Adds a single sequence to the trie *)
fun update ([], c) Lf0 = Lf1(c) | (*Adding an empty sequence to an empty leaf yields a char bearing leaf *)
	update ([], c) (Lf1 _) = Lf1(c) | (* Replace the character*)
	update ([], c) (Br0(t1,t2)) = Br1(c,t1,t2) | (* just insert the character*)
	update ([], c) (Br1(_,t1,t2)) = Br1(c,t1,t2) |
	(* Now for when there's a sequence*)
	update ((Dit::signals),c) Lf0 = Br0( (update (signals,c) Lf0) ,Lf0) |  (*Keep searching to the left, add in some leaves to make the tree valid*)
	update ((Dah::signals),c) Lf0 = Br0(Lf0,(update (signals,c) Lf0))	|	(*ditto to the right*)

	update ((Dit::signals),c) (Lf1 v) = Br1(v, (update (signals,c) Lf0) ,Lf0) |  (*Same as above, but preserve the existing value*)
	update ((Dah::signals),c) (Lf1 v) = Br1(v, Lf0,(update (signals,c) Lf0))  |	

	update ((Dit::signals),c) (Br0(t1,t2)) = Br0((update (signals,c) t1),t2)  |	(* Need to search at least one more layer*)
	update ((Dah::signals),c) (Br0(t1,t2)) = Br0(t1,(update (signals, c) t2)) |

	update ((Dit::signals),c) (Br1(v,t1,t2)) = Br1(v,(update (signals,c) t1),t2)  |
	update ((Dah::signals),c) (Br1(v,t1,t2)) = Br1(v,t1,(update (signals, c) t2));

fun buildTrie [] t = t |
	buildTrie (seq::rest) t =
		let
			val newT = update seq t;
		in
		 	buildTrie rest newT
		 end;

datatype 'a option = 
	None 
	| Some of 'a;

fun lookup t [] =
		(
		case t of
					Lf0 => None
				|  	(Lf1(c)) => (Some c)
				|	(Br0(_,_)) => None
				| 	(Br1(c,_,_)) => (Some c)
	)
	| lookup t (Dit::signals) =
		(
			case t of
						Lf0 => None
					|	(Lf1 _) => None
					| 	(Br0(t1,_)) => lookup t1 signals
					| 	(Br1(_,t1,_)) => lookup t1 signals
		)
	| lookup t (Dah::signals) =
		(
			case t of
						Lf0 => None
					|	(Lf1(_)) => None
					| 	(Br0(_,t2)) => lookup t2 signals
					| 	(Br1(_,_,t2)) => lookup t2 signals
		)
	;