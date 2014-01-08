import math

def quantum_logic_operation(state_vector,quantum_gate_matrix): #gate matrix is in form [[row1],[row2]...]
	if len(state_vector) != len(quantum_gate_matrix):
		pass
	else:
		result_vector = list(state_vector) #initialises a vector of the same length
		for i in xrange(len(result_vector)):
			iSum = 0
			for j in xrange(len(result_vector)):
				iSum += state_vector[j]*quantum_gate_matrix[j][i]
			result_vector[i] = iSum
		return result_vector

def get_bin(x):
	binary = []
	while x:
		binary.append(x%2)
		x = x >>2
	binary.reverse()
	return binary

def tensor_product(state_vector_array):
	result_array = [1]*2**len(state_vector_array) #initializes a vector array
	for i in xrange(2**len(state_vector_array)):
		binary = get_bin(i)

		for bit in bin:
			result_vector[i] *=state_vector_array[i][bit] #takes the coefficient for |1> or |0>
	return result_vector

def scalar_product(scalar,matrix): #multiplies each element in the matrix by the scalar
	result_matrix = []
	row = [0]*len(matrix[0]) #create a row of the correct length
	for i in xrange(len(matrix)):
		result_matrix.append(list(row)) #add a row
		for j in xrange(len(matrix[i])):
			result_matrix[i][j] = matrix[i][j]*scalar
	return result_matrix

def kronecker_product(transformation_matrix,identity_matrix):
	#calculates kronecker product of two matrices

	#goes through these stages:
	
	#creates a nested matrix 
	for i in xrange(len(transformation_matrix)): #i = row j = cloumn
		for j in xrange(len(transformation_matrix[i])):
			transformation_matrix[i][j] = scalar_product(transformation_matrix[i][j],identity_matrix)
	#sorts it out
	result_matrix = []
	for i in xrange(len(transformation_matrix)): #row pointer in the outer matrix
		for j in xrange(len(identity_matrix)):        #row pointer in the inner matrix
			row = []
			for k in xrange(len(transformation_matrix[i])): #column pointer in the outer matrix
				row += transformation_matrix[i][k][j] #collects terms
			result_matrix.append(row)
	return result_matrix






#for i in xrange(10):
#	q1 = Qubit.Qubit((complex(1,0),complex(0,0))) #initialises a qubit to |0>
#
#	q1.update(quantum_logic_operation(q1.superposition,identity_gate)) #apply a hadamard gate to the qubit
#
#
#	#q1.update(quantum_logic_operation(q1.superposition,pauli_x_gate))
#	#q1.update(quantum_logic_operation(q1.superposition,hadamard_gate))
#	print q1.sneaky_measure(),   #read the superposition without "measuring" it
#	print q1.measure()
#
#print "\n\npauli-x * identity: "
#print kronecker_product(pauli_x_gate,identity_gate)
