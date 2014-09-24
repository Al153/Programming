import math
#def fft(x,N,width,offset): #x is input, X is output
#	print N,width,offset
#	if N == 1:
#		return
#	else:
#		if N&1:
#			raise ValueError("N wmust be a power of 2")
#		
#		#divide and conquer
#		fft(x,N/2,width*2,offset+0)			#applies fft to even and odd arrays
#		fft(x,N/2,width*2,offset+width)
#		for k in xrange(N/2):
#			t = x[k*width+(offset+1)*width*2]*math.e**complex(0,-2*math.pi*k/N)
#			even_value = x[k*width*2+offset*width]
#			x[k*width +offset*width] = even_value + t
#			x[(k+N/2)*width +offset*width] = even_value - t
#		return 
#a =[1,0]
#fft(a,len(a),1,0)
#print a

from numpy.fft import fft
from numpy import array
a = array([1.0, 0.0])
print fft(a)
