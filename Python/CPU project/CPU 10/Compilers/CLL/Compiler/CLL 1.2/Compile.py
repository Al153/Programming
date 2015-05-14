import LR1_parser
import sys
import os
import code_generator1_2 as code_generator

# CLL 1.1 adds direct casting support, and further underlying optimisations
# CLL 1.2 adds the ternary expression and modifying assignments (a += b etc)

###________________________ Compiling Strategy ____________________________

#-get primary source code
#-run parser on it
#-extract functions from files and store them in a list
#-the functionless code should now consist of purely variable definitions (and import statements?)
#-linearise the functionless code: reduce to a list of parse trees for each line
#- for each function, generate a name_space object, containing the code of that function
#- for each function namespace: linearise the code: create a single list containing the parse trees for each line
#- run type and parameter checking (for each function call, make sure the types and number of parameters passed to it is correct)
#begin code generation - lots of mutually recursive functions

CURRENT_DIR = os.path.dirname(__file__)


class Program:
	def __init__(self): 		#is main argument is to tell ow much setup should occur
		print "getting source = ",			
		self.source = get_source_file()
		print "DONE!\nParsing = ",
		self.parse_tree = get_parse_tree(self.source)
		print "DONE!"

	def compile(self):
		print "Creating built in functions = ",
		CURRENT_DIR = os.path.dirname(__file__)
		self.built_in_functions = [  #sets up the built in functions
			built_in_function([("@char","word")],"void","printf", open(os.path.join(CURRENT_DIR, 'BuiltIns\\printf.al'),"r").read()),
			built_in_function([("int","number")],"void","print_i",open(os.path.join(CURRENT_DIR, 'BuiltIns\\print_i.al'),"r").read()),
			built_in_function([("int","number")],"char","char",open(os.path.join(CURRENT_DIR, 'BuiltIns\\char.al'),"r").read()),
			built_in_function([("char","character")],"void","putc",open(os.path.join(CURRENT_DIR, 'BuiltIns\\putc.al'),"r").read()),
			built_in_function([],"char","getc",open(os.path.join(CURRENT_DIR, 'BuiltIns\\getc.al'),"r").read()),
			built_in_function([],"char","getw",open(os.path.join(CURRENT_DIR, 'BuiltIns\\getw.al'),"r").read()),
			built_in_function([],"void","quit",open(os.path.join(CURRENT_DIR, 'BuiltIns\\quit.al'),"r").read())

		]
		print "DONE!\nExtracting functions = ",	


		self.functions = [function(tree) for tree in find_functions(self.parse_tree)] +self.built_in_functions
		self.functions = {function.name:function for function in self.functions}
		self.header_code = Non_terminal_parse_tree_node("<block>",linearise_code(self.parse_tree))

		print "DONE!\nFinding global variables =",
		#print_parse_tree(self.header_code)

		self.global_var_types = {}
		self.global_array_values = {}
		self.global_var_values = [] #for simple type global vars
		self.global_var_sizes = {}
		for line in self.header_code.children:
			#print line.type
			if line.type == "<var_dec>":
				self.get_var(line)
			else:
				print "ERROR(7): not expecting line of type "+line.type+" outside of function definitions"


		#print self.global_var_types

		self.functions["main"].parse_tree.children = self.global_var_values + self.functions["main"].parse_tree.children #inserts assignments for global variables

		print "DONE!\nChecking functions = ",
		for function_name in self.functions:
			if not self.functions[function_name].built_in:
				#if function_name == "main":
				#	print_parse_tree(self.functions["main"].parse_tree)
				self.functions[function_name].process()
				self.functions[function_name].check_function_typing(self.functions[function_name].parse_tree)
		#print_parse_tree(self.functions["main"].parse_tree)

		print "DONE!\nGenerating assembly =",
		global_var_addresses = {var:"CLL."+var for var in self.global_var_types}
		assembly_code = code_generator.snippets[" setup routines "].generate_code({})
		assembly_code += self.generate_global_vars()
		#print assembly_code
		#raw_input('')
		for function_name in self.functions:
			if self.functions[function_name].built_in:
				assembly_code += self.functions[function_name].assembly #could do with only including code if built in function is used
			else:
				assembly_code += code_generator.code_generator(self.functions[function_name],global_var_addresses,self.global_var_types).assembly
		print "DONE!\nWriting to file =",
		write_to_file(assembly_code)
		print "DONE\nCompilation complete"




	def get_var(self,var_line): 				#gets a global variable
		var_name = var_line.children[1].string 	
		var_type_tree = var_line.children[0]
		var_type = self.get_type(var_type_tree)
		try:
			array_size = int(var_type.split(";")[1])
			var_type = var_type.split(";")[0]
		except IndexError:
			array_size = 0
		if len(var_line.children) == 4: #if there is a preset value for the variable
			self.get_value(var_line.children[3],var_name)
		self.global_var_types[var_name] = var_type
		self.global_var_sizes[var_name] = array_size


	def get_value(self,expression_tree,name):
		if len(expression_tree.children) == 3: #if an array
			self.global_array_values[name] = self.parse_array(expression_tree.children[1]) #adds array value to array values list
		else: #create an assignment to add to main function
			var_node = Non_terminal_parse_tree_node("<variable>",[Terminal_parse_tree_node("id",name)])
			assignment_node = Non_terminal_parse_tree_node("<assignment>",[var_node,expression_tree.children[0]])
			self.global_var_values.append(assignment_node)

	def get_type(self,type_tree):
		type_string = ''
		for node in type_tree.children:
			try:
				int(node.string)
				type_string += ";"+node.string #if an array with a length, add a semicolon to split type and  length
			except ValueError:
				type_string += node.string
		return type_string

	def parse_array(self,array_tree): #non recursive since arrays can get large with big strings
		array = []
		while len(array_tree.children)>1:
			array.append(int(array_tree.children[2].string))
			array_tree = array_tree.children[0]
		array.append(int(array_tree.children[0].string))
		array.reverse()
		return array

	def generate_global_vars(self):
		#creates assembly level variable definitions
		return_string = ''
		for var_name in self.global_var_types:
			#print self.global_var_types[var_name]
			#cont = raw_input('')
			self.global_var_types[var_name]
			if self.global_var_types[var_name] in ["int","char"]:     #plain variables
				return_string += self.global_var_types[var_name] +" CLL."+var_name+" 0\n"
			elif self.global_var_types[var_name] in ["@int","@char"]: #pointers
				if self.global_var_sizes[var_name] == 0: 				#array less pointers
					return_string += "int CLL."+var_name+" 0\n"
				else:
					array_length = str(self.global_var_sizes[var_name]) #gets length
					array_name = "CLL.array_of_"+var_name
					if var_name in self.global_array_values:
						array_values = "["+ ', '.join([str(value) for value in self.global_array_values[var_name]])+"]\n"	
					else:
						array_values = '[]\n'
					if self.global_var_types[var_name] == "@int":
						return_string += "array "+array_name+" "+array_length+" "+array_values #creates array
						return_string += "int CLL."+var_name+" "+array_name+"\n"
					elif self.global_var_types[var_name][:5] == "@char":
						return_string += "byteArray "+array_name+" "+array_length+" "+array_values #creates array
						return_string += "int CLL."+var_name+" "+array_name	+"\n"			

		return return_string





