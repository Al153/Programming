guess = 2.0
x = 1000
for i in xrange(10):
	guess2 = x/guess
	guess = (guess + guess2)/2

print guess