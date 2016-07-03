# class representing an operator in FCL

class BinaryOperator:
	def __init__(self,name,type,fasmFunction):
		self.name = name
		self.type = type # type is: ((Type , Type) , (type))
		self.getFasm = fasmFunction # fasmFunction is of type (reg1 * reg2 * resultantReg -> fasm)				 
	

class UnaryOperator:
	def __init__(self,name,type,fasmFunction):
		self.name = name
		self.type = type # type list is: (type,type) list
		self.getFasm = fasmFunction

Operators = {} # name -> Operator list
UnaryOperators = {} # name -> UnaryOperator list

def getOperator(OpNode,type1,type2):

def getUnaryOperator(OpNode,exprType):