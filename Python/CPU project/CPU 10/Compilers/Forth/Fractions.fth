using std.hlib 			#contains standard built-in words

4 6     3 4    add_fractions SWAP . CR .  #main program: prints the sum of 2/3 and 3/4
: add_fractions 
#inputs of numerator1, denominator1, numerator2, denominator2
	int numerator1 0					#define variables
	int numerator2 0
	int denominator1 0
	int denominator2 0

	*denominator2 POP	*numerator2 POP 					#get two fractions
	*denominator1 POP	*numerator1 POP

	numerator1 denominator2 * numerator2 denominator1 * +   #calculates result numerator
	denominator1 denominator2 * 							#calculate result denominator

	#stack now contains result_num, result_denom
	simplify 		#simplifies fraction
;

: simplify
	int numerator 0
	int denominator 0

	*denominator POP *numerator POP
	numerator denominator GCD
	DUP

	numerator SWAP / SWAP
	denominator SWAP /
	
;

: GCD 
#gcd = b if (a == 0) else gcd(b mod a, a)
#stack = . . . b a
	int a 0
	DUP 0 = if
		DROP #if a == 0 then return b
	else
		DUP #else return GCD(b mod a, a)
		*a POP
		% a SWAP
		GCD
	endif
;
