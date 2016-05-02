class Struct:
	def __init__(self,typeDict):
		self.size = 0
		self.typeDict = typeDict # typeDictis { id -> type }
		self.offsetDict = { name:getOffset(name) for name in typeDict }

	def getVariableType(self,name):
		try:
			return typeDict[name]
		except KeyError:
			raise NameError(name,self)

	def getOffset(self)