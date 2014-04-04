def key_schedule(key):
	S_array = range(256)
	j = 0
	for i in xrange(256):
		#print j,S_array[i],key[i%len(key)]

		j = (j + S_array[i] + key[i%len(key)])%256
		temp = S_array[i]
		S_array[i] = S_array[j]
		S_array[j] = temp
	return S_array

class PRNG:
	def __init__(self,S_array):
		self.S_array = S_array
		self.i = 0
		self.j = 0
	def generate(self):
		self.i = (self.i+1)%256
		self.j = (self.j+self.S_array[self.i])%256
		self.swap()
		k = self.S_array[(self.S_array[self.i]+self.S_array[self.j])%256]
		return k
	def swap(self):
		temp = self.S_array[self.i]
		self.S_array[self.i] = self.S_array[self.j]
		self.S_array[self.j] = temp

def encrypt(key,plaintext):
	byte_key = [ord(char) for char in key]
	S_array = key_schedule(byte_key)
	generator = PRNG(S_array)
	for i in xrange(3072):
		generator.generate() #discard start of keystream
	return_string = ''
	for char in plaintext:
		print chr(ord(char)^generator.generate()),

encrypt("Key",['\xbb', '\xf3', '\x16', '\xe8', '\xd9', '@', '\xaf', '\n', '\xd3'])

#byte_key = [ord(char) for char in 'Key']
#S_array = key_schedule(byte_key)
#generator = PRNG(S_array)
#for i in xrange(256):
#	print generator.generate()