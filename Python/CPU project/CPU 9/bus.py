class Bus:
	'''A generalised bus'''
	def __init__(self,byte_width):
		self.value = [0] *byte_width
		self.size = byte_width

	def put(self,data):
		self.value = data + [0]*(self.size-len(data))

	def read(self):
		return list(self.value)
