class Register:
	def __init__(self,value):
		self.value = value
	def read(self):
		return self.value
	def write(self,value):
		self.value = value

class Bus:
	def __init__(self):
		self.data = 0


class ALU:
	def __init__(self):
		self.Accumulator = Register(0)
		self.inputBus = Bus()
		self.regBus = RNG.readBus
		self.enable = 0
	def run(self):
		if self.enable:
			self.inputBus.value = self.inputBus.value|self.regBus.value 


class RNG:
	def __init__(self,a,b,c,d,e,f,g,h):
		self.registers = (self.register(a),self.register(b),self.register(c),self.register(d),self.register(e),self.register(f),self.register(g),self.register(h))
		self.ALU = ALU()
		self.readBus = Bus()
		self.writeBus = Bus()
	def run(self,program):
		for line in program:
