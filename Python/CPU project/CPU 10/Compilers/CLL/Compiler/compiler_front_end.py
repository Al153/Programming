import LR1_parser
import sys


###________________________ Compiling Strategy ____________________________

#-get primary source code
#-run parser on it
#-extract functions from files and store them in a list
#-the functionless code should now consist of purely variable definitions (and import statements?)
#-linearise the functionless code: reduce to a list of parse trees for each line
#- for each function, generate a name_space object, containing the code of that function
#- for each function namespace: linearise the code: create a single list containing the parse trees for each line
#- run type and parameter checking (for each function call, make sure the types and number of parameters passed to it is correct)
#begin code generation



class Program:
	def __init__(self): 		#is main argument is to tell ow much setup should occur			
		self.source = get_source_file()
		self.parse_tree = get_parse_tree(self.source)

	def compile(self):
		#########################################
		#	Code to get inbuilt functions 		#
		#########################################

		self.functions = [function(tree) for tree in find_functions(self.parse_tree)]#+self.inbuilt_functions
		self.functions = {function.name:function for function in self.functions}
		self.header_code = Non_terminal_parse_tree_node("<block>",linearise_code(self.parse_tree))

		self.global_var_types = {}
		self.global_array_values = {}
		self.global_var_values = [] #for simple type global vars
		self.global_var_sizes = {}
		for line in self.header_code.children:
			if line.type == "<var_dec>":
				self.get_var(line)
			else:
				print "ERROR: not expecting line of type "+line.type+" outside of function definitions"



		self.functions["main"].parse_tree.children = self.global_var_values + self.functions["main"].parse_tree.children #inserts assignments for global variables

		for function_name in self.functions:
			#if function_name == "main":
			#	print_parse_tree(self.functions["main"].parse_tree)
			self.functions[function_name].process()
			self.functions[function_name].check_function_typing(self.functions[function_name].parse_tree)
		print_parse_tree(self.functions["arithmetic_test"].parse_tree)

		#################################
		#	Code generation step 		#
		#################################

	def get_var(self,var_line): 				#gets a global variable
		var_name = var_line.children[1].string 	
		var_type_tree = var_line.children[0]
		var_type = self.get_type(var_type_tree)
		if len(var_type)>4: #if an array:
			var_length = var_type[4:]
			var_type = var_type[:4]
		else:
			var_length = 1
		if len(var_line.children) == 4: #if there is a preset value for the variable
			self.get_value(var_line.children[3],var_name)
		self.global_var_types[var_name] = var_type
		self.global_var_sizes[var_name] = var_length


	def get_value(self,expression_tree,name):
		if len(expression_tree.children) == 3: #if an array
			self.global_array_values[name] = self.parse_array(expression_tree.children[1]) #adds array value to array values list
		else: #create an assignment to add to main function
			var_node = Non_terminal_parse_tree_node("<variable>",[Terminal_parse_tree_node("id",name)])
			equ_node = Terminal_parse_tree_node('"="',"=")
			assignment_node = Non_terminal_parse_tree_node("<assignment>",[var_node,equ_node,expression_tree])
			self.global_var_values.append(assignment_node)

	def get_type(self,type_tree):
		type_string = ''
		for node in type_tree.children:
			type_string += node.string
		return type_string

	def parse_array(self,array_tree):
		#print array_tree.type
		if len(array_tree.children) == 1:
			return [int(array_tree.children[0].string)]
		else:
			return [int(array_tree.children[2].string)]+self.parse_array(array_tree.children[0])




#		for function_instance in functions:
#			for line in function_instance.lines:
#				print_parse_tree(line)





def get_source_file():
	'''gets source text from the requested file'''
	file_name = sys.argv[1]
	return open(file_name,"r").read()

def get_parse_tree(source_text):
	'''uses parser file to get a parse tree of the program'''
	local_parser = LR1_parser.Parser("CLL.parse",tokenise) #replace built in function in parser
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

