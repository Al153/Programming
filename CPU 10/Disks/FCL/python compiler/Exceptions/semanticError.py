class SemanticError(Exception):
	def __init__(self,msg):
		super()
		self.msg = msg
	def __str__(self):
		return self.msg