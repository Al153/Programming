class UnknownOperatorError(Exception):
	def __init__(self,operatorName,type1,type2):
		self.name = operatorName
		self.type1 = type1
		self.type2 = type2

	def __str__(self):
		return "Error: operator " + self.name + "(" + type1 + ", " + type2 + ") could not be found" 