#import Getch
import sys

def bytify(binary):
	"""turns a number into bytes"""
	bytes = [0,0,0,0]
	i = 3
	while binary:

		bytes[i]  = binary&255
		binary >>= 8
		i -= 1 
	return bytes

class IO:
	def __init__(self,IO_bus,address_bus):
		#self.get_char = Getch._Getch
		self.IO_bus = IO_bus
		self.address_bus = address_bus


	def set(self):
		address = self.address_bus.data&255
		if address == 0: #char to terminal
			char = self.IO_bus.data&255
			sys.stdout.write(chr(char))
			sys.stdout.flush()
		elif address == 1: #raw to terminal
			data = self.IO_bus.data
			sys.stdout.write(str(data))
			sys.stdout.flush()