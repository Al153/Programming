# builds a DFA from an NFA
import NFA_builder
import LR1_parser

class DFAstateCounter:
	def __init__(self):
		self.i = 0
	def __call__(self):
		self.i += 1
		return self.i -1
	def decrement(self):
		self.i -=1

DFAstateCounter = DFAstateCounter()


class DFA_state:
	def __init__(self,nfa_set):
		self.id = DFAstateCounter()
		self.nfa_set =  set(nfa_set)
		self.transitions = {} # dict


	def getClosure(self,nfa_states): #gets all NFA states one linked to ones in the set via null transitions
		changes = 1
		while changes:
			changes = 0
			new_items = set([])
			for identifier in self.nfa_set:
				nfaState = nfa_states[identifier]
				equivalent_items = set([state.getID() for state in nfaState.getNextStates("")]) #gets all the ids of states with null transitions from the nfastate
				if not (equivalent_items <= self.nfa_set):
					changes = 1
					new_items |= equivalent_items
			self.nfa_set |= new_items

	def __eq__(self,a):
		if isinstance(a,DFA_state): return self.nfa_set == a.nfa_set
		return False;

	def __ne__(self,a): return not (self == a)
	def __str__(self): #hack to give print behaviour
		string =  "-------------------------------------------------------------\n"
		string += "| State number: " + str(self.id) + "\t\t\t\t|\n"
		string += "-------------------------------------------------------------\n"
		for s in self.nfa_set:
			string += "| contains: " + str(s) + "\t\t\t\t|\n"

		string += "-------------------------------------------------------------\n"
		for c in self.transitions:
			string += "|"+c+"-->"+ str(self.transitions[c].id) + "\t\t\t\t|\n"
		string += "-------------------------------------------------------------\n\n\n"
		return string

class DFA:
	def __init__(self,nfa,alphabet):
		# builds a DFA from an NFA
		#print "Generating nfa state table"
		self.nfa_states = {s.getID():s for s in nfa.getStates()}
		#print "Getting start state"
		self.start = DFA_state([nfa.getStart().getID()])
		#print "Getting start closure"
		self.start.getClosure(self.nfa_states)
		#print "creating all states"
		self.allSets = [self.start] #set of dfa states
		self.alphabet = alphabet
		changes = 1
		while changes:
			changes = 0
			for s in self.allSets:
				#print "transition state = ",s
				for character in self.alphabet:
					#raw_input()
					#print character
					new_DFA_state = self.__getTransition(s,character)
					new_DFA_state.getClosure(self.nfa_states)
					#print "test_state = "
					#print new_DFA_state
					if len(new_DFA_state.nfa_set) == 0:
						#print "Empty state"
						DFAstateCounter.decrement()
						continue

					# now to check if new_DFA is in the set:
					reduced_set = filter((lambda s: s == new_DFA_state), self.allSets)
					if len(reduced_set) == 0:
						#print "new state"
						s.transitions[character] = new_DFA_state
						self.allSets.append(new_DFA_state)
						changes = 1
					else:
						#print "existing state"
						if character not in s.transitions:
					#		print "adding transition"
							s.transitions[character] = reduced_set[0] # add transition to the found state
							DFAstateCounter.decrement() #decrement the state counter
							changes = 1

		#find accept states:
		#print "end of loop"
		self.accept = set([])
		#print "finding accept states"
		for  s in self.allSets:
			for n in s.nfa_set:
				if self.nfa_states[n] in nfa.getAcceptStates():
					self.accept.add(s.id)
		#print "done"


	def __getTransition(self,this_DFA_state,char):
		next_DFA_state = set([])
		for  nfa_id in this_DFA_state.nfa_set:
			next_DFA_state |= set([n.getID() for n in self.nfa_states[nfa_id].getNextStates(char)]) #gets the ids of each NFA state 
		return DFA_state(next_DFA_state)

	def __str__(self):
		string =  "-------------------------------------------------------------\n"
		string +=  "| Start:" + str(self.start.id) + "\t\t\t\t|\n"
		for s in self.accept:
			string += "| Accepts: " + str(s) + "\t\t\t\t|\n"
		for s in self.allSets:
			string += s.__str__()
		return string

	def DFA_MATCH(self,s):
		# s is a string, try and match it
		current_state = self.start
		for c in s: # for every character in the string
			if current_state == "FAILURE":
				break
			if c in current_state.transitions: # else
				current_state = current_state.transitions[c] #transition state
			else: current_state = "FAILURE"

		if current_state == "FAILURE": return False
		if current_state.id in self.accept:
			return True
		return False


if __name__ == "__main__":
	import sys
	source_name = sys.argv[1]
	string = sys.argv[2]
	grammar_name = "regex.parse"
	local_parser = LR1_parser.Parser(grammar_name)
	nfa = NFA_builder.CreateNFA(local_parser.parse(open(source_name,"r").read()))
	dfa = DFA(nfa,"abcdefghijklmnopqrstuvwxyz")
#	for s in nfa.getStates():
#		print "NEW S"
#		print s.getAllNextStates()
	output = open("resultingDFA.txt",'w')
	output.write(dfa.__str__())
	print dfa.DFA_MATCH(string)


