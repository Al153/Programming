import cmath
import math


def dft(X):
	N = len(X)
	return [sum([X[n]*cmath.exp(complex(0,-2*math.pi*k*n/N)) for n in xrange(N)])for k in xrange(N)]

print dft([1,0])