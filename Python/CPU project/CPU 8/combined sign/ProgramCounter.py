class PC:
	def __init__(self,memory,index_register):
		self.memory = memory.mem_array
		self.pos = 0
		self.index = index_register
	def advance(self):
		out = (self.memory[self.pos],self.memory[(self.pos+1)&0xffff])
		self.pos = (self.pos+2)&0xffff
		return out
	def jump(self,value,jmp_abs):
		old_pos = self.pos
		if jmp_abs:
			self.pos = (self.pos+abs(value))&0xffff
		else:
			self.pos = (self.pos + value)&0xffff

	def goto(self,value,include_index_register):
		if include_index_register:
			index = self.index.value
		else:
			index = 0
		self.pos = (value+index)&0xffff

