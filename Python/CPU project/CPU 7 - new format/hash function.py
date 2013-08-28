def right_rot(value,by):
	return (value>>by)|(value<<16-by)&0xffff

def left_rot(value,by):
	return (value<<by)|(value>>16-by)&0xffff

#initialize values: 8*16bits
a,b,c,d,e,f,g,h = 0x6a09, 0xbb67, 0x3c6e, 0xa54f, 0x510e, 0x9b05, 0x1f83, 0x5be0

#input
to_hash = [0x0]*8

#expand to 16bit input
for i in xrange(8,16):
	t = (to_hash[i-5]>>3)^right_rot(to_hash[i-5],5)^to_hash[i-8]
	s = (to_hash[i-7]<<10)^left_rot(to_hash[i-7],8)^to_hash[i-1]
	to_hash.append((t+s+to_hash[i-6])&0xffff)



for i in xrange(16):
	t = (to_hash[i]<<9)^a
	s = right_rot(to_hash[i],3)^left_rot(to_hash[i],6)
	temp = (a + b + e + to_hash[i] + t + s)&0xffff

	a = b
	b = c
	c = d
	d = e
	e = f
	f = g
	g = h
	h = temp

print hex(a),hex(b),hex(c),hex(d),hex(e),hex(f),hex(g),hex(h)







