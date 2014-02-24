def modular_matrix_product(a,b,modulus):
	#a = m*n and b = n*q ab = m*q
	m = len(a)
	n = len(a[0])
	n2 = len(b)
	q = len(b[0])
	if n != n2:
		print "ERROR: matrices do not share side lengths"
		quit()
	ab = []
	ab_row = [0]*q 
	for i in xrange(m):
		ab.append(list(ab_row))  #initialise a matrix of correct size

	for i in xrange(m): #standard matrix_product
		for j in xrange(q):
			product_sum = 0
			for k in xrange(n):
				product_sum += a[i][k]*b[k][j]
			ab[i][j] = product_sum%modulus
	return ab

def modular_matrix_sum(a,b,modulus):
	result = []
	for i in xrange(len(a)):
		row = []
		for j in xrange(len(a[i])):
			row.append((a[i][j]+b[i][j])%modulus)
		result.append(row)
	return result

def rotate_martix(matrix):
	for i in xrange(len(matrix)):
		matrix[i] = matrix[i][1:]+matrix[i][:1]
	return matrix

def create_bytes(string):
	bytes = []
	for char in string:
		#print char
		bytes.append(ord(char))
	return bytes

def matrixify(bytes):
	#convert 16 bytes into a matrix
	matrix = []
	for i in xrange(4):
		matrix.append(bytes[i*4:i*4+4])
	return matrix

def matrixify_all(bytes):
	length = len(bytes)
	to_add = (16-length)%16
	bytes += [0]*to_add
	matrices = []
	for i in xrange(0,len(bytes),16):
		matrices.append(matrixify(bytes[i:i+16]))
	return matrices

def pi_to_matrix(start_bit): #create a starting number for digest
	pi = hexpi.pi((start_bit+512)/4) #creates pi to n bits
	pi = pi &(2**128-1) #extracts 128 bits
	bytes = []
	for i in xrange(16):
		bytes.append(pi&(255))
		pi >>= 8 
	return matrixify(bytes)


import hexpi
class Hash:
	def __init__(self):
		self.__digest_matrix = pi_to_matrix(0)

	hex_alphabet = ["0","1","2","3","4","5","6","7","8","9","a","b","c","d","e","f"]
	
	def add_to_digest(self,string):
		#print string
		bytes = create_bytes(string)
		matrices = matrixify_all(bytes)
		for matrix in matrices:
			self.add_to_digest_matrix(matrix)



	def add_to_digest_matrix(self,matrix): #can be extended with other transformations
		self.__digest_matrix = modular_matrix_sum(
								self.__digest_matrix,
								modular_matrix_product(matrix,self.__digest_matrix,256),
								256
							)
		self.__digest_matrix = modular_matrix_product(self.__digest_matrix,self.__digest_matrix,256)
		self.__digest_matrix = modular_matrix_sum(self.__digest_matrix,rotate_martix(self.__digest_matrix),256)

	def digest(self):
		result = ''
		bytes = []
		for row in self.__digest_matrix:
			bytes += row
		for char in bytes:
			#print char>>4
			result += self.hex_alphabet[char>>4]+self.hex_alphabet[char&15]

		return result

trial = Hash()
print trial.digest()
trial.add_to_digest("   ")
print trial.digest()