#		for function_instance in functions:
#			for line in function_instance.lines:
#				print_parse_tree(line)








class function:
	#class to deal with function definitions
	#extracts all information needed to compile a function
	def __init__(self,parse_tree):
		self.built_in = 0
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
			return_expression = Terminal_parse_tree_node("num","0") #builds up a return 0
			return_expression = Non_terminal_parse_tree_node("<const>",[return_expression])
			return_expression = Non_terminal_parse_tree_node("<expr>",[return_expression])

			self.parse_tree.children.append(Non_terminal_parse_tree_node("<other>",[Terminal_parse_tree_node('"return"',"return"),return_expression]))
		else:
			self.parse_tree.children.append(Non_terminal_parse_tree_node("<other>",[Terminal_parse_tree_node('"return"',"return")]))
		
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
			return self.linearise_arguments(args.children[0]) + [(get_type(args.children[2]),args.children[3].string)]

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
										process_assignment(new_line.children[2]),
										new_line.children[4],
										process_assignment(new_line.children[6]),
										self.blockify_code(new_line.children[8])
										]
			elif line.type == "<fun_dec>": #does not expect a function declaration inside a function 
				error("SEMANTIC","Did not expect the definition of function '"+line.children[1].string+"'")
			elif line.type == "<assignment>":
				#assignments become a lhs and rhs
				line = process_assignment(line)
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
			array = 0
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
					print "ERROR(8): non control flow parse tree: "+child.children[0].type
			elif child.type == "<var_dec>":
				#print "VAR DEC!"
				#print "VAR DEC"
				#print_parse_tree(parse_tree)
				#print get_type(child.children[0])
				return_variables[child.children[1].string] = get_type(child.children[0])			#adds an entry for the new variable
				widths[child.children[1].string] = widths_lookup[get_type(child.children[0])]
				
				if len(child.children[0].children)==3: #if there is an array type 
					#print "ARRAY TYPE !"
					array_type = get_type(child.children[0])[1:] 			#type of variables in array
					array_length =int(child.children[0].children[2].string)*widths_lookup[array_type] #adds the length of the array to lengths
					widths["Array_of"+child.children[1].string] = array_length
					return_variables["Array_of"+child.children[1].string] 	= return_variables[child.children[1].string] + "array" #adds @intarray and @chararray types internally

					#needs to link up pointer to array
					pointer_const_tree = Non_terminal_parse_tree_node("<const>",[Terminal_parse_tree_node('"@"',"@"),Terminal_parse_tree_node("id","Array_of"+child.children[1].string)])
					factor_tree = Non_terminal_parse_tree_node("<factor>",[pointer_const_tree])
					term_tree = Non_terminal_parse_tree_node("<term>",[factor_tree])
					expression_tree = Non_terminal_parse_tree_node("<expr>",[term_tree])
					lhs = Non_terminal_parse_tree_node("<variable>",[Terminal_parse_tree_node("id",child.children[1].string)])
					assignment_tree = Non_terminal_parse_tree_node("<assignment>",[lhs,expression_tree])


					parse_tree.children[i] = assignment_tree
					#print_parse_tree(assignment_tree)
					assignment_present = 1

				if len(child.children) > 2: #if there is an assignment
					#print "assignment"
					assignment_present = 1
					if len(child.children[3].children)==1: #if a simple expression
						assign_expression = child.children[3].children[0] #gets the assignment trees	
						var_name = Non_terminal_parse_tree_node("<variable>",[child.children[1]]) 
						assignment = Non_terminal_parse_tree_node("<assignment>",[var_name,assign_expression]) #generate tree
						parse_tree.children[i] = assignment #place back into code
					elif child.children[3].children[1].type == "<array>":
						if not len(child.children[0].children)==3: #if no array type, raise error
							print "ERROR(42): Array assigned to non array type variable "+child.children[1].string
							quit()
						array_vars = self.parse_array(child.children[3].children[1])
						#parse_tree.children = parse_tree.children[:i]+parse_tree.children[i+1:] #deletes variable declaration	
						for j in xrange(len(array_vars)):
							#print j
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
							parse_tree.children.insert(i+j+1,assignment_tree)


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
			return self.parse_array(array_tree.children[0]) + [int(array_tree.children[2].string)]

	def get_overall_type(self,specific_type):
		#reduces ints, chars, pointers etc to what they can be treated as, ie an @int is basically an int in terms of arithmetic
		return "char" if specific_type == "char" else "void" if specific_type == "void" else "int"

	def check_function_typing(self,parse_tree):
		#searches whole parse tree looking for expressions to check
		for child in parse_tree.children:
			if not child.terminal:
				if child.type == "<expr>":
					self.check_typing(child)
				elif child.type == "<assignment>":
					#print_parse_tree(child)
					self.check_assignment_typing(child)
				elif child.type == "<fun_call>" and parse_tree.type == "<other>": #function call on its own in a line
					function_name = parse_tree.children[0].children[0].string
					function_type = self.get_overall_type(program.functions[function_name].return_type)
					self.check_function_call(parse_tree.children[0])
					if function_type != "void": #needs to be void to be called on a line on its own
						print "ERROR(41): function called outside of an assignment must return void, "+function_name+" returns "+function_type
						quit()
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
		if parse_tree.type == "<type_cast>":
			resultant_type = get_type(parse_tree.children[0])#get the two types
			source_type = self.check_typing(parse_tree.children[2])

			parse_tree.type = "<cast>"
			parse_tree.children = [parse_tree.children[2],Terminal_parse_tree_node(source_type,source_type),Terminal_parse_tree_node(resultant_type,resultant_type)]
			return resultant_type

		if parse_tree.type == "<ternary_op>":
			true_type = self.check_typing(parse_tree.children[0])
			false_type = self.check_typing(parse_tree.children[4])
			self.check_function_typing(parse_tree.children[2])
			if true_type != false_type:
				print "ERROR(44): Types of the two results in a ternary statement must be the same"
				quit()
			else:
				return true_type

		if len(parse_tree.children) == 3:
			if parse_tree.children[0].type == '"("': #( expression )
				input_type =  self.check_typing(parse_tree.children[1])
				return input_type
			else: 									# expr + term or equivalent
			#	print_parse_tree(parse_tree)
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
			if parse_tree.children[0].type in ("<type_cast>","<term>","<factor>","<ternary_op>"):
				input_type =  self.check_typing(parse_tree.children[0])
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
					if variable_parse_tree.children[0].string in self.variables:
						#print	self.get_overall_type(self.variables[variable_parse_tree.children[0].string])
						return self.get_overall_type(self.variables[variable_parse_tree.children[0].string]) #gets overall type
					elif variable_parse_tree.children[0].string in program.global_var_types:
						#print self.get_overall_type(program.global_var_types[variable_parse_tree.children[0].string])
						return self.get_overall_type(program.global_var_types[variable_parse_tree.children[0].string])
					else:
						print "ERROR(0): Unrecognised variable: "+ variable_parse_tree.children[0].string + " in function "+self.name
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
							print "ERROR(1): variable "+variable_parse_tree.children[0].string+" of type "+self.variables[variable_parse_tree.children[0].string]+" cannot be used as a pointer"
							quit()
					elif variable_parse_tree.children[0].string in program.global_var_types:
						if program.global_var_types[variable_parse_tree.children[0].string][0] == "@":
							#if the variable type is a pointer
							type_to_return = program.global_var_types[variable_parse_tree.children[0].string][1:] #gets the pointed to type
							self.check_typing(variable_parse_tree.children[2])
							#print type_to_return
							return type_to_return
						else:
							#raise an error
							print "ERROR(2): variable "+variable_parse_tree.children[0].string+" of type "+program.global_var_types[variable_parse_tree.children[0]].string+" cannot be used as a pointer"
							quit()
					else:
						print "ERROR(3): Unrecognised variable: \""+variable_parse_tree.children[0].string + "\""
						quit()

			elif parse_tree.children[0].type == "<const>":
				#print "CONSTANT"
				return "int"  #constants are either numbers or pointers (ints)
			else:
				print "ERROR(39): incorrect node passed: "+ parse_tree.children[0].type
				print_parse_tree(parse_tree)
				quit()
		else:
			print "ERROR(40): incorrect node passed: "+pass_tree.type
			quit()
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
				print "ERROR(4): Function "+function_name+" takes "+str(len(function_parameters))+ "arguments, none given"
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
						print "ERROR(5): parameter of type "+parameter_type+" passed, in " + self.name+" to function "+function_name.string+", expected "+ function_parameters[i][1]+" of type " + function_parameters[i][0]
						quit()
					i += 1
			else:
				print "ERROR(6): Function "+function_name.string+" takes "+str(len(function_parameters))+ " argument(s), "+ str(len(parameters)) + " given"
				quit()
	
	def get_given_parameters(self,parameters_parse_tree):
		#print_parse_tree(parameters_parse_tree)
		if len(parameters_parse_tree.children) == 1:
			return parameters_parse_tree.children
		else:
			return self.get_given_parameters(parameters_parse_tree.children[0]) + [parameters_parse_tree.children[2]]


