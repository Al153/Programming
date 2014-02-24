class graph:
	def __init__(self,node_matrix,node_names):
		self.node_matrix = node_matrix #start-end matrix
		self.node_names = node_names
		#node matrix lengths are 0,1,2... or "N" for undefined

	def mininum_connector(self):
		new_tree = []
		added_nodes = [0]
		for row in self.node_matrix:
			new_tree.append([0]*len(row))
		for i in xrange(len(self.node_matrix)-1):
			

		