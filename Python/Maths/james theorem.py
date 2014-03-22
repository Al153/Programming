def sieve_of_erasothenes(size):
	primes = [2,3,5]
	test = 6
	for i in xrange(size):
		index = 0
		while primes[index] >