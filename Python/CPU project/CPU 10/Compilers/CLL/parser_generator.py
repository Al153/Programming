class Parser:
	def __init__(self,ABNF_grammar,source_text):
		self.ABNF_tree = ABNF_parse_tree(ABNF_grammar)                                          #parses grammar specification
		self.ABNF_tree.express_parse_tree()
		print "\n\n"
		self.rules = self.get_rules_table()                                             #gets a list of rules from the ABNF tree

		self.elementary_tokens = self.rules["<ELEMENTARY_TOKENS>"]
		del self.rules["<ELEMENTARY_TOKENS>"]
		print self.elementary_tokens
		self.to_ignore = [character[0][1:-1] for character in self.rules["<IGNORE>"].rhs]
		del self.rules["<IGNORE>"]

		self.terminals = self.get_terminals()                                                #searches rules to get a list of terminal strings which are directly referenced in the grammar
		self.grammar_symbols = [symbol for symbol in self.rules] + self.terminals                        #gets all grammar symbols
		self.first_sets = {}                                                                     #used to speed up testing of first sets
		self.initialise_first_sets()
		print "calculated first sets: "
		self.print_first_sets()

		cont = raw_input('')

		self.item_set = self.get_item_sets()                                                        #finds all items reachable from "GOAL"
		self.get_parsing_tables()

		cont = raw_input('')

		#self.print_lookahead_table()

		self.tokens = self.tokenise(source_text)                                                    #tokeniser takes in text and produces a list of terminal objects
		self.parse_tree_stack = [0]                                                                 #starts with just starting state

		self.lookahead = self.tokens[0]                                                             #Loads in lookahead token 
		self.token_index = 1                                                                        #fixes index within stream

		parse_tree = self.parse()
		self.print_parse_tree(parse_tree)


