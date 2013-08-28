class OutputUnit:
	def __init__(self):
		self.output_buffer = ''

	def output(self,word,output_value):
		if output_value:
			if word[0]:
				self.output_buffer += str(0-word[1])
			else:
				self.output_buffer += str(word[1])
		else:
			char1 = (word[1]&0xff00)>>8
			char2 = word[1]&0x00ff
			char1 = chr(char1)
			char2 = chr(char2)
			if char1 != "\n":
				self.output_buffer += char1
			else:
				print self.output_buffer
				self.output_buffer = ''
				
			if char2 != "\n":
				self.output_buffer += char2
			else:
				print self.output_buffer
				self.output_buffer = ''

