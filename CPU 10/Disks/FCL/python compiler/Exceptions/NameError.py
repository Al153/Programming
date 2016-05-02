class NameError(Exception):
	def __init__(self,name,scope):
		self.name = name
		self.scope = scope