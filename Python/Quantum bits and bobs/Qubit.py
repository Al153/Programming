import random

class Qubit:
	def __init__(self,start_state):
		self.superposition = start_state

	def sneaky_measure(self):
		return self.superposition

	def measure(self):
		probability = abs(self.superposition[0])**2 #probability that it reverts to zero
		if random.random()> probability:
			self.superposition = (complex(0.0,0.0),complex(1.0,0.0)) #set superposition to 1
		else:
			self.superposition = (complex(1.0,0.0),complex(0.0,0.0)) #set superposition to 0
		return self.superposition
		