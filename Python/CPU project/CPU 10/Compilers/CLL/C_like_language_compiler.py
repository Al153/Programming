#compiler for a C like language



#steps:
	#parse to parse tree
		# - import .h files
		# - split program into functions
		# - parse function text
		# - <cr>eate parse tree
	#generate code
		# - deal with variable use/ function calls
		# - use parse tree to generate forth code
		# - import relative header files


# tasks:
	# - <cr>eate bnf style format for expressing language
	# - build meta parser that reads in BNF  and parses text equivalently

	# - build a parse tree reorderer - separate executable code and function calls etc
	# - check typing - check the types of each function call etc
	# - check variable use
	# - sort out stack framing



#______________________ ABNF: Al's BNF ______________________
#<r>                    represents an expression known as a r
#::=                means consists of 
#|                  means a choice
#"string"           means a string literal of str

#id                 identifier (python style variable naming rules: )
#dig                means any combination of digits in a row
#""                 arbitary empty string

#

#                   There must be a global expression known as "PROGRAM"
#                   There must be a global expression known as "ELEMENTARY TOKENS" which defines the specific tokens other than id and int
#                   the rule <GOAL> ::= <PROGRAM> "END" is added, as is the token "END"
#so ABNF defined in itself is:

#<PROGRAM> ::= <set_of_rules>
#<ELEMENTARY_TOKENS> ::= " " | "\n" | "\t"
#<set_of_rules> ::= <rule> <cr> <set_of_rules> | <rule>
#<rule> ::= <assignment> <ws0> <assigned>

#<assignment> ::= <expression_name> <ws0> "::="

#<assigned> ::= <expression_name> | <special> | <composite>
#<composite> ::= <assigned> <ws0> "|" <ws0> <assigned> | <assigned> <ws1> <assigned>
#<special> ::= "<ws0>" | "<ws1>"|"<cr>"|"a-z"|"0-9"|"|&^"|"a1|"

#<expression_name> ::= "<" <name> ">"
#<name> ::= a-z | a-z <name>



# parsing will occur as thus:
	# an ABNF parser based on the above will parse a set of BNF rules which define the language syntax
	# using the now internalised language ABNF, the parser parses the program

import copy

class ABNF_parse_tree:
	def __init__(self,ABNF_string):
		self.ABNF = ABNF_string
		self.get_rules()
	def get_rules(self):
		#split text into lines,ignoring excess whitespace
		lines = self.ABNF.split("\n")
		rules_list = [self.tokenise_line(line) for line in lines if self.tokenise_line(line)]
		self.rules = {rule.left_hand_side:rule.right_hand_side for rule in map(ABNF_rule,rules_list)}
	def tokenise_line(self,line):
		#simple line tokeniser
		whitespace = [' ','\t']
		escaped_dict = {"n":"\n","t":"\t",'"':'"'}
		line_tokens = []
		current_token = ''
		string = 0
		escaped = 0


		for character in line:
			if not string:                          #vanilla tokens
				if character in whitespace:         #removes whitespace
					if current_token == '':
						pass
					else:
						line_tokens.append(current_token)
						current_token = ''
				elif character == '"' and current_token == '':      #start of string
					string = 1
					current_token += character
				else:                                               #typical character
					current_token += character


			else:
				if not escaped:
					if character == "\\":       #escaped
						escaped = 1
					elif character == '"':      #end of string
						current_token += '"'
						line_tokens.append(current_token)
						current_token = ''
						string = 0
					else:
						current_token += character

				else:
					current_token += escaped_dict[character]
					escaped = 0
		if current_token != '':
			line_tokens.append(current_token)
		if line_tokens == []:
			return False
		else:
			return line_tokens
	def express_parse_tree(self):
		for rule in self.rules:
			print rule, ":=",self.rules[rule]






