class Neuron:
	def __init__(self,input_list,input_weights):
		self.input_list = input_list
		self.input_weights = input_weights
		self.output = 0
		self.input_size = len(input_list)
	def update(self):
		self.output = 0
		for i in xrange(input_size):
			self.output += self.input_list[i].output*self.input_weights[i]
		self.output = sigmoid(self.output)

class InputNode:
	def __init__(self):
		pass
	def update(self,value):
		self.output = value

class Layer:
	def __init__(self,input_nodes):
		#input nodes is a 2d array - [[], []]  
		self.size = len(input_nodes)
		