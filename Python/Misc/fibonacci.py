def fib(n):
	fibonacci = [1,1]
	for k in xrange(2,n+1):
		fibonacci.append(fibonacci[k-2]+fibonacci[k-1])
	return fibonacci[n]

for i in xrange(10):
	print fib(i)
