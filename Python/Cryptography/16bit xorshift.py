import time
a = 0xf562
b = 0x1357
c = 0xeeee
d = 0xabcd
print "Begin"
start = time.time()
rounds = 2**5
for i in xrange(rounds):
	t = (a ^ (a<<5)^b)&65535
	a = b
	b = c
	c = d
	d = (d^(d>>3)^(t^(b>>2)))&65535
	print (a,b,c,d)
print "ended"
end = time.time()
print "time taken", end - start
i = raw_input("Press enter to end")
