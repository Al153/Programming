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
#<r>					represents an expression known as a r
#::= 				means consists of 
#|					means a choice
#"string"			means a string literal of str

#id 				identifier (python style variable naming rules: )
#dig                means any combination of digits in a row
#""					arbitary empty string

#

#					There must be a global expression known as "PROGRAM"
#					There must be a global expression known as "ELEMENTARY TOKENS" which defines the specific tokens other than id and int
#					the rule <GOAL> ::= <PROGRAM> "END" is added, as is the token "END"
#so ABNF defined in itself is:

#<PROGRAM> ::= <set_of_rules>
#<ELEMENTARY_TOKENS> ::= " " | "\n" | "\t"
#<set_of_rules> ::= <rule> <cr> <set_of_rules> | <rule>
#<rule>	::= <assignment> <ws0> <assigned>

#<assignment> ::= <expression_name> <ws0> "::="

#<assigned> ::= <expression_name> | <special> | <composite>
#<composite> ::= <assigned> <ws0> "|" <ws0> <assigned> | <assigned> <ws1> <assigned>
#<special> ::= "<ws0>" | "<ws1>"|"<cr>"|"a-z"|"0-9"|"|&^"|"a1|"

#<expression_name> ::= "<" <name> ">"
#<name> ::= a-z | a-z <name>



# parsing will occur as thus:
	# an ABNF parser based on the above will parse a set of BNF rules which define the language syntax
	# using the now internalised language ABNF, the parser parses the program



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
			if not string: 							#vanilla tokens
				if character in whitespace:			#removes whitespace
					if current_token == '':
						pass
					else:
						line_tokens.append(current_token)
						current_token = ''
				elif character == '"' and current_token == '': 		#start of string
					string = 1
					current_token += character
				else:												#typical character
					current_token += character


			else:
				if not escaped:
					if character == "\\":		#escaped
						escaped = 1
					elif character == '"':		#end of string
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
#<rule>	::= <assignment> <ws0> <assigned>

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
		self.ABNF_tree = ABNF_parse_tree(ABNF_grammar)  										#parses grammar specification
		self.ABNF_tree.express_parse_tree()
		print "\n\n"
		self.rules = self.get_rules_table()												#gets a list of rules from the ABNF tree
		self.elementary_tokens = self.rules["<ELEMENTARY_TOKENS>"]
		del self.rules["<ELEMENTARY_TOKENS>"]
		self.terminal_expressions = self.get_terminal_expressions() 						#searches rules to get a list of terminal strings which are directly referenced in the grammar
		self.first_sets = {}																		#used to speed up testing of first sets
		self.tested_first_set = [] 																	#used to prevent infinite recursion of first set calculations, stores sets for which calculation has been attempted
		self.item_set = self.get_item_sets() 														#finds all items reachable from "GOAL"
		self.print_fsm()



#
#

#		self.tokens = self.tokenise(source_text) 													#tokeniser takes in text and produces a list of terminal objects
#		self.LHS_goto_table = self.get_LHS_goto_table() 											#generates lookup and lookahead tables
#		self.lookahead_action_table = self.get_lookahead_action_table()
#		self.parse_tree_stack = [0] 																#starts with just starting state#
#
#

