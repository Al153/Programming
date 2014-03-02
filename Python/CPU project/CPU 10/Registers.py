class Register_bank:
	def __init__(self,main_bus,Address_bus):
		self.main_bus = main_bus
		self.Address_bus = Address_bus
		flags = flag_register_set(main_bus,main_bus)
		self.registers = [
			Read_only_reg([0,0,0,0],main_bus),  #zero
			Read_only_reg([0,0,0,1],main_bus),  #one
			Register(main_bus,main_bus,4), 		#acc
			Register(main_bus,main_bus,4),		#Jump reg

			Register(main_bus,main_bus,4),		#program counter
			flags, #flags set
			flag_register_reset(main_bus,main_bus,flags), #flags reset
			Register(main_bus,main_bus,4),		#stack pointer
			Register(main_bus,main_bus,4),		#stack base

			Register(main_bus,main_bus,4),		#gp registers
			Register(main_bus,main_bus,4),
			Register(main_bus,main_bus,4),
			Register(main_bus,main_bus,4),
			Register(main_bus,main_bus,4),
			Register(main_bus,main_bus,4),
			Register(main_bus,main_bus,4)
		]

	def set(self):
		self.registers[self.Address_bus.data[0]&15].set()
	def enable(self):
		self.registers[self.Address_bus.data[0]&15].enable()

class Register:
	def __init__(self,input_bus,output_bus,size):
		self.input_bus = input_bus
		self.output_bus = output_bus
		self.data = [0]*size
		self.size = size
	def set(self):
		self.data = list(self.input_bus.data)

	def enable(self):
		self.output_bus.data  = list(self.data)

class flag_register_set: #a way of just setting individual bits
	def __init__(self,input_bus,output_bus):
		self.input_bus = input_bus
		self.output_bus = output_bus
		self.data = [0,0,0,0]

	def set(self):
		for i in xrange(4):
			self.data[i] |= self.input_bus.data[i] #inputs ORed

	def enable(self):
		self.output_bus.data = list(self.data)

class flag_register_reset:
	def __init__(self,input_bus,output_bus,base_register):
		self.base_register = base_register
		self.input_bus = input_bus
		self.output_bus = output_bus
		self.data = self.base_register.data

	def set(self):
		for i in xrange(4):
			self.base_register.data[i] &= self.input_bus.data[i]

	def enable(self):
		self.output_bus.data = list(self.base_register.data)		

class Read_only_reg:
	def __init__(self,value,output_bus):
		self.data = value
		self.output_bus = output_bus

	def set(self):
		pass #read only
	def enable(self):
		self.output_bus.data = list(self.data)