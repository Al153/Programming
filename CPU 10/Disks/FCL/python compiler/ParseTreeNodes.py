#defines parse tree node structs

class Non_terminal_parse_tree_node:                                                                 #class for non terminals (ie have children)
	def __init__(self,node_type,children):
		self.terminal = 0
		self.type = node_type
		self.children = children

class Terminal_parse_tree_node:                                                                     #class for terminals
	def __init__(self,node_type,token_string):
		self.terminal = 1
		self.type = node_type
		self.string = token_string