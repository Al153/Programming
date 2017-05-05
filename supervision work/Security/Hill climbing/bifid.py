import cipher_tools 

class Properties():
	def __init__(self,):
		self.key_length = 6
		self.key_alphabet = "ABCDEFGHIKLMNOPQRSTUVWXYZ"  #no j
		self.preprocess = cipher_tools.preprocess
		

Properties = Properties()

def create_key_matrix(key):
	#"ABCDEFGHIJKLMNOPQRSTUVWXYZ/" means A = 000 B = 001 etc
	key = Properties.preprocess(key)

	forwards_lookup = {}
	backwards_lookup = {}
	for i in xrange(25):
		lookup_result = (i//5,i%5)
		forwards_lookup[key[i]] = lookup_result
		backwards_lookup[lookup_result] = key[i]
	return forwards_lookup,backwards_lookup

def create_blocks(text):
	if len(text)%2:
		text += 'X'
	return [text]


def encrypt_block(block,lookup,lookup_reverse):
	block = Properties.preprocess(block)
	row_1 = []
	row_2 = []
	for character in block:
		binary = lookup[character]
		row_1.append(binary[0])
		row_2.append(binary[1])
	row = row_1+row_2
	block = ''
	#print row
	#print row == zip(row[0::2], row[1::2])
	for bit_1,bit_2 in zip(row[0::2], row[1::2]):
		block += lookup_reverse[(bit_1,bit_2)]
		#print lookup_reverse[(bit_1,bit_2)],
	return block

def decrypt_block(block,lookup,lookup_reverse):
	block_length = len(block)
	row = []
	for character in block:
		row += lookup[character]
	row_1 = row[:block_length]
	row_2 = row[block_length:]


	block = ''
	for i in xrange(block_length):
		try:
			block += lookup_reverse[(row_1[i],row_2[i])]
		except IndexError:
			pass
	return block

def encrypt(text,key):
	lookup,lookup_reverse = create_key_matrix(key)
	text = encrypt_block(text,lookup,lookup_reverse)
	return text


def decrypt(text,key):

	lookup,lookup_reverse = create_key_matrix(key)
	text = decrypt_block(text,lookup,lookup_reverse)
	return text
	

