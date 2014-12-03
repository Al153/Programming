def process_snippets(filename):
	'''generates a list of snippets objects'''
	snippet_text = open(filename,"r").read()
	snippets_dict = parse_snippets(snippet_text)
#	print snippets_dict
	snippets_dict = {name:snippet(name,snippets_dict[name]) for name in snippets_dict}
	print snippets_dict[" function startup routine "].generate_code(
			{
				"function_name":"hello",
				"new_length":"5",
				"get_parameters":"blah blah blah"
			}
		)
	return snippets_dict

def parse_snippets(text):
	#simple splitting up job
	snippets = {}
	state = "begin" 				#state machine which builds up name and text before addign entry to dictionary
	previous_state = ''
	current_snippet = ''
	current_snippet_name = ''
	for character in text: 		    #makes single pass over text
		if state == "begin":        #begin state is before the machine has seen the start of a snippet
			if character == "<":  
				previous_state = state
				state = "found <"
		elif state == "found <": 	#the machine can find a < either at the start of a new snippet, the use of a name in the snippet, or general use
			if character == "<":  	# two < indicates the name of a new snippet
				if previous_state == "in snippet": 		#if had already found a snippet
					self.snippets[current_snippet_name] = current_snippet
					current_snippet = ''
					current_snippet_name = ''
				previous_state = "found <"
				state = "snippet name"
			else: 										#for other uses of <
				state = previous_state
				if previous_state  == "in snippet":
					current_snippet += '<'
					current_snippet += character

		elif state == "snippet name": 					#in the name of a snippet
			if character == ">":
				previous_state = state
				state = "found >"
			else:
				current_snippet_name += character


		elif state == "found >": 						#at the and of a name of a snippet
			if character == ">":
				state = "in snippet"
			else:
				state = previous_state
				current_snippet_name += character

		elif state == "in snippet": 				   #in the body of a snippet
			if character == "<":
				previous_state = state
				state = "found <"
			else:
				current_snippet += character
	if current_snippet_name and current_snippet:
		self.snippets[current_snippet_name] = current_snippet
	return snippets


class snippet: 										   #class to do main snippet processing
	def __init__(self,name,snippet_text):
		self.name = name
		self.snippet_text = snippet_text
		self.blocks,self.labels = self.split_snippet() 	#gets lists of plain text and labels to substituted in

	def split_snippet(self):
		''' simple state machine to find the permanent and non permanent parts of the code'''
		blocks = []
		labels = []
		label_name = ''
		block = ''
		state = 'body'
		for character in self.snippet_text: 		#single pass through text, with state machine splitting up text
			if state == 'body': 					#if between gaps
				if character == "<":
					blocks.append(block)
					block = ''
					state = 'name'
				else:
					block += character
			elif state == 'name': 					#if in a gap
				if character == '>':
					labels.append(label_name)
					label_name = ''
					state = 'body'
				else:
					label_name += character 
		if state == 'block': 						#cleaning up
			blocks.append(block)
		elif state == "name":
			labels.append(label_name)
		return blocks,labels

	def generate_code(self,substitution_dictionary):
		'''takes in a dictionary of substitutions and generates code from it'''
		substituted = []
		print self.labels
		for label in self.labels:
			substituted.append(substitution_dictionary[label]) #gets labels in order
		new_code = []
		for i in xrange(len(self.blocks)): 	#builds new dictionary
			new_code.append(self.blocks[i])
			try:
				new_code.append(substituted[i])
			except IndexError:
				pass
		try:	
			new_code += substituted[len(self.blocks):] #adds substitued to the end if any is left
		except IndexError:
			pass
		return ''.join(new_code)

