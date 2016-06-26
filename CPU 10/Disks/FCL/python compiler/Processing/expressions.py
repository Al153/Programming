#Functions allowing the processing of expressions (these require more arguments to be passed (eg free registers))
def processExpr(parseTree,scope,result,freeRegs,resReg):
	if len(parseTree.children) == 1:
		child = parseTree.children[0]
		if child.type == "FunCall":

		elif child.type == "Term"
			return ProcessTerm(child,scope,result,freeRegs,resReg)
		elif child.type == "TernaryOp":
			 
		else:
			raise NodeError()
	elif len(parseTree.children) == 2:
		child = parseTree.children[0]

	elif len(parseTree.children) == 3:
		return	processAddop(parseTree,scope,result,freeRegs,resReg)
	else:
		raise NodeError()

def getValue():

def storeValue():

def processTerm(parseTree,scope,result,freeRegs,resReg):

def processFactor(parseTree,scope,result,freeRegs,resReg):

def processValue(parseTree,scope,result,freeRegs,resReg):

def processFunCall(parseTree,scope,result):
	raise incompleteError()