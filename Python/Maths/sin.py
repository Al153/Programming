import math
def sine(x): 
	total = 0
	numerator = x
	denominator = 1
	for i in xrange(1,20):
		total += numerator/denominator
		numerator *= -(x**2)
		denominator *= (2*i)*(2*i+1)
		#print 2*i
		#print 2*i+1
	return total

for i in xrange(8):
	print sine((math.pi*i)/4.0)
