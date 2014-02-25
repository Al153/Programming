class Memory:
	def __init__(self,Address_bus,Data_bus,memory_dict):
		self.memory_dict = memory_dict
		self.Address_bus = Address_bus
		self.Data_bus = Data_bus

	def set(self):
		address = 0
		for byte in self.Address_bus.data:
			address<<=8 #shift up a byte
			address += byte
			
		for i in xrange(4):
			self.memory_dict[(address+i)%4294967296] = self.Data_bus.data[i]

	def enable(self):
		address = 0
		for byte in self.Address_bus.data:
			address += byte
			address<<=8 #shift up a byte
		for i in xrange(4):
			self.Data_bus.data[i] = self.memory_dict.get((address+i)%4294967296,0) 