def get_type(type_tree):
	if len(type_tree.children) == 1: #int or char
		return type_tree.children[0].string
	elif len(type_tree.children) >= 2: #@int or @char
		return type_tree.children[0].string+type_tree.children[1].string
	print type_tree.type
	quit()


class function:
	#class to deal with function definitions
	#extracts all information needed to compile a function
	def __init__(self,parse_tree):
		self.type = "defined_function"
		self.return_type = get_type(parse_tree.children[0])
		self.name = parse_tree.children[1].string
		self.parse_tree = parse_tree.children[-2]
		if len(parse_tree.children) == 7:		#has arguments
			self.input_parameters = self.linearise_arguments(parse_tree.children[3])
		else:
			self.input_parameters = []
		self.lines = self.blockify_code(self.parse_tree)

	def process(self):
		if self.return_type != "void": #adds a default return statement
			self.parse_tree.children.append(Non_terminal_parse_tree_node("<other>",[Terminal_parse_tree_node('"return"',"return"),Terminal_parse_tree_node("num","0")]))
		else:
			self.parse_tree.children.append(Non_terminal_parse_tree_node("<other>",[Terminal_parse_tree_node('"return"',"return")]))
		#if self.name == "main":
		#	print_parse_tree(self.parse_tree)
		self.variables = self.get_variables(self.parse_tree)

		#self.variable_preset_values = self.variables[1]
		self.variable_sizes = self.variables[2]
		self.variables = self.variables[0]
		
		self.variables.update({pair[1]:pair[0] for pair in self.input_parameters}) #adds input parameters
		self.variable_sizes.update({pair[1]:self.get_var_width(pair[0]) for pair in self.input_parameters})

		#for var_name in self.variables:
		#	print var_name, ":",self.variables[var_name]


	def linearise_arguments(self,args):
		'''given the input arguments to a function, produce a list of parameters'''
		if len(args.children) == 2:
			return [(get_type(args.children[0]),args.children[1].string)]
		else:
			return [(get_type(args.children[2]),args.children[3].string)]+self.linearise_arguments(args.children[0])

	def blockify_code(self,parse_tree):
		'''linearises blocks of code, but also searches control structures in order to linearise the lines stored within them'''
		parse_tree.children = linearise_code(parse_tree) 		#forms a list of lines
		for i in xrange(len(parse_tree.children)):
			line = parse_tree.children[i]
			if line.type == "<cntrl_flow>":
				new_line = line.children[0]
				if new_line.type == "<if_stmnt>":
					#reduces an if statement to a condition and a block or a condition and two blocks
					if len(new_line.children)== 5:
						new_line.children = [new_line.children[1],self.blockify_code(new_line.children[3])]
					else:
						new_line.children = [new_line.children[1],self.blockify_code(new_line.children[3]),self.blockify_code(new_line.children[5])]
				elif new_line.type == "<while_loop>":	#changes a while loop to a condition and a block
					new_line.children = [
								new_line.children[1],
								self.blockify_code(new_line.children[3])
								]
				elif new_line.type == "<for_loop>": 	#for loop becomes a start assignment, a test and a repeated assignment, and repeated code
					new_line.children = [
										Non_terminal_parse_tree_node("<assignment>",[new_line.children[2].children[0],new_line.children[2].children[2]]),
										new_line.children[4],
										Non_terminal_parse_tree_node("<assignment>",[new_line.children[6].children[0],new_line.children[6].children[2]]),
										self.blockify_code(new_line.children[8])
										]
			elif line.type == "<fun_dec>": #does not expect a function declaration inside a function 
				error("SEMANTIC","Did not expect the definition of function '"+line.children[1].string+"'")
			elif line.type == "<assignment>":
				#assignments become a lhs and rhs
				line.children = [line.children[0],line.children[2]]
			elif line.type == "<var_dec>>":
				pass
			elif line.type == "<other>":
				pass
		return parse_tree

	def get_variables(self,parse_tree):
		return_variables = {}  #names:types
		values = [] 		   #names:preset expressions
		widths = {} 		   #names:bytewidth
		widths_lookup = {"int":4,"char":1,"@int":4,"@char":4} #arrays for @chars and @ints are 4+n or 4+(n*4), ptr, then array
		i = 0
		while i < len(parse_tree.children):
			#print i, len(parse_tree.children)
			assignment_present = 0
			child = parse_tree.children[i]

			if child.type == "<block>":
				new_variables = self.get_variables(child)
				return_variables.update(new_variables[0])
				values+= new_variables[1]
				widths.update(new_variables[2])
			if child.type == "<cntrl_flow>":
				if child.children[0].type == "<if_stmnt>": #get variables in an if
					for new_child in child.children[0].children[1:]: #could be an if then or an if then else
						new_variables = self.get_variables(new_child)
						return_variables.update(new_variables[0])
						values += new_variables[1]
						widths.update(new_variables[2])
				elif child.children[0].type == "<for_loop>":
					new_child = child.children[0].children[3] 		#child is cntrl flow, child.children[0] is the loop, loop.children 3 is the block
					new_variables = self.get_variables(new_child)
					return_variables.update(new_variables[0])
					values += new_variables[1]
					widths.update(new_variables[2])
				elif child.children[0].type == "<while_loop>":
					new_child = child.children[0].children[1]
					new_variables = self.get_variables(new_child)
					return_variables.update(new_variables[0])
					values += new_variables[1]
					widths.update(new_variables[2])
				else:
					print "ERROR: non control flow parse tree: "+child.children[0].type
			elif child.type == "<var_dec>":
				#print "VAR DEC"
				#print_parse_tree(parse_tree)
				#print get_type(child.children[0])
				return_variables[child.children[1].string] = get_type(child.children[0])			#adds an entry for the new variable
				widths[child.children[1].string] = widths_lookup[get_type(child.children[0])]
				
				if len(child.children[0].children)==3: #if there is an array type 	
					array_type = get_type(child.children[0])[1:] 			#type of variables in array
					array_length =int(child.children[0].children[2].string)*widths_lookup[array_type] #adds the length of the array to lengths
					widths["Array_of_"+child.children[1].string] = array_length
					return_variables["Array_of_"+child.children[1].string] 	= return_variables[child.children[1].string] + "array" #adds @intarray and @chararray types internally

				if len(child.children) > 2: #if there is an assignment

					assignment_present = 1
														#^if is an expression 															^if is an array
					if len(child.children[3].children)==1: #if a simple expression
						assign_expression = child.children[3].children[0] #gets the assignment trees	
						var_name = Non_terminal_parse_tree_node("<variable>",[child.children[1]]) 
						assignment = Non_terminal_parse_tree_node("<assignment>",[var_name,assign_expression]) #generate tree
						parse_tree.children[i] = assignment #place back into code
					elif child.children[3].children[1].type == "<array>":
						array_vars = self.parse_array(child.children[3].children[1])
						parse_tree.children = parse_tree.children[:i]+parse_tree.children[i+1:] #deletes variable declaration	
						for j in xrange(len(array_vars)):
							index_parse_tree = Terminal_parse_tree_node("num",str(j)) #build up the  indexing expression
							index_parse_tree = Non_terminal_parse_tree_node("<const>",[index_parse_tree]) #constant layer
							index_parse_tree = Non_terminal_parse_tree_node("<factor>",[index_parse_tree]) #factor layer
							index_parse_tree = Non_terminal_parse_tree_node("<term>",[index_parse_tree]) 	#term
							index_parse_tree = Non_terminal_parse_tree_node("<expr>",[index_parse_tree]) 	#packaged up in an expr before becoming part of the lhs

							lhs_parse_tree = Non_terminal_parse_tree_node("<variable>",[child.children[1],Terminal_parse_tree_node('"["',"["),index_parse_tree,Terminal_parse_tree_node('"]"',"]")])

							rhs_parse_tree = Terminal_parse_tree_node("num",str(array_vars[j])) #build up the  indexing expression
							rhs_parse_tree = Non_terminal_parse_tree_node("<const>",[rhs_parse_tree]) #constant layer
							rhs_parse_tree = Non_terminal_parse_tree_node("<factor>",[rhs_parse_tree]) #factor layer
							rhs_parse_tree = Non_terminal_parse_tree_node("<term>",[rhs_parse_tree]) 	#term
							rhs_parse_tree = Non_terminal_parse_tree_node("<expr>",[rhs_parse_tree])

							assignment_tree =Non_terminal_parse_tree_node("<assignment>",[lhs_parse_tree,rhs_parse_tree]) #generates an assignment
							parse_tree.children.insert(i+j,assignment_tree)


				if not assignment_present:
					parse_tree.children = parse_tree.children[:i]+parse_tree.children[i+1:] #deletes variable declaration	


				


				
				#print len(parse_tree.children)
				i -= 1 #makes up for shortened parse tree
				#cont = raw_input("")
			i += 1
		return (return_variables,values,widths)

	def get_var_width(self,var_type):
		#gets width of input parameters, ignores arrays, just get input as pointers
		widths_lookup = {"int":4,"char":1,"@int":4,"@char":4}
		return widths_lookup[var_type]

	def parse_array(self,array_tree):
		#print array_tree.type
		if len(array_tree.children) == 1:
			return [int(array_tree.children[0].string)]
		else:
			return [int(array_tree.children[2].string)]+self.parse_array(array_tree.children[0])

	def get_overall_type(self,specific_type):
		#reduces ints, chars, pointers etc to what they can be treated as, ie an @int is basically an int in terms of arithmetic
		return "char" if specific_type == "char" else "int"

	def check_function_typing(self,parse_tree):
		#searches whole parse tree looking for expressions to check
