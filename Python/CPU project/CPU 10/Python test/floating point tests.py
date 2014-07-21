# 1 bit sign, 23 bits mantissa 8 bits mantissa, excess 128
#all numbers have an implicit 1
#a sign of 1 indicates negative numbers
#sme  - sign mantissa exponent

class Float:
	def __init__ (self, data):
		self.sign = (data>>31)&1                                  #top bit
		self.mantissa = (2**23)|((data>>8)&(2**23 -1))                  #next 8 bits
		self.exponent = data &255

	def pack(self):
		return ((self.sign&1)<<31)+((self.mantissa& (2**23   -1)) <<8) + self.exponent


def add(float1,float2):
	result_float = Float(0)  #creates a new float
	if float2.exponent > float1.exponent:                 #switches if float2 has a bigger exponent

		float1,float2 = float2,float1

	result_float.exponent = float1.exponent
	exponent_difference = float1.exponent - float2.exponent    #distance needed to be shifted
	float2.mantissa >>= exponent_difference

	if float1.sign != float2.sign:
		result_float.mantissa  = float1.mantissa - float2.mantissa
		if result_float.mantissa < 0:
			result_float.sign = 1-float1.sign
			result_float.mantissa = abs(result_float.mantissa)
		else:
			result_float.sign = float1.sign
	else:
		result_float.mantissa = float1.mantissa + float2.mantissa
		result_float.sign = float1.sign


	return normalize(result_float)

def subtract(float1,float2):
	result_float = Float(0)  #creates a new float
	float2.sign = 1-float2.sign
	if float2.exponent > float1.exponent:                 #switches if float2 has a bigger exponent

		float1,float2 = float2,float1

	result_float.exponent = float1.exponent
	exponent_difference = float1.exponent - float2.exponent    #distance needed to be shifted
	float2.mantissa >>= exponent_difference

	if float1.sign != float2.sign:
		result_float.mantissa  = float1.mantissa - float2.mantissa
		if result_float.mantissa < 0:
			result_float.sign = 1-float1.sign
			result_float.mantissa = abs(result_float.mantissa)
		else:
			result_float.sign = float1.sign
	else:
		result_float.mantissa = float1.mantissa + float2.mantissa
		result_float.sign = float1.sign


	return normalize(result_float)



def multiply(float1,float2):
	result_float = Float(0)
	result_float.sign = float1.sign^float2.sign
	#print float1.mantissa, float2.mantissa

	mult_result  = float1.mantissa * float2.mantissa
	mult_result2 = mult_result
	#print bin(mult_result)
	acc = mult_result>>32

	mult_result &= 2**32-1
	mult_result >>=23
	acc <<= 9
	mult_result |= acc
	mantissa_result = mult_result
	#mantissa_result = float1.mantissa *float2.mantissa
	#mantissa_result >>=23
	exponent_result = float1.exponent+float2.exponent-128
	#renormalizing:

	if mantissa_result >= 2**24:
		mantissa_result >>= 1
		exponent_result += 1

	if exponent_result>=256:  #set result to infinity
		exponent_result = 255
		mantissa_result = 2**24-1

	if exponent_result<0:    #set result to 0 (1*2**-128)
		exponent_result = 0
		mantissa_result = 2**23

	result_float.mantissa = mantissa_result
	result_float.exponent = exponent_result
	return result_float



def divide(float1,float2):
	result_float = Float(0)
	result_float.sign = float1.sign^float2.sign

	mantissa_result = (float1.mantissa<<23) / float2.mantissa


#calculating matissa result without shifting beyond 32bits
	mantissa_result2 = (((float1.mantissa<<8)/float2.mantissa)<<15)

	remainder = (((float1.mantissa<<8)%float2.mantissa)<<8)
	mantissa_result2 += (remainder/float2.mantissa)<<7
	remainder = (remainder %float2.mantissa)<<7
	mantissa_result2 += remainder/float2.mantissa






	exponent_result = float1.exponent-float2.exponent+128
	if exponent_result>=256:  #set result to infinity
		exponent_result = 255
		mantissa_result = 2**24-1

	if exponent_result<0:    #set result to 0 (1*2**-128)
		exponent_result = 0
		mantissa_result = 0

	result_float.mantissa = mantissa_result
	result_float.exponent = exponent_result
	return result_float

def normalize(float1):
	#normalises a float
	while float1.mantissa >= 2**24:
		float1.mantissa >>= 1
		float1.exponent += 1
	
	if float1.exponent >= 256:
		float1.exponent = 255
		float1.mantissa = 2**24 -1
		return float1

	while float1.mantissa < 2**23:
		float1.mantissa <<=1
		float1.exponent -=1
		if float1.exponent  < 0:
			return Float(0)
	
	if float1.exponent  < 0:
		return Float(0)

	return float1



#test script:
def display_float(float1):
	value = ((-1)**float1.sign) * (float1.mantissa&(2**24-1))*(2.0**(float1.exponent - 151))
	print value

def floatify(number):
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







def simpsons_rule(f,a,b,n):
	#integrates function f between the values a and b
	h = (b - a)/float(n)
	sample_points = [f(a + i*h)   for i in xrange(n+1)]
	scale = (lambda n,i: 1 if (i == 0) or (i == n) else (4 if i%2 else 2))
	scaled_sample_points = [scale(n,i)*sample_points[i] for i in xrange(n+1) ]
	summed_samples = sum(scaled_sample_points)
	return h/3.0 * summed_samples

def ln(x):
	return simpsons_rule((lambda a: 1.0/a),1,x,100)


def ln(x):
	u = x-1
	numerator = 1
	denominator = 0.0
	result = 0
	sign = -1
	for i in xrange(100):
		sign *= -1
		numerator *=u
		denominator += 1.0
		result += sign*numerator/denominator
	return result


def sin(x):
	total = x
	denominator = 1.0
	numerator = x
	for i in xrange(1,10):
		denominator *= (2*i) *(2*i +1)
		#print denominator
		numerator *= x**2
		total += (-1)**(i)*numerator/denominator
	return total

import math



def square_root(c,d):
	a_squared = (c + math.sqrt(c**2 + d**2))/2.0 
	a = math.sqrt(a_squared)
	return (a,d/(2.0*a)),(-a,d/(-2.0*a))

print square_root(1,1)
