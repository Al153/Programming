class cell:
	def __init__(self,state):
		self.state = state
	def set_neighbours(self,neighbours_list):
		self.neighbours = neighbours_list
	def count_neighbours(self):
		count = 0
		for neighbour in self.neighbours:
			if neighbour.state = True:
				count += 1
		return count
	def check(self):
		count = self.count_neighbours()
		self.new_state = self.state
		if self.state:
			if count == 3 or count == 2:
				pass
			else:
				self.new_state = False
		else:
			if count == 3:
				self.new_state = True
	def update(self):
		self.state = self.new_state

