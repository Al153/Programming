import LR1_parser
import sys


###________________________ Compiling Strategy ____________________________

#-get primary source code
#-run parser on it
#-extract functions from files and store them in a list
#-the functionless code should now consist of purely variable definitions (and import statements?)
#-linearise the functionless code: reduce to a list of parse trees for each line
#	(- import other files?)
#	(-on import, parse the file and extract its functions)
#	(-should leave purely import statements and import statements)
#	(-combine functionless code and function list (if there is overlap raise an error))
#- for each function, generate a name_space object, containing the code of that function
#- for each function namespace: linearise the code: create a single list containing the parse trees for each line
#- run type and parameter checking (for each function call, make sure the types and number of parameters passed to it is correct)
#begin code generation


#to generate code, I will probably use forth code to write assemblky forthe run time environment - error handling, function calling etc

class Program:
	def __init__(self,is_main = True,already_imported_list = []): 		#is main argument is to tell ow much setup should occur			
		self.source = get_source_file()
		self.parse_tree = get_parse_tree(source)

		#########################################
		#	Code to get inbuilt functions 		#
		#########################################

		self.functions = [function(tree) for tree in find_functions(self.parse_tree)]+self.inbuilt_functions
		self.functions = {function.name:function for function in self.functions}
		self.header_code = linearise_code(self.parse_tree)

		for line in self.header_code:
			#####################
			#	do imports 		#
			#####################

		if is_main:
			#################################
			#	check function calls etc    #
			#################################

			#################################
			#	Code generation step 		#
			#################################






#		for function_instance in functions:
#			for line in function_instance.lines:
#				print_parse_tree(line)





def get_source_file():
	'''gets source text from the requested file'''
	file_name = sys.argv[1]
	return open(file_name,"r").read()

def get_parse_tree(source_text):
	'''uses parser file to get a parse tree of the program'''
	local_parser = LR1_parser.Parser("CLL.parse")
	parse_tree = local_parser.parse(source_text)
	return parse_tree

def find_functions(parse_tree,parent = []):
	'''recursively searches parse tree to find functions'''
	#print parse_tree.type
	if parse_tree.type == "<PROGRAM>":						#program is the top node of the tree
		return find_functions(parse_tree.children[0],parse_tree) #need to get functions lower down in the tree
	elif parse_tree.type == "<block>": 						#blocks contain another block and a line or just a line
		if len(parse_tree.children)>1:						#if the block has children
			if parse_tree.children[1].children[0].children[0].type == "<fun_dec>": 	#if the line child derives to a function declaration
	#			print "FOUND FUNCTION!"
				return_list =  [parse_tree.children[1].children[0].children[0]] + find_functions(parse_tree.children[0],parse_tree) #copies out a list to return
				parse_tree.children = parse_tree.children[:1] 									#chops out function definition
				return return_list
			else:
				return find_functions(parse_tree.children[0],parse_tree)
		elif len(parse_tree.children) == 1:											#if the end block:
			if parse_tree.children[0].children[0].children[0].type == "<fun_dec>":
	#			print "FOUND FUNCTION!"
				return_list =  [parse_tree.children[0].children[0].children[0]]
				parent.children = [] if parent.type == "<block>" else []
				return return_list
			elif parse_tree.children[0].type == "<block>":
				return find_functions(parse_tree.children[0],parse_tree)
		else:
			return []
	else:
		return []


def linearise_code(parse_tree):
	'''searches parse tree for line expressions and then adds them to a list'''
	if parse_tree.type == "<PROGRAM>":
		return linearise_code(parse_tree.children[0])
	elif parse_tree.type == "<block>":
		code_to_return = []
		for child in parse_tree.children:
			if child.type == "<line>":
				code_to_return += [child.children[0].children[0]]
			elif child.type == "<block>":
				code_to_return += linearise_code(child)
		return code_to_return


