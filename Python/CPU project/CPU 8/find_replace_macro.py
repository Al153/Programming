#find - replace syntax: find <expression> replace <expression> end

#<> denotes a variable, can be anything and is constant throughout tranformation
#"" denotes a string, which is the target for the macro

#eg 'find if <x> == <y> then goto <z> replace "CMP" <x> <y> "@wf" "\n" "CGT" "E" <z> end'
#will replace "if acc == ind then goto %if_equal"
#with "CMP acc ind @wf
#		CGT E %if_equal" 

#rules stored as [start_of_find/replace, ["This_is_a_string", "<this_is_a_variable>"],["<this_is_a_variable>", "this_is_another_string"]




class Macro:
	def __init__(self,tokens,macro_rounds):
		self.tokens = tokens
		self.macro_rounds = macro_rounds
		self.rules = []

	def process_tokens(self):
		new_tokens = []
		for line in self.tokens:
			new_tokens += line
			new_tokens.append("\n")
		self.tokens = new_tokens

	def find_rules(self):
		found_rule = 0
		rule_index = 1
		rule = [0,[],[]]
		for i in xrange(len(self.tokens)):
			token = 
			if found_rule == 0:
				if token == "find":
					found_rule = 1
					rule_index = 1
					rule[0] = i
			else:
				if token == "end":
					found_rule = 0
					self.rules.append(rule)
					rule = [0,[],[]]
				elif token == "replace":
					rule_index = 2
				else: 
					rule[rule_index].append(token)

	def execute_rules(self):
		for i in xrange(self.macro_rounds):
			for i in self.rules:
				full_execute_rule(i)

	def full_execute_rule(self,rule):
		i = 0
		while i < len(self.tokens):
			if i !=  rule[0] and self.tokens[i] == rule[1][0]:
				rule = self.execute_single_rule(rule,i)
			i += 1

	def execute_single_rule(self,rule,target_index):
		#rule = [rule_line_no,[<to_find>],[<to_replace>]]
		var_dict = {}
		for i in xrange(len(rule[1])):
			#rule clean up
			if rule[1][i][0] == '"' and rule[1][i][-1] == '"': #remove quotes
				rule[1][i] = rule[1][i][1:-1]
			if rule[1][i] == "\\n":
				rule[1][i] = "\n"

			if rule[1][i][0] == "<" and rule[1][i][-1] == ">":
				var_dict[rule[1][i]] = self.tokens[target_index+i]

			else:
				if rule[1][i] != self.tokens[target_index+i]:
					return rule #breaks out of function
		#if run through has no errors:
		first_tokens = self.tokens[:target_index]
		second_tokens = self.tokens[token_index+len(rule[1])]
		for i in xrange(len(rule[2])):
			if rule[2][i][0] == '"' and rule[2][i][-1] == '"': #remove quotes
				rule[2][i] = rule[2][i][1:-1]
				out = rule[2][i]
			if rule[2][i] == "\\n":
				rule[2][i] = "\n"
				out = "\n"
			if rule[2][i][0] == "<" and rule[2][i][-1] == ">":
				out = var_dict[rule[2][i]]

			first_tokens += out
		self.tokens = first_tokens + second_tokens
		return rule

	def repackage_tokens(self):
		self.tokens += "\n"
		lines = []
		line_tokens = []
		for token in self.tokens:
			if token == "\n" and line_tokens != []:
				lines.append(line_tokens)
				line_tokens = []
			else:
				line_tokens.append(token)
		self.tokens = lines


	def full_process(self):
		self.process_tokens()
		self.find_rules()
		self.execute_rules()
		self.repackage_tokens()
		return self.tokens