class built_in_function:
	def __init__(self,arguments,return_type,name,assembly_equivalent):
		self.built_in = 1
		self.used = 0
		self.return_type = return_type
		self.input_parameters = arguments
		self.name = name
		self.assembly = assembly_equivalent

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


def tokenise(self,source_text):
	#tokeniser which handles strings and comments, deals with import directives etc
	#source_text = fix_strings_and_comments(source_text)
	#print "tokenising"
	escaped_replace_dict = {"n":"\n",'"':'"',"\\":"\\","'":"'","t":"\t"}
	source_text,macro_replace_dict = pretokenise(source_text,sys.argv[1].split("\\")[:-1])
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
			values_list = []
			for char in current_token[1:-1]:
				values_list.append(str(ord(char)))
				values_list.append(",")
			values_list.append('0')
			string_token_list += ["@","char",str(len(current_token)-1),name,"=","["]+values_list + ["]",";"]
			string_token_list[i] = name
			#if string_token_list[i] == name:
			#	print "String found: ",name,current_token
			#	cont = raw_input('')
			string_counter += 1
		elif current_token[0] == current_token[-1] == "'":
			if current_token[1] != '\\':
				string_token_list[i] = str(ord(current_token[1]))
			else:
				string_token_list[i] = str(ord(escaped_replace_dict[current_token[2]]))
			token_list += [
				self.get_parse_tree_node("char"),
				self.get_parse_tree_node("(")
				]
			string_token_list.insert(i+1,")")
		if current_token not in self.to_ignore:
			if current_token in macro_replace_dict:
				string_token_list[i] = macro_replace_dict[current_token]
			token_list.append(self.get_parse_tree_node(string_token_list[i]))
		i += 1
	token_list.append(Terminal_parse_tree_node("END","END"))                                    #adds end symbol to end of code
	#print [token.string for token in token_list]
	return token_list