class ABNF_rule:
	def __init__(self,rule_list):
		#rule_list is a list of tokens containing the rule
		self.rule = rule_list
		self.left_hand_side = self.get_lhs()
		self.right_hand_side = self.get_rhs()
	def get_lhs(self):
		#gets the left handside of rule equation and checks it's valid
		if "::=" !=  self.rule[1]:
			raise SyntaxError('"::=" Operator not present or in incorrect position in rule "'+' '.join(self.rule)+ '".')
		else:
			lhs = self.rule[0]
			if lhs[0] == "<" and lhs[-1] == ">":
				return lhs
			else:
				raise SyntaxError('"'+lhs+ '" expression does not have <> brackets.')
	def get_rhs(self):
		#generates a list of possible right hand sides of rule equation
		replacement_possibilities = []
		current_possibility = []
		for token in self.rule[2:]:
			if token == "|":
				if current_possibility != []:
					replacement_possibilities.append(current_possibility)
					current_possibility = []
				else:
					raise SyntaxError('ABNF parser did not expect "|" operator in rule "'+ ' '.join(self.rule) + '".')
			else:
				current_possibility.append(token)
		if current_possibility != []:
			replacement_possibilities.append(current_possibility)
		return replacement_possibilities


 
#my_parse_tree = ABNF_parse_tree('''
#<PROGRAM> ::= <set_of_rules>
#<ELEMENTARY_TOKENS> ::= " " | "\\n" | "\\t" "<" | ">"

#<set_of_rules> ::= <rule> <cr> <set_of_rules> | <rule>
#<rule> ::= <assignment> <ws0> <assigned>

#<assignment> ::= <expression_name> <ws0> "::="

#<assigned> ::= <expression_name> | <special> | <composite>
#<composite> ::= <assigned> <ws1> "|" <ws1> <assigned> | <assigned> ws1 <assigned>
#<special> ::= "id" | "dig"

#<expression_name> ::= "<" <name> ">"
#<name> ::= id
#<cr> ::= <ws0> "\\n" <cr> | <ws0> "\\n"
#<ws0> ::= <ws> <ws0> | ""
#<ws1> ::= <ws> <ws1> | <ws>
#<ws> ::= " " | "\\t"

#''')
#my_parse_tree.express_parse_tree()




class Parser:
	def __init__(self,ABNF_grammar,source_text):
		self.ABNF_tree = ABNF_parse_tree(ABNF_grammar)                                          #parses grammar specification
		self.ABNF_tree.express_parse_tree()
		print "\n\n"
		self.rules = self.get_rules_table()                                             #gets a list of rules from the ABNF tree
		self.elementary_tokens = self.rules["<ELEMENTARY_TOKENS>"]
		del self.rules["<ELEMENTARY_TOKENS>"]

		self.terminals = self.get_terminals()                                                #searches rules to get a list of terminal strings which are directly referenced in the grammar
		self.grammar_symbols = [symbol for symbol in self.rules] + self.terminals                        #gets all grammar symbols
		self.first_sets = {}                                                                     #used to speed up testing of first sets
		self.initialise_first_sets()
		print "calculated first sets: "
		self.print_first_sets()


		print self.compare_item_sets(set([Item("<PROGRAM>",["BLOB","<E>"],"END")]),set([Item("<PROGRAM>",["BLOB","<E>"],"END")]))
		cont = raw_input('')

		self.item_set = self.get_item_sets()                                                        #finds all items reachable from "GOAL"
		self.get_parsing_tables()

		self.print_fsm()



#
#

#       self.tokens = self.tokenise(source_text)                                                    #tokeniser takes in text and produces a list of terminal objects
#       self.LHS_goto_table = self.get_LHS_goto_table()                                             #generates lookup and lookahead tables
#       self.lookahead_action_table = self.get_lookahead_action_table()
#       self.parse_tree_stack = [0]                                                                 #starts with just starting state#
#
#

#       self.lookahead = self.tokens[0]                                                             #Loads in lookahead token 
#       self.token_index = 1                                                                        #fixes index within stream



