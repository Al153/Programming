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


 
my_parse_tree = ABNF_parse_tree('''
<PROGRAM> ::= <set_of_rules>
<ELEMENTARY_TOKENS> ::= " " | "\\n" | "\\t" "<" | ">"

<set_of_rules> ::= <rule> <cr> <set_of_rules> | <rule>
<rule>	::= <assignment> <ws0> <assigned>

<assignment> ::= <expression_name> <ws0> "::="

<assigned> ::= <expression_name> | <special> | <composite>
<composite> ::= <assigned> <ws1> "|" <ws1> <assigned> | <assigned> ws1 <assigned>
<special> ::= "id" | "dig"

<expression_name> ::= "<" <name> ">"
<name> ::= id
<cr> ::= <ws0> "\\n" <cr> | <ws0> "\\n"
<ws0> ::= <ws> <ws0> | ""
<ws1> ::= <ws> <ws1> | <ws>
<ws> ::= " " | "\\t"

''')
my_parse_tree.express_parse_tree()




class Parser:
	def __init__(ABNF_grammar,source_text):
		self.ABNF_tree = self.ABNF_parse_tree(ABNF_grammar)  				#parses grammar specification
		self.rules = self.get_rules_table()									#gets a list of rules from the ABNF tree
		self.ABNF_patterns = self.generate_patterns(self.ABNF_tree) 		#inverts rules table to get a lhs for each pattern
		self.terminal_expressions = self.get_terminal_expressions(ABNF_tree) #searches rules to get a list of terminal strings which are directly referenced in the grammar

		self.tokens = self.tokenise(source_text) 							#tokeniser takes in text and produces a list of terminal objects
		self.LHS_goto_table = self.get_LHS_goto_table() 					#generates lookup and lookahead tables
		self.lookahead_action_table = self.get_lookahead_action_table()
		self.parse_tree_stack = [0] 										#starts with just starting state



		self.lookahead = self.tokens[0] 									#Loads in lookahead token 
		self.token_index = 1 												#fixes index within stream


	def parse(self):
		while not self.parse_step():
			pass
		return 

	def parse_step(self):
		top_state = self.parse_tree_stack[-1]
		try:
			next_action_tuple = self.lookahead_action_table[top_state,self.lookahead.type]
		except KeyError:
			next_action_tuple = ("error","unidentified terminal"
		if next_action_tuple[0] == "shift":
			self.shift(next_action_tuple[1])
			return 0
		elif next_action[0] == "reduce":
			self.reduce(pattern,lhs)
			return 0
		elif next_action[0] == "done":
			done = self.done()
			if done:
				return 1
		elif next_action[0] == "error":
			self.error(next_action_tuple[1])

	def shift(self,next_state):
		self.parse_tree_stack.append(self.match(self.lookahead))
		self.parse_tree_stack.append(next_state)
		self.lookahead = self.tokens[self.token_index]
		self.token_index += 1
	
	def reduce(self,pattern,lhs):
		length_to_pop = 2*len(pattern)
		popped = self.parse_tree_stack[-length_to_pop::2]
		self.parse_tree_stack = self.parse_tree_stack[:-length_to_pop]
		state_p = self.parse_tree_stack[-1]
		next_state = LHS_goto_table[state_p][lhs]
		tree_to_push = Non_terminal_parse_tree_node(node_type,popped)
		self.parse_tree_stack += [tree_to_push,next_state]


	def done(self):
		if len(self.parse_tree_stack) == 2 and self.parse_tree_stack[0] == 0:   #if stack consists of a parse tree and the success state 
			return 1
		else:
			self.error("False_EOF")
	def error(self,reason):

		quit()

	def match(self,token):

	def check_patterns(self,parse_tree_stack,ABNF_patterns):
	

	def tokenise(self,source_text):
		token_triggers = self.ABNF_tree.rules["<ELEMENTARY_TOKENS>"]
		current_token = ''
		token_list = []
		for character in source_text:
			if character in token_triggers:
				token_list.append(self.get_parse_tree_node(current_token))
				token_list.append(self.get_parse_tree_node(character))
				current_token = ''
			else:
				current_token += character

		if current_token != '':
			token_list.append(self.get_parse_tree_node(current_token))
		token_list.append(Terminal_parse_tree_node("END","END"))
		return token_list

	def get_terminal_expressions(self,ABNF_tree):
		#recognises terminal expressions

	def get_LHS_goto_table(self):

	def get_lookahead_action_table(self):

	def get_rules_table(self):
		rules = {}
		for rule in self.ABNF_tree.rules:
			rules[rule] = Rule(rule,self.ABNF_tree.rules[rule]))
		rules["<GOAL>"] = [["<PROGRAM>",'"END"']]
		return rules


	def get_item_sets(self):
		

	def find_all_items(self,rule,added_symbols = []):
		items = []
		for i in xrange(len(rule.rhs)):
			items.append([rule.lhs,rule.rhs[:i]+["BLOB"]+rule.rhs[i:]])
			if rule.rhs[i] not in added_symbols and rule.rhs[i][0] == "<" and rule.rhs[i][-1] == "<":
				added_symbols.append(rule.rhs[i])
				items += find_all_item_sets(self.rules[rule.rhs[i]],added_symbols)
		items.append([rule.lhs,rule.rhs+["BLOB"]])
		return items

	def sort_items(self,items):
		sorted_items = {}
		for item in items:
			try:
				sorted_items[item[1].index("BLOB")].append(item)
			except:
				sorted_items[item[1].index("BLOB")] = [item]
		return sorted_items

<<<<<<< HEAD
=======
	def find_item_sets(self,rule,done_tokens):
		item_set = []
		for pattern in rule.rhs:
			for i in xrange(len(pattern)):
				item_set += [rule.lhs,pattern[:i]+["[BLOB]"]+pattern[i:]]
				next_token = pattern[i]
				if next_token not in done_tokens and next_token[0] == "<" and next_token[-1] == ">":
					done_tokens.append(next_token)
					try:
						new_rule = self.rules[next_token]
					except KeyError:
						print "ERROR: undefined token in grammar: " + next_token
					item_set += find_item_sets(new_rule,done_tokens)
			item_set += [rule.lhs,pattern+["[BLOB]"]]
		return item_set 
	
>>>>>>> origin/master

	def generate_patterns(self,ABNF_tree):
		rules = ABNF_tree.rules
		patterns = {}
		for rule in rules:
			pattern_possibilities = rules[rule]
			for pattern in pattern_possibilities:
				if pattern in patterns:
					print "ERROR: ambiguous use of pattern: ",pattern
					quit()
				patterns[pattern] = rule
		return patterns

	def get_parse_tree_node(self,current_token):
		if current_token in self.terminal_expressions: 			#if it is a special string, eg "=" 
			return Terminal_parse_tree_node('"'+current_token+'"',current_token))
		else:
			try:
				current_token = int(current_token)
				return Terminal_parse_tree_node("int",current_token)
			except ValueError:
				return Terminal_parse_tree_node("id",current_token)



class Non_terminal_parse_tree_node:
	def __init__(self,node_type,children):
		self.terminal = 0
		self.type = node_type
		self.children = []

class Terminal_parse_tree_node:
	def __init__(self,node_type,token_string):
		self.terminal = 0
		self.type = node_type
		self.string = token_string

class Rule:
	def __init__(self,lhs,rhs):
		self.lhs = lhs
		self.rhs = rhs