#		print parse_tree.type
		for child in parse_tree.children:
			if not child.terminal:
				if child.type == "<expr>":
					self.check_typing(child)
				elif child.type == "<assignment>":
					self.check_assignment_typing(child)
				else:
					self.check_function_typing(child)


	def check_assignment_typing(self,parse_tree):
		#test if an assignment has the correct

		lhs = self.check_typing(Non_terminal_parse_tree_node("<factor>",[parse_tree.children[0]]))
		rhs = self.check_typing(parse_tree.children[1])
		#print lhs, rhs
		#print_parse_tree(parse_tree)

		if lhs != rhs:
			parse_tree.children[1] = self.cast_type(rhs,lhs,parse_tree.children[1]) #adds a cast operation

	def check_typing(self,parse_tree):
		#takes a parse tree and checks typing (fixes it if possible), and returns the type of the expression at the aend of evalutation of this part of the tree,
		#to the extent of checking overall type - ie @int =~= @char =~= int
		#print parse_tree.type
		if len(parse_tree.children) == 3:
			if parse_tree.children[0].type == "(": #( expression )
				input_type =  self.check_typing(parse_tree.children[1])
				return input_type
			else: 									# expr + term or equivalent
				lhs_type = self.check_typing(parse_tree.children[0])
				rhs_type = self.check_typing(parse_tree.children[2])
				overall_type = lhs_type #left hand rule

				#print lhs_type,rhs_type
		#				print_parse_tree(parse_tree)
		#				cont = raw_input("")

				parse_tree.children[2] = self.cast_type(rhs_type,lhs_type,parse_tree.children[2]) #casts rhs into the type
				parse_tree.children[1].type = "<"+parse_tree.children[1].type[1:-1]+lhs_type+">" #fixes the operator to a specific type
			 	return lhs_type
		elif len(parse_tree.children) == 2:   #unary ops
			input_type = self.check_typing(parse_tree.children[1])
			parse_tree.children[0].type = "<"+parse_tree.children[0].type[1:-1]+input_type+">" #fixes the operator to a specific type
			return input_type
		elif len(parse_tree.children) == 1:
			if parse_tree.children[0].type == "<term>":
				input_type =  self.check_typing(parse_tree.children[0])
				return input_type
			elif parse_tree.children[0].type == "<factor>":
				input_type = self.check_typing(parse_tree.children[0])
				return input_type
			elif parse_tree.children[0].type == "<fun_call>":
				function_name = parse_tree.children[0].children[0].string
				function_type = self.get_overall_type(program.functions[function_name].return_type)
				self.check_function_call(parse_tree.children[0])
				#print "FUNCTION TYPE = ", function_type
				return function_type
			elif parse_tree.children[0].type == "<variable>":
				variable_parse_tree = parse_tree.children[0]
				if len(variable_parse_tree.children) == 1: #treating a variable as itself
					#print "DIRECT VARIABLE USE"
					if variable_parse_tree.children[0].string in self.variables:
						#print	self.get_overall_type(self.variables[variable_parse_tree.children[0].string])
						return self.get_overall_type(self.variables[variable_parse_tree.children[0].string]) #gets overall type
					elif variable_parse_tree.children[0].string in program.global_var_types:
						#print self.get_overall_type(program.global_var_types[variable_parse_tree.children[0].string])
						return self.get_overall_type(program.global_var_types[variable_parse_tree.children[0].string])
					else:
						print "ERROR: Unrecognised variable: "+ variable_parse_tree.children[0].string
						quit()
				else: #indirect addressing
					#needs to be a pointer
					#print "POINTER"
					if variable_parse_tree.children[0].string in self.variables: #if local
						if self.variables[variable_parse_tree.children[0].string][0] == "@":
							#if the variable type is a pointer
							type_to_return = self.variables[variable_parse_tree.children[0].string][1:] #gets the pointed to type
							#print type_to_return
							self.check_typing(variable_parse_tree.children[2])
							return type_to_return
						else:
							#raise an error
							print "ERROR: variable "+variable_parse_tree.children[0].string+" of type "+self.variables[variable_parse_tree.children[0]].string+" cannot be used as a pointer"
							quit()
					elif variable_parse_tree.children[0].string in program.global_var_types:
						if program.global_var_types[variable_parse_tree.children[0].string][0] == "@":
							#if the variable type is a pointer
							type_to_return = program.global_var_types[variable_parse_tree.children[0].string][1:] #gets the pointed to type
							check_typing(variable_parse_tree.children[2])
							#print type_to_return
							return type_to_return
						else:
							#raise an error
							print "ERROR: variable "+variable_parse_tree.children[0].string+" of type "+program.global_var_types[variable_parse_tree.children[0]].string+" cannot be used as a pointer"
							quit()
					else:
						print "ERROR: Unrecognised variable: \""+variable_parse_tree.children[0].string + "\""
						quit()

			elif parse_tree.children[0].type == "<const>":
				#print "CONSTANT"
				return "int"  #constants are either numbers or pointers (ints)

	def cast_type(self,start_type,end_type,parse_tree):
		return Non_terminal_parse_tree_node(
			"<cast>",[
				parse_tree,
				Terminal_parse_tree_node(start_type,start_type),
				Terminal_parse_tree_node(end_type,end_type)
				]
			) 

	def check_function_call(self,parse_tree):
		#checks type and number of arguments
		function_name = parse_tree.children[0]
		function_parameters = program.functions[function_name.string].input_parameters
		if len(parse_tree.children) == 3:
			# no arguments
			if len(function_parameters) == 0:
				return
			else:
				print "ERROR: Function "+function_name+" takes "+str(len(function_parameters))+ "arguments, none given"
				quit()
		else:
			#has input parameters
			parameters = self.get_given_parameters(parse_tree.children[2]) #linearises arguments
			if len(parameters) == len(function_parameters):
				#do type_checking
				i = 0
				for parameter in parameters:
					parameter_type = self.check_typing(parameter)
					if parameter_type != self.get_overall_type(function_parameters[i][0]):
						print "ERROR: parameter of type "+parameter_type+" passed to function "+function_name+", expected "+ get_type(function_parameters[i][1])+" of type" + get_type(function_parameters[i][0])
						quit()
			else:
				print "ERROR: Function "+function_name+" takes "+str(len(function_parameters))+ "arguments, "+ str(len(parameters)) + " given"
				quit()
	
	def get_given_parameters(self,parameters_parse_tree):
		#print_parse_tree(parameters_parse_tree)
		if len(parameters_parse_tree.children) == 1:
			return parameters_parse_tree.children
		else:
			return [parameters_parse_tree.children[2]]+self.get_given_parameters(parameters_parse_tree.children[0])


