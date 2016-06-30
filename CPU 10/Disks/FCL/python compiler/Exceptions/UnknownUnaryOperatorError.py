class UnknownUnaryOperatorError(Exception):
	def __init__(self,operatorName,type1):
		self.name = operatorName
		self.type1 = type1


	def __str__(self):
		return "Error: operator " + self.name + "(" + type1 + ") could not be found" 