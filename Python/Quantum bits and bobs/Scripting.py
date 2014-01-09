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
				[1,0,0,0],
				[0,0,1,0],
				[0,1,0,0],
				[0,0,0,1]
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

def slow_QTF(register):
	###################### Does not work ########################
	#performs a slow version of the QTF
	#constructs a qtf in steps (QTF[0:0]=>QTF[0:1]=>...=>QTF[0:n])
	for i in xrange(register.number_of_qubits):
		print i
		for j in xrange(i,1,-1):
			register.multi_qubit_op(bi_swap_gate,j) #this puts the new qubit at position 1

		for j in xrange(1,i):
			k = i-j #the variable for the controlled R_k gate
			controlled_R_k(register,j,k) #applies R_k trans
			register.multi_qubit_op(bi_swap_gate,j+1) #moves the new qubit back
		if i>0:
			print "i = ", i
			controlled_R_k(register,i-1,1)
		#print register.superposition
		register.multi_qubit_op(hadamard_gate,i) #applies a hadamard transform to the new qubit




def slow_QTF_2(register):
	############### Does work as far as I can tell
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




#deutsch_josza_algorithm(2,cnot_gate)

register = Quantum_computer.Qubit_system(3,{0:1})
#register.multi_qubit_op(hadamard_gate,0)
#register.multi_qubit_op(hadamard_gate,1)
#half_adder(register,0)
slow_QTF_2(register)
#register.multi_qubit_op(two_qubit_quantum_fourier_transform,0)

#slow_QTF(register)
print "register superposition = ",register.superposition
print "measured register = ",register.measure()


		