class built_in_function(function):
	def __init__(self,arguments,return_type,name,assembly_equivalent):
		self.return_type = return_type
		self.parameters = arguments
		self.name = name
		##########################
		#    Add assembly code 	 #
		##########################

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

def tokenise(self,source_text):
	#tokeniser which handles strings and comments, deals with import directives etc
	#source_text = fix_strings_and_comments(source_text)
	#print "tokenising"
	source_text = pretokenise(source_text)

	#standard tokenizing routine
	string_token_list = main_tokenise(self,source_text)
	token_list = []
	string_counter = 0 #string counter allows string names to be unique
	i = 0
	while i < len(string_token_list):
		current_token = string_token_list[i]
		#print current_token
		if current_token[0] == current_token[-1] == '"': #if a string
			name  = "string"+str(string_counter)
			values_list = zip([str(ord(char)) for char in current_token[1:-1]]+["0"],["," for char in current_token[1:]]) #adds 0 as an end of string
			values_list = [elem for pair in values_list for elem in pair][:-1] #flatten list of tuples,remove last comma
			string_token_list += ["@","char",str(len(current_token)-2),name,"=","["]+values_list + ["]",";"]
			string_token_list[i] = name
			#if string_token_list[i] == name:
			#	print "String found: ",name,current_token
			#	cont = raw_input('')
			string_counter += 1
		elif current_token[0] == current_token[-1] == "'":
			string_token_list[i] = str(ord(current_token[1]))
		if current_token not in self.to_ignore:
			token_list.append(self.get_parse_tree_node(string_token_list[i]))
		i += 1
	token_list.append(Terminal_parse_tree_node("END","END"))                                    #adds end symbol to end of code
	#print [token.string for token in token_list]
	return token_list

