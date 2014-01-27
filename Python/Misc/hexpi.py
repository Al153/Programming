import time
def pi_hexit(digit,accuracy):
	hexit = (4*10**accuracy/(8*digit +1) - 2*10**accuracy/(8*digit +4) - 1*10**accuracy/(8*digit +5) - 1*10**accuracy/(8*digit + 6))
	return hexit

def pi(accuracy):
	pi = 0
	for i in xrange(accuracy):
		pi += pi_hexit(i,accuracy)/16**(i)
	return pi
start = time.time()
print pi(5000)
print "took ",time.time()-start, "seconds"