#		self.lookahead = self.tokens[0] 															#Loads in lookahead token 
#		self.token_index = 1 																		#fixes index within stream


	def parse(self):
		while not self.parse_step():
			pass
		return 

	def parse_step(self):																			#main parsing step, repeated till done or error
		top_state = self.parse_tree_stack[-1] 														#get the top state of the stack
		try:
			next_action_tuple = self.lookahead_action_table[top_state,self.lookahead.type] 			#uses table to calculate next values
		except KeyError:
			next_action_tuple = ("error","unidentified terminal")									#if there is an error, then call error
		if next_action_tuple[0] == "shift":															#carries out a shift operation
			self.shift(next_action_tuple[1])														
			return 0 																				#returns 1 if done, so this is not done
		elif next_action_tuple[0] == "reduce":
			self.reduce(next_action_tuple[1]) 														#next action tuple[1] = pattern number 		#carries out a reduce operation
			return 0
		elif next_action_tuple[0] == "done":														#if parsing complete, report back that it is done
			done = self.done()
			if done:
				return 1
		elif next_action_tuple[0] == "error": 														#otherwise report an error
			self.error(next_action_tuple[1])

	def shift(self,next_state):																		#shift operation
		self.parse_tree_stack.append(self.lookahead) 												#pushes lookahead symbol
		self.parse_tree_stack.append(next_state) 													#pushes new state
		self.lookahead = self.tokens[self.token_index]												#loads a new lookahead symbol
		self.token_index += 1
	
	def reduce(self,pattern_number):

		#<logic to get pattern and lhs>


		length_to_pop = 2*len(pattern)																#the length of the pattern to reduce is doubled (to accomodate for state values)
		popped = self.parse_tree_stack[-length_to_pop::2] 											#pops off symbols to be matched
		self.parse_tree_stack = self.parse_tree_stack[:-length_to_pop] 								#rest of pop operation
		state_p = self.parse_tree_stack[-1] 														#gets previous state
		next_state = LHS_goto_table[state_p][lhs]													#calculates new state
		tree_to_push = Non_terminal_parse_tree_node(lhs,popped) 									#creates  new parse tree node
		self.parse_tree_stack += [tree_to_push,next_state]											#pushes new tree and state


	def done(self): 																				#halts operation
		if len(self.parse_tree_stack) == 1 and self.parse_tree_stack[-1] == 0:   					#if stack consists of a parse tree and the success state 
			return 1
		else:
			self.error("False_EOF")																	#calls an errors
	
	def error(self,reason):																			#error reporting
		quit()

	def tokenise(self,source_text): 																#splits text according to elementary tokens - chars which indicate a new token
		token_triggers = self.elementary_tokens 													#fetch elementary tokens
		current_token = ''																			#initialise current token and token list
		token_list = []
		for character in source_text: 																#iterate through source text
			if character in token_triggers: 														#splits if elementary token found
				token_list.append(self.get_parse_tree_node(current_token)) 							#generates parse tree node object
				token_list.append(self.get_parse_tree_node(character))								#adds in parse tree node for elementary token causing splitting
				current_token = ''
			else:
				current_token += character 															#otherwise place the character in the token

		if current_token != '': 																	#clean up final token
			token_list.append(self.get_parse_tree_node(current_token))
		token_list.append(Terminal_parse_tree_node("END","END"))									#adds end symbol to end of code
		return token_list			

	def get_rules_table(self):																		#extracts rules into an easy to access table, addressed by the lhs of each rule
		rules = {}
		for rule in self.ABNF_tree.rules:															#iterates through rules
			rules[rule] = Rule(rule,self.ABNF_tree.rules[rule])										#reordering rules table
		rules["<GOAL>"] = Rule("<GOAL>",[["<PROGRAM>","END"]])										#adds global rule
		self.get_enumerated_rules_table(rules)															#generates an enumerated list of the patterns for table generation									
		return rules

	def get_enumerated_rules_table(self,rules):															#separates out rules into a version for each rhs an enumberates them
		self.enum_rules = []																		#new list
		for rule in rules:																		#cycles through rules
			rhs = rules[rule].rhs 																#gets rhs
			for rhs_part in rhs: 																	#iterates through patterns creating enumerated rules
				self.enum_rules.append(EnumRule(rule,rhs_part,len(self.enum_rules)))

	def get_parse_tree_node(self,current_token):													#gets a node for the parse tree
		if current_token in self.terminal_expressions: 												#if it is a special string, eg "=" then create a terminal 
			return Terminal_parse_tree_node('"'+current_token+'"',current_token)
		else:
			try:
				current_token = int(current_token)
				return Terminal_parse_tree_node("int",current_token)								#if integerise-able then produce an integer token
			except ValueError:
				return Terminal_parse_tree_node("id",current_token)									#otherwise then produce an identifier




	def get_terminal_expressions(self):
		#recognises terminal expressions
		terminal_expressions = []
		for symbol in self.rules:
			for pattern in self.rules[symbol].rhs:
				for token in pattern:
					if not(token[0] == "<" and token[-1] == ">") and token not in terminal_expressions:
						terminal_expressions.append(token)
		return terminal_expressions


	def get_LHS_goto_table(self):
		pass
	def get_lookahead_action_table(self):
		pass

	def first(self,symbol):
		#checks memo of first rules sets
		#if exists, then returns the rules
		#print symbol
		self.tested_first_set.append(symbol)
		if symbol in self.first_sets:
			return self.first_sets[symbol]
		else:
			new_first_set = set([])
			rules = self.rules[symbol].rhs
			for pattern in rules:
				if pattern[0] in self.rules: #if a non terminal, then first(X) += first(Y)
					if pattern[0] not in self.tested_first_set:
						self.first(pattern[0])
						new_first_set |= self.first_sets[pattern[0]]
				else:						#if a terminal, then first(X) += Y
					new_first_set |= set([pattern[0]])
			self.first_sets[symbol] = new_first_set	
			return self.first_sets[symbol]
	
	def alternate_first(self,symbol):
