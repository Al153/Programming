import LR1_parser
import sys
import os
import code_generator1_3 as code_generator

# CLL 1.1 adds direct casting support, and further underlying optimisations
# CLL 1.2 adds the ternary expression and modifying assignments (a += b etc)
# CLL 1.3 is the typing revolution - going to completely redesign the back end of typing and what one can do with typing
#	- Add signedInt and signedChar, float
#	- structs - collections of variables can be defined as a whole new type
#	- Overhaul pointers (allow a pointer to point to any kind of type - ie @@int @float, to user defined structs)
# 	- added ability to comment in grammar
#
#
#
#	TO DO:
#
# need to update variable stuff and ability to create structs 				DONE -  needs checking
# refactor variable handling code (unify it)  								DONE -  needs checking
# need to update code generator and snippets
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



class Program:
	def __init__(self): 		
		print "getting source = ",			
		self.source = get_source_file()
		print "DONE!\nParsing = ",
		self.parse_tree = get_parse_tree(self.source)
		print "DONE!"

	def compile(self):
		print "Creating built in functions = ",
		CURRENT_DIR = os.path.dirname(__file__)
		self.built_in_functions = [
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
		self.type_sizes = {"char":1,"int":4,"float":4,"signedChar":1,"signedInt":4}
		self.structs = self.get_structs()
		self.has_array = []
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
			self.has_array.append(var_name)
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
		type_string = get_type(type_tree) #gets the type
		if len(type_tree.children) == 3: #if an array
			type_string += ";"+ type_tree.children[2].string
		return type_string
	def parse_array(self,array_tree):
		#print array_tree.type
		if len(array_tree.children) == 1:
			return [int(array_tree.children[0].string)]
		else:
			return self.parse_array(array_tree.children[0]) + [int(array_tree.children[2].string)]

	def generate_global_vars(self):
		#creates assembly level variable definitions
		return_string = ''
		for var_name in self.global_var_types:
			#print self.global_var_types[var_name]
			#cont = raw_input('')
			self.global_var_types[var_name]
			if self.global_var_types[var_name][0] == '@': #pointers
				if var_name in self.has_array: #array
					array_length = str(self.global_var_sizes[var_name]) #gets length
					array_name = "CLL.array_of_"+var_name
					if var_name in self.global_array_values:
						array_values = "["+ ', '.join([str(value) for value in self.global_array_values[var_name]])+"]\n"	
					else:
						array_values = '[]\n'
					if self.global_var_types[var_name][1:] == "char": 					#chars are one byte
						return_string += "byteArray "+array_name+" "+array_length+" "+array_values #creates array
						return_string += "int CLL."+var_name+" "+array_name	+"\n"
					else: 															#points to int type
						return_string += "array "+array_name+" "+array_length+" "+array_values #creates array
						return_string += "int CLL."+var_name+" "+array_name+"\n"		
				else: #no array
					return_string += "int CLL."+var_name+" 0\n"


			if self.global_var_types[var_name] in ["int","char","float","signedInt","signedChar"]:     #plain variables
				return_string += self.global_var_types[var_name] +" CLL."+var_name+" 0\n"

		return return_string

	def get_structs(self):
		#returns a dict of struct objects
		structs_dict = {}
		for line in self.header_code.children:
			if line.type == "<struct_def>":
				structs_dict[line.children[1].string] = Struct(line)
				index = self.header_code.children.index(line)
				self.header_code.children = self.header_code.children[:index]+self.header_code.children[index+1:]
		return structs_dict

class Struct:
	#class for objects to store information on structs
	def __init__(self,line):
		#an array called "has_array" is generated which lists the elements which must be set to equal arrays
		self.name = line.children[1].string
		self.declarations = self.linearise_declarations(line.children[3]) #identify var declarations
		self.var_types = self.get_var_types() 							  #work out the types of each variable - including the length of any arrays
		self.var_sizes = self.get_var_sizes()							  #works out the size of each variable within the structure
		self.var_offsets = self.get_var_offsets() 						  #works out the internal address offsets within the struct (ie the internal address of each variable)
																		  #also works out the memory footprint of the struct and adds it to the global var size dict
		self.startng_values = self.get_starting_values() 										  #works out if there are any starting values for variables within the struct


	def get_var_types(self):
		#produces a {name:type} dict of all the variables in the declarations
		self.has_array = []
		var_types = {}
		for declaration in self.declarations:
			this_type = get_type(declaration.children[0]) #adds type is type
			var_types[declaration.children[1].string] =  this_type
			if len(declaration.children[0].children == 3): #if there is an array, create an entry for the array too
				self.has_array.append(declaration.children[1].string)
				var_types["array_of_"+declaration.children.[1].string] = "ARRAY|"+this_type[1:]+"|"+declaration.children[0].children[2].string #adds an array type, the type reoves a singe pointer
		return var_types

	def get_var_sizes(self):
		var_sizes = {}
		for var in self.var_types:
			var_type = var_types[var]
			if len(var_type.split("|"))>1: #if an array
				array_type = var_type.split("|")
				try:
					size = 4 if array_type[1][0] == '@' else program.var_sizes[array_type[1]] #he size of an @var is always 4
					var_sizes[var] = size*int(array_type[2]) 
				except KeyError:
					print "ERROR(45): undefined type: "+array_type[1]
					quit()
			else:
				try:
					size = 4 if var_type[0] == '@' else program.var_sizes[var_type]
					var_sizes[var] = size
				except KeyError:
					print "ERROR(45): undefined type: "+array_type[1]
					quit()
			var_sizes[var] = new_size
		return var_sizes

	def get_starting_values():
		#goes through the list of declarations checking for starting values
		starting_values = {}
		for declaration in self.declarations:
			if len(declaration.children) == 4:
			var = declaration.children[1].string
			rhs = declaration.children[3]
			if var in self.has_array: #if an array
				if len(rhs.children) == 3: #if an array
					star][var] = rhs.children[1]
				else:
					#raise an error an array must have an array asignment
					print "ERROR(47): arrays oonly have array "
			else:
				if len(rhs.children) == 3: #if an array assignment, raise an error
					print "ERROR(46): arrays can only be assigned to array types"
					quit()
				else:
					#add the value to the dict
					starting_values[var] = rhs



	def get_var_offsets(self):
		#gets internal addresses of variables within a structss
		var_offsets = {}
		offset = 0
		for var in self.var_sizes:
			var_offsets[var] = offset
			offset += self.var_sizes[var]
		self.size = offset #remaining offset is the entrire size of the struct
		program.var_sizes[self.name] = self.size 		#updaes the external struct dict
		return var_offsets

	def linearise_declarations(self,inside_struct):
		#recursive unary tree structure => array
		declarations = []
		while len(inside_struct.children) >1:
			declarations.append(inside_struct.children[1])
			inside_struct = inside_struct.children[1]
		declarations.append(inside_struct.children[0])
		declarations.reverse()
		return declarations








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
		widths_lookup = program.type_sizes #arrays for @chars and @ints are 4+n or 4+(n*4), ptr, then array
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
				child_type = get_type(child.children[0])
				return_variables[child.children[1].string] = child_type			#adds an entry for the new variable
				widths[child.children[1].string] = 4 if child_type[0] == '@' else widths_lookup[child_type] #pointers have a width of 4 (int), otherwise lookup the type width
				if len(child.children[0].children)==3: #if there is an array type 
					#print "ARRAY TYPE !"
					array_type = get_type(child.children[0])[1:] 			#type of variables in array
					array_length =int(child.children[0].children[2].string)*(4 if array_type[0] == '@' else widths_lookup[array_type]) #adds the length of the array to lengths
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
		return 4 if var_type[0] == '@' else program.type_sizes[var_type]

	def parse_array(self,array_tree):
		#print array_tree.type
		if len(array_tree.children) == 1:
			return [int(array_tree.children[0].string)]
		else:
			return self.parse_array(array_tree.children[0]) + [int(array_tree.children[2].string)]

	def get_overall_type(self,specific_type):
		#reduces ints, chars, pointers etc to what they can be treated as, ie an @int is basically an int in terms of arithmetic
		if specific_type[0] == "@":
			return "int"
		return specific_typess

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
		#very large function - should probably be cut down into smaller pieces
		#runs recursively 
		if parse_tree.type == "<type_cast>": #casting type expressions always return the destination type, but need to check the tyhping of the expression to be cast
			resultant_type = get_type(parse_tree.children[0])#get the two types
			source_type = self.check_typing(parse_tree.children[2])

			parse_tree.type = "<cast>" 		#change the type of parse tree
			parse_tree.children = [parse_tree.children[2],Terminal_parse_tree_node(source_type,source_type),Terminal_parse_tree_node(resultant_type,resultant_type)] #reconstruct parse tree
			return resultant_type

		if parse_tree.type == "<ternary_op>": 				#ternary op must check that the types of the true expression and false expression are the same
			true_type = self.check_typing(parse_tree.children[0]) 			# the rest is fairly self explanatory
			false_type = self.check_typing(parse_tree.children[4])
			if true_type != false_type:
				print "ERROR(44): Types of the two results in a ternary statement must be the same"
				quit()
			else:
				return true_type

		if len(parse_tree.children) == 3: 		#for all expressions with 3 children
			if parse_tree.children[0].type == '"("': #( expression )
				input_type =  self.check_typing(parse_tree.children[1]) 	#just need to check the tying of the child
				return input_type
			else: 									# expr + term or equivalent, binary opss
				lhs_type = self.check_typing(parse_tree.children[0])
				rhs_type = self.check_typing(parse_tree.children[2])
				overall_type = lhs_type #left hand rule
				parse_tree.children[2] = self.cast_type(rhs_type,lhs_type,parse_tree.children[2]) #casts rhs into the type
				parse_tree.children[1].type = "<"+parse_tree.children[1].type[1:-1]+lhs_type+">" #fixes the operator to a specific type for the code generator - results in ADDOpchar, or ADDop int
			 	return lhs_type
		elif len(parse_tree.children) == 2:   #unary ops
			input_type = self.check_typing(parse_tree.children[1]) 								#checks typing of child
			parse_tree.children[0].type = "<"+parse_tree.children[0].type[1:-1]+input_type+">" #fixes the operator to a specific type, as above
			return input_type
		elif len(parse_tree.children) == 1: 													#skips ahead if one of these
			if parse_tree.children[0].type in ("<type_cast>","<term>","<factor>","<ternary_op>"):
				input_type =  self.check_typing(parse_tree.children[0])
				return input_type
			elif parse_tree.children[0].type == "<fun_call>": 									#returns the return type of the function called, after checking that the parameters match up
				function_name = parse_tree.children[0].children[0].string
				function_type = self.get_overall_type(program.functions[function_name].return_type)
				self.check_function_call(parse_tree.children[0])
				return function_type


			elif parse_tree.children[0].type == "<variable>": #for variables


				variable_parse_tree = parse_tree.children[0]
				if len(variable_parse_tree.children) == 1: #simple variable (not a pointer or a struct)
					if variable_parse_tree.children[0].string in self.variables:
						return self.get_overall_type(self.variables[variable_parse_tree.children[0].string]) #gets overall type
					elif variable_parse_tree.children[0].string in program.global_var_types:
						return self.get_overall_type(program.global_var_types[variable_parse_tree.children[0].string])
					else:
						print "ERROR(0): Unrecognised variable: "+ variable_parse_tree.children[0].string + " in function "+self.name
						quit()


				elif len(variable_parse_tree.children) == 4: #if getting a value with respect to a pointer then
					#needs to be a pointer
					#print "POINTER"
					if variable_parse_tree.children[0].string in self.variables: #if local
						if self.variables[variable_parse_tree.children[0].string][0] == "@":
							#if the variable type is a pointer
							type_to_return = self.get_overall_type(self.variables[variable_parse_tree.children[0].string][1:]) #gets the pointed to type
							#print type_to_return
							index_type = self.check_typing(variable_parse_tree.children[2])
							if index_type in ["int","char","signedInt","signedChar"]: #checks the type can be used to index
								return type_to_return
							else:
								print "ERROR(47): type: " + index_type + " cannot be used to index a pointer"
								quit()
						else:
							#raise an error
							print "ERROR(1): variable "+variable_parse_tree.children[0].string+" of type "+self.variables[variable_parse_tree.children[0].string]+" cannot be used as a pointer"
							quit()
					elif variable_parse_tree.children[0].string in program.global_var_types:
						if program.global_var_types[variable_parse_tree.children[0].string][0] == "@":
							#if the variable type is a pointer
							type_to_return = program.global_var_types[variable_parse_tree.children[0].string][1:] #gets the pointed to type
							index_type = self.check_typing(variable_parse_tree.children[2])
							if index_type in ["int","char","signedInt","signedChar"]: #checks the type can be used to index
								return type_to_return
							else:
								print "ERROR(47): type: " + index_type + " cannot be used to index a pointer"
								quit()
						else:
							#otherwise raise an error
							print "ERROR(2): variable "+variable_parse_tree.children[0].string+" of type "+program.global_var_types[variable_parse_tree.children[0]].string+" cannot be used as a pointer"
							quit()
					else:
						print "ERROR(3): Unrecognised variable: \""+variable_parse_tree.children[0].string + "\""
						quit()
				elif len(variable_parse_tree.children) == 3: #if a struct reference
					struct_type = self.check_typing(variable_parse_tree.children[0])
					if (struct_type in program.structs): #if a struct
						possible_member = variable_parse_tree.children[2].string
						if possible_member in program.structs[struct_type].var_types:  #if the struct contains a value of the right type
							return program.structs[struct_type].var_types[possible_member] #finds ype of the member
						else:
							print "ERROR(49): struct of type: ",struct_type," does not have member: ",possible_member," in function: ",self.name
							quit()
					else: #raise error
						print "ERROR(48): tried to access member of a non struct variable: ",struct_type," in function: ",self.name
						quit()


			elif parse_tree.children[0].type == "<const>":
				if len(parse_tree.children[0].children) == 3: #floats are num . num
					return "float"
				return "int"  #other constants are either numbers or pointers (ints)
			else: #unkonown node - ore for debugging the compiler than debugging CLL code
				print "ERROR(39): incorrect node passed: "+ parse_tree.children[0].type
				print_parse_tree(parse_tree)
				quit()
		else: #debugging 
			print "ERROR(40): incorrect node passed: "+pass_tree.type
			quit()

	def cast_type(self,start_type,end_type,parse_tree): #creates a cast tree object, containing the types
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
		function_parameters = program.functions[function_name.string].input_parameters #gets hold of the desired parmeters of the function
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
				for parameter in parameters: #iterates through the parameters checking they match types
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


