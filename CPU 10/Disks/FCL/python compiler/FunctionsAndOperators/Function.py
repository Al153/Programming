class Function:
	# a class representing a function object
	def __init__(self,name,type):
		self.name = name
		self.type = type # ( Type List -> Type)  
		self.inputTypes,self.resultType = self.getTypes() # type list

	def getFASMName(self,name,t_entry): # (string * (typeList) -> FASM )
		# gets the name of the FASM variable holding the value of 
		raise IncompleteError()

	def getTypes(self):
		if self.type.typeClass == 'function':
			return self.type.value[0],self.type.value[1]
		else:
			raise TypeError("Functions should have typeClass type")		
	def typeCheckInputs(self,inputTypes):
		raise IncompleteError()

