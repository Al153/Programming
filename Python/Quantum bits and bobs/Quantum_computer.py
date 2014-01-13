import random
import math

def matrix_product(a,b):
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
			ab[i][j] = product_sum 
	return ab

def scalar_product(scalar,matrix): #multiplies each element in the matrix by the scalar
	result_matrix = [] 
	row = [0]*len(matrix[0]) #create a row list of the correct length
	for i in xrange(len(matrix)):
		result_matrix.append(list(row)) #add a row
		for j in xrange(len(matrix[i])):
			result_matrix[i][j] = matrix[i][j]*scalar #fills the row
	return result_matrix

def kronecker_product(transformation_matrix,identity_matrix):	#calculates kronecker product of two matrices, especially for mapping an n-qubit operation to n+1 qubits
	intermediate_matrix = []
	for i in xrange(len(transformation_matrix)): #i = row j = cloumn
		intermediate_matrix.append([])
		for j in xrange(len(transformation_matrix[i])):
			intermediate_matrix[i].append(scalar_product(transformation_matrix[i][j],identity_matrix)) #replaces each entry in the trans matrix with it's scalar product with the identity matrix
	#sorts it out - quite complicated as it needs to grab rows from the 4-d array formed in the last step
	result_matrix = []
	for i in xrange(len(transformation_matrix)): #row pointer in the outer matrix
		for j in xrange(len(identity_matrix)):        #row pointer in the inner matrix
			row = []
			for k in xrange(len(transformation_matrix[i])): #column pointer in the outer matrix
				row += intermediate_matrix[i][k][j] #collects terms
			result_matrix.append(row)
	return result_matrix

class Qubit_system: #creates an n-bit quantum computer (maximum n on a normal computer is about 15, ~8gb of ram or so, so don't go over)
	def __init__(self, number_of_qubits, start_state): #takes start state as a dict to save on space and time
		self.number_of_qubits = number_of_qubits
		self.max_state = 2**number_of_qubits #maximum state when treated as binary
		self.superposition = []
		for i in xrange(self.max_state): #fills up superposition from given states
			try:
				self.superposition.append([start_state[i]])
			except KeyError:
				self.superposition.append([0])
		self.superposition = self.superposition

	def measure(self):
		randomly_chosen_number = random.random() #float between 0 and 1
		lower_bound = 0 #sum of all tested states
		for i in xrange(self.max_state):
			lower_bound += abs(self.superposition[i][0])**2 #gets probability that will be this state
			if randomly_chosen_number < lower_bound:
				break #when this i is picked: stop
		for j in xrange(len(self.superposition)):
			if j == i:
				self.superposition[j][0] = 1
			else:
				self.superposition[j][0] = 0 #superposition collapses to a single state
 		return i

	def multi_qubit_op(self,transformation_matrix,start_qubit): #maps an operation on individual qubits to a full n-qubit system, start_qubit gives abulity to target a particular qubit
		identity_matrix = [
			[1,0],
			[0,1]				
			]
		full_trans_matrix = [[1]]
		transformation_size =int(math.log(len(transformation_matrix),2)) #number of qubits operated on, since a transormation matrix is 2^n x 2^n

		#build up correct logic grid
		for i in xrange(start_qubit):
			full_trans_matrix = kronecker_product(full_trans_matrix,identity_matrix)  #for each qubit before the starting qubit for the operation, current matrix = kronecker product of (identity,transformation matrix) 
		full_trans_matrix = kronecker_product(full_trans_matrix,transformation_matrix) #add in the actual transformation matrix
		for i in xrange(start_qubit+transformation_size,self.number_of_qubits): #for each qubit until the end, current matrix = kronecker product of (transformation matrix, identity) 
			full_trans_matrix =kronecker_product(full_trans_matrix,identity_matrix)
		self.superposition =matrix_product(full_trans_matrix,self.superposition) #apply completed transformation to the qubits