def split(delimiters, string, maxsplit=0):
    import re
    regexPattern = '|'.join(map(re.escape, delimiters))
    return [string for string in re.split(regexPattern, string, maxsplit) if string != '' ]


def main_tokenise(self,text_file):
	'''
	Monolithic tokenizer
	''' #replaces parser tokeniser
	text_file = [line for line in text_file.split("\n")]
	#print text_file
	token_list = []
	string = 0
	escaped = 0
	array = 0
	i = 0
	char_literal = 0
	token_separators = self.elementary_tokens
	to_ignore = self.to_ignore
	escaped_replace_dict = {"n":"\n",'"':'"',"\\":"\\","'":"'","t":"\t"} #converts escaped n to \n etc
	while i < len(text_file):
		line = text_file[i]
		if not string:
			line_tokens= []
			current_token = ''
		for character in line:
			if not string:
				if not char_literal:
					if character == "'":
						char_literal = 2
						current_token = "'"
					elif character == '"' and current_token == '': #if a string
						current_token = '"'
						string = 1
					elif character == "/" and len(line_tokens) and line_tokens[-1] == '/': #comment
						line_tokens = line_tokens[:-1]
						break
					elif not character in token_separators:
						current_token += character
					else:
						if current_token != "":
							line_tokens.append(current_token)
							current_token = ""
						line_tokens.append(character)
				else:
					if not escaped:
						if character == "\\":
							escaped = 1
							current_token+=(character)
						else:
							char_literal -= 1
							current_token+=(character)
					else:
						char_literal -= 1
						current_token += character
						escaped = 0
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
		else:
			current_token += "\n"
		i +=1
		line_tokens.append("\n")
	return token_list

