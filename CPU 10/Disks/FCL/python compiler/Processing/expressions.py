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
			return processValue(child.children[0],scope,result,freeRegs,resReg)
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

def processGetValue(parseTree,scope,result,freeRegs,resReg):
	raise IncompleteError()

def processStoreValue(parseTree,scope,result,freeRegs,resReg):
	raise IncompleteError()

def processValue(parseTree,scope,result,freeRegs,resReg):
	if parseTree.type == 'TypeInst':
		raise IncompleteError()
	elif parseTree.type == 'Primitive':
		prim = parseTree.children[0]
		if prim.type == "num":
			return (resReg+ " "+ prim.string +" # lda;\n"+result,Types.Type('primititive','"int"'),True)

		elif prim.type == "fp":
			return (resReg+ " "+ convertFloat(prim) + " # lda;\n"+result,Types.Type('primitive','"float"'),True)

		elif prim.type in ('"True"','"False"'):
			value =  "one, " if prim.type == '"True"' else "zro, "
			return (value + resReg + " mov;\n",Types.Type('primitive','"bool"'),True) 

		elif prim.type == 'chr':
			value = prim.string[:-1] # remove c suffix
			return (resReg+" " str(int(value)&255)+ " # lda;\n"+result,Types.Type('primitive','"char"'),True)

		elif prim.type == '"Null"':
			return ("zro, "+ resReg+" mov;\n",Types.Type('Null','Null'),True)

		elif prim.type == '"("': # unit
			return ("zro, "+ resReg+" mov;\n",Types.Type('primitive','"unit"'),True)
		else:
			raise NodeError(prim)
	elif parseTree.type == 'StatementVar':
		raise IncompleteError()
	else:
		raise NodeError(parseTree)

def processFunCall(parseTree,scope,result,freeRegs,resReg):

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
