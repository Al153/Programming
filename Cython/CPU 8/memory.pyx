class Memory:
	def __init__(self,memory_to_load,index_register):
		self.mem_array = memory_to_load + [(0,0)]*(65536-len(memory_to_load))
		self.index = index_register
		#print self.mem_array[:50]

	def read(self,address,clear_flag,abs_flag):
		index = self.index.value[1]*((-1)**self.index.value[0])
		address = (address+index)&0xffff
		out = self.mem_array[address]
		if abs_flag:
			out = (0,out[1])
		if clear_flag:
			self.mem_array[address] = (0,0)
		return out

	def write(self,address,data,keep_dest_sign):
		index = self.index.value[1]*((-1)**self.index.value[0])
		address = (address+index)&0xffff
		if keep_dest_sign:
			self.mem_array[address] = (self.mem_array[address][0],data[1])
		else:
			self.mem_array[address] = data 