#_________________________________________________ Parse related functions ______________________________________________

	def parse(self):
		while not self.parse_step():
			pass
		return 

	def parse_step(self):                                                                           #main parsing step, repeated till done or error
		top_state = self.parse_tree_stack[-1]                                                       #get the top state of the stack
		try:
			next_action_tuple = self.lookahead_action_table[top_state,self.lookahead.type]          #uses table to calculate next values
		except KeyError:
			next_action_tuple = ("error","unidentified terminal")                                   #if there is an error, then call error
		if next_action_tuple[0] == "shift":                                                         #carries out a shift operation
			self.shift(next_action_tuple[1])                                                        
			return 0                                                                                #returns 1 if done, so this is not done
		elif next_action_tuple[0] == "reduce":
			self.reduce(next_action_tuple[1])                                                       #next action tuple[1] = pattern number      #carries out a reduce operation
			return 0
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
	
	def reduce(self,pattern_number):

		#<logic to get pattern and lhs>


		length_to_pop = 2*len(pattern)                                                              #the length of the pattern to reduce is doubled (to accomodate for state values)
		popped = self.parse_tree_stack[-length_to_pop::2]                                           #pops off symbols to be matched
		self.parse_tree_stack = self.parse_tree_stack[:-length_to_pop]                              #rest of pop operation
		state_p = self.parse_tree_stack[-1]                                                         #gets previous state
		next_state = LHS_goto_table[state_p][lhs]                                                   #calculates new state
		tree_to_push = Non_terminal_parse_tree_node(lhs,popped)                                     #creates  new parse tree node
		self.parse_tree_stack += [tree_to_push,next_state]                                          #pushes new tree and state


	def done(self):                                                                                 #halts operation
		if len(self.parse_tree_stack) == 1 and self.parse_tree_stack[-1] == 0:                      #if stack consists of a parse tree and the success state 
			return 1
		else:
			self.error("False_EOF")                                                                 #calls an errors
	
	def error(self,reason):                                                                         #error reporting
		quit()







	def tokenise(self,source_text):                                                                 #splits text according to elementary tokens - chars which indicate a new token
		token_triggers = self.elementary_tokens                                                     #fetch elementary tokens
		current_token = ''                                                                          #initialise current token and token list
		token_list = []
		for character in source_text:                                                               #iterate through source text
			if character in token_triggers:                                                         #splits if elementary token found
				token_list.append(self.get_parse_tree_node(current_token))                          #generates parse tree node object
				token_list.append(self.get_parse_tree_node(character))                              #adds in parse tree node for elementary token causing splitting
				current_token = ''
			else:
				current_token += character                                                          #otherwise place the character in the token

		if current_token != '':                                                                     #clean up final token
			token_list.append(self.get_parse_tree_node(current_token))
		token_list.append(Terminal_parse_tree_node("END","END"))                                    #adds end symbol to end of code
		return token_list           

	def get_parse_tree_node(self,current_token):                                                    #gets a node for the parse tree
		if current_token in self.terminals:                                              #if it is a special string, eg "=" then create a terminal 
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
		for state in self.enumerated_states:
			self.LHS_goto_table[state] = {}
			self.lookahead_action_table[state] = {}

			for symbol in self.enumerated_states[state].goto_table:
				if symbol == "END" and self.is_in_item_set(Item("<GOAl>",['<PROGRAM>', 'BLOB', 'END' ],'END'), self.enumerated_states[state].own_set): 	#if the final rule, accept
					self.lookahead_action_table[state][symbol] = ("accept",0)					
				if symbol in self.terminals:
					self.lookahead_action_table[state][symbol] = ("shift",self.enumerated_states[state].goto_table[symbol]) 	#shift symbol onto stack, goto new state
				else:
					self.LHS_goto_table[state][symbol] = self.enumerated_states[state].goto_table[symbol] 		#once a reduction has occured, get the new state

			for item in self.enumerated_states[state].own_set:
				if item.rhs.index("BLOB")+1 == len(item.rhs): #reduce
					for rule in self.enum_rules:			  #searching for acceptable rules
						found = 0
						if rule.lhs == item.lhs and rule.rhs == item.rhs[:-1]: #if rule is correct
							found = 1
							rule_number = rule.number
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
		rules["<GOAL>"] = Rule("<GOAL>",[["<PROGRAM>","END"]])                                      #adds global rule
		self.get_enumerated_rules_table(rules)                                                          #generates an enumerated list of the patterns for table generation                                  
		return rules

	def get_enumerated_rules_table(self,rules):                                                         #separates out rules into a version for each rhs an enumberates them
		self.enum_rules = []                                                                        #new list
		for rule in rules:                                                                     #cycles through rules
			if rule != "<ELEMENTARY_TOKENS>":													#not a real rule
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
	def closure(self,items):
		#input is a set of items: item has lhs, rhs, and lookahead, where rhs contains 'blob'
		#print "Calculating closure: ",items,type(items)
		items = list(items)
		for item in items:
			#print "Item  = ",item.lhs,item.rhs
			if item.rhs.index("BLOB") + 1 < len(item.rhs):
				next_symbol = item.rhs[item.rhs.index("BLOB")+1]
				#print "next symbol = ",next_symbol
				if next_symbol not in self.terminals:
					for production in self.rules[next_symbol].rhs:
						#print "production = ",production
						first_set = self.first_sets[item.rhs[item.rhs.index("BLOB")+1]]
						#print "first_set = ",first_set
						for terminal in first_set:
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
		starting_state = self.closure([Item("<GOAL>",["BLOB"] +self.rules["<GOAL>"].rhs[0],"END")]) 
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
					self.first_sets[non_terminal].append(symbol) 		#adds the symbol
				if not self.null_dict[symbol]:							#if the symbol derives the empty string then the next symbol is added to first
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
		if not '""' in self.null_dict: 	#if no symbols can be null
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

