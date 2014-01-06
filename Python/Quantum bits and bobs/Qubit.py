import random
import Quantum_logic_unit
import math

#class Qubit:
#	def __init__(self,start_state):
#		self.superposition = start_state
#
#	def update(self,new_state):
#		self.superposition = new_state
#
#	def sneaky_measure(self):
#		return self.superposition
#
#
#	def measure(self):
#		probability = abs(self.superposition[0])**2 #probability that it reverts to zero
#		if random.random()> probability:
#			self.superposition = (complex(0.0,0.0),complex(1.0,0.0)) #set superposition to 1
#		else:
#			self.superposition = (complex(1.0,0.0),complex(0.0,0.0)) #set superposition to 0
#		return self.superposition

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
			full_trans_matrix = Quantum_logic_unit.kronecker_product(full_trans_matrix,identity_matrix)
		full_trans_matrix = Quantum_logic_unit.kronecker_product(full_trans_matrix,transformation_grid)
		for i in xrange(start_qubit+transformation_size,self.number_of_qubits):
			full_trans_matrix =Quantum_logic_unit.kronecker_product(full_trans_matrix,identity_matrix)

		self.superposition = Quantum_logic_unit.quantum_logic_operation(self.superposition,full_trans_matrix)


#============================================= Scripting around Qubits ================

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

register = Qubit_system(3,{6:1})
register.multi_qubit_op(cnot_gate,0)
print "register superposition = ",register.superposition
print "measured register = ",register.measure()

		