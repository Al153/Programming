#node_struct
#(order,arcs,value)

int node3 0
int node3_value 1

int node4 0
int node4_value 4

int node5 0
int node5_value 6

int node6 0
int node6_value 8

#-----------------------------------------

int node2 2
int node2_arc1 @node3
int node2_arc2 @node4
int node2_value 3

int node1 2
int node1_arc1 @node5 
int node1_arc2 @node6
int node1_value 7

#-----------------------------------------

int node0 2
int node0_arc1 @node2
int node0_arc2 @node1 
int node0_value 5

int node_pointer @node0


int test_node @node0
int target 8
int 4 4

ptr check_node
ptr Halt
ptr Halt_root

def Search_for gp1
def test gp2
def order gp3
def Node_address gp0


#init

Load Search_for @target
Load Node_address @test_node


Load order 0 [Node_address]				%check_node #get node order
Compare order Zero
	if Equal then Load PC @Halt_root

ADD order One
MUL order @4
ADD order Node_address 						#address of data at node

Compare Search_for 0 [order]				#get data at node
	if Equal then Load PC @Halt
Compare Search_for 0 [order]
	if Greater then ADD Node_address @4
ADD Node_address @4						#add one for 	
Load Node_address 0 [Node_address] 			#find new node

Load PC @check_node							#check new node









Load gp0 0 [order] %Halt
Move order gp1
Move Zero gp2
Move Zero gp3
Halt

ADD Node_address @4 %Halt_root
Move Node_address order
Load PC @Halt
