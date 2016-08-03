class Struct(value):
	def __init__(self,typeDict,scope):
		self.size = 0
		self.typeDict = typeDict # typeDictis { id -> type }
		self.offsetDict = { name:getOffset(name) for name in typeDict }
		self.scope = scope


	def getVariableType(self,name):
		try:
			return typeDict[name]
		except KeyError:
			raise NameError(name,self)

	def getOffset(self,name):
		# generates the numerical offsets of variables within the struct
		
		

		

