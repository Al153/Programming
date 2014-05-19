class Super_int:
	def __init__(self,zahl):
		self.vorzeichen = (1 if zahl >= 0 else -1)
		self.zeicher = Super_int_korper(abs(zahl))

class Super_int_korper:
	def __init__(self,zahl):
		self.zahl = zahl&4294967295
		self.zeicher = (Super_int_korper(zahl>>32) if zahl>>32 else 0)

class Super_int_pool:
	def __init__(self,number):
		self.pool = Super_int(2**(32*number)).zeicher


def  add(Super_int1,Super_int2,pool)