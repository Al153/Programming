def multiply(matrix,vector):
	return_vector = []
	return_vector[0] = (matrix[0][0]*vector[0]+matrix[0][1]*vector[1])%26
	return_vector[1] = (matrix[0][0]*vector[0]+matrix[0][1]*vector[1])%26
	return return_vector