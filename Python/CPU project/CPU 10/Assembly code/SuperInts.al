array Pool 64 []
int SuperInts.pool 0

Struct Block value pointer
	int Value value
	int Pointer pointer
end Struct



#_________________________ To format a pool (will be carried out in assembler in future) _________________________


#Function format_pool(pool,size):
#	start_pointer := ptr(pool);
#	block_pointer := ptr(pool);
#	i := 0;
#	while i < size do
#		link_pointer := block_pointer + 8;
#		link(block_pointer) := link_pointer;
#		i ++;
#	return start_pointer;


Scope SuperInts.format_pool

		def size gp0
		def block_pointer gp1
		def link_pointer gp2
		def i gp3



		Pop block_pointer %SuperInts.format_pool
		Pop size
		Store block_pointer SuperInts.pool              #puts a return value
		Move Zero i

		Move block_pointer link_pointer	

		Compare i size %SuperInts.format_pool.loop
		if Greater then return
			ADD link_pointer @8
			Store link_pointer 4 [block_pointer]
			Move link_pointer block_pointer
			ADD i @2
		Load PC format_pool.loop


#_________________________ releasing block _________________________

Scope SuperInts.release_block

#Function release_block():
#	top_block := pool;         \\finds top of block
#	if top_block = 0 do
#		raise Empty_Pool
#	pool := link(top_block);        \\ makes pool point to the next block
#	return top_block#

#Case Empty_Pool:
#	print "Dynamic allocation pool is empty"
#	Halt

	

	def top_block gp0

		Load top_block SuperInts.Pool		%SuperInts.release_block
		Compare top_block Zero
			if Equal then Load PC SuperInts.Empty_Pool
		Load gp1 4 [top_block]
		Store gp1 SuperInts.pool
		#leaves top_block in gp0
		Move Jump PC      #Utilising quick return

	
	str SuperInts.Empty_Pool.str "Dynamic allocation pool is empty"
	

	Push 									%SuperInts.Empty_Pool.str
	Call Strings.print
	Halt

Scope SuperInts.ADD
		
Function ADD(block_one,block_two)
	