class Memory:
	def __init__(self,memory_dict,bMC,bMAD):
		self.memory_dict = memory_dict
		self.state = "ready"
		self.control_bus = bMC
		self.AD_bus = bMAD
		self.storage_register = [0]*4
		self.address_register = 0

	def clock(self):
		if self.state == "ready":
			

		elif self.state = "read":

		elif self.state = "write"



		
	def read(self,address):
		for i in xrange(4): #reads four bytes
			
			try:
				self.storage_register[i] = self.memory_dict[address]
			except:   #if a memory cell is not yet defined
				self.storage_register[i] = 0

	def write(self):
		for i in xrange(4):
			self.memory[self.address_register] = self.storage_register[i]
			self.address_register += 1


