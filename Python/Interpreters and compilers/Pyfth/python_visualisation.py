def mexp(base, exponent, modulus):
	result = 1
	while exponent > 0:
		bit = exponent%2
		exponent /= 2
		if bit:
			result = (result*base)%modulus
		base = (base**2)%modulus
	return result

print mexp2(1300,1000,323232323) #should be 1
print mexp(1300,1000,323232323)
print mexp2(2,3,7)#should be 1
print mexp2(6,30,10)#should be 6


