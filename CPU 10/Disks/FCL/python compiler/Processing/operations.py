def processAddop(parseTree,scope,result,freeRegs,resReg):
	# preconditions:
	# 	parseTree is an "Expr -> Expr addOp Term" node 
	# 	resReg is in freeRegs
	# 	freeRegs is the list of registers currently available to the compiler
	#	the result is moved into resReg at the end of the operation


	# post conditions: returns result, type
	pushedRegs = []
	if len(freeRegs)<2: # if there is not enough register space for the operation, push some registers
		pushedRegs = filter((lambda s: not s in freeRegs),registerNames)[:2-len(freeRegs)]
		result = "".join(map ((lambda s: s+" Pop;\n"),pushedRegs)) + result
		(result,exprType) = processAddop(parseTree,scope,result,freeRegs+pushedRegs,resReg)
		result = "".join(map ((lambda s: s+" Push;\n"),pushedRegs)) + result
		return (result,exprType)

	else:
		(r1,t1) = processExpr(parseTree.children[0],scope,'',freeRegs,resReg)
		(r2,t2) = processTerm(parseTree.children[1],scope,'',freeRegs[1:],freeRegs[0])
		operator = getOperator(parseTree.children[1])
		(fasm,resultant_type) = operator.getVersion(t1,t2)
		return operator.process(result,resReg,freeRegs[0],resReg,fasm)


def processMulop(parseTree,scope,result,freeRegs,resReg):
	# preconditions:
	# 	parseTree is an "Expr -> Expr addOp Term" node 
	# 	resReg is in freeRegs
	# 	freeRegs is the list of registers currently available to the compiler
	#	the result is moved into resReg at the end of the operation


	# post conditions: returns result, type
	pushedRegs = []
	if len(freeRegs)<2: # if there is not enough register space for the operation, push some registers
		pushedRegs = filter((lambda s: not s in freeRegs),registerNames)[:2-len(freeRegs)]
		result = "".join(map ((lambda s: s+" Pop;\n"),pushedRegs)) + result
		(result,exprType) = processAddop(parseTree,scope,result,freeRegs+pushedRegs,resReg)
		result = "".join(map ((lambda s: s+" Push;\n"),pushedRegs)) + result
		return (result,exprType)

	else:
		(r1,t1) = processTerm(parseTree.children[0],scope,'',freeRegs,resReg)
		(r2,t2) = processFactor(parseTree.children[1],scope,'',freeRegs[1:],freeRegs[0])
		operator = getOperator(parseTree.children[1])
		(fasm,resultant_type) = operator.getVersion(t1,t2)
		return operator.process(result,resReg,freeRegs[0],resReg,fasm)