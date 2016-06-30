# class representing an operator in FCL

class BinaryOperator:
	def __init__(self,name,type,fasmFunction):
		self.name = name
		self.type = type # type is: ((Type , Type) , (type))
		self.getFasm = fasmFunction # fasmFunction is of type (reg1 * reg2 * resultantReg -> fasm)				 
	

class UnaryOperator:
	def __init__(self,name,type,fasmFunction):
		self.name = name
		self.type = type # type list is: (type,type)
		self.getFasm = fasmFunction

Operators = {			# name -> Operator list
	'"*"': []
	'"+"':[]
	'"-"':[]
	'"/"':[]
	'"|"':[]
	'"&"':[]
	'"^"':[]
	'"andalso"':[]
	'"orelse"':[]
	'"mod"':[]
	'BoolComp':[]
} 
UnaryOperators = { 		# name -> UnaryOperator list
	'"-"':[]
	'"~"':[]
	'not':[]
} 

def getOperator(OpNode,type1,type2):
	# look up OpNode type
	opList = Operators[OpNode.type]
	for op in opList:
		if Types.Type.compare(type1,op.type[0][0]):
			if Types.Type.compare(type2,op.type[0][1]):
				return (op,op.type[1])
	raise UnknownOperatorError(OpNode.type,Types.Type.toString(type1),Types.Type.toString(type2))


def getUnaryOperator(OpNode,exprType):
	opList = Operators[OpNode.type]
	for op in opList:
		if Types.Type.compare(exprType,op.type[0]):
			return (op,op.type[1])
	raise UnknownUnaryOperatorError(OpNode.type,Types.Type.toString(exprType))