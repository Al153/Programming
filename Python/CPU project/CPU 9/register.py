class Register:
	def __init__(self,control_bus,data_bus,bytes):
		self.bytes = [0]*bytes
		self.byte_number = bytes
		self.control_bus = control_bus
		self.data_bus = data_bus
		
	def clock(self):
		field = self.control_bus.read()[0]>>4
		if self.control_bus.read()[0]&1: #if a write op
			self.write(self.data_bus.read(),field)
		else: #if a read op
			self.data_bus.write(self.read(field))

	def read(self,field):
		#			 lo    hi
		#register = [A,B,C,D]
		#field = [start,end(inclusive)]
		#read([1:3]) ==> [0,B,C,D]
		#read([3:1]) ==> [0,D,C,B]

		output_value = [0]*self.byte_number
		if field[0]=<field[1]+1:
			output_value[field[0]:field[1]+1] = self.bytes[field[0]:field[1]+1]
		else:
			output_value[field[0]:field[1]+1:-1] = self.bytes[field[0]:field[1]+1]
		return output_value

		
	def write(self,data,field):
		# input = [A,B,C,D]
		# byte  = [0,1,2,3]

		#write([1:2]) ==> [0,B,C,3]
		#write([2:1]) ==> [0,C,B,3]
		if field[0]=<field[1]+1:
			self.bytes[field[0]:field[1]+1] = data[field[0]:field[1]+1]
		else:
			self.bytes[field[0]:field[1]+1] = data[field[0]:field[1]+1:-1]

class Register_bank:
	'''An object containing all of the programmer-visible registers'''
	def __init__(self,register_control_bus,register_data_bus):
		self.data_bus,self.control_bus = register_data_bus,register_control_bus
		#______________________________________________general purpose registers___[0x00-0x0F]__________________
		self.registers = [register(self.control_bus,self.data_bus,4),register(self.control_bus,self.data_bus,4),
						  register(self.control_bus,self.data_bus,4),register(self.control_bus,self.data_bus,4),
						  register(self.control_bus,self.data_bus,4),register(self.control_bus,self.data_bus,4),
						  register(self.control_bus,self.data_bus,4),register(self.control_bus,self.data_bus,4),
						  register(self.control_bus,self.data_bus,4),register(self.control_bus,self.data_bus,4),
						  register(self.control_bus,self.data_bus,4),register(self.control_bus,self.data_bus,4),
						  register(self.control_bus,self.data_bus,4),register(self.control_bus,self.data_bus,4),
						  register(self.control_bus,self.data_bus,4),register(self.control_bus,self.data_bus,4),

		#_________________________________________________index registers__________[0x10-0x17]__________________										 
						  register(self.control_bus,self.data_bus,4),register(self.control_bus,self.data_bus,4),
						  register(self.control_bus,self.data_bus,4),register(self.control_bus,self.data_bus,4),
						  register(self.control_bus,self.data_bus,4),register(self.control_bus,self.data_bus,4),
						  register(self.control_bus,self.data_bus,4),register(self.control_bus,self.data_bus,4),

		#________________________________________________Special registers_________[0x18-0x1F]__________________
						  register(self.control_bus,self.data_bus,4), #rX [0x18]
						  register(self.control_bus,self.data_bus,4), #rR [0x19]
						  register(self.control_bus,self.data_bus,?), #rF [0x1A]
						  register(self.control_bus,self.data_bus,2), #rP [0x1B]
						  register(self.control_bus,self.data_bus,2), #rS [0x1C]
						  register(self.control_bus,self.data_bus,4), #sP [0x1D]
						  register(self.control_bus,self.data_bus,4), #sD [0x1E]
						  register(self.control_bus,self.data_bus,4)  #sS [0x1F]
						  ]
	
	def clock(self):
		control = self.control_bus.read() #reads control bus
		register_address =control [1]>>3 #5 bit address
		self.registers[register_address].clock() #clocks the register with the corresponding address



