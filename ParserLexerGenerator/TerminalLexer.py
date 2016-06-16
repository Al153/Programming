import NFA_builder
import DFA_builder

class TokenRule:
	def __init__(self,lhs,rhs):
		self.lhs = lhs
		self.rhs = rhs # an AST

class Lexer():
	def __init__(self, elementaryTokens,token_rules,to_ignore,terminals):
		# creates DFAs for each kind of token
		self.elementaryTokens = elementaryTokens
		self.to_ignore = to_ignore
		self.nfas = {}
		self.rule_list = []
		for rule in token_rules: # get NFAs for all of the REGEX rules
			# a rule is (string * parseTree)
			rule_list.append(rule.lhs)
			self.nfas[rule.lhs] = NFA_builder.createNFA(rule,self.nfas)

		for t in terminals: # get NFAs for all of the elements
			rule_list.append(t)
			self.nfas[t] = NFA_builder.createNFA(parseTreeNodes.Terminal_parse_tree_node("string",t),self.nfas)

		rule_list.reverse()
		alphabet = ' \n\t!"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~'
		self.dfas = {r:DFA_builder.DFA(nfas(r,alphabet)) for r in self.rule_list}


	def lex(self,string):
		token_list = self.split(string)
		token_objects = []
		for t in token_list:
			matched = False
			for d in self.dfas:
				if self.dfas[d].DFA_MATCH(t):
					token_objects.append(Terminal_parse_tree_node(d,t))
					matched = True
					break
			if not matched:
				raise Errors.LexerFailedError(t)
		return token_objects

	def split(self,string):
		# splits a string up using elementary tokens and ignore


		
		