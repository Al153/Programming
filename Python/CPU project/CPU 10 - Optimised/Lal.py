import sys

#Source ==> command list ==> subfunctions ==> RTL ==> assembly 



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



def RTL_to_AL_line(RTL):
	'''converts a line of RTL to assembly'''
	assembly = ''
	if RTL[1] == "|":
		assembly += "ptr "+RTL[0] #create a pointer to sub routine



typical RTL clauses:


subroutine_name | var0 var1 var2 add

becomes 

ptr subroutine_name

Load gp0 @var0 %subroutine_name
Load gp1 @var1
ADD gp0 gp1 
Store gp0 @var2


or..

var0 var1 equals subroutine_name

becomes 

Load gp0 @var0
Load gp1 @var1
Compare gp0 gp1 
if Equal then Goto @subroutine_name

or ..
Load_clause var0 value load

int value value
Load gp0 @value
Store gp0 @var0

RTL functions

Add