class code_generator:
	def __init__(self,function_name,variable_address_dict,global_variable_address_dictionary,variable_type_dict,global_variable_type_dict,function_object,snippets):
		snippets = process_snippets(sys.argv[1])
		self.IF_COUNT = 0
		self.LOOP_COUNT = 0

		self.global_variable_address_dict = global_variable_address_dictionary
		self.local_variable_address_dict = variable_address_dict
		self.global_variable_type_dict = global_variable_type_dict
		self.variable_address_dict = variable_type_dict

		self.function_name = function_name
	#Code generation code to write:
	#	expression generation code
	#	boolean expression generation code
	# 		- Bool factor, bool_expr
	#	for loop code 											DONE
	#	while loop code 										DONE
	#	if statement, if - else code 							DONE
	#	block code
	#	function call, and function execution code  			DONE
	#	variable fetching and storing code 						DONE
	
	#	assignments
	
	
	# _________________________________ functions  _________________________________
	def generate_function_code(self,function_parse_tree,parameters,input_variables,stack_frame_size,function_name):
		'''generates code fo a function,
		input variables is a dict matching variables to a stack frame index
		'''
		pop_to_gp0_code = self.snippets["Popgp0"].generate_code({})
		code_to_get_parameters = ''.join([snippets.get_parameters(
			{
				"Popgp0":pop_to_gp0_code,
				"index":input_variables[variable]
				}
			) for variable in input_variables])
		assembly_code = self.snippets[" function startup routine "].generate_code(
			{
			"function_name":function_name,
			"new_length":str(stack_frame_size),
			"get_parameters":code_to_get_parameters
			})
		for line in function_parse_tree.children:
			assembly_code += self.generate_block_code(line)
		#last line should be a return command
	
	def generate_function_call(self,args_parse_tree,function_name):
		'''Generates the code to call a function'''
		function_call_code = self.snippets[" function call routine "].generate_code(
			{
			"Push args":self.generate_push_args(args_parse_tree),
			"Call_address":function_name
			}
			)
		return function_call_code
	
	def generate_push_args(self,args_parse_tree):
		'''generates code to push argumetns onto the stack for the start of a function'''
		push_args_code = ''
		while 1:
			if len(args_parse_tree)>1: 	#if not at end, add the code, and update the parse tree
				push_args_code += self.generate_expression_code(args_parse_tree.children[0])
				args_parse_tree = args_parse_tree.children[-1]
			else: 	#gets to the end of the the arguments 
				push_args_code += self.generate_expression_code(args_parse_tree.children[0])
				break
		return push_args_code
	
	
	#__________________________________________________ control flow _____________________________________
	
	def generate_if_code(self,if_parse_tree):
		if len(if_parse_tree.children)>1: 		#two kinds of if
			return self.generate_if_else_code(if_parse_tree)
		else:
			return self.generate_only_if_code(if_parse_tree)
	
	def generate_only_if_code(self,if_parse_tree):
		condition_code = self.generate_boolean_expression(if_parse_tree.children[0]) #generates the boolean condition	
		block_code = self.generate_block_code(if_parse_tree.children[1]) 			#gets block code to run if true
		pop_gp0 = self.snippets["Popgp0"].generate_code({}) 							#code to deal with a pop
		return_code =  self.snippets[" if statement code "].generate_code({ 			#generates if code using a snippet
			"Calculate_condition":condition_code,
			"Popgp0":pop_gp0,
			"number":str(self.IF_COUNT), 	#if count used to make labels distinct
			"conditional code":block_code,
			})
		self.IF_COUNT += 1 															#increments if count to make it distinct
		return return_code
	
	def generate_if_else_code(self,if_parse_tree):
		condition_code = self.generate_boolean_expression(if_parse_tree.children[0])  		#get boolean condition
		true_code = self.generate_block_code(if_parse_tree.children[1]) 						#gets truwe and false code
		false_code = self.generate_block_code(if_parse_tree.children[2])
		pop_gp0 = self.snippets["Popgp0"].generate_code({})
		return_code =  self.snippets[" if statement code "].generate_code({ 					#uses snippet
			"Calculate_condition":condition_code,
			"Popgp0":pop_gp0,
			"number":str(self.IF_COUNT),
			"true_code":true_code,
			"false_code":false_code
			})
		self.IF_COUNT += 1
		return return_code
	
	def generate_while_code(self,while_parse_tree):
		#similar to if code, using counter make labels distinct
		condition_code = self.generate_boolean_expression(while_parse_tree.children[0]) 		#condition and code to run fetched
		pop_gp0 = self.snippets["Popgp0"].generate_code({})
		looped_code = self.generate_block_code(while_parse_tree.children[1])
		return_code = self.snippets[" while loop code "].generate_code({ 					#snippet used to generate code
			"number":str(self.LOOP_COUNT),
			"Popgp0":pop_gp0,
			"Calculate_condition":condition_code
			})
		self.LOOP_COUNT += 1
		return return_code
	
	def generate_for_loop(self,for_parse_tree): 
		assign_1 = self.generate_assign_statement(for_parse_tree.children[0]) 		#2 assignments are an initial assignment and a repeated assignment
		if for_parse_tree.children[1].children[0].type == "bool_factor":
			condition = self.generate_boolean_factor(for_parse_tree.children[1].children[0])
		else:
			condition = self.generate_comparison(for_parse_tree.children[1].children[0])
		pop_gp0 = self.snippets["Popgp0"].generate_code({})
		assign_2 = self.generate_assign_statement(for_parse_tree.children[2])
		block = self.generate_block_code(for_parse_tree.children[3])
		return_code = self.snippets[" for loop code "].generate_code({
				"assignment1":assign_1,
				"Calculate_condition":condition,
				"Popgp0":pop_gp0,
				"assignment2":assign_2,
				"number": str(self.LOOP_COUNT),
				"looped_code":block
			})
		self.LOOP_COUNT += 1
		return return_code
	
	#______________________________________________ Bolean code ________________________________________
	
	def generate_boolean_expression(self,bool_parse_tree):  			#set of mutually recursive functions
		if bool_parse_tree.children[1].type == "bool_factor":  	#follows grammar parse tree
			return self.generate_boolean_factor(bool_parse_tree.children[1])   
		elif bool_parse_tree.children[1].type == "comparison":
			return self.generate_comparison(bool_parse_tree.children[1])
		else:
			print "ERROR"
			quit()
	
	
	def generate_boolean_factor(self,bool_parse_tree):
		if len(bool_parse_tree.children) == 1: 			#can be simply a bool expr, a binary op or unary op
			return_code = self.generate_boolean_expression(bool_parse_tree.children[0])
		elif len(bool_parse_tree.children) == 2:
			return_code = self.generate_boolean_expression(bool_parse_tree.children[1]) + self.generate_bool_unary_op(bool_parse_tree.children[0])
		elif len(bool_parse_tree.children) == 3:
			return_code = self.generate_boolean_expression(bool_parse_tree.children[0])+self.generate_boolean_expression(bool_parse_tree.children[2])+self.generate_boolean_operation(bool_parse_tree.children[1])
		return return_code
		
	def generate_boolean_operation(self,bool_parse_tree):
		'''modular boolean operation generator'''
		pop_gp0 = self.snippets["Popgp0"].generate_code({})
		pop_gp1 = self.snippets["Popgp1"].generate_code({})
		push_gp0 = self.snippets["Pushgp0"].generate_code({})
		if  bool_parse_tree.string == "and":
			return '\n'.join([pop_gp0,pop_gp1,"AND gp0 gp1",push_gp0])
		elif bool_parse_tree.string == "or":
			return '\n'.join([pop_gp0,pop_gp1,"OR gp0 gp1",push_gp0])
		elif bool_parse_tree.string == "xor":
			return '\n'.join([pop_gp0,pop_gp1,"XOR gp0 gp1",push_gp0])
		else:
			print "ERROR: unexpected boolean operation: ",bool_parse_tree.string
			quit()
	
	def generate_bool_unary_op(self,bool_parse_tree):
		pop_gp0 = self.snippets["Popgp0"].generate_code({})
		push_gp0 = self.snippets["Pushgp0"].generate_code({})
		if bool_parse_tree.string == "not":
			return ''.join([pop_gp0,"NOT gp0",push_gp0])
	
	def generate_comparison(self,bool_parse_tree):
		if len(bool_parse_tree.children) == 1: #just an if true comparison
			pop_gp0 = self.snippets["Popgp0"].generate_code({})
			push_gp0 = self.snippets["Pushgp0"].generate_code({})
			return self.generate_expression_code(bool_parse_tree.children[0]) + self.snippets["is true"].generate_code({"getgp0":pop_gp0,"Push gp0":push_gp0})
		elif len(bool_parse_tree.children) == 3:
			pop_gp0 = self.snippets["Popgp0"].generate_code({})
			pop_gp1 = self.snippets["Popgp1"].generate_code({})
			push_gp0 = self.snippets["Pushgp0"].generate_code({})
			comparison_operation = bool_parse_tree.children[1]
			if len(comparison_operation.children) == 2: 						#is equal
				return self.snippets["is equal"].generate_code({"getgp0":pop_gp0,"getgp1":pop_gp1,"push gp0":push_gp0})
			elif len(comparison_operation.children) == 1: 						#other operations
				if comparison_operation.children[0].terminal:  					#if a < or >
					if comparison_operation.children[0].string == "<":
						return self.snippets["is less"].generate_code({"getgp0":pop_gp0,"getgp1":pop_gp1,"push gp0":push_gp0})
					elif comparison_operation.children[0].string == ">":
						return self.snippets["is greater"].generate_code({"getgp0":pop_gp0,"getgp1":pop_gp1,"push gp0":push_gp0})
					else:
						print "ERROR: not expecting comparisopn operator: "+comparison_operation.children[0].string
						quit()
				else:
					if comparison_operation.children[0].type == "<not_less>": 			#deal with non terminals
						return self.snippets["not less"].generate_code({"getgp0":pop_gp0,"getgp1":pop_gp1,"push gp0":push_gp0})
					elif comparison_operation.children.type == "<not_greater>":
						return self.snippets["is greater"].generate_code({"getgp0":pop_gp0,"getgp1":pop_gp1,"push gp0":push_gp0})
					else:
						print "ERROR: not expecting comparisopn operator: "+comparison_operation.children[0].type
						quit()
	
	
	
	
	#___________________________________________ getting and storing variables _______________________
	
	def generate_get_value(self,value_parse_tree):
		#generates either loading a variable or a constant
		if value_parse_tree.type == "<const>":
			return self.generate_get_constant(value_parse_tree)
		elif value_parse_tree.type  == "<variable>":
			return self.generate_get_variable(value_parse_tree)

	def generate_get_constant

	def generate_store_value(self,variable_parse_tree):
		variable_name = variable_parse_tree.children[0].string
		if variable_name in self.variable_address_dict:
			return self.generate_store_local_variable(variable_parse_tree)
		elif variable_name in self.global_variable_address_dict:
			return generate_store_global_variable(variable_parse_tree)
		else:
			print "ERROR: does not recognise variable name: "+variable_name

	def generate_get_local_variable(self,variable_parse_tree):
		#gets a variable's value onto the stack
		variable_name = variable_parse_tree.children[0].string
		variable_type = self.variable_type_dict[variable_name]
		variable_address = str(self.variable_address_dict[variable_name])
		if len(variable_parse_tree.children) == 1:
			if variable_type == "int":
				return self.snippets[" to load gp0 "].generate_code({"absolute_address":variable_address}) + self.snippets["Pushgp0"].generate_code({})
			elif variable_type == "char":
				return self.snippets[" to load gp0 char "].generate_code({"absolute_address":variable_address}) + self.snippets["Pushgp0"].generate_code({})			
		else:
			if variable_type = "@int":
				index_expr = self.generate_expression_code(variable_parse_tree.children[2])
				pop_index = self.snippets["Popindex"].generate_code({})
				get_index = self.snippets[" get index integer "].generate_code({"index expr":index_expr,"pop index":pop_index})
				return self.snippets[" load gp0 relative "].generate_code({"get_index":get_index,"absolute_address":variable_address})
			elif variable_type == "@char":
				index_expr = self.generate_expression_code(variable_parse_tree.children[2])
				pop_index = self.snippets["Popindex"].generate_code({})
				get_index = self.snippets[" get index char "].generate_code({"index expr":index_expr,"pop index":pop_index})
				return self.snippets[" load gp0 relative char "].generate_code({"get_index":get_index,"absolute_address":variable_address})
			else:
				print "ERROR: unexpected variable type for relative addressing: "+variable_type
				quit()
	
	
	def generate_store_local_variable(self,variable_parse_tree):
		variable_name = variable_parse_tree.children[0].string
		variable_type = self.variable_type_dict[variable_name]
		variable_address = str(self.variable_address_dict[variable_name])
		if len(variable_parse_tree.children) == 1:
			if variable_type == "int":
				return self.snippets[" to store gp0 "].generate_code({"absolute_address":variable_address}) + self.snippets["Pushgp0"].generate_code({})
			elif variable_type == "char":
				return self.snippets[" to store gp0 char "].generate_code({"absolute_address":variable_address}) + self.snippets["Pushgp0"].generate_code({})			
		else:
			if variable_type = "@int":
				index_expr = self.generate_expression_code(variable_parse_tree.children[2])
				pop_index = self.snippets["Popindex"].generate_code({})
				get_index = self.snippets[" get index integer "].generate_code({"index expr":index_expr,"pop index":pop_index})
				return self.snippets[" store gp0 relative "].generate_code({"get_index":get_index,"absolute_address":variable_address})
			elif variable_type == "@char":
				index_expr = self.generate_expression_code(variable_parse_tree.children[2])
				pop_index = self.snippets["Popindex"].generate_code({})
				get_index = self.snippets[" get index char "].generate_code({"index expr":index_expr,"pop index":pop_index})
				return self.snippets[" store gp0 relative char "].generate_code({"get_index":get_index,"absolute_address":variable_address})
			else:
				print "ERROR: unexpected variable type for relative addressing: "+variable_type
				quit()	
	
	def generate_get_global_variables(self,variable_parse_tree):
		#gets a variable's value onto the stack
		variable_name = variable_parse_tree.children[0].string
		variable_type = self.variable_type_dict[variable_name]
		variable_address = str(self.variable_address_dict[variable_name])
		if len(variable_parse_tree.children) == 1:
			if variable_type == "int":
				return self.snippets[" to load gp0 global "].generate_code({"absolute_address":variable_address}) + self.snippets["Pushgp0"].generate_code({})
			elif variable_type == "char":
				return self.snippets[" to load gp0 char global "].generate_code({"absolute_address":variable_address}) + self.snippets["Pushgp0"].generate_code({})			
			elif variable_type == "@int":
				return self.snippets[" to load gp0 global "].generate_code({"absolute_address":variable_address}) + self.snippets["Pushgp0"].generate_code({})
			elif variable_type == "@char":
				return self.snippets[" to load gp0 char global "].generate_code({"absolute_address":variable_address}) + self.snippets["Pushgp0"].generate_code({})			
	
		else:
			if variable_type = "@int":
				index_expr = self.generate_expression_code(variable_parse_tree.children[2])
				pop_index = self.snippets["Popindex"].generate_code({})
				get_index = self.snippets[" get index integer "].generate_code({"index expr":index_expr,"pop index":pop_index})
				return self.snippets[" load gp0 relative global "].generate_code({"get_index":get_index,"absolute_address":variable_address})
			elif variable_type == "@char":
				index_expr = self.generate_expression_code(variable_parse_tree.children[2])
				pop_index = self.snippets["Popindex"].generate_code({})
				get_index = self.snippets[" get index char "].generate_code({"index expr":index_expr,"pop index":pop_index})
				return self.snippets[" load gp0 relative char global "].generate_code({"get_index":get_index,"absolute_address":variable_address})
			else:
				print "ERROR: unexpected variable type for relative addressing: "+variable_type
				quit()
	
	def generate_store_global_variable(self,variable_parse_tree):
		variable_name = variable_parse_tree.children[0].string
		variable_type = self.variable_type_dict[variable_name]
		variable_address = str(self.variable_address_dict[variable_name])
		if len(variable_parse_tree.children) == 1:
			if variable_type == "int":
				return self.snippets[" to store gp0 global "].generate_code({"absolute_address":variable_address}) + self.snippets["Pushgp0"].generate_code({})
			elif variable_type == "char":
				return self.snippets[" to store gp0 char global "].generate_code({"absolute_address":variable_address}) + self.snippets["Pushgp0"].generate_code({})			
			elif variable_type == "@int":
				return self.snippets[" to store gp0 global "].generate_code({"absolute_address":variable_address}) + self.snippets["Pushgp0"].generate_code({})
			elif variable_type == "@char":
				return self.snippets[" to store gp0 char global "].generate_code({"absolute_address":variable_address}) + self.snippets["Pushgp0"].generate_code({})
			else:
				print "ERROR: unexpected variable type: "+variable_type
				quit()
		else:
			if variable_type = "@int":
				index_expr = self.generate_expression_code(variable_parse_tree.children[2])
				pop_index = self.snippets["Popindex"].generate_code({})
				get_index = self.snippets[" get index integer "].generate_code({"index expr":index_expr,"pop index":pop_index})
				return self.snippets[" store gp0 relative global "].generate_code({"get_index":get_index,"absolute_address":variable_address})
			elif variable_type == "@char":
				index_expr = self.generate_expression_code(variable_parse_tree.children[2])
				pop_index = self.snippets["Popindex"].generate_code({})
				get_index = self.snippets[" get index char "].generate_code({"index expr":index_expr,"pop index":pop_index})
				return self.snippets[" store gp0 relative char global "].generate_code({"get_index":get_index,"absolute_address":variable_address})
			else:
				print "ERROR: unexpected variable type for relative addressing: "+variable_type
				quit()	
	
	#______________________________________________ Line types _________________________________
	def generate_assignment_code(self,assignment_parse_tree):
		lhs = assignment_parse_tree.children[0]
		rhs = assignment_parse_tree.children[1]
		expression_code = self.generate_expression_code(rhs)
		assignment_code = self.generate_store_value(lhs)
		return expression_code + assignment_code




 
import sys
