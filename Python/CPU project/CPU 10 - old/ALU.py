class ALU:
	def __init__(self,input_bus,output_bus,op_bus):
		self.input_bus = input_bus
		self.output_bus = output_bus
		self.op_bus = op_bus

		self.reg1 = 0
		self.reg2 = 0
		self.flags = 0

		self.ops = [
		self.Add,
		self.Sub,
		self.Mul,
		self.Div,
		self.Mod,
		self.AND,
		self.OR,
		self.XOR,
		self.NOT,
		self.NAND,
		self.NOR,
		self.XNOR,
		self.SHL,
		self.SHR,
		self.ADDc,
		self.SUBb
		]



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
			self.output_bus.data[3-i] = self.reg1&255
			self.reg1 >>= 8

	def enable_reg_2(self):
		for i in xrange(4):
			self.output_bus.data[i] = self.reg2&255
			self.reg2 >>= 8

	def enable_flags(self):
		self.output_bus.data = [0,0,0,self.flags]
		self.flags = 0

	def op(self):
		self.ops[self.op_bus.data[0]]()

	def Add(self):
		self.reg1 = self.reg1+self.reg2
		if self.reg1>4294967295:
			self.reg1 &= 4294967295
			self.flags = 16 #carry

	def Sub(self):
		self.reg1 = self.reg1-self.reg2
		if self.reg1<0:
			self.reg1 &= 4294967295
			self.flags = 8 #borrow

	def Mul(self):
		self.reg1 = self.reg1*self.reg2
		self.reg2 = self.reg1 >>32 #upper bytes
		self.reg1 &= 4294967295 #lower bytes

	def Div(self):
		if self.reg2 == 0:
			self.reg1 = 4294967295
			self.flags = 4 #division by 0
		else:
			self.reg1 //= self.reg2


	def Mod(self):
		if self.reg2 == 0:
			self.reg1 = 0
			self.flags = 4 #division by 0
		else:
			self.reg1 %= self.reg2

	def AND(self):
		self.reg1 &= self.reg2

	def OR(self):
		self.reg1 |= self.reg2
	def XOR(self):
		self.reg1 ^= self.reg2
	def NOT(self):
		self.reg1 ^= 4294967295

	def NAND(self):
		self.reg1 = (self.reg1&self.reg2)^4294967295

	def NOR(self):
		self.reg1 = (self.reg1|self.reg2)^4294967295

	def XNOR(self):
		self.reg1 = (self.reg1^self.reg2)^4294967295

	def SHL(self):
		self.reg1 = (self.reg1<<self.reg2)&4294967295

	def SHR(self):
		self.reg1 = (self.reg1>>self.reg2)&4294967295

	def ADDc(self):
		self.reg1 = self.reg1+self.reg2+1
		if self.reg1>4294967295:
			self.reg1 &= 4294967295
			self.flags = 16 #carry
	def SUBb(self):
		self.reg1 = self.reg1-self.reg2-1
		if self.reg1<0:
			self.reg1 &= 4294967295
			self.flags = 8 #borrow