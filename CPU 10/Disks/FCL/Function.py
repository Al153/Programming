class Function:
	# a class representing a function object
	def __init__(self,name,typeList):
		self.name = name
		self.types = typeList # ( Type List -> Type)  - allows overloading
		self.codeTypes = [(t_entry,self.createCall(self.getFASMName(name,t_entry[0]))) for t_entry in self.types] # ( Type List -> Type * FASM)


	def addOverload(self,name,thisType):
		if not( self.name == name):
			raise someError()
		else:
			self.types.append(thisType)
			self.codeTypes.append((thisType,self.createCall(self.getFASMName(name,thisType[0]))))
	def getFASMName(self,name,t_entry): # (string * (typeList) -> FASM )
		# gets the name of the FASM variable holding the value of 
		raise incompleteError()

	def createCall(self,getFASMName):
