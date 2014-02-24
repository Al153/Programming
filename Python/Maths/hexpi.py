import time
def pi_hexit(digit,accuracy):
	ten_pow = 10**accuracy
	hexit = (4*ten_pow/(8*digit +1) - 2*ten_pow/(8*digit +4) - ten_pow/(8*digit +5) - ten_pow/(8*digit + 6))
	return hexit

def pi(accuracy):
	pi = 0
	for i in xrange(accuracy):
		pi += pi_hexit(i,accuracy)/16**(i)
	return pi


def e(accuracy):
	numerator = 10**accuracy
	denominator =1
	estimate = numerator
	for i in xrange(1,accuracy):
		denominator*= i
		estimate += numerator/denominator
	return estimate

#start = time.time()
#
#
#result = pi(10000)
#print "took ",time.time()-start, "seconds"
#print "\n\n\n\n", result
