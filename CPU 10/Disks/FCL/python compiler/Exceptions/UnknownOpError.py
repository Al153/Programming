class UnknownOpError(Exception):
	def __init__(self,nodeType,t1,t2):
		self.nodeType = nodeType
		self.t1 = t1
		self.t2 = t2
	def __str__(self):
		return "Could not find operator: "+self.nodeType+"("+self.t1+","+self.t2+")"

class UnknownUnOpError(Exception):
	def __init__(self,nodeType,t1):
		self.nodeType = nodeType
		self.t1 = t1
	def __str__(self):
		return "Could not find operator: "+self.nodeType+"("+self.t1+")"
		