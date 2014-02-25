class ALU:
	def __init__(self,input_bus,output_bus,op_bus):
		self.input_bus = input_bus
		self.output_bus = output_bus
		self.op_bus = op_bus

		self.reg1 = 0
		self.reg2 = 0
		self.flags = 0



	def set_reg_1(self):
		self.flags = 0
		self.reg1 = 0
		for byte in self.input_bus.data:
			self.reg1 <<= 8
			self.reg1 += byte

	def set_reg_2(self):
		self.reg2 = 0
		for byte in self.input_bus.data:
			self.reg2 <<= 8
			self.reg2 += byte

	def enable_reg_1(self):
		for i in xrange(4):
			self.output_bus.data[i] = self.reg1&255
			self.reg1 >>= 8

	def enable_reg_2(self):
		for i in xrange(4):
			self.output_bus.data[i] = self.reg2&255
			self.reg2 >>= 8

	def enable_flags(self):
		self.output_bus.data = [0,0,0,self.flags]
		self.flags = 0

	def op(self):
		




	def Add(self):

	def Sub(self):

	def Mul(self):

	def Div(self):

	def Mod(self):

	def AND(self):

	def OR(self):

	def XOR(self):

	def NOT(self):

	def NAND(self):

	def NOR(self):

	def XNOR(self):

	def SHL(self):

	def SHR(self):

	def CMP(self):

