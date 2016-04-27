# writing a compiler in python to get the ground work, then will attempt to write a compiler in FCL
# both compilers will target a Forth/Fasm system
import LR1_parser
import sys
from tokeniser import tokenise
from parseTreeNodes import * 
from exceptions import *
from types import *
from Scope import *


#_______________________ TO DO __________________________________________
# - add fp, char terminals to the LR1 parser
# - create a "Type" type in python, which records the types of values
# - create a type checking function
# - scope classes and hierarchy
# - Code generator
# - run-time bounds checking where appropriate
# - optimisation?
# - Type dictionary
# - FASM environment - whiles, calls, breaks, returns etc
# - Type class
# - typeError exceptions
# - nodeError exceptions
# - scope lookup function
# - incomplete exceptions
# - type comparison
# - create operation definitions 
#
#
#
#
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
primitiveTypes = {"int","char","float","bool","unit"}
definedTypes = {}

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
		return (processLine(parseTree.children[0],scope,processLine(parseTree.children[1],scope,result)[1]),"TODO: type = unit")
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
		raise nodeError("SomeError") 

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

def processExpr(ParseTree,scope,result):

def processTerm(parseTree,scope,result):

def processFactor(parseTree,scope,result):

def processValue():

def processFunCall():

def process():




# ____________________________________________________________________
def getScope(parseTree):
	raise incompleteError()