def main_tokenise(self,text_file):
	'''
	Monolithic tokenizer
	'''
	text_file = [line for line in text_file.split("\n")]
	token_list = []
	string = 0
	escaped = 0
	array = 0
	i = 0
	token_separators = self.elementary_tokens
	to_ignore = self.to_ignore
	escaped_replace_dict = {"n":"\n",'"':'"',"\\":"\\"} #converts escaped n to \n etc
	while i < len(text_file):
		line = text_file[i]
		if not string:
			line_tokens= []
			current_token = ''
		for character in line:
			if not string:
				if character == '"' and current_token == '': #if a string
					current_token = '"'
					string = 1
				elif character == "/" and line_tokens[-1] == '/': #comment
					line_tokens = line_tokens[:-1]
					break
				elif not character in token_separators:
					current_token += character
				else:
					if current_token != "":
						line_tokens.append(current_token)
						current_token = ""
					line_tokens.append(character)
			elif string:
				if not escaped:
					if character == '"':
						current_token += '"'
						string = 0
						line_tokens.append(current_token) 
						current_token = ''
					elif character == "\\":
						escaped = 1
					else:
						current_token += character
				else:
					escaped = 0
					current_token += escaped_replace_dict.get(character,character)
		if not string:
			if current_token != "" and current_token != "\t":
				line_tokens.append(current_token)
			
			token_list+=line_tokens
		i +=1
		line_tokens.append("\n")
	return token_list

def pretokenise(source_text):
	#deals with import directives
	lines = source_text.split("\n")
	for i in xrange(len(lines)):
		line = lines[i]
		#print line
		if line[:9] == "#include ":
			#print line
			lines[i] = pretokenise(open(line[9:],"r").read())
	return "\n".join(lines)




program = Program()
program.compile()