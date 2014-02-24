done  = 0
i = 9
while not done:
	i += 1
	done = 1
	print i
	for n in xrange(1,11):
		if i%n 	!= (-1)%n:
			done = 0
			break
print i