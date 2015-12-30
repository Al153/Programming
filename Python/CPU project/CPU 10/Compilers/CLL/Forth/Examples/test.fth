// __________________________ TEST CODE _________________________________


// building a naive recursive fibonacci number generator

VARIABLE fibRec

: fib DUP DUP 1 = SWAP 0 = | if DROP 1 else DUP 1 -  fibRec @ EXEC SWAP 2 - fibRec @ EXEC + then ;
getA fib fibRec !

1 fib CR . CR .s

// another way to do recursion

: facDummy [ : fact ." I'm a dummy function!" ; 0 ] OVER = if DROP 1 else DUP 1 - fact * then ;
getA facDummy getA fact swapCode

3 fact .

// testing for loop:

: i . ;
: n 1 + ;
: p 10 < ;

0 getA p getA n getA i FOR



