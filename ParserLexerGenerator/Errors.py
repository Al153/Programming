class LexerFailedError(Exception):
	def __init__(self,string):
		self.string = string
	def __string__(self):
		return "Token: '"+self.string+ "' could not be matched to a terminal type"