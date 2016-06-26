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
		raise NodeErrorException(parseTree)





def processScope(parseTree,scope,result):
	return processLine(parseTree.children[2],ScopeList(getScope(parseTree.children[1]),scope),result)

def processStatement(parseTree,scope,result):
	raise incompleteError()

def processIfstatement(parseTree,scope,result):
	raise incompleteError()

def processWhileLoop(parseTree,scope,result):
	raise incompleteError()

def processForLoop(parseTree,scope,result):
	raise incompleteError()