# 1 bit sign, 23 bits mantissa 8 bits mantissa, excess 128
#all numbers have an implicit 1
#a sign of 1 indicates negative numbers
#sme  - sign mantissa exponent

class Float:
	def __init__ (self, data):
		self.sign = (data>>31)&1                                  #top bit
		self.mantissa = 2**24+(data>>8)&(2**23 -1)                  #next 8 bits
		self.exponent = data &255

	def pack(self):
		return ((self.sign&1)<<31)+((self.mantissa& (2**23   -1)) <<8) + self.exponent


def multiply(float1,float2):
	result_float = Float(0)
	result_float.sign = float1.sign^float2.sign

	mantissa_result = float1.mantissa *float2.mantissa
	exponent_result = float1.exponent+float2.exponent-128
	#renormalizing:
	mantissa_result >>=23


	if exponent_result>=256:  #set result to infinity
		exponent_result = 255
		mantissa_result = 2**24-1

	if exponent_result<0:    #set result to 0 (1*2**-128)
		exponent_result = 0
		mantissa_result = 0

	result_float.mantissa = mantissa_result
	result_float.exponent = exponent_result
	return result_float


#test script:
def display_float(float1):
	value = ((-1)**float1.sign) * float1.mantissa*(2.0**(float1.exponent - 151))
	print value

def floatify(number):
	print number
	if number == 0:
		return Float(0)

	if  number<0:

		sign = 1
	else:
		sign = 0

	number = abs(number)
	exponent = 128
	while number>=2:
		exponent += 1
		number /= 2.0
		if exponent >= 256:
			number = 1.9999998807907104
		 	exponent = 255
		 	break


	while number<1:

		exponent -= 1
		number *= 2.0
		if exponent < 0:
			number = 1
			exponent = 0
			break

	number *= 2**23
	number = int(number)

	return_float = Float(0)
	return_float.sign = sign
	return_float.mantissa = number
	return_float.exponent = exponent
	return return_float

five = floatify(2**200)
four = floatify(178.246563)

twenty = multiply(four,five)

display_float(twenty)



