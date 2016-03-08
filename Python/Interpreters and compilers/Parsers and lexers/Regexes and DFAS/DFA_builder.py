# builds a DFA from an NFA
import NFA_builder
import LR1_parser

class DFAstateCounter:
	def __init__(self):
		self.i = 0
	def __call__(self):
		self.i += 1
		return str(self.i -1)
	def decrement(self):
		self.i -=1

DFAstateCounter = DFAstateCounter()


class DFA_state:
	def __init__(self,nfa_set):
		self.id = DFAstateCounter()
		self.nfa_set =  set(nfa_set)
		self.transitions = {} # dict: char --> state


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
		string += ("| State number: " + str(self.id)).ljust(60) +"|\n"
		string += "-------------------------------------------------------------\n"
		for s in self.nfa_set:
			string += ("| contains: " + str(s)).ljust(60) + "|\n"

		string += "-------------------------------------------------------------\n"
		for c in self.transitions:
			string += ("|"+c+"-->"+ str(self.transitions[c].id)).ljust(60) + "|\n"
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
		i = 0
		while i < len(self.allSets):
			a = self.allSets[i]
			i += 1
			j = 0
			while j < len(self.allSets):
				b = self.allSets[j]
				j += 1
				if a in self.allSets: # occasionally, a is removed
					if self.can_merge(a,b): # tests all pairs of states in the fsm to see if they can be merged
						self.merge_states(a,b) 
						i -= 1
						j -= 1
						a = self.allSets[i]

					


	def __getTransition(self,this_DFA_state,char):
		next_DFA_state = set([])
		for  nfa_id in this_DFA_state.nfa_set:
			next_DFA_state |= set([n.getID() for n in self.nfa_states[nfa_id].getNextStates(char)]) #gets the ids of each NFA state 
		return DFA_state(next_DFA_state)

	def __str__(self): # prints out a representation of the state
		string =  "-------------------------------------------------------------\n"
		string +=  ("| Start:" + str(self.start.id)).ljust(60) + "|\n"
		for s in self.accept:
			string += ("| Accepts: " + str(s)).ljust(60) + "|\n"
		string += "-------------------------------------------------------------\n\n\n\n"
		for s in self.allSets:
			string += s.__str__()
		return string

	def DFA_MATCH(self,s):
		# s is a string, try and match it
		current_state = self.start # start at the start state
		for c in s: # for every character in the string
			print current_state.id, "--"+c+"-->",
			if c in current_state.transitions: # find the transition associated with c
				current_state = current_state.transitions[c] # do state transition
				print current_state.id
			else: 											 # otherwise raise a failure condition
				current_state = "FAILURE"
				print current_state
				break
		if current_state == "FAILURE": return False
		return current_state.id in self.accept #check if the final state is an accepting state

	def can_merge(self,s1,s2):
		if (s1.id in self.accept)!=(s2.id in self.accept): # if one accepts and the other not, then not equivalent states
			return False
		else:
			if s1.transitions == s2.transitions: # if they have the same transitions
				return s1.id != s2.id # and are not the same stat, then they can be merged
			else: #could still be merged if they both share all their transitions with the merged state
				if len(s1.transitions) == len(s2.transitions):
					for c in s1.transitions:
						if s1.transitions[c] == s2.transitions[c]: # if this transition is equal then test the next
							continue
						else:
							if s1.transitions[c] in [s1,s2] and s2.transitions[c] in [s1,s2]: #if transition not equal then check if it's in the shared set
								continue
							else:
								return False
					return True
				else:
					return False

	def merge_states(self,s1,s2):
		newState = DFA_state(s1.nfa_set|s2.nfa_set)
		DFAstateCounter.decrement()
		newState.id = str(s1.id)+"i"
		newState.transitions = s1.transitions
		if s1.id in self.accept:
			self.accept.add(newState.id)
			self.accept.remove(s1.id)
			self.accept.remove(s2.id)
		self.allSets.remove(s1)
		self.allSets.remove(s2)
		self.allSets.append(newState)
		for state in self.allSets:
			for key in state.transitions:
				if state.transitions[key] == s1 or state.transitions[key] == s2:
					state.transitions[key] = newState
		if s1 == self.start or s2 == self.start:
			self.start = newState

if __name__ == "__main__":
	import sys
	regex_file_name = sys.argv[1] #get a file with the regex
	string = sys.argv[2] 	  #get the string
	grammar_name = "regex.parse"
	local_parser = LR1_parser.Parser(grammar_name) #create an LR1 parser for regexes
	nfa = NFA_builder.CreateNFA(local_parser.parse(open(regex_file_name,"r").read())) #create an NFA
	dfa = DFA(nfa,"abcdefghijklmnopqrstuvwxyz")  									  #create a DFA from the NFA
	output = open("resultingDFA.txt",'w')  											  #writes the state structure of the DFA to a file
	output.write(dfa.__str__()) 				
	print dfa.DFA_MATCH(string)														  # tries to match the string


