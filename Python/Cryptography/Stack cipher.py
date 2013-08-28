import BBSgenerator as RNG

class BinaryDistributor:
	def __init__(self,sheets):
		self.sheet_number = sheets
	def distribute(self,binary):
		for bit in binary:
			if bit == '1' and self.sheet_number%2 == 1:

			elif bit == '1' and self.sheet_number%2 == 0:

			elif bit == '0' and self.sheet_number%2 == 1:

			elif bit == '0' and self.sheet_number%2 == 0:
