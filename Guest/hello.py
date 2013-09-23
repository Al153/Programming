import time

start = time.time()

lines = 0
while lines < 50000:
	#print "hello world ",lines," :D"
	a =3+4**5&5
	lines = lines+1

print time.time()-start