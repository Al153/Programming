import Quantum_computer
import math

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

two_qubit_quantum_fourier_transform = Quantum_computer.scalar_product(0.5,[
																		[1,1,1,1],
																		[1,complex(0,1),-1,-complex(0,1)],
																		[1,-1,1,-1],
																		[1,-complex(0,1),-1,complex(0,1)]
																	])

def apply_hadamard_all_qubits(register): #applies a hadamard transform to every bit in a register
	hadamard_gate = [
				[1/math.sqrt(2), 1/math.sqrt(2)],
				[1/math.sqrt(2),-1/math.sqrt(2)]
				]
	for i in xrange(register.number_of_qubits):
		register.multi_qubit_op(hadamard_gate,i)


def apply_hadamard_n_qubits(register,n):  #performs hadamard gate operations on n of qubits in a register
	hadamard_gate = [
				[1/math.sqrt(2), 1/math.sqrt(2)],
				[1/math.sqrt(2),-1/math.sqrt(2)]
				]
	for i in xrange(n):
		register.multi_qubit_op(hadamard_gate,i)



def deutsch_josza_algorithm(n,gate_function):
	#sort of finished, but haven't started testing yet
	#inititialize register with correct state
	register = Quantum_computer.Qubit_system(n,{1:1})
	apply_hadamard_all_qubits(register)
	register.multi_qubit_op(gate_function,0)
	apply_hadamard_n_qubits(register,n-1)

	print "Register superposition = ", register.superposition
	print "result = ", register.measure()//2 #removes bottom bit
	if register.measure()//2 == 1:
		print "function is balanced"
	else:
		print "function is constant"

two_qubit_quantum_fourier_transform =Quantum_computer.scalar_product(0.5,[
																		[1,1,1,1],
																		[1,complex(0,1),-1,-complex(0,1)],
																		[1,-1,1,-1],
																		[1,-complex(0,1),-1,complex(0,1)]
																	])
#________________ quantum fourier transform ___________
def slow_QTF(register):
	############### Does work, but has to reverse qubits
	reverse(register)
	n = register.number_of_qubits
	for i in xrange(n):
		new_qubit = n-1-i
		print new_qubit
		for j in xrange(new_qubit,n-2):
			register.multi_qubit_op(bi_swap_gate,j) 
		for j in xrange(n-2,new_qubit,-1):
			controlled_R_k(register,j,j+1)
			register.multi_qubit_op(bi_swap_gate,j-1)
		if i >0:
			controlled_R_k(register,new_qubit,1) #if this is the first iteration, skip
		register.multi_qubit_op(hadamard_gate,new_qubit)



def controlled_R_k_gate(k):  #create  a controlled rotation k gate
	gate = [
			[1,0,0,0],
			[0,1,0,0],
			[0,0,1,0],
			[0,0,0,math.e**((2*math.pi*complex(0.0,1.0))/2**k)]
	]
	return gate

def controlled_R_k(register,start_bit,k):
	#was for implementing a quantum fourier transform
	gate = controlled_R_k_gate(k)
	register.multi_qubit_op(gate,start_bit)

def reverse(register):
	#reverses the order of qubits in a system
	for i in xrange(register.number_of_qubits-1,-1,-1):
		for j in xrange(i):
			register.multi_qubit_op(bi_swap_gate,j)


#_______________________ end of quantum fourier transform tools

def not_every_bit(register):
	maximum = 2**register.number_of_qubits
	line_template = [0]*maximum
	gate_matrix = []
	for i in xrange(maximum):
		new_line = list(line_template)
		new_line[maximum-1-i] = 1
		gate_matrix.applend(new_line)
	register.multi_qubit_op(gate_matrix,0)

adder_low_bit = [
[1,0,0,0,  0,0,0,0,  0,0,0,0,  0,0,0,0],
[0,1,0,0,  0,0,0,0,  0,0,0,0,  0,0,0,0],
[0,0,1,0,  0,0,0,0,  0,0,0,0,  0,0,0,0],
[0,0,0,1,  0,0,0,0,  0,0,0,0,  0,0,0,0],

[0,0,0,0,  0,0,0,1,  0,0,0,0,  0,0,0,0],
[0,0,0,0,  1,0,0,0,  0,0,0,0,  0,0,0,0],
[0,0,0,0,  0,1,0,0,  0,0,0,0,  0,0,0,0],
[0,0,0,0,  0,0,1,0,  0,0,0,0,  0,0,0,0],

[0,0,0,0,  0,0,0,0,  1,0,0,0,  0,0,0,0],
[0,0,0,0,  0,0,0,0,  0,1,0,0,  0,0,0,0],
[0,0,0,0,  0,0,0,0,  0,0,1,0,  0,0,0,0],
[0,0,0,0,  0,0,0,0,  0,0,0,1,  0,0,0,0],

[0,0,0,0,  0,0,0,0,  0,0,0,0,  0,0,0,1],
[0,0,0,0,  0,0,0,0,  0,0,0,0,  1,0,0,0],
[0,0,0,0,  0,0,0,0,  0,0,0,0,  0,1,0,0],
[0,0,0,0,  0,0,0,0,  0,0,0,0,  0,0,1,0]
]



adder_high_bit = [
[1,0,0,0,  0,0,0,0,  0,0,0,0,  0,0,0,0],
[0,1,0,0,  0,0,0,0,  0,0,0,0,  0,0,0,0],
[0,0,1,0,  0,0,0,0,  0,0,0,0,  0,0,0,0],
[0,0,0,1,  0,0,0,0,  0,0,0,0,  0,0,0,0],

[0,0,0,0,  1,0,0,0,  0,0,0,0,  0,0,0,0],
[0,0,0,0,  0,1,0,0,  0,0,0,0,  0,0,0,0],
[0,0,0,0,  0,0,1,0,  0,0,0,0,  0,0,0,0],
[0,0,0,0,  0,0,0,1,  0,0,0,0,  0,0,0,0],

[0,0,0,0,  0,0,0,0,  0,0,1,0,  0,0,0,0],
[0,0,0,0,  0,0,0,0,  0,0,0,1,  0,0,0,0],
[0,0,0,0,  0,0,0,0,  1,0,0,0,  0,0,0,0],
[0,0,0,0,  0,0,0,0,  0,1,0,0,  0,0,0,0],

[0,0,0,0,  0,0,0,0,  0,0,0,0,  0,0,1,0],
[0,0,0,0,  0,0,0,0,  0,0,0,0,  0,0,0,1],
[0,0,0,0,  0,0,0,0,  0,0,0,0,  1,0,0,0],
[0,0,0,0,  0,0,0,0,  0,0,0,0,  0,1,0,0]
]

two_bit_adder = Quantum_computer.matrix_product(adder_high_bit,adder_low_bit)

def QTF_gate(number_of_qubits):
	N = 2**number_of_qubits
	'''Creates a QTF gate for N qubits'''
	scale = 1/math.sqrt(N) 
	omega = math.e**(complex(0.0,2*math.pi/N))  #primitive Nth root of unity

	gate_matrix = [[0]*N for i in xrange(N)]
	for i in range(N):
		for j in range(N):
			gate_matrix[i][j] = omega**(i*j)
	gate_matrix = Quantum_computer.scalar_product(scale,gate_matrix)
	return gate_matrix

quantum_register = Quantum_computer.Qubit_system(4,{0:1})
print quantum_register.state_vector
quantum_register.multi_qubit_op(QTF_gate(4),0)

print quantum_register.state_vector