# functions to process operations
# functions are of the type:
	# (parseTree * scope * result * freeRegs * resReg -> code * type *  pure?)

def processOp(parseTree,scope,result,freeRegs,resReg):
	# preconditions:
	# 	parseTree is an "Expr -> Expr addOp Term" node 
	# 	resReg is in freeRegs
	# 	freeRegs is the list of registers currently available to the compiler
	#	the result is moved into resReg at the end of the operation


	# post conditions: returns result, type
	pushedRegs = []
	if len(freeRegs)<2: # if there is not enough register space for the operation, push some registers
		pushedRegs = filter((lambda s: not s in freeRegs),registerNames.regNames)[:2-len(freeRegs)]
		result = "".join(map ((lambda s: s+" Pop;\n"),pushedRegs)) + result
		(result,exprType) = processOp(parseTree,scope,result,freeRegs+pushedRegs,resReg)
		result = "".join(map ((lambda s: s+" Push;\n"),pushedRegs)) + result
		return (result,exprType,False)

	else:
		(r1,t1,p1) = processExpr(parseTree.children[0],scope,'',freeRegs,resReg)
		(r2,t2,p2) = processExpr(parseTree.children[2],scope,'',freeRegs[1:],freeRegs[0])
		(operator,opType) = getOperator(parseTree.children[1],t1,t2)
		
		(opFasm) = operator.getFasm(resReg,freeRegs[0],resReg)
		return (r1+r2+opFasm+result,opType,p1 and p2)