#		If X is a terminal then First(X) is just X!
#		If there is a Production X → ε then add ε to first(X)
#		If there is a Production X → Y1Y2..Yk then add first(Y1Y2..Yk) to first(X)
#		First(Y1Y2..Yk) is either
#    		First(Y1) (if First(Y1) doesn't contain ε)
#    		OR (if First(Y1) does contain ε) then First (Y1Y2..Yk) is everything in First(Y1) <except for ε > as well as everything in First(Y2..Yk)
#    	If First(Y1) First(Y2)..First(Yk) all contain ε then add ε to First(Y1Y2..Yk) as well.
		
#		first(A) is the set of all {t in terminals: A ==> t alpha}
		
		#this is the initialisation function,
		if symbol in self.first_sets:
			return self.first_sets[symbol]
		else:
			self.checking_sets = [symbol]
			self.first_sets[symbol] = alternate_first_recursion(symbol)

	def alternate_first_recursion(self,symbol):
		#the recursive part
		if symbol in self.terminal_expressions: #if x is a terminal
			return symbol
		patterns = self.rules[symbol].rhs
		

	def alternate_first_of_list(self,symbol_list):

#_______________________________ set finding algorithms ______________________
	def closure(self,item_set):
		#input is a set of items: item has lhs, rhs, and lookahead, where rhs contains 'blob'
		print "Calculating closure: ",item_set
		for item in item_set:
			print "Item  = ",item.lhs,item.rhs
			if item.rhs.index("BLOB") + 1 < len(item.rhs):
				next_symbol = item.rhs[item.rhs.index("BLOB")+1]
				print "next symbol = ",next_symbol
				if next_symbol not in self.terminal_expressions:
					for production in self.rules[next_symbol].rhs:
						print "production = ",production
						first_set = self.first(item.rhs[item.rhs.index("BLOB")+1])
						print "first_set = ",first_set
						for terminal in first_set:
							item_to_add = Item(production.lhs,["BLOB"]+production.rhs,terminal)
							print "Adding item to closure: ", item_to_add.right_hand_side,item_to_add.lhs,item_to_add.lookahead
							item_set |= set([item_to_add])
		print "closure",item_set
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
		grammar_symbols = [symbol for symbol in self.rules] + self.terminal_expressions
		print "grammar_symbols = ", grammar_symbols
		starting_state = self.closure([Item("<GOAL>",["BLOB"] +self.rules["<GOAL>"].rhs[0],"END")]) 
		C_set = [starting_state]
		print starting_state
		self.enumerated_states = {0:Finite_automaton_state(starting_state,0)} 	#allows for creation of finite automaton
		state_number = 1 								#counts number of states

		for item_set in C_set:
			print "\n\n", item_set,"\n\n"
			state_index = C_set.index(item_set)
			for X in grammar_symbols:
				goto_of_x = self.goto(item_set,X)
				print X,goto_of_x
				if len(goto_of_x)>0 and (goto_of_x not in C_set):
					print "ADDING", goto_of_x
					C_set += [goto_of_x]
					self.enumerated_states[state_number] = Finite_automaton_state(goto_of_x,state_number)
					self.enumerated_states[state_index].goto_table[X] = state_number
					state_number += 1
		return frozenset(C_set)

	def print_fsm(self):
		for index in self.enumerated_states:
			print "\n\n\n________________________ STATE ",int(index),"______________________________"
			print self.enumerated_states[index].goto_table



#________________________________________________________________________________________________________________
class Non_terminal_parse_tree_node:																	#class for non terminals (ie have children)
	def __init__(self,node_type,children):
		self.terminal = 0
		self.type = node_type
		self.children = []

class Terminal_parse_tree_node:																		#class for terminals
	def __init__(self,node_type,token_string):
		self.terminal = 0
		self.type = node_type
		self.string = token_string

class Rule: 																						#simple rule class
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
		self.goto_table = {}


#test_code:

test_abnf = '''
<PROGRAM> ::= <Sums>
<Sums> ::= <Sums> "+" <Products> | <Products>
<Products> ::= <Products> "*" <Value> | <Products>
<Value> ::= dig | id
<ELEMENTARY_TOKENS> ::= "*" | "+" | dig | id
'''
test_parser = Parser(test_abnf,'')
