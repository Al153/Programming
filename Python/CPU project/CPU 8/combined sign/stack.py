class Stack:
	def __init__(self,flags,size):
		self.Flags = flags
		self.max_size = size
		self.stack = []
	def push(self,value):
		if len(self.stack) == self.max_size:
			del (self.stack[0])
			self.stack.append(value)
			self.Flags.write((1<<11),False,False)
		else:
			self.stack.append(value)

	def pop(self):
		if len(self.stack) == 0:
			self.Flags.write(1<<10,False,False)
			return (0)
		else:
			return self.stack.pop()