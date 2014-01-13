import math
import Quantum_computer

full_adder = [
			[1,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0],
			[0,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0],
			[0,0,0,0, 1,0,0,0, 0,0,0,0, 0,0,0,0],
			[0,0,0,0, 0,0,0,0, 0,1,0,0, 0,0,0,0],
			
			[0,0,0,0, 0,0,0,0, 0,0,1,0, 0,0,0,0],
			[0,0,0,1, 0,0,0,0, 0,0,0,0, 0,0,0,0],
			[0,0,0,0, 0,0,1,0, 0,0,0,0, 0,0,0,0],
			[0,0,0,0, 0,1,0,0, 0,0,0,0, 0,0,0,0],
			
			[0,0,1,0, 0,0,0,0, 0,0,0,0, 0,0,0,0],
			[0,1,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0],
			[0,0,0,0, 0,0,0,0, 0,0,0,1, 0,0,0,0],
			[0,0,0,0, 0,0,0,0, 0,0,0,0, 1,0,0,0],

			[0,0,0,0, 0,0,0,0, 0,0,0,0, 0,1,0,0],
			[0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,1,0],
			[0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,1],
			[0,0,0,0, 0,0,0,1, 0,0,0,0, 0,0,0,0]
]

hadamard_gate = [
				[1/math.sqrt(2), 1/math.sqrt(2)],
				[1/math.sqrt(2),-1/math.sqrt(2)]
				]


pauli_x_gate =  [ #implements a NOT gate
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

cnot_gate     = [ #implements an XOR gate
				[1,0,0,0],
				[0,1,0,0],
				[0,0,0,1],
				[0,0,1,0]
				]

toffoli_gate = [ #implements an AND gate when Q3 is |0>
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
				[1,0,0,0],
				[0,0,1,0],
				[0,1,0,0],
				[0,0,0,1]
				]
tri_swap_gate = [ # is Q1 Q2 Q3 ==> Q3 Q2 Q1
				[1,0,0,0,0,0,0,0],
				[0,0,0,0,1,0,0,0],
				[0,0,1,0,0,0,0,0],
				[0,0,0,0,0,0,1,0],
				[0,1,0,0,0,0,0,0],
				[0,0,0,0,0,1,0,0],
				[0,0,0,1,0,0,0,0],
				[0,0,0,0,0,0,0,1]
				]

half_adder_gate=[#implements a half adder in one gate 
				[1,0,0,0,0,0,0,0],
				[0,1,0,0,0,0,0,0],
				[0,0,1,0,0,0,0,0],
				[0,0,0,1,0,0,0,0],
				[0,0,0,0,0,0,1,0],
				[0,0,0,0,0,0,0,1],
				[0,0,0,0,0,1,0,0],
				[0,0,0,0,1,0,0,0]
				]

or_gate = 		[
				[0, 0, 0, 0, 0, 0, 1, 0],
				[0, 0, 0, 0, 0, 0, 0, 1],
				[0, 0, 0, 0, 0, 1, 0, 0],
				[0, 0, 0, 0, 1, 0, 0, 0],
				[0, 0, 0, 1, 0, 0, 0, 0],
				[0, 0, 1, 0, 0, 0, 0, 0],
				[0, 1, 0, 0, 0, 0, 0, 0],
				[1, 0, 0, 0, 0, 0, 0, 0]
				]
not_gate = [[0,1],[1,0]]

def reverse(register):
	#reverses the order of qubits in a system
	for i in xrange(register.number_of_qubits-1,-1,-1):
		for j in xrange(i):
			register.multi_qubit_op(bi_swap_gate,j)


two_qubit_quantum_fourier_transform =Quantum_computer.scalar_product(0.5,[
																		[1,1,1,1],
																		[1,complex(0,1),-1,-complex(0,1)],
																		[1,-1,1,-1],
																		[1,-complex(0,1),-1,complex(0,1)]
																	])

def hadamard_logic(register): #applies a hadamard transform to every bit in a register
	hadamard_gate = [
				[1/math.sqrt(2), 1/math.sqrt(2)],
				[1/math.sqrt(2),-1/math.sqrt(2)]
				]
	for i in xrange(register.number_of_qubits):
		register.multi_qubit_op(hadamard_gate,i)

def n_hadamard_logic(register,n):  #performs hadamard gate operations on n of qubits in a register
	hadamard_gate = [
				[1/math.sqrt(2), 1/math.sqrt(2)],
				[1/math.sqrt(2),-1/math.sqrt(2)]
				]
	for i in xrange(n):
		register.multi_qubit_op(hadamard_gate,i)

def half_adder(register,start_qubit):
	#requires states in order |a> b> |0> ==> |a> |(a+b)mod2> |(a+b)//2>
	register.multi_qubit_op(toffoli_gate,start_qubit)
	register.multi_qubit_op(cnot_gate,start_qubit)
def controlled_R_k(register,start_bit,k):
	#was for implementing a quantum fourier transform
	gate = [
			[1,0,0,0],
			[0,1,0,0],
			[0,0,1,0],
			[0,0,0,math.e**((2*math.pi*complex(0.0,1.0))/2**k)]
	]
	register.multi_qubit_op(gate,start_bit)



def deutsch_josza_algorithm(n,gate_function):
	#sort of finished, but haven't started testing yet
	#inititialize register with correct state
	register = Quantum_computer.Qubit_system(n,{1:1})
	hadamard_logic(register)
	register.multi_qubit_op(gate_function,0)
	n_hadamard_logic(register,n-1)

	print "Register superposition = ", register.superposition
	print "result = ", register.measure()//2 #removes bottom bit
	if register.measure()//2 == 1:
		print "function is balanced"
	else:
		print "function is constant"



def slow_QTF(register):
	############### Does work, but requires qubits to be reversed beforehand
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


def not_every_bit(register):
	maximum = 2**register.number_of_qubits
	line_template = [0]*maximum
	gate_matrix = []
	for i in xrange(maximum):
		new_line = list(line_template)
		new_line[maximum-1-i] = 1
		gate_matrix.applend(new_line)
	register.multi_qubit_op(gate_matrix,0)


#deutsch_josza_algorithm(2,cnot_gate)

register = Quantum_computer.Qubit_system(2,{0:1})

#register.multi_qubit_op(hadamard_gate,0)
#register.multi_qubit_op(hadamard_gate,1)
#half_adder(register,0)
slow_QTF_2(register)
register.multi_qubit_op(two_qubit_quantum_fourier_transform,0)

#register.multi_qubit_op(full_adder,0)
#register.multi_qubit_op(two_qubit_quantum_fourier_transform,0)

register.multi_qubit_op(hadamard_gate,0)
print "register superposition = ",register.superposition
register.multi_qubit_op(cnot_gate,0)

#register.multi_qubit_op(hadamard_gate,1)
#half_adder(register,0)
#slow_QTF(register)

#register.multi_qubit_op(two_qubit_quantum_fourier_transform,0)

print "register superposition = ",register.superposition
print "measured register = ",register.measure()
