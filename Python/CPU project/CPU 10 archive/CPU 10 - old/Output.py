import Getch
import sys

def append_bytes(byte_list):
	"""converts a list of bytes (such as on a bus) to a binary value"""
	result = 0
	for byte in byte_list:
		result<<=8
		result += byte
	return result

class IO:
	def __init__(self,IO_bus,address_bus):
		self.get_char = Getch._Getch
		self.IO_bus = IO_bus
		self.address_bus = address_bus


	def set(self):
		address = self.address_bus.data[0]
		if address == 0: #screen
			for char in self.IO_bus.data:
				print chr(char),
				sys.stdout.write('')
