// _____________________ RC4 implementation ___________________

VARIABLE i
VARIABLE j
0 i ! 0 j ! // init i and j
256 2 >> TABLE SArray // create a state array

VARIABLE kLen 0 kLen !
VARIABLE kAddr 0 kAddr !

: getKC kLen @ % kAddr @ char[@] ;

: @i i @ ;
: @j j @ ;
: asByte 255 & ;
: reset_ij 0 i ! 0 j ! ;
: update_i i @ 1 + i ! ;
: getC SArray char[@] ;
: setC SArray char[!] ;
: update_j @j @i getC + asByte j ! ;
: initStep DUP setC ;

: l_cndtion 256 < ;
: l_next 1 + ;

: .sArray 0 [ getA l_cndtion ] [ getA l_next ] [ : .sChar getC .h TAB ; getA .sChar ] FOR ;

: do_swap
	@j getC
	@i getC @j setC
	@i setC
;

: kSchStep DROP @j @i getC @i getKC + + asByte j !  do_swap update_i ;

: testing 	256 min kLen ! kAddr ! // test word for RC4 key schedule 
	0 [ getA l_cndtion ] [ getA l_next ] [ getA initStep ] FOR // sets array to 0 1 2 3 4 5 ... 255
	.sArray
;

: RC4_init  // ( KeyAddr Keylen -- )
	256 min kLen ! kAddr !
	0 [ getA l_cndtion ] [ getA l_next ] [ getA initStep ] FOR // sets array to 0 1 2 3 4 5 ... 255
	reset_ij
	0 [ getA l_cndtion ] [ getA l_next ] [ getA kSchStep ] FOR // runs key
	reset_ij
	kLen 0 ! kAddr 0 ! // clears key and keyAddress variables
;

: RC4_byte
	update_i update_j
	do_swap
	@i getC @j getC + asByte getC
;


VARIABLE PT_ADDR
VARIABLE PT_LEN
: pt_len PT_LEN @ ;
: pt_addr PT_ADDR @ ;

: RC4_encr // ( plaintext length key length --) encrypts a piece of plaintext
	RC4_init
	PT_LEN ! PT_ADDR !
	0 0 pt_len < while // 0
		DUP pt_addr char[@] // i pt[i]
		RC4_byte ^ OVER pt_addr char[!] // i
		1 + DUP pt_len < // i+1 ?(i+1< pt)
	loop DROP
;


2 ALLOC CONST kArray
1 kArray 0 char[!]
2 kArray 1 char[!]
3 kArray 2 char[!]
4 kArray 3 char[!]
5 kArray 4 char[!]

kArray 5 RC4_init

RC4_byte .h TAB RC4_byte .h TAB RC4_byte .h TAB