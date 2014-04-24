Struct Block           Next Size_left Top_of_block

	int Next Next
	int Size_left Size_left
	int Top_of_block Top_of_block

end Struct

#Algorithm for allocating
# . . . size ==> . . . pointer

#function allocate(size):
#	current_block = block0

#	while current_block.next != Null do
#		if size <= current_block.size_left do
#			current_block.size_left -= size
#			current_block.Top_of_block -= size
#			return current_block.Top_of_block
#		endif 
#		current_block = current_block.next
#	loop
#	return Failure




Block Block0 0  65536 0

Pop gp0  				%allocate.init_block
Load gp1 4 [gp0]
ADD gp1 gp0
ADD gp1 @12
Store gp1 8[gp0]
Return


def current_block gp0
def size gp1
def next gp2


Pop size  														    %Allocation.allocate
Load current_block Block0
Load next 0 [current_block]


if next then Load PC 				Allocation.allocate_loop
Load PC  							Allocation.allocate_return_failure




Compare size 4 [current_block] 										%Allocation.allocate_loop
if Less then Load PC 				Allocation.allocate_return_success
Compare size 4 [current_block]     
if Equal then Load pc               Allocation.allocate_return_success
Load current_block 0 [current_block]
if current_block then Load PC 		Allocation.allocate_loop
Load PC 							Allocation.allocate_return_failure




			Push Zero    									              		%Allocation.allocate_return_failure
			Return

			Load gp2 4 [current_block]											%Allocation.allocate_return_success
			SUB gp2 size
			Store gp2 4 [current_block]
			Load gp2 8 [current_block]
			SUB gp2 size
			Store gp2 8 [current_block]
			Push gp2
			Return