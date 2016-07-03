class NodeError(Exception): # an exception signifying that a parse tree node error has occured
	def __init__(self,Node):
		self.node = Node
	def __str__(self):
		return "Not expecting node: "+self.node.__str__()