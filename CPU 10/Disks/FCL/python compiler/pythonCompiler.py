# writing a compiler in python to get the ground work, then will attempt to write a compiler in FCL
# both compilers will target a Forth/Fasm system
import LR1_parser
import sys
from tokeniser import tokenise
from parseTreeNodes import * 
from Types import *
from Scope import *
from FunctionsAndOperators import *
from Exceptions import *
from DataStructures import * 


#_______________________ TO DO __________________________________________
# - Parser/Parser generator
# 		- add fp, char terminals to the LR1 parser

# - Scopes 
# 		- scope classes and hierarchy
# 		- scope lookup function
# 		- defined types by scope? - future maybe
# - Code generator
#		- write struct access FASM
#		- Write Allocation/deallocation FASM
#		- Fix fasm namespaces
# 		- write stack code
# 		- FASM environment - whiles, calls, breaks, returns etc
# 		- FASM errors library
# 		- FASM nameSpacing

# - optimisation?
# 		- Mark expressions and functions as pure
#		- use pureness to do CSE

# - Type dictionary
# - Exceptions
# 		- typeError exceptions
# 		- NodeError exceptions

# - incomplete exceptions
# - create operation definitions 
# - initialise operators and functions

#_________________________________________________________________________

#____________________________ Compiling strategy _________________________
# parse program
# line by line:
# 	case lineType:
# 		Scope -> enter new scope level, process line, exit scope, store scope
#       Statement -> check typing and semantics; compile the statement to FASM
# 		VarDec -> add a new var instance of the right type to the current scope, check for a statement and process it
#       FunDec -> create a new scope; process lines; finally wrap result in an appropriate subroutine linkage and stack handling routine
#		PureFunDec -> process the expression, wrap it in subroutine linkage
# 		TypeDec -> ( effectively cloneable scopes ) - add to typeDictionary
#		Ifstatement -> process the 2 fields and wrap them accordingly
# 		WhileLoop -> process the 2 fields and wrap them accordingly
#		ForLoop -> process the 4 fields and wrap them accordingly
# 		Block -> process each line
#		FunCall -> check the function is ( * -> unit )
#		break -> compiles to a FASM break - check context
# 		continue -> compiles to a FASM continue - check context
#		return -> test expression and create return code
#____________________________________________________________________________
primitiveTypes = ["int","char","float","bool","unit"] # holds names of primitive type

typeSizes = {"int":4,"char":1, "float":4,"bool":4,"unit":0} # type -> sizeOfType in bytes

operators = {}
registerNames = [
	"gp0,",
	"gp1,",
	"gp2,",
	"gp3,",
	"gp4,",
	"gp5,",
	"gp6,",
	"gp7,"
]

def get_source_file():
	'''gets source text from the requested file. unit -> string'''
	file_name = sys.argv[1]
	return open(file_name,"r").read()

def compile():
		print "getting source = ",			
		self.source = get_source_file()
		print "DONE!\nParsing = ",
		self.parse_tree = get_parse_tree(self.source)
		print "DONE!"

# process nodes:
# (parseTree * scopeList * string -> (string * type))

def processBlock(parseTree,scope,result):
	if len(parseTree.children) == 3:
		return (processLine(parseTree.children[0],scope,processLine(parseTree.children[1],scope,result)[1]),Type('primitive','unit'))
	else:
		return processLine(parseTree.children[0],result)
def processLine(parseTree,scope,result):
	Onetable = {
		"Statement": processStatement,
		"VarDec": processVarDec,
		"FunDec": processFunDec,
		"PureFunDec": processPureFunDec,
		"TypeDec": processTypeDec,
		"Ifstatement": processIfstatement,
		"WhileLoop": processWhileLoop,
		"ForLoop": processForLoop,
		"FunCall": processFunCall,
		"Scope": processScope
	}

	TwoTable = {
		"return":processReturn
	}
	TerminalTable = {"break":processBreak,"continue":processContinue}
	if len(parseTree.children) == 1:

	elif len(parseTree.children) == 2:

	elif len(parseTree.children) == 3:

	else:
		raise NodeError("SomeError") 

	raise incompleteError()


def processScope(ParseTree,scope,result):
	return processLine(parseTree.children[2],ScopeList(getScope(parseTree.children[1]),scope),result)

def processStatement(ParseTree,scope,result):
	raise incompleteError()

def processVarDec(ParseTree,scope,result):
	raise incompleteError()

def processFunDec(ParseTree,scope,result):
	raise incompleteError()

def processPureFunDec(ParseTree,scope,result):
	raise incompleteError()

def processTypeDec(ParseTree,scope,result):
	raise incompleteError()

def processIfstatement(ParseTree,scope,result):
	raise incompleteError()

def processWhileLoop(ParseTree,scope,result):
	raise incompleteError()

def processForLoop(ParseTree,scope,result):
	raise incompleteError()

def processFunCall(ParseTree,scope,result):
	raise incompleteError()

#___________________________ expression processing functions __________________________

def processExpr(ParseTree,scope,result,freeRegs,resReg):
	if len(ParseTree.children) == 1:
		child = ParseTree.children[0]
		if child.type == "FunCall":

		elif child.type == "Term"
			return ProcessTerm(child,scope,result,freeRegs,resReg)
		elif child.type == "TernaryOp":
			 
		else:
			raise NodeError()
	elif len(ParseTree.children) == 2:
		child = ParseTree.children[0]

	elif len(ParseTree.children) == 3:
		return	processAddop(parseTree,scope,result,freeRegs,resReg)
	else:
		raise NodeError()

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








def processTerm(parseTree,scope,result,freeRegs,resReg):

def processFactor(parseTree,scope,result,freeRegs,resReg):

def processValue(parseTree,scope,result,freeRegs,resReg):

def processFunCall():

def process():




# ____________________________________________________________________
def getScope(parseTree):
	# ( parseTree -> scopeObject )
	# look up the name of a scope
	raise incompleteError()
def getDefinedTypes(scope):
	raise incompleteError()
def getDefinedVariables(scope):
	raise incompleteError()

def getOperator(parseTree):
	# ( parseTree -> operatorObject )
	# lookup operator in operator dictionary
	raise incompleteError()
