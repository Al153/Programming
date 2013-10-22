import cipher_tools

class Properties():
	def __init__(self):
		self.key_length = 26
		self.key_alphabet = "abcdefghijklmnopqrstuvwxyz"

Properties = Properties()


def create_lookup_tables(key):
	'''creates a pair of lookup tables for encryption and decryption'''
	alphabet = "abcdefghijklmnopqrstuvwxyz"
	encrypt_table = {}
	decrypt_table = {}
	for i in xrange(len(key)):
		encrypt_table[alphabet[i]] = key[i]
		decrypt_table[key[i]] = alphabet[i]
	return encrypt_table,decrypt_table

def encrypt(plaintext,key):
	plaintext = cipher_tools.preprocess(plaintext)
	encrypt_table,decrypt_table = create_lookup_tables(key)
	ciphertext = ''
	for char in plaintext:
		ciphertext += encrypt_table[char]
	return ciphertext

def decrypt(ciphertext,key):
	encrypt_table,decrypt_table = create_lookup_tables(key)
	plaintext = ''
	for char in ciphertext:
		plaintext += decrypt_table[char]
	return plaintext