#_________________________________________________ Parse related functions ______________________________________________

	def parse(self):
		while not self.parse_step():
			pass
		return self.parse_tree_stack[1]

	def parse_step(self):                                                                           #main parsing step, repeated till done or error
		top_state = self.parse_tree_stack[-1]                                                       #get the top state of the stack
		try:
			print self.lookahead.type,self.lookahead.string,
			next_action_tuple = self.lookahead_action_table[top_state][self.lookahead.type]          #uses table to calculate next values
		except KeyError:
			next_action_tuple = ("error",'not expecting terminal type = '+self.lookahead.type+', terminal = "'+self.lookahead.string+'"')                                   #if there is an error, then call error
		print next_action_tuple
		if next_action_tuple[0] == "shift":                                                         #carries out a shift operation
			self.shift(next_action_tuple[1])                                                        
			return 0                                                                                #returns 1 if done, so this is not done
		elif next_action_tuple[0] == "reduce":
			return self.reduce(next_action_tuple[1])                                                       #next action tuple[1] = pattern number      #carries out a reduce operation
		elif next_action_tuple[0] == "done":                                                        #if parsing complete, report back that it is done
			done = self.done()
			if done:
				return 1
		elif next_action_tuple[0] == "error":                                                       #otherwise report an error
			self.error(next_action_tuple[1])

	def shift(self,next_state):                                                                     #shift operation
		self.parse_tree_stack.append(self.lookahead)                                                #pushes lookahead symbol
		self.parse_tree_stack.append(next_state)                                                    #pushes new state
		self.lookahead = self.tokens[self.token_index]                                              #loads a new lookahead symbol
		self.token_index += 1
	
	def reduce(self,rule_number):
		pattern = self.enum_rules[rule_number].rhs
		lhs = self.enum_rules[rule_number].lhs
		if lhs == "<GOAL>":
			return self.done()
		length_to_pop = 2*len(pattern)                                                              #the length of the pattern to reduce is doubled (to accomodate for state values)
		popped = self.parse_tree_stack[-length_to_pop::2]                                           #pops off symbols to be matched
		self.parse_tree_stack = self.parse_tree_stack[:-length_to_pop]                              #rest of pop operation
		state_p = self.parse_tree_stack[-1]                                                         #gets previous state
		next_state = self.LHS_goto_table[state_p][lhs]                                                   #calculates new state
		tree_to_push = Non_terminal_parse_tree_node(lhs,popped)                                     #creates  new parse tree node
		self.parse_tree_stack += [tree_to_push,next_state]                                          #pushes new tree and state
		return 0

	def done(self):
		print self.parse_tree_stack[1].type                                                                                 #halts operation
		if len(self.parse_tree_stack) == 3 and self.parse_tree_stack[0] == 0:                      #if stack consists of a parse tree and the success state 
			return 1
		else:
			self.error("False_EOF")                                                                 #calls an errors
	
	def error(self,reason):                                                                         #error reporting
		print reason
		quit()

	def tokenise(self,source_text):                                                                 #splits text according to elementary tokens - chars which indicate a new token
		token_triggers = [character[0][1:-1] for character in self.elementary_tokens.rhs]                                                     #fetch elementary tokens
		current_token = ''                                                                          #initialise current token and token list
		token_list = []
		for character in source_text:                                                               #iterate through source text
			if character in token_triggers:                                                         #splits if elementary token found
				if current_token not in self.to_ignore and current_token != '':
					token_list.append(self.get_parse_tree_node(current_token))                          #generates parse tree node object
				if character not in self.to_ignore:
					token_list.append(self.get_parse_tree_node(character))                              #adds in parse tree node for elementary token causing splitting
				current_token = ''
			else:
				current_token += character                                                          #otherwise place the character in the token

		if current_token != '' and current_token not in self.to_ignore:                         #clean up final token
			token_list.append(self.get_parse_tree_node(current_token))
		token_list.append(Terminal_parse_tree_node("END","END"))                                    #adds end symbol to end of code
		return token_list           

	def get_parse_tree_node(self,current_token):                                                    #gets a node for the parse tree
		if '"' + current_token + '"' in self.terminals:                                              #if it is a special string, eg "=" then create a terminal 
			return Terminal_parse_tree_node('"'+current_token+'"',current_token)
		else:
			try:
				current_token = int(current_token)
				return Terminal_parse_tree_node("int",current_token)                                #if integerise-able then produce an integer token
			except ValueError:
				return Terminal_parse_tree_node("id",current_token)                                 #otherwise then produce an identifier

	def get_parsing_tables(self):
		self.LHS_goto_table = {}
		self.lookahead_action_table = {}
		for rule in self.enum_rules:
			print rule.number,"|",rule.lhs," ==> ", rule.rhs
		for state in self.enumerated_states:
			self.LHS_goto_table[state] = {}
			self.lookahead_action_table[state] = {}

			for symbol in self.enumerated_states[state].goto_table:
				if symbol == "END" and self.is_in_item_set(Item("<GOAl>",['<PROGRAM>', 'BLOB'],'END'), self.enumerated_states[state].own_set):  #if the final rule, accept
					self.lookahead_action_table[state][symbol] = ("done",0)                   
				if symbol in self.terminals:
					self.lookahead_action_table[state][symbol] = ("shift",self.enumerated_states[state].goto_table[symbol])     #shift symbol onto stack, goto new state
				else:
					self.LHS_goto_table[state][symbol] = self.enumerated_states[state].goto_table[symbol]       #once a reduction has occured, get the new state

			for item in self.enumerated_states[state].own_set:
				if item.rhs.index("BLOB")+1 == len(item.rhs): #reduce
					for rule in self.enum_rules:              #searching for acceptable rules
						found = 0
						if rule.lhs == item.lhs and rule.rhs == item.rhs[:-1]: #if rule is correct
							found = 1
							rule_number = rule.number
							break
					if found:
						self.lookahead_action_table[state][item.lookahead] = ("reduce",rule_number)
					else:
						print "ERROR: no correct rule found for item", 
						self.print_item(item)



#________________________________ Functions for extracting rules from the ABNF parse tree _______________________________________________________

	def get_rules_table(self):                                                                      #extracts rules into an easy to access table, addressed by the lhs of each rule
		rules = {}
		for rule in self.ABNF_tree.rules:                                                           #iterates through rules
			rules[rule] = Rule(rule,self.ABNF_tree.rules[rule])                                     #reordering rules table
		rules["<GOAL>"] = Rule("<GOAL>",[["<PROGRAM>"]])                                      #adds global rule
		self.get_enumerated_rules_table(rules)                                                          #generates an enumerated list of the patterns for table generation                                  
		return rules

	def get_enumerated_rules_table(self,rules):                                                         #separates out rules into a version for each rhs an enumberates them
		rules_to_ignore = ["<ELEMENTARY_TOKENS>","<IGNORE>"]
		self.enum_rules = []                                                                        #new list
		for rule in rules:                                                                     #cycles through rules
			if rule not in rules_to_ignore:                                                   #not a real rule
				rhs = rules[rule].rhs                                                               #gets rhs
				for rhs_part in rhs:                                                                    #iterates through patterns creating enumerated rules
					self.enum_rules.append(EnumRule(rule,rhs_part,len(self.enum_rules)))

	def get_terminals(self):
		#finds terminal expressions in the rules
		terminals = []
		for symbol in self.rules:
			for pattern in self.rules[symbol].rhs:
				for token in pattern:
					if not(token[0] == "<" and token[-1] == ">") and token not in terminals:
						terminals.append(token)
		return terminals