import re
def pretokenise(source_text,path):
	#deals with import and define directives

	lines = source_text.split("\n")
	replace_dict = {}
	i = 0
	while i < len(lines):
		line = lines[i]
		split_line = split([" ","\t"],line)
		if len(split_line)  and split_line[0][0] == "#":
			if split_line[0] == "#include":  #replaces this line with the code of the specified file
				#print line
				if split_line[1][:4] == "STD:":
					file_path = os.path.join(CURRENT_DIR,"standard library\\"+split_line[1][4:])
					included = pretokenise(open(file_path,"r").read(),file_path[-1])
				else:
					file_path = path+[split_line[1]]
					included = pretokenise(open("\\".join(file_path),"r").read(),file_path[-1])
				lines[i] = included[0]
				replace_dict.update(included[1])
			elif split_line[0] == "#define": #defines token to be changed for another
				try:
					replace_dict[split_line[1]] = split_line[2]
					lines = lines[:i]+lines[i+1:] #removes line 
					i -=1 							#accounts for removal of line
				except IndexError:
					print "ERROR(43): not enough tokens for a #define in line "+str(i)
					quit()
			elif split_line[0] == "#random": #defines a token to be replaced by a random integer
				try:
					import random
					replace_dict[split_line[1]] = str(random.randrange(0xffffffff))
					lines = lines[:i]+lines[i+1:] #removes line 
					i -=1 							#accounts for removal of line	
				except IndexError:
					print "ERROR(43): not enough tokens for a #random in line "+str(i)
					


		i += 1
	return "\n".join(lines),replace_dict

