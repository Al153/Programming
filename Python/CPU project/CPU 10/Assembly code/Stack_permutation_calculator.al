Struct linked_list value pointer
	int value pointer
	int pointer pointer
end Struct

array stack 64 []
array input 64 []
array permutation 64 []


int stack_pointer 0
int input_pointer 0
int permutation_pointer 0




	Load gp2 stack_pointer   %permutation_step
	Load gp3 permutation_pointer
	Load gp0 stack [gp2]
	Load gp1 permutation [gp3]

	Compare gp0 gp1
	if Equal then Load PC pop_from_stack





SUB gp2 One  %pop_from_stack
ADD gp3 One
Store gp2 stack_pointer
Store gp3 permutation_pointer

