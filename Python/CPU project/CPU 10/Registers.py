class Register_bank:
	def __init__(self,main_bus,Address_bus):
		self.main_bus = main_bus
		self.Address_bus = Address_bus
		self.registers = [...]#need to add registers
	def set(self):
		self.registers[self.Address_bus[0]].set()
	def enable(self):
		self.registers[self.Address_bus[0]].enable()

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