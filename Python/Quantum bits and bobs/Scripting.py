import math
import Quantum_computer

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

toffoli_gate = [ #implemens an AND gate when Q3 is |0>
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
tri_swap_gate = [ # is Q1 Q2 Q3 ==> Q3 Q2 Q1
				[1,0,0,0,   0,0,0,0],
				[0,0,0,0,   1,0,0,0],
				[0,0,1,0,   0,0,0,0],
				[0,0,0,0,   0,0,1,0],

				[0,1,0,0,   0,0,0,0],
				[0,0,0,0,   0,1,0,0],
				[0,0,0,1,   0,0,0,0],
				[0,0,0,0,   0,0,0,1]
				]
two_qubit_quantum_fourier_transform =Quantum_computer.scalar_product(0.5,[
																		[1,1,1,1],
																		[1,complex(0,1),-1,-complex(0,1)],
																		[1,-1,1,-1],
																		[1,-complex(0,1),-1,complex(0,1)]
																	])
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






deutsch_josza_algorithm(2,cnot_gate)

register = Quantum_computer.Qubit_system(2,{0:1})
#register.multi_qubit_op(hadamard_gate,0)
#register.multi_qubit_op(hadamard_gate,1)
#half_adder(register,0)

register.multi_qubit_op(two_qubit_quantum_fourier_transform,0)

print "register superposition = ",register.superposition
print "measured register = ",register.measure()


		