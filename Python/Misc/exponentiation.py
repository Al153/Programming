def sqrt(x):
	guess = 2.0
	for i in xrange(20):
		guess2 = x/guess
		guess = (guess+guess2)/2
	return guess


def power_of(base,exponent):
	count = 0
	while int(exponent) != exponent and count<30:
		count += 1
		exponent *= 2
		base = sqrt(base)


	exponent = int(exponent)
	print base,exponent
	solution = 1

	while exponent:
		if exponent%2:
			solution *= base
		base **= 2
		exponent >>= 1

	return solution

print power_of(2,3.14159265359)