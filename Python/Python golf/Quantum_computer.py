import random,import math
def matrix_product(a,b):
	m,n,n2,q = len(a),len(a[0]),len(b),len(b[0])
	if n != n2:quit()
	ab,ab_row = [],[0]*q 
	for i in xrange(m):ab.append(list(ab_row))  #initialise a matrix of correct size
	for i in xrange(m): #standard matrix_product
		for j in xrange(q):
			product_sum = 0
			for k in xrange(n):product_sum += a[i][k]*b[k][j]
			ab[i][j] = product_sum 
	return ab
def scalar_product(scalar,matrix): #multiplies each element in the matrix by the scalar
	result_matrix,row = [],[0]*len(matrix[0]) #create a row list of the correct length
	for i in xrange(len(matrix)):
		result_matrix.append(list(row)) #add a row
		for j in xrange(len(matrix[i])):result_matrix[i][j] = matrix[i][j]*scalar #fills the row
	return result_matrix
def kronecker_product(transformation_matrix,identity_matrix):	#calculates kronecker product of two matrices, especially for mapping an n-qubit operation to n+1 qubits
	intermediate_matrix,result_matrix = [],[]
	for i in xrange(len(transformation_matrix)): #i = row j = cloumn
		intermediate_matrix.append([])
		for j in xrange(len(transformation_matrix[i])):intermediate_matrix[i].append(scalar_product(transformation_matrix[i][j],identity_matrix)) #replaces each entry in the trans matrix with it's scalar product with the identity matrix
	for i in xrange(len(transformation_matrix)): #row pointer in the outer matrix
		for j in xrange(len(identity_matrix)):        #row pointer in the inner matrix
			row = []
			for k in xrange(len(transformation_matrix[i])):row += intermediate_matrix[i][k][j] #collects terms
			result_matrix.append(row)
	return result_matrix
class Qubit_system: #creates an n-bit quantum computer (maximum n on a normal computer is about 15, ~8gb of ram or so, so don't go over)
	def __init__(self, number_of_qubits, start_state): #takes start state as a dict to save on space and time
		self.number_of_qubits,self.max_state,self.superposition = number_of_qubits,2**number_of_qubits,[[0]*2**number_of_qubits]
		for i in xrange(self.max_state): #fills up superposition from given states
			try:self.superposition[0][i] = start_state[i]
			except KeyError:pass
	def measure(self):
		randomly_chosen_number,lower_bound = random.random(),0 #float between 0 and 1
		for i in xrange(self.max_state):
			lower_bound += abs(self.superposition[0][i])**2 #gets probability that will be this state
			if randomly_chosen_number < lower_bound:break #when this i is picked: stop
		self.superposition = [[0]*self.max_state] 
		self.superposition[0][i] = 1 #superposition collapses to a single state
 		return i
	def multi_qubit_op(self,transformation_matrix,start_qubit): #maps an operation on individual qubits to a full n-qubit system, start_qubit gives abulity to target a particular qubit
		identity_matrix,full_trans_matrix,transformation_size = [[1,0],[0,1]],[[1]],int(math.log(len(transformation_matrix),2)) #number of qubits operated on, since a transormation matrix is 2^n x 2^n
		for i in xrange(start_qubit):full_trans_matrix = kronecker_product(full_trans_matrix,identity_matrix)  #for each qubit before the starting qubit for the operation, current matrix = kronecker product of (identity,transformation matrix) 
		full_trans_matrix = kronecker_product(full_trans_matrix,transformation_matrix) #add in the actual transformation matrix
		for i in xrange(start_qubit+transformation_size,self.number_of_qubits): full_trans_matrix =kronecker_product(full_trans_matrix,identity_matrix)
		self.superposition =matrix_product(self.superposition,full_trans_matrix) #apply completed transformation to the qubits