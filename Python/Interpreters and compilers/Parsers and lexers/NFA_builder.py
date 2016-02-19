import LR1_parser
from collections import defaultdict

class stateCounter:
	def __init__(self):
		self.i = 0
	def __call__(self):
		self.i += 1
		return self.i -1

stateCounter = stateCounter()

class Relation:
	def __init__(self,character,result_state):
		self.__character = character
		self.__result_state = result_state
	def get_character(self):
		return self.__character
	def get_result_state(self):
		return self.__result_state


class NFA_state:
	def __init__(self,state_id,relations_list):
		self.__relations = []
		self.__relations_dict = defaultdict(lambda: [])

		self.__id = state_id
		self.__relations += relations_list
		for r in self.__relations:
			self.__relations_dict[r.get_character()].append(r.get_result_state())

	def addRelation(self,r):
		self.__relations.append(r)
		self.__relations_dict[r.get_character()].append(r.get_result_state())

	def getNextStates(self,c):
		return self.__relations_dict[c]

	def getAllNextStates(self):
		return self.__relations_dict

	def getRelations(self):
		return self.__relations

	def getID(self):
		return self.__id

class NFA:
	def __init__(self,states,start,accept_list):
		self.__states = states
		self.__start = start
		self.__accept = accept_list

	def getStates(self):
		return self.__states

	def getStart(self):
		return self.__start

	def getAcceptStates(self):
		return self.__accept

	#_________________ NFA Construction methods ______________________-

	def concatenate(self,B):
		#PRECONDITION: self = M(r), B = M(s)
		#POSTCONDITION: self = M(rs)
		B_start = B.getStart()
		for q in self.getAcceptStates():
			q.addRelation(Relation("",B_start))
		self.__states += B.getStates() 
		self.__accept = B.getAcceptStates()


	def alternate(self,B):
		#PRECONDITION: self = M(r), B = M(s)
		#POSTCONDITION: self = M(r|s)

		newState = NFA_state(
			stateCounter(),
			[
				Relation("",self.getStart()),
				Relation("",B.getStart())
			]
		)
		self.__states.append(newState)
		self.__states += B.getStates()
		self.__start = newState
		self.__accept += B.getAcceptStates()


	def star(self):
		#PRECONDITION: self = M(r)
		#POSTCONDITION: self = M(r*)
		newState = NFA_state(
			stateCounter(),
			[
				Relation("",self.getStart())
			]
		)
		self.__states.append(newState)
		for q in self.getAcceptStates():
			q.addRelation(Relation("",newState))
		self.__accept = [newState]
		self.__start = newState

def TerminalNFA(char):
	# creates an NFA which accepts a single character
	stateA = NFA_state(stateCounter(),[])
	stateB = NFA_state(stateCounter(),[])
	stateA.addRelation(Relation(char,stateB))
	return NFA([stateA,stateB],stateA,[stateB])


def CreateNFA(ParseTree):
	# creates an NFA from a parse tree
	if ParseTree.terminal:
		return TerminalNFA(ParseTree.string)
	else:
		if ParseTree.type == "<PROGRAM>": # Program -> expr
			return CreateNFA(ParseTree.children[0])
		if ParseTree.type == "<expr>": 
			if len(ParseTree.children) == 3: # expr -> expr "|" term
				nfa =  CreateNFA(ParseTree.children[0])
				nfa.alternate(CreateNFA(ParseTree.children[2]))
				return nfa
			else: # expr -> term
				return CreateNFA(ParseTree.children[0])
		if  ParseTree.type == "<term>":
			if len(ParseTree.children) == 2: # term -> term factor
				nfa = CreateNFA(ParseTree.children[0])
				nfa.concatenate(CreateNFA(ParseTree.children[1]))
				return nfa
			else: 							 # term -> factor
				return CreateNFA(ParseTree.children[0])
		if ParseTree.type == "<factor>":
			if len(ParseTree.children) == 2: # factor -> lit "*"
				nfa = CreateNFA(ParseTree.children[0])
				nfa.star()
				return nfa
			else: 								# factor -> lit
				return CreateNFA(ParseTree.children[0])
		if ParseTree.type == "<lit>":
			if len(ParseTree.children) == 3: # lit -> "(" expr ")"
				return CreateNFA(ParseTree.children[1])
			else: 							 # lit -> letter
				return CreateNFA(ParseTree.children[0])
		if ParseTree.type == "<letter>": 		# letter -> cap | lower
			return CreateNFA(ParseTree.children[0])
		if ParseTree.type == "<cap>":			# cap -> terminal
			return CreateNFA(ParseTree.children[0])
		if ParseTree.type == "<lower>": 		# cap -> terminal
			return CreateNFA(ParseTree.children[0])
		else:
			print "Unexpected node type: " + ParseTree.type
			quit()

def printState(s):
	print "-------------------------------------------------------------"
	print "| State number: ", s.getID(), "\t\t\t\t|"
	print "-------------------------------------------------------------"
	for r in s.getRelations():
		print "|",r.get_character(),"-->",r.get_result_state().getID(), "\t\t\t\t|"
	print "-------------------------------------------------------------\n\n\n"

def printNFA(n):
	print "-------------------------------------------------------------"
	print "| Start:", n.getStart().getID(), "\t\t\t\t|"
	for s in n.getAcceptStates():
		print "| Accepts: ", s.getID(), "\t\t\t\t|"
	for s in n.getStates():
		printState(s)


if __name__ == "__main__":
	import sys
	source_name = sys.argv[1]
	grammar_name = "regex.parse"
	local_parser = LR1_parser.Parser(grammar_name)
	nfa = CreateNFA(local_parser.parse(open(source_name,"r").read()))
#	for s in nfa.getStates():
#		print "NEW S"
#		print s.getAllNextStates()
	printNFA(nfa)
