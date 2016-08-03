def processBlock(parseTree,scope,result):
	if len(parseTree.children) == 2:
		return (processLine(parseTree.children[0],scope,processLine(parseTree.children[1],scope,result)[1]),Type('primitive','unit'))
	else:
		return processLine(parseTree.children[0],result)

def processLine(parseTree,scope,result):
 	extendedTable = {
		"FunDec": processFunDec,
		"TypeDec": processTypeDec,
		"Ifstatement": processIfstatement,
		"WhileLoop": processWhileLoop,
		"ForLoop": processForLoop,
		"Scope": processScope
	 	'"{"':processBlock
	}

	simpleTable = {
			"PureFunDec": processPureFunDec,
			"FunCall": processFunCall,
			"break":processBreak,
			"continue":processContinue,
			"Statement": processStatement,
			"VarDec": processVarDec,
			'"return"':processReturn,
	}

	if parseTree.type == "Simple":
		
		processFunction = simpleTable[parseTree.children[0].type]
		if parseTree.children[0].type != '"return"':
			return processFunction(parseTree.children[0],scope,result)
		else:
			return processFunction(parseTree.children[1],scope,result)

	elif parseTree.type == "Extended":
		processFunction = extendedTable[parseTree.children[0].type]
		if parseTree.children[0].type != '"{"':
			return processFunction(parseTree.children[0],scope,result)
		else:
			return processFunction(parseTree.children[1],scope,result)
	else:
		raise NodeError(parseTree)





def processScope(parseTree,scope,result):

	scopeObject = scopeLookup(scope,parseTree.children[1].string)
	if  scopeObject.type == "Namespace":
		return scopeObject.process(processLine(parseTree.children[2],scope+[scopeObject],result))

def processStatement(parseTree,scope,result):
	if parseTree.type != "Statement":
		raise NodeError()
	(result,storeType,pure) = processStoreValue(parseTree,scope,result,registerNames.regNames[0],registerNames.regNames[1:])
	(result,exprType,pure) = processExpression(parseTree.children[2],scope,result)
	if not Types.Type.compare(storeType,exprType):
		raise TypeError("Error: the expression and variable in the statement:"+ parseTree.generate()+ "do not have the same type: " + Types.Type.toString(storeType) + " and " + Types.Type.toString(exprType) + ".")
	else:
		return result

def processIfstatement(parseTree,scope,result):
	if len(parseTree.children) == 5:
		# if...end
		test = parseTree.children[2]
		trueCode = parseTree.children[4]

		result = processLine(trueCode,scope,"endif;\n"+result)
		(result,exprType,pure) = processExpression(test,scope,"gp0, if;\n"+result,registerNames.regNames,"gp0,")
		if not (Type.compareType(exprType,Type('primitive','"bool"'))):
			raise TypeErrorException("The type of the condition expression in an if statement's definition must be boolean.")
		return result
	elif len(parseTree.children) == 7:
		# if ... else .. end
		test = parseTree.children[2]
		trueCode = parseTree.children[4]
		falseCode = parseTree.children[6]
		result = processLine(falseCode,scope,"endif;\n"+result)
		result = processLine(trueCode,scope,"else;\n"+result)
		(result,exprType,pure) = processExpression(test,scope,"gp0, if;\n"+result,registerNames.regNames,"gp0,")
		if not (Type.compareType(exprType,Type('primitive','"bool"'))):
			raise TypeErrorException("The type of the condition expression in an if statement's definition must be boolean.")
		return result
	else:
		raise NodeError()

def processWhileLoop(parseTree,scope,result):
	test = parseTree.children[2]
	loopedCode = parseTree.children[4]

	result = processLine(loopedCode,scope,'next;\nloop;\n'+result)
	(result,exprType,pure) = processExpression(test,scope,"gp0, do;\n"+result,registerNames.regNames,"gp0,")
	if not (Type.compareType(exprType,Type('primitive','"bool"'))):
		raise TypeErrorException("The type of the condition expression in a while loop's definition must be boolean.")
	result = "while;\n" + result
	return result

def processForLoop(parseTree,scope,result):
	instantiation = parseTree.children[2]
	test = parseTree.children[4]
	nextValue = parseTree.children[6]
	loopedCode = parseTree.children[8]

	result = processStatement(nextValue,scope,'loop;\n'+result)
	result = processLine(loopedCode,scope,"next;\n"+result)
	(result,exprType, pure) = processExpression(test,scope,"gp0, do;\n"+result,registerNames.regNames,"gp0,")

	if not (Type.compareType(exprType,Type('primitive','"bool"'))):
		raise TypeErrorException("The type of the condition expression in a for loop's definition must be boolean.")
	if instantiation.children[0].type == 'Statement':
		result = processStatement(instantiation.children[0],scope,"while;\n"+result)

	elif instantiation.children[0].type == 'VarDec':
		varDec = instantiation.children[0]
		if len(varDec.children) == 2:
			raise Errors.SemanticError("Error: the variable declaration in a for loop instantiation must be of the statement type")
		else:
			result =  processStatementVarDec(varDec,scope,"while;\n"+result)
	else:
		raise NodeError()
	return result

def processContinue(parseTree,scope,result):
	return "contin;\n" + result

def processBreak(parseTree,scope,result):
	return "break;\n" + result

def processReturn(parseTree,scope,result):
	if scope.head.isFunction:
		result = "gp0, return;\n"+result
		result,exprType,pure = processExpression(parseTree,scope,result,registerNames.regNames,"gp0,")
		if Types.Type.compare(scope.head.localFunction.resultType,exprType):
			return result
		else:
			raise TypeError 
	else:
		raise SemanticError("Cannot return when not in a function")
