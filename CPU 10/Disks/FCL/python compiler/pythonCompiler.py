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
from Processing import *

sys.path.insert(0, '..\\..\\..\\..\\..\\ParserAndLexerGenerator')
import PAL
from tempfile import TemporarySpooledFile


#_______________________ TO DO __________________________________________
# - Parser/Parser generator
# 		- integrate PAL parser to compiler
# - Variables
#		- investigate loads and stores
#		- write code to look up a variable
# - Structure.py 
#		- write statement code
# - Scopes 
# 		- scope classes and hierarchy
# 		- scope lookup function
# 		- defined types by scope? - future maybe
# - Code generator
#		- write struct access FASM
#		- Write Allocation/deallocation FASM
#		- Fix fasm namespaces
# 		- write stack code
# 		- returns etc
# 		- FASM errors library
# 		- FASM nameSpacing

# - optimisation?
# 		- Mark expressions and functions as pure
#		- use pureness to do CSE

# - Type dictionary
# - Exceptions
# 		- TypeError exceptions
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



def compile():
		print "getting source = ",			
		source = get_source_file()
		print "DONE!\nParsing = ",
		parse_tree = get_parse_tree(source)
		print "DONE!\nCompilation = ",
		fasm = processBlock(parse_tree.children[0].children[0])
		print "DONE!\nWriting to file = ",
		writeToFile(fasm)
		print "DONE!\n"

def get_parse_tree(text):
	
	text = preprocess(text)
	virtualFile = TemporarySpooledFile()
	virtualFile.write(text)
	virtualFile.seek(0)
	# parse:
	return PAL.ParserLexer.PAL(virtualFile,open("GrammarAndParsing\\FCL.spec",r))

def get_source_file():
	'''gets source text from the requested file. unit -> string'''
	fileName = sys.argv[1]
	return open(fileName,"r").read()

def writeToFile(text):
	fileName = "".join(sys.argv[1].split(".")[:-1]+[".fth"])
	resFile = open(fileName,"w")
	res.write(text)

def preprocess(text):

	# remove comments:
	# look for string and character literal and replace them with char arrays and chrs
	return text


if __name__ == "__main__":
	compile()














# ____________________________________________________________________
def getScope(parseTree):
	# ( parseTree -> scopeObject )
	# look up the name of a scope
	raise IncompleteError()
def getDefinedTypes(scope):
	raise IncompleteError()
def getDefinedVariables(scope):
	raise IncompleteError()


