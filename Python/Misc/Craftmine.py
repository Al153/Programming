#64 bit input, 64bit output


def right_rot(value,by): #rotates value by "by"
	return ((value>>by)|value<<(8-by))&255

def left_rot(value,by):
	return ((value<<by)|value>>(8-by))&255

class Unit:
	def __init__(self,right_shift,right_rot,left_shift,left_rot,special_value):
		self.right_shift = right_shift
		self.right_rot = right_rot
		self.left_shift = left_shift
		self.left_rot = left_rot
		self.special_value = special_value

	def mix(self,input_array):
		output_array = [0,0,0,0,0,0,0,0]
		output_array[0] = input_array[1]
		output_array[1] = input_array[2]
		output_array[2] = input_array[3]
		output_array[3] = input_array[4]
		output_array[4] = left_rot(input_array[5],self.left_rot)^input_array[4]
		output_array[5] = (input_array[6]+self.special_value)%256
		output_array[6] = (input_array[7]>>self.right_shift^input_array[6]<<self.left_shift)%256
		output_array[7] = right_rot(input_array[0],self.right_rot)^input_array[1]
		return output_array



inPut = input("Enter plaintext: ")
array = []
for i in xrange(8):
	array.append(inPut%256)
	inPut = inPut >>8

#initialize special values with psuedo random values: first eight bits of the square roots of prime numbers(from SHA-256)
a,b,c,d,e,f,g,h = 0x6a, 0xbb, 0x3c, 0xa5, 0x51, 0x9b, 0x1f, 0x5b

Unit_a = Unit(1,2,3,4,a)
Unit_b = Unit(1,2,3,5,b)
Unit_c = Unit(1,1,2,3,c)
Unit_d = Unit(1,3,6,3,d)
Unit_e = Unit(1,2,1,2,e)
Unit_f = Unit(5,6,7,0,f)
Unit_g = Unit(6,5,4,3,g)
Unit_h = Unit(1,3,5,7,h)

step1 =  Unit_h.mix(Unit_g.mix(Unit_f.mix(Unit_e.mix(Unit_d.mix(Unit_c.mix(Unit_b.mix(Unit_a.mix(array))))))))
step2 =  Unit_h.mix(Unit_g.mix(Unit_f.mix(Unit_e.mix(Unit_d.mix(Unit_c.mix(Unit_b.mix(Unit_a.mix(step1))))))))
print  Unit_h.mix(Unit_g.mix(Unit_f.mix(Unit_e.mix(Unit_d.mix(Unit_c.mix(Unit_b.mix(Unit_a.mix(step2))))))))



