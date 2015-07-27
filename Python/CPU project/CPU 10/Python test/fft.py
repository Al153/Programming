import cmath
import math


def dft(X):
	N = len(X)
	return [sum([X[n]*cmath.exp(complex(0,-2*math.pi*k*n/N)) for n in xrange(N)])for k in xrange(N)]

for x in dft([1,1,1,1,0,0,0,0]):
	print x