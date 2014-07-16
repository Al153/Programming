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


def multiply(float1,float):
	result_float = Float(0)
	result_float.sign = float1.sign^float2.sign

	mantissa_result = float1.mantissa *float2.mantissa
	exponent_result = float1.exponent+float2.exponent-128
	#renormalizing:
	while mantissa_result >2**23:
		mantissa_result >>= 1
		exponent_result += 1

	if exponent_result>=256:  #set result to infinity
		exponent_result = 255
		mantissa_result = 2**24-1

	result_float.mantissa = mantissa_result
	result_float.exponent = exponent_result


#test script:
def display_float(float):
	



