#Functions allowing the processing of expressions (these require more arguments to be passed (eg free registers))

# functions are of the type:
	# (parseTree * scope * result * freeRegs * resReg -> code * type *  pure?)
def processExpr(parseTree,scope,result,freeRegs,resReg):
	# processes expressions, terms, and factors
	if len(parseTree.children) == 1:
		child = parseTree.children[0]
		if child.type == "FunCall":

		elif child.type in ("Term","factor")
			return ProcessExpr(child,scope,result,freeRegs,resReg)
		elif child.type == "TernaryOp":
			return ProcessTernaryOp(child,scope,result,freeRegs,resReg)

		elif child.type == "Value":

		else:
			raise NodeError()
	elif len(parseTree.children) == 2:
		child = parseTree.children[0]
		if child.type == "UnOp":

		else:
			raise NodeError()

	elif len(parseTree.children) == 3:
		middle = parseTree.children[1]
		if middle.type == "Expr":
			return processExpr(middle,child,scope,result,freeRegs,resReg)
		if middle.type in ("MulOp","AddOp"):
			return	processOp(parseTree,scope,result,freeRegs,resReg)
		else:
			raise NodeError()
	else:
		raise NodeError()

def getValue(var,type):
	raise IncompleteError()

def storeValue(var,type,value):
	raise IncompleteError()

def processValue(parseTree,scope,result,freeRegs,resReg):
	raise IncompleteError()

def processFunCall(parseTree,scope,result):
	raise IncompleteError()

def processStatementVar(parseTree,scope,result):
	raise IncompleteError()

def processTernaryOp(parseTree,scope,result,freeRegs,resReg):
	test = parseTree.children[1]
	trueCode = parseTree.children[3]
	falseCode = parseTree.children[5]

	(result,exprType1,pure1) = processExpr(falseCode,scope,"endif;\n"+result,freeRegs,resReg)
	(result,exprType2,pure2) = processExpr(trueCode,scope,"else;\n"+result,freeRegs,resReg)
	if not Types.Type.Compare(exprType1,exprType2):
		raise TypeError("Expressions in a ternary operator must be of the same type")
	(result,exprType3,pure3) = processExpr(test,scope,resReg+"if;\n"+result,freeRegs,resReg)
	if not (Types.Type.compareType(exprType3,Type('primitive','"bool"'))):
		raise TypeError("The type of the condition expression in a for loop's definition must be boolean.")
	return (result,exprType2,pure1 and pure2 and pure3)
