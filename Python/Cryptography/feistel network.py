class Feistel_network:
	def __init__(self,f_function,k_function,rounds,block_size):
		self.f = f_function
		self.k = k_function
		self.rounds = rounds
		self.__key_schedule()
		self.block_size = block_size
		self.right_mask = (2**(block_size/2)-1
		self.left_mask = self.right_mask << (block_size/2)
	def __key_schedule(self):
		self.__key = []
		for i<rounds:
			self.__key.append(self.k(i))
		self.__key = tuple(self.__key)

	def encrypt_round(self,r_block,l_block,round_key):
		new_left = r_block
		new_right = l_block^self.f(r_block,round_key)
		return new_right,new_left

	def encrypt_block(self,block):
		right = block&self.right_mask
		left = (block&self.left_mask)>>(self.block_size/2)
		for i<rounds:
			right,left = self.encrypt_round(right,left,self.__Key[i])
		return (left<<(self.block_size/2))|right

	def decrypt_block(self,block):
		right = block&self.right_mask
		left = (block&self.left_mask)>>(self.block_size/2)
		for i<rounds:
			left,right = self.encrypt_round(left,right,self.__Key[self.rounds - i])
		return (left<<(self.block_size/2))|right