class built_in_function: 					#class for built in functions (have associated assemblys)
	def __init__(self,arguments,return_type,name,assembly_equivalent):
		self.built_in = 1
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

	#pretokenise carries out directives such as define and import
	source_text,macro_replace_dict = pretokenise(source_text,sys.argv[1].split("\\")[:-1])
	#main tokenise is a standard tokenizing routine
	string_token_list = main_tokenise(self,source_text)
	token_list = []
	string_counter = 0 #string counter allows string names to be unique -deals with stings by creating a @char n for the string and renaming it to stringX, then replacing references to it with stringX
	i = 0
	while i < len(string_token_list):		#iterates through tokens
		current_token = string_token_list[i]
		#print current_token
		if current_token[0] == current_token[-1] == '"': #if a string
			name  = "string"+str(string_counter)
			values_list = []
			for char in current_token[1:-1]: #get ordinal value of each char
				values_list.append(str(ord(char)))
				values_list.append(",")
			values_list.append('0')					#nullify strignby adding a 0
			string_token_list += ["@","char",str(len(current_token)-1),name,"=","["]+values_list + ["]",";"]   #adds tokens to end of token list declaring the string
			string_token_list[i] = name 			#replaces the "string" token with name
			string_counter += 1 
		elif current_token[0] == current_token[-1] == "'":
			string_token_list[i] = str(ord(current_token[1]))
		if current_token not in self.to_ignore:				#removes tokens to ingore (\n, \r space etc)
			if current_token in macro_replace_dict:
				string_token_list[i] = macro_replace_dict[current_token] 				#does the replacement if the token is defined as something else
			token_list.append(self.get_parse_tree_node(string_token_list[i]))
		i += 1
	token_list.append(Terminal_parse_tree_node("END","END"))                                    #adds end symbol to end of code
	return token_list

