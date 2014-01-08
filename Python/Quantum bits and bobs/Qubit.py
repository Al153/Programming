import random
import Matrix_tools
import math

class Qubit_system:
	def __init__(self, number_of_qubits, start_state): #takes start state as a dict to save on space and time
		self.number_of_qubits = number_of_qubits
		self.max_state = 2**number_of_qubits
		self.superposition = [0]*self.max_state
		for i in xrange(self.max_state):
			try:
				self.superposition[i] = start_state[i]
			except KeyError:
				pass

	def update(self,new_state):
		self.superposition =new_state

	def measure(self):
		randomly_chosen_number = random.random() #float between 0 and 1
		lower_bound = 0 #sum of all tested states
		for i in xrange(self.max_state):
			lower_bound += abs(self.superposition[i])**2 #gets probability that will be this state
			if randomly_chosen_number < lower_bound:
				break
		self.superposition = [0]*self.max_state 
		self.superposition[i] = 1
		return i

	def multi_qubit_op(self,transformation_grid,start_qubit):
		identity_matrix = [
			[1,0],
			[0,1]				
			]
		full_trans_matrix = [[1]]
		transformation_size =int(math.log(len(transformation_grid),2)) #nbumber of qubits operated on

		#build up correct logic grid
		for i in xrange(start_qubit):
			full_trans_matrix = Matrix_tools.kronecker_product(full_trans_matrix,identity_matrix)
		full_trans_matrix = Matrix_tools.kronecker_product(full_trans_matrix,transformation_grid)
		for i in xrange(start_qubit+transformation_size,self.number_of_qubits):
			full_trans_matrix =Matrix_tools.kronecker_product(full_trans_matrix,identity_matrix)

		self.superposition = Matrix_tools.quantum_logic_operation(self.superposition,full_trans_matrix)


#============================================= Scripting around Qubits ================
def hadamard_logic(register): #applies a hadamard transform to every bit in a register
	hadamard_gate = [
				[1/math.sqrt(2), 1/math.sqrt(2)],
				[1/math.sqrt(2),-1/math.sqrt(2)]
				]
	for i in xrange(register.number_of_qubits):
		register.multi_qubit_op(hadamard_gate,i)

def half_adder(register,start_qubit):
	#requires states in order |a> Ab> |0>
	register.multi_qubit_op(toffoli_gate,start_qubit)
	register.multi_qubit_op(cnot_gate,start_qubit)




hadamard_gate = [
				[1/math.sqrt(2), 1/math.sqrt(2)],
				[1/math.sqrt(2),-1/math.sqrt(2)]
				]


pauli_x_gate =  [
				[0,1],
				[1,0]
				]

pauli_y_gate = [
				[0,-complex(0,1)],
				[complex(0,1),0]
				]

pauli_z_gate = [
				[1,0],
				[0,-1]
				]

identity_gate = [
				[1,0],
				[0,1]				
				]

cnot_gate     = [
				[1,0,0,0],
				[0,1,0,0],
				[0,0,0,1],
				[0,0,1,0]
				]

toffoli_gate = [
				[1,0,0,0,0,0,0,0],
				[0,1,0,0,0,0,0,0],
				[0,0,1,0,0,0,0,0],
				[0,0,0,1,0,0,0,0],
				[0,0,0,0,1,0,0,0],
				[0,0,0,0,0,1,0,0],
				[0,0,0,0,0,0,0,1],
				[0,0,0,0,0,0,1,0]
				]
bi_swap_gate =  [
				[]
				]
tri_swap_gate = [
				[1,0,0,0,   0,0,0,0],
				[0,0,0,0,   1,0,0,0],
				[0,0,1,0,   0,0,0,0],
				[0,0,0,0,   0,0,1,0],

				[0,1,0,0,   0,0,0,0],
				[0,0,0,0,   0,1,0,0],
				[0,0,0,1,   0,0,0,0],
				[0,0,0,0,   0,0,0,1]
				]
two_qubit_quantum_fourier_transform = Matrix_tools.scalar_product(0.5,[
																		[1,1,1,1],
																		[1,complex(0,1),-1,-complex(0,1)],
																		[1,-1,1,-1],
																		[1,-complex(0,1),-1,complex(0,1)]
																	])
def controlled_R_k(register,start_bit,k):
	gate = [
			[1,0,0,0],
			[0,1,0,0],
			[0,0,1,0],
			[0,0,0,math.e**((2*math.pi*complex(0.0,1.0))/2**k)]
	]
	register.multi_qubit_op(gate,start_bit)



def deutsch_josza_algorithm(n,gate_function):
	#inititialize register with correct state
	register = Qubit_system(n,{1:1})
	hadamard_logic(register)
	register.multi_qubit_op(gate_function,0)
	hadamard_logic(register)

	print "Register superposition = ", register.superposition
	print "result = ", register.measure()






#deutsch_josza_algorithm(2,cnot_gate)

register = Qubit_system(2,{0:1})
register.multi_qubit_op(hadamard_gate,0)
#hadamard_logic(register)
register.multi_qubit_op(two_qubit_quantum_fourier_transform,0)

print "register superposition = ",register.superposition
print "measured register = ",register.measure()

		