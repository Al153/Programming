def append_bytes(byte_list):
	"""converts a list of bytes (such as on a bus) to a binary value"""
	result = 0
	for byte in byte_list:
		result<<=8
		result += byte
	return result
def bytify(binary):
	"""turns a number into bytes"""
	bytes = [0,0,0,0]
	i = 3
	while binary:
		bytes[i]  = binary&255
		binary >>= 8
		i -= 1 
	return bytes

class Memory:
	def __init__(self,Address_bus,Data_bus,memory_dict):
		self.memory_dict = memory_dict
		self.Address_bus = Address_bus
		self.Data_bus = Data_bus

	def set(self):
		address = self.Address_bus.data		
		bytes = bytify(self.Data_bus.data)
		for i in xrange(4):
			self.memory_dict[(address+i)&4294967295] = bytes[i]

	def enable(self):
		address = self.Address_bus.data
		bytes = [0,0,0,0]
		for i in xrange(4):
			bytes[i] = self.memory_dict.get((address+i)&4294967295,0)
		self.Data_bus.data = append_bytes(bytes) 


	def byte_set(self):
		address = self.Address_bus.data	
		self.memory_dict[self.Address_bus.data] = self.Data_bus.data&255


	def byte_enable(self):
		self.Data_bus.data = self.memory_dict.get(self.Address_bus.data,0)
				
	def word_set(self):
		high_byte, low_byte = (self.Data_bus.data>>8)&255,self.Data_bus.data&255
		self.memory_dict[self.Address_bus.data] = high_byte
		self.memory_dict[(self.Address_bus.data+1)&4294967295] = low_byte


	def word_enable(self):
		high_byte = self.memory_dict.get(self.Address_bus.data,0)
		low_byte = self.memory_dict.get((self.Address_bus.data+1)&4294967295,0)
		self.Data_bus.data = (high_byte<<8)+low_byte