def main_tokenise(self,text_file):
	'''
	Monolithic tokenizer
	''' #replaces parser tokeniser, acts a a finite state machine
	text_file = [line for line in text_file.split("\n")]
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
					char_literal -= 1
					current_token+=(character)
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

def pretokenise(source_text,path):
	#deals with import directives
	lines = source_text.split("\n")
	replace_dict = {}
	i = 0
	while i < len(lines):
		line = lines[i]
		if len(line) and line[0] == "#":
			if line[:9] == "#include ":
				file_path = path+[line[9:]]
				included = pretokenise(open("\\".join(file_path),"r").read(),file_path[-1]) #an include statement means to replace that line with code from another file
				lines[i] = included[0]
				replace_dict.update(included[1]) 			#also imports the macros from the included file
			elif line.split(" ")[0] == "#define": #defines token to be changed for another
				try:
					replace_dict[line.split(" ")[1]] = line.split(" ")[2] 		#sets the replacement dict up
					lines = lines[:i]+lines[i+1:] #removes line 
					i -=1 							#accounts for removal of line
				except IndexError:
					print "ERROR(43): not enough tokens for a #define in line "+str(i)
					quit()
		i += 1
	return "\n".join(lines),replace_dict

def write_to_file(assembly_code):
	#'nuff said
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
	#snips out functions from code and adds to a list of functions
	function_list = []
	i = 0
	while i < len(parse_tree.children): #iterates through the childrenof the block parse tree
		child = parse_tree.children[i]
		if child.type == "<block>": 		#blocks indicate to search the block for functions - recursive
			function_list += find_functions(child)
		elif child.children[0].children[0].type == "<fun_dec>":
			#found a function
			function_list.append(child.children[0].children[0]) #function found
			parse_tree.children = parse_tree.children[:i]+parse_tree.children[i+1:]#cut out of parse tree and readjust i
			i -=1
		i +=1
	return function_list




