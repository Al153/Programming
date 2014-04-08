import sys

#Source ==> Flow map ==> expanding map ==> blocks ==> RTL ==> assembly 

class block:
	def __init__(self,code,link):
		self.code = code
		self.link = link

class branch:
	def __init__(self,code,link0,link1):
		self.code = code
		self.link0 = link0
		self.link1 = link1





def tokenise_first_pass(string):
	"""
	Splits into lines + removes comments
	"""
	commented = 0
	commands = []
	string = 0
	escaped = 0
	command = ''
	for char in string:
		if commented:
			if char == "\n":
				commented = 0
		elif string:
			if not escaped:
				pass
			else:
				pass