#________________________________________ functions for comparing and checking membership for items, itemsets etc ___________________

	def compare_items(self,item1,item2):
		#compares two items
		return (item1.lhs == item2.lhs)and(item1.rhs == item2.rhs)and(item1.lookahead == item2.lookahead)

	def compare_item_sets(self,item_set1,item_set2):
		#sees if two item sets are the same
		counting_item_set = set(item_set2) 				#each time an item is matched, it is removed
		for item1 in item_set1:
			found = 0
			for item2 in item_set2: 					#tries to find each item in the second set, and removes it from the copy of the second set
				if self.compare_items(item1,item2):
					found = 1
					counting_item_set.remove(item2)
					break
			if not found:
				return False
		if len(counting_item_set):   					#if there are additional items in the second set, then the copy set will still have items in it
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

	def print_first_sets(self):
		for symbol in self.rules:
			print "FIRST("+symbol+") = ",self.first_sets[symbol]

	def print_item(self,item):
		print item.lhs, "==>", item.rhs,",",item.lookahead



#________________________________________________________________________________________________________________
class Non_terminal_parse_tree_node:                                                                 #class for non terminals (ie have children)
	def __init__(self,node_type,children):
		self.terminal = 0
		self.type = node_type
		self.children = []

class Terminal_parse_tree_node:                                                                     #class for terminals
	def __init__(self,node_type,token_string):
		self.terminal = 0
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

#test_code:

test_abnf = '''
<PROGRAM> ::= <Line> | <PROGRAM> <Line>
<Line> ::= id "=" <Expression>
<Expression> ::= <Products> "+" <Products> | <Products> | dig | id
<Products> ::= <Expression> "*" <Expression> | <Expression>
<ELEMENTARY_TOKENS> ::= "*" | "+"
'''
#test_abnf = '''
#<PROGRAM> ::= <E>
#<E> ::= id <S> <E> | id
#<S> ::=	dig
#<ELEMENTARY_TOKENS> ::= 
#'''

test_abnf = '''
<PROGRAM> ::= <PROGRAM> <T> | <T>
<T> ::= <T> "*" <F> | <F>
<F> ::= "(" <PROGRAM> ")" | id
<ELEMENTARY_TOKENS> ::= "("
'''
test_parser = Parser(test_abnf,'')