#_______________________________ set finding algorithms ______________________
	def closure(self,input_items):
		#input is a set of items: item has lhs, rhs, and lookahead, where rhs contains 'blob'
		#print "Calculating closure: ",items,type(items)
		items = list(input_items)

		for item in items:
			#print "Item  = ",item.lhs,item.rhs
			if item.rhs.index("BLOB") + 1 < len(item.rhs):
				next_symbol = item.rhs[item.rhs.index("BLOB")+1]
				#print "next symbol = ",next_symbol
				if next_symbol not in self.terminals:
					lookaheads = self.lookaheads(next_symbol,items)
					#sprint "lookaheads = ",lookaheads
					for production in self.rules[next_symbol].rhs:
						#print "production = ",production
						#first_set = self.first_sets[item.rhs[item.rhs.index("BLOB")+1]]

						for terminal in lookaheads:
							item_to_add = Item(next_symbol,["BLOB"]+production,terminal)
							#print "Adding item to closure: ", item_to_add.lhs, "==>", item_to_add.rhs,",",item_to_add.lookahead
							if not self.is_in_item_set(item_to_add,items):
								items.append(item_to_add)
		item_set = set(items)
		return frozenset(item_set)

	def goto(self,item_set,token):  
		j_item_set = set([])
		for item in item_set:
			if token in item.rhs:
				token_ptr = item.rhs.index(token)
				blob_ptr = item.rhs.index("BLOB")
				if token_ptr == blob_ptr + 1:
					try:
						j_item_set |= set([Item(item.lhs, item.rhs[:blob_ptr]+[token,"BLOB"]+item.rhs[token_ptr+1:],item.lookahead)])
					except IndexError:
						pass
		return self.closure(j_item_set) if len(j_item_set) else frozenset(j_item_set)

	def get_item_sets(self):
		grammar_symbols = self.grammar_symbols
		starting_state = self.closure([Item("<GOAL>",["BLOB","<PROGRAM>"],"END")]) 
		C_set = [starting_state]
		self.enumerated_states = {0:Finite_automaton_state(starting_state,0)}   #allows for creation of finite automaton
		state_number = 1                                #counts number of states



		for item_set in C_set:
			state_index = C_set.index(item_set)
			for X in grammar_symbols:
				goto_of_x = self.goto(item_set,X)
				in_c_set, index = self.is_in_c_set(goto_of_x,C_set)
				if len(goto_of_x)>0 and not in_c_set:
					print "ADDING", X
					C_set += [goto_of_x]
					self.enumerated_states[state_number] = Finite_automaton_state(goto_of_x,state_number)
					self.enumerated_states[state_index].goto_table[X] = state_number
					state_number += 1
				elif len(goto_of_x)>0: #otherwise, link back
					print "LINKING", X
					self.enumerated_states[state_index].goto_table[X] = index
		return frozenset(C_set)


#___________________________ AUXILARY set finding functions __________________________
	def initialise_first_sets(self):
		'''Populates first sets, modified from http://www.andrews.edu/~bidwell/456/'''
		#initialise first table
		self.get_nulls()
		self.first_sets = {symbol:[symbol] if symbol in self.terminals else [] for symbol in self.grammar_symbols}
		#for each NT, gathers a list of symbols which could be in first, including both terminals and non terminals
		for rule in self.enum_rules:
			non_terminal = rule.lhs
			pattern = rule.rhs
			for symbol in pattern:
				if not symbol in self.first_sets[non_terminal]:
					self.first_sets[non_terminal].append(symbol)        #adds the symbol
				if not self.null_dict[symbol]:                          #if the symbol derives the empty string then the next symbol is added to first
					break

		#now while there are still changes each non terminal in each set is used to get the existing symbols in its first set
		changes = 1
		while changes:
			changes = 0
			for symbol_I in self.first_sets:
				for symbol_J in self.first_sets[symbol_I]:
					if not symbol_J in self.terminals:
						changes = self.merge_lists(self.first_sets[symbol_I],self.first_sets[symbol_J])

		#remove non terminals from each set and convert lists to sets
		for symbol_I in self.first_sets:
			self.first_sets[symbol_I] = set(
				filter(
					(lambda symbol: (symbol in self.terminals)),
					self.first_sets[symbol_I]
				)
			)

	def get_nulls(self):
		'''checks if the empty string can be derived from symbol. modified from http://www.andrews.edu/~bidwell/456'''
		self.null_dict = {symbol:False for symbol in self.grammar_symbols}
		if not '""' in self.null_dict:  #if no symbols can be null
			return
		changes = 1
		while changes:
			changes = 0
			for i in self.enum_rules:
				if not self.null_dict[i.lhs]: #otherwise get the new i
					for j in i.rhs:
						broken_out_oof_loop = 0
						if not self.null_dict[j]:
							broken_out_oof_loop = 1
							break

					if broken_out_oof_loop:
						self.null_dict[i.lhs] = True
						changes = 1
		return

	def lookaheads(self,symbol,item_set):			#calculate the lookahead of a set
		return_set = set([])
		item_sets = []
		for item in item_set: 						#lookahead is the union of the follow sets of all items in the item set where the symbol is a immediately to the right of the blob
			if item.rhs.index("BLOB")+1 <len(item.rhs) and item.rhs[item.rhs.index("BLOB")+1] == symbol:
				return_set |= self.follow(item)
		return return_set


	def follow(self,item):
		nullable = 1
		lookaheads = set([])
		for symbol in item.rhs[item.rhs.index("BLOB")+2:]: 		#iterates through symbols, follow of an item is the first set of the symbol to the right of the one to the rights of the blob, in the current context
			lookaheads |= set(self.first_sets[symbol])
			if not self.null_dict[symbol]:
				nullable = 0
				break
		if nullable:
			lookaheads.add(item.lookahead)
		return lookaheads

