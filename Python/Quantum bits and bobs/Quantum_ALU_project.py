import Quantum_computer
import copy
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

tri_not_gate = [
				[0,0,0,0,0,0,0,1],
				[0,0,0,0,0,0,1,0],
				[0,0,0,0,0,1,0,0],
				[0,0,0,0,1,0,0,0],
				[0,0,0,1,0,0,0,0],
				[0,0,1,0,0,0,0,0],
				[0,1,0,0,0,0,0,0],
				[1,0,0,0,0,0,0,0]

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


rotate_gate = [ [1, 0, 0, 0, 0, 0, 0, 0],
				[0, 0, 1, 0, 0, 0, 0, 0],
				[0, 0, 0, 0, 1, 0, 0, 0],
				[0, 0, 0, 0, 0, 0, 1, 0],
				[0, 1, 0, 0, 0, 0, 0, 0],
				[0, 0, 0, 1, 0, 0, 0, 0], 
				[0, 0, 0, 0, 0, 1, 0, 0], 
				[0, 0, 0, 0, 0, 0, 0, 1]]

swap =        [
				[1,0,0,0],
				[0,0,1,0],
				[0,1,0,0],
				[0,0,0,1]
				]



Identity_gate = [[1,0],[0,1]]
first_half_adder_gate = copy.deepcopy(half_adder_gate)
for i in xrange(2):
	first_half_adder_gate = Quantum_computer.kronecker_product(first_half_adder_gate,Identity_gate)
	rotate_gate = Quantum_computer.kronecker_product(Identity_gate,rotate_gate)

half_adder_and_rotate = Quantum_computer.matrix_product(first_half_adder_gate,rotate_gate)
half_adder_and_rotate = Quantum_computer.kronecker_product(half_adder_and_rotate,Identity_gate)

second_half_adder = Quantum_computer.kronecker_product(Identity_gate,half_adder_gate)
for i in xrange(2):
	second_half_adder = Quantum_computer.kronecker_product(second_half_adder,Identity_gate)
#print len(second_half_adder)
#print len(half_adder_and_rotate)
half_adder_rotate_and_second_half_adder = Quantum_computer.matrix_product(half_adder_and_rotate, second_half_adder)
print half_adder_rotate_and_second_half_adder

or_gate = Quantum_computer.matrix_product(tri_not_gate,toffoli_gate)
for i in xrange(3):
	or_gate = Quantum_computer.kronecker_product(Identity_gate,or_gate)

full_adder = Quantum_computer.matrix_product(half_adder_rotate_and_second_half_adder,or_gate)
print "\n\n\n", full_adder

in_buffer = copy.deepcopy(swap)
for i in xrange(2):
	in_buffer = Quantum_computer.kronecker_product(Identity_gate,in_buffer)
for i in xrange(2)
	in_buffer = Quantum_computer.kronecker_product(in_buffer,Identity_gate)

I_swap = Quantum_computer.kronecker_product(Identity_gate,swap)
swap_I = Quantum_computer.kronecker_product(swap,Identity_gate)

out_buffer_1 = Quantum_computer.matrix_product(I_swap,swap_I)

IIII_swap = copy.deepcopy(swap)
for i in xrange(4):
	IIII_swap = Quantum_computer.kronecker_product(Identity_gate,IIII_swap)
III_swap_I = copy.deepcopy(swap)
for i in xrange(3):
	III_swap_I = Quantum_computer.kronecker_product(Identity_gate,III_swap_I)
III_swap_I = Quantum_computer.kronecker_product