def print_parse_tree(parse_tree_node,offset = ''):
	if parse_tree_node.terminal:
		print offset+parse_tree_node.type+"("+parse_tree_node.string+")"
		return
	else:
		print offset+parse_tree_node.type+"("
		for child in parse_tree_node.children:
			print_parse_tree(child,offset+"  ")
		print offset+")"

class function:
	#class to deal with function definitions
	#extracts all information needed to compile a function
	def __init__(self,parse_tree):
		self.type = "defined_function"
		self.return_type = get_type(parse_tree.children[0])
		self.name = parse_tree.children[1]
		self.parse_tree = parse_tree.children[-2]
		if len(parse_tree.children) == 7:		#has arguments
			self.input_parameters = self.linearise_arguments(parse_tree.children[3])
		else:
			self.input_parameters = []
		self.lines = self.blockify_code(self.parse_tree)
		self.variables = self.get_variables(self.line)



	def linearise_arguments(self,args):
		'''given the input arguments to a function, produce a list of parameters'''
		if len(args.children) == 2:
			return [(args.children[0],args.children[1])]
		else:
			return [(args.children[2],args.children[3])]+linearise_arguments(args.children[0])

	def blockify_code(self,parse_tree):
		'''linearises blocks of code, but also searches control structures in order to linearise the lines stored within them'''
		parse_tree.children = linearise_code(parse_tree) 		#forms a list of lines
		for i in xrange(len(parse_tree)):
			line = parse_tree.children[i]
			if line.type == "<cntrl_flow>":
				new_line = line.children[0]
				if new_line.type == "<if_stmnt>":
					#reduces an if statement to a condition and a block or a condition and two blocks
					if len(new_line.children)== 5:
						new_line.children = [new_line.children[1],Non_terminal_parse_tree_node("<block>",self.blockify_code(new_line.children[3])).children]
					else:
						new_line.children = [new_line.children[1],Non_terminal_parse_tree_node("<block>",self.blockify_code(new_line.children[3])).children,Non_terminal_parse_tree_node("<block>",self.blockify_code(new_line.children[5]))]
				elif new_line.type == "<while_loop>":	#changes a while loop to a condition and a block
					new_line.children = [new_line.children[1],Non_terminal_parse_tree_node("<block>",self.blockify_code(new_line.children[3])).children]
				elif new_line.type == "<for_loop>": 	#for loop becomes a start assignment, a test and a repeated assignment
					new_line.children = [new_line.children[2],new_line.children[4],new_line.children[6],Non_terminal_parse_tree_node("<block>",self.blockify_code(new_line.children[8])).children]
			elif line.type == "<fun_dec>": #does not expect a function declaration inside a function 
				error("SEMANTIC","Did not expect the definition of function '"+line.children[1].string+"'")
			elif line.type == "<assignment>":
				line.children = [line.children[0],line.children[2]]
			elif line.type == "<var_dec>>":
				pass
			elif line.type == "<other>":
				pass
		parse_tree.children.append(Non_terminal_parse_tree_node("<other>",Terminal_parse_tree_node("return","return")))
		return parse_tree

	def check_function_calls(self,parent_program,block):
		pass

	def get_variables(self,parse_tree):
		return_variables = {}
		for child in parse_tree:
			if child.type == "<block>":
				return_variables.update(self.get_variables(child.children))
			elif child.type == "<var_dec>":
				return_variables[child.children[1].string] = get_type(child.children[1])			#adds an entry for the new variable
		return return_variables

	def get_type(self,type_tree):
		#reduces a type parse tree to a string
		if len(type_tree.children) == 1:
			return type_tree.children[0].string
		elif len(type_tree.children) == 2:
			if type_tree.children[0].type == "@":
				return type_tree.children[0].string + type_tree.children[1].string
			else:
				return "array|" + type_tree.children[1].string
		else: 
			##################################################
			# parse array and return it alongside definition #
			##################################################	





class built_in_function(function):
	def __init__self(self,arguments,return_type,name,assembly_equivalent):
		self.return_type = return_type
		self.parameters = arguments
		self.name = named

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


def error(error_type,reason_string):
	print error_type+" ERROR: ",reason_string
	quit()




main()