def write_to_file(assembly_code):
	file_name = ".".join(sys.argv[1].split(".")[:-1]+["al"])
	open(file_name,"w").write(assembly_code)

def get_source_file():
	'''gets source text from the requested file'''
	file_name = sys.argv[1]
	return open(file_name,"r").read()

def get_parse_tree(source_text):
	'''uses parser file to get a parse tree of the program'''
	CURRENT_DIR = os.path.dirname(__file__)
	file_path = os.path.join(CURRENT_DIR, 'CLL1_2.parse')
	local_parser = LR1_parser.Parser(file_path,tokenise) #replace built in function in parser
	parse_tree = local_parser.parse(source_text)
	return parse_tree

def find_functions(parse_tree):
	function_list = []
	i = 0
	while i < len(parse_tree.children):
		child = parse_tree.children[i]
		if child.type == "<block>":
			function_list += find_functions(child)
		elif child.children[0].children[0].type == "<fun_dec>":
			#found a function
			function_list.append(child.children[0].children[0]) #function found
			parse_tree.children = parse_tree.children[:i]+parse_tree.children[i+1:]
			i -=1
		i +=1
	return function_list

def linearise_code(parse_tree):
	'''searches parse tree for line expressions and then adds them to a list'''
	if parse_tree.type == "<PROGRAM>":
		return linearise_code(parse_tree.children[0]) if len(parse_tree.children) else []
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

def store_parse_tree(parse_tree_node,offset = ''):
	if parse_tree_node.terminal:
		return offset+parse_tree_node.type+"("+parse_tree_node.string+")"
	else:
		return_string = offset+parse_tree_node.type+"(" + "\n"
		for child in parse_tree_node.children:
			return_string += store_parse_tree(child,offset+"  ") +"\n"
		return_string +=  offset+")"
		return return_string

def get_type(type_tree):
	if len(type_tree.children) == 1: #int or char
		return type_tree.children[0].string
	elif len(type_tree.children) >= 2: #@int or @char
		return type_tree.children[0].string+type_tree.children[1].string
	#print type_tree.type
	quit()

def copy_parse_tree(parse_tree):
	if parse_tree.terminal:
		return Terminal_parse_tree_node(parse_tree.type,parse_tree.string)
	else:
		new_children = [copy_parse_tree(child) for child in parse_tree.children]
		new_type = parse_tree.type
		return Non_terminal_parse_tree_node(new_type,new_children)

def process_assignment(assignment):
	#assignments become a lhs and rhs
	if assignment.children[1].terminal: #if a normal assignment
		assignment.children = [assignment.children[0],assignment.children[2]]
	else:
		new_children = []
		new_children.append(assignment.children[0])
		lhs = copy_parse_tree(assignment.children[0])
		lhs = Non_terminal_parse_tree_node("<expr>",[Non_terminal_parse_tree_node("<term>",[Non_terminal_parse_tree_node("<factor>",[lhs])])]) #adds wrapper
		new_children.append(Non_terminal_parse_tree_node("<expr>",[lhs,assignment.children[1].children[0],assignment.children[3]]))
		assignment.children = new_children
	return assignment

program = Program()
program.compile()