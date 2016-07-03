# class representing an operator in FCL

class BinaryOperator:
	def __init__(self,name,type,fasmFunction):
		self.name = name
		self.type = type # type is: ((Type , Type) , (type))
		self.getFasm = fasmFunction # fasmFunction is of type (reg1 * reg2 * resultantReg -> fasm)				 
	

class UnaryOperator:
	def __init__(self,name,type,fasmFunction):
		self.name = name
		self.type = type # type is: (type,type)
		self.getFasm = fasmFunction # fasmFunction is of type ( reg1 * reg2 * resultantReg -> fasm)

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
	try:
		opList = Operators[Opnode.type]
		for op in opList:
			if Types.Type.compare(type1,op.type[0][0]):
				if Types.Type.compare(type2,op.type[0][1]):
					return op
		raise UnknownOpError(opNode.type,Types.Type.toString(type1),Types.Type.toString(type2))
	except KeyError:
		raise UnknownOpError(opNode.type,Types.Type.toString(type1),Types.Type.toString(type2))


def getUnaryOperator(OpNode,exprType):
	try:
		opList = UnaryOperators[Opnode.type]
		for op in opList:
			if Types.TYp.compare(op.type[0],exprType):
				return op
		raise UnknownUnOpError(opNode.type,Types.Type.toString(exprType))
	except KeyError:
		raise UnknownUnOpError(opNode.type,Types.Type.toString(exprType))