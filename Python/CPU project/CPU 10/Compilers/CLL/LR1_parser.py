import json

class Parser:
	def __init__(self,parse_file_name):
		parse_table_file = open(parse_file_name,"r")
		self.parse_settings = json.loads(parse_table_file.read())
		self.elementary_tokens = self.parse_settings["elementary_tokens"]
		self.to_ignore = self.parse_settings["to_ignore"]

		temp_goto_table = self.parse_settings["goto_table"]
		self.LHS_goto_table = {int(state):temp_goto_table[state] for state in temp_goto_table}

		temp_lookahead_table = self.parse_settings["lookahead_action_table"]
		self.lookahead_action_table = {int(state):temp_lookahead_table[state] for state in temp_lookahead_table}

		self.terminals = self.parse_settings["terminals"]
		self.enum_rules = [EnumRule(rule[0],rule[1],rule[2]) for rule in self.parse_settings["rules"]]

		print "AFTER_A:",self.lookahead_action_table[42]
		cont = raw_input('')

	def parse(self,source):
		self.tokens = self.tokenise(source)                                                    #tokeniser takes in text and produces a list of terminal objects
		self.parse_tree_stack = [0]                                                                 #starts with just starting state

		self.lookahead = self.tokens[0]                                                             #Loads in lookahead token 
		self.token_index = 1  

		while not self.parse_step():
			pass
		return self.parse_tree_stack[1]

	def parse_step(self):                                                                           #main parsing step, repeated till done or error
		top_state = self.parse_tree_stack[-1]                                                       #get the top state of the stack
		try:
			print self.lookahead.type,self.lookahead.string,
			next_action_tuple = self.lookahead_action_table[top_state][self.lookahead.type]          #uses table to calculate next values
			print next_action_tuple
		except KeyError:
			next_action_tuple = ("error",'not expecting terminal type = '+self.lookahead.type+', terminal = "'+self.lookahead.string+'"')                                   #if there is an error, then call error
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
		token_triggers =self.elementary_tokens	                                                    #fetch elementary tokens
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
				int(current_token)
				return Terminal_parse_tree_node("int",current_token)                                #if integerise-able then produce an integer token
			except ValueError:
				return Terminal_parse_tree_node("id",current_token)                                 #otherwise then produce an identifier

	def print_parse_tree(self,parse_tree_node,offset = ''):
		if parse_tree_node.terminal:
			print offset+parse_tree_node.type+"("+parse_tree_node.string+")"
			return
		else:
			print offset+parse_tree_node.type+"("
			for child in parse_tree_node.children:
				self.print_parse_tree(child,offset+"  ")
			print offset+")"



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

class EnumRule:
	def __init__(self,lhs,rhs,number):
		self.lhs = lhs
		self.rhs = rhs
		self.number = number