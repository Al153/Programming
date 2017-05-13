datatype 'a searchTree = (* An ML tree which only holds values at its leaves *)
	Lf of 'a
	| Br of 'a searchTree list;

val minInt = (* Equivalent of positive and negative infinity*)
			case Int.minInt of
				SOME x => x
				| NONE => 0;
val maxInt =
			case Int.maxInt of
				SOME x => x
				| NONE => 0;


fun min(a, b) = if a < b then a else b; (* Auxiliary funcitons *)
fun max(a, b) = if a > b then a else b;

	
fun takeDrop([], _) = ([], []) (* Splits a list by some number*)
	| takeDrop(xs, 0) =  ([], xs)
	| takeDrop((x::xs, n)) = 
		let
			val (front, back) = takeDrop(xs, n-1)
		in 
			(x::front, back)
		end;

fun
	player (Lf(v), _, _) = v (* At a leaf, return the value *)
	| player (Br(children), alpha, beta) =
		playerRound children minInt alpha beta	(* Otherwise do a prune at of the children*)
and
	opponent(Lf(v), _, _) = v (* Mirror function for the opponent *)
	| opponent (Br(children), alpha, beta) =
		opponentRound children maxInt alpha beta	
and
	playerRound [] value _ _ = value (* If we look at the children of the node.. no children -> return previous value*)
	| playerRound (child :: cs) value alpha beta =
		let
			val newVal = max(value, opponent(child, alpha, beta))
			val newAlpha = max(newVal, alpha)
		in
			if value > beta then value
			else playerRound cs newVal newAlpha beta
		end
and
	opponentRound [] value _ _ = value (* Mirror function to player round *)
	| opponentRound (child :: cs) value alpha beta =
		let
			val newVal = min(value, player(child, alpha, beta))
			val newBeta = min(newVal, beta)
		in
			if value < alpha then value
			else opponentRound cs newVal alpha newBeta
		end;

fun treeify [n] _ = Lf(n) (* Convert a list into a balanced binary tree *)
	| treeify ns len = 
		let
			val half = len div 2
			val (front, back) = takeDrop(ns, half);
		in
			Br([(treeify front half), (treeify back (len-half))])
		end;

val t1 = treeify [1, ~15, 2, 19, 18, 23, 4, 3] 8;
val t2 = treeify [2, 1, 7, 8, 9, 10, ~2, 5] 8;
val t3 = treeify [~1, ~30, 4, 7, 20, ~1, ~1, ~5] 8;
val tree = Br([t1, t2, t3]);
val a = minInt;
val b = maxInt;

player(tree, a, b)