def linearise_code(parse_tree):
	'''searches parse tree for line expressions and then adds them to a list'''
	if parse_tree.type == "<PROGRAM>":
		return linearise_code(parse_tree.children[0]) if len(parse_tree.children) else [] #checks if program has any non funion children
	elif parse_tree.type == "<block>": #check the blocks children
		code_to_return = []
		for child in parse_tree.children:
			if child.type == "<line>":
				code_to_return += [child.children[0].children[0]]
			elif child.type == "<block>":
				code_to_return += linearise_code(child)
		return code_to_return


def print_parse_tree(parse_tree_node,offset = ''):
	#output parse tree recursively
	if parse_tree_node.terminal:
		print offset+parse_tree_node.type+"("+parse_tree_node.string+")"
	else:
		print offset+parse_tree_node.type+"("
		for child in parse_tree_node.children:
			print_parse_tree(child,offset+"  ")
		print offset+")"

def store_parse_tree(parse_tree_node,offset = ''):
	#writes th parse tree to a string
	if parse_tree_node.terminal:
		return offset+parse_tree_node.type+"("+parse_tree_node.string+")"
	else:
		return_string = offset+parse_tree_node.type+"(" + "\n"
		for child in parse_tree_node.children:
			return_string += store_parse_tree(child,offset+"  ") +"\n"
		return_string +=  offset+")"
		return return_string

def get_type(type_tree):
	if len(type_tree.children) == 1: #primitive
		return type_tree.children[0].string
	elif len(type_tree.children) >= 2: #@pointer
		return "@" + get_type(type_tree.children[1])
	#print type_tree.type
	quit()

def copy_parse_tree(parse_tree):
	#performs a deep copy of the parse tree
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
	else: #if a modifying assignment
		new_children = []
		new_children.append(assignment.children[0])
		lhs = copy_parse_tree(assignment.children[0])
		lhs = Non_terminal_parse_tree_node("<expr>",[Non_terminal_parse_tree_node("<term>",[Non_terminal_parse_tree_node("<factor>",[lhs])])]) #adds wrapper
		new_children.append(Non_terminal_parse_tree_node("<expr>",[lhs,assignment.children[1].children[0],assignment.children[3]]))
		assignment.children = new_children
	return assignment

program = Program()
program.compile()