#________________________________________ functions for comparing and checking membership for items, itemsets etc ___________________

	def compare_items(self,item1,item2):
		#compares two items
		return (item1.lhs == item2.lhs)and(item1.rhs == item2.rhs)and(item1.lookahead == item2.lookahead)

	def compare_item_sets(self,item_set1,item_set2):
		#sees if two item sets are the same
		counting_item_set = set(item_set2)              #each time an item is matched, it is removed
		for item1 in item_set1:
			found = 0
			for item2 in item_set2:                     #tries to find each item in the second set, and removes it from the copy of the second set
				if self.compare_items(item1,item2):
					found = 1
					counting_item_set.remove(item2)
					break
			if not found:
				return False
		if len(counting_item_set):                      #if there are additional items in the second set, then the copy set will still have items in it
			return False
		else: 
			return True

	def is_in_item_set(self,item,item_set):
		#checks if an item is in an item set
		for item1 in item_set:
			if self.compare_items(item,item1):
				return True
		return False


	def is_in_c_set(self,goto_set,C_set):
		#checks if an item set is a member of a list
		for item_set in C_set:
			if self.compare_item_sets(item_set,goto_set):
				return True, C_set.index(item_set)
		return False, None


	def merge_lists(self,list1,list2):
		#merges list2 into list 1 as if they are sets, returns changes to indicate if anny changes occured
		changes = 0
		for symbol in list2:
			if not symbol in list1:
				changes = 1
				list1.append(symbol)
		return changes


#___________________________________ Functions for displaying things ______________________________________________

	def print_fsm(self):
		for index in self.enumerated_states:
			print "\n\n\n________________________ STATE ",int(index),"______________________________"
			for item in self.enumerated_states[index].own_set:
				self.print_item(item)
			print self.enumerated_states[index].goto_table



	def print_lookahead_table(self):
		for state in self.lookahead_action_table:
			print "\n\n\n________________________ STATE ",state,"______________________________"
			for item in self.enumerated_states[state].own_set:
				self.print_item(item)
			print "\n__________________________ lookahead table ____________________________"
			for symbol in self.lookahead_action_table[state]:
				print symbol, "==>", self.lookahead_action_table[state][symbol]
			#cont = raw_input('')

	def print_first_sets(self):
		for symbol in self.rules:
			print "FIRST("+symbol+") = ",self.first_sets[symbol]

	def print_item(self,item):
		print item.lhs, "==>", item.rhs,",",item.lookahead

	def print_parse_tree(self,parse_tree_node,offset = ''):
		if parse_tree_node.terminal:
			print offset+parse_tree_node.type+"("+parse_tree_node.string+")"
			return
		else:
			print offset+parse_tree_node.type+"("
			for child in parse_tree_node.children:
				self.print_parse_tree(child,offset+"  ")
			print offset+")"




#________________________________________________________________________________________________________________
class Non_terminal_parse_tree_node:                                                                 #class for non terminals (ie have children)
	def __init__(self,node_type,children):
		self.terminal = 0
		self.type = node_type
		self.children = children

class Terminal_parse_tree_node:                                                                     #class for terminals
	def __init__(self,node_type,token_string):
		self.terminal = 1
		self.type = node_type
		self.string = token_string

class Rule:                                                                                         #simple rule class
	def __init__(self,lhs,rhs):
		self.lhs = lhs
		self.rhs = rhs

class EnumRule:
	def __init__(self,lhs,rhs,number):
		self.lhs = lhs
		self.rhs = rhs
		self.number = number
		
class Item:
	def __init__(self,lhs,rhs,lookahead):
		self.lhs = lhs
		self.rhs = rhs
		self.lookahead = lookahead

class Finite_automaton_state:
	def __init__(self,own_set,number):
		self.own_set = own_set  
		self.number = number       
		self.goto_table = {}