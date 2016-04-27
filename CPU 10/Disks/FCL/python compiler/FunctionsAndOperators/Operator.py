# class representing an operator in FCL

class BinaryOperator:
	def __init__(self,name,TypeList):
		self.name = name
		self.TypeList = TypeList # type list is: ((Type * Type) -> (Type * FasmCode)) list
								 
	
	def Process(self,Type1, Type2):
		# ( Type * Type -> FASM * Type)

		# compare type pair with internal type list
		for (t in self.TypeList):
			thisType = t[0] # ( Type * Type )
			if (Type.CompareType(Type1,thisType[0])) and (Type.CompareType(Type1,thisType[1])):
				return t[1] # ( FASM * TYPE)

		raise TypeError()

class UnaryOperator:
	def __init__(self,name,TypeList):
		self.name = name
		self.TypeList = TypeList # type list is: (Type -> Type * FasmCode) list

								 
	
	def Process(self, inType):
		# ( Type List -> FASM * Type)

		# compare inType with internal type list
		for (t in self.TypeList):
			thisType = t[0] # (  Type )
			if (Type.CompareType(Type1,thisType)):
				return t[1] # ( FASM * TYPE)
		raise TypeError()
