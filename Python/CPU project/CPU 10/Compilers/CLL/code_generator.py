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
					snippets[current_snippet_name] = current_snippet
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
		snippets[current_snippet_name] = current_snippet
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


#Code generation code to write:
#	expression generation code
#	boolean expression generation code
# 		- Bool factor, bool_expr
#	for loop code 											DONE
#	while loop code 										DONE
#	if statement, if - else code 							DONE
#	block code
#	function call, and function execution code  			DONE

#	assignments



def generate_function_code(function_parse_tree,parameters,input_variables,stack_frame_size,function_name):
	'''generates code fo a function,
	input variables is a dict matching variables to a stack frame index
	'''
	global snippets
	pop_to_gp0_code = snippets["Popgp0"].generate_code({})
	code_to_get_parameters = ''.join([snippets.get_parameters(
		{
			"Popgp0":pop_to_gp0_code,
			"index":input_variables[variable]
			}
		) for variable in input_variables])
	assembly_code = snippets[" function startup routine "].generate_code(
		{
		"function_name":function_name,
		"new_length":str(stack_frame_size),
		"get_parameters":code_to_get_parameters
		})
	for line in function_parse_tree.children:
		assembly_code += generate_block_code(line)
	#last line should be a return command

def generate_function_call(args_parse_tree,function_name):
	'''Generates the code to call a function'''
	function_call_code = snippets[" function call routine "].generate_code(
		{
		"Push args":generate_push_args(args_parse_tree),
		"Call_address":function_name
		}
		)
	return function_call_code

def generate_push_args(args_parse_tree):
	'''generates code to push argumetns onto the stack for the start of a function'''
	push_args_code = ''
	while 1:
		if len(args_parse_tree)>1: 	#if not at end, add the code, and update the parse tree
			push_args_code += generate_expression_code(args_parse_tree.children[0])
			args_parse_tree = args_parse_tree.children[-1]
		else: 	#gets to the end of the the arguments 
			push_args_code += generate_expression_code(args_parse_tree.children[0])
			break
	return push_args_code

def generate_if_code(if_parse_tree):
	if len(if_parse_tree.children)>1: 		#two kinds of if
		return generate_if_else_code(if_parse_tree)
	else:
		return generate_only_if_code(if_parse_tree)

def generate_only_if_code(if_parse_tree):
	global IF_COUNT #uses if count to make if labels distinct
	condition_code = generate_boolean_expression(if_parse_tree.children[0]) #generates the boolean condition	
	block_code = generate_block_code(if_parse_tree.children[1]) 			#gets block code to run if true
	pop_gp0 = snippets["Popgp0"].generate_code({}) 							#code to deal with a pop
	return_code =  snippets[" if statement code "].generate_code({ 			#generates if code using a snippet
		"Calculate_condition":condition_code,
		"Popgp0":pop_gp0,
		"number":str(IF_COUNT),
		"conditional code":block_code,
		})
	IF_COUNT += 1 															#increments if count to make it distinct
	return return_code

def generate_if_else_code(if_parse_tree):
	global IF_COUNT #uses if count to make if labels distinct
	condition_code = generate_boolean_expression(if_parse_tree.children[0])  		#get boolean condition
	true_code = generate_block_code(if_parse_tree.children[1]) 						#gets truwe and false code
	false_code = generate_block_code(if_parse_tree.children[2])
	pop_gp0 = snippets["Popgp0"].generate_code({})
	return_code =  snippets[" if statement code "].generate_code({ 					#uses snippet
		"Calculate_condition":condition_code,
		"Popgp0":pop_gp0,
		"number":str(IF_COUNT),
		"true_code":true_code,
		"false_code":false_code
		})
	IF_COUNT += 1
	return return_code

def generate_while_code(while_parse_tree):
	global LOOP_COUNT 																#similar to if code, using counter make labels distinct
	condition_code = generate_boolean_expression(while_parse_tree.children[0]) 		#condition and code to run fetched
	pop_gp0 = snippets["Popgp0"].generate_code({})
	looped_code = generate_block_code(while_parse_tree.children[1])
	return_code = snippets[" while loop code "].generate_code({ 					#snippet used to generate code
		"number":str(LOOP_COUNT),
		"Popgp0":pop_gp0,
		"Calculate_condition":condition_code
		})
	LOOP_COUNT += 1
	return return_code

def generate_for_loop(for_parse_tree): 
	global LOOP_COUNT    	#same as if and while
	assign_1 = generate_assign_statement(for_parse_tree.children[0]) 		#2 assignments are an initial assignment and a repeated assignment
	if for_parse_tree.children[1].children[0].type == "bool_factor":
		condition = generate_boolean_factor(for_parse_tree.children[1].children[0])
	else:
		condition = generate_comparison(for_parse_tree.children[1].children[0])
	pop_gp0 = snippets["Popgp0"].generate_code({})
	assign_2 = generate_assign_statement(for_parse_tree.children[2])
	block = generate_block_code(for_parse_tree.children[3])
	return_code = snippets[" for loop code "].generate_code({
			"assignment1":assign_1,
			"Calculate_condition":condition,
			"Popgp0":pop_gp0,
			"assignment2":assign_2,
			"number": str(LOOP_COUNT),
			"looped_code":block
		})
	LOOP_COUNT += 1
	return return_code

def generate_boolean_expression(bool_parse_tree):  			#set of mutually recursive functions
	if bool_parse_tree.children[1].type == "bool_factor":  	#follows grammar parse tree
		return generate_boolean_factor(bool_parse_tree.children[1])   
	elif bool_parse_tree.children[1].type == "comparison":
		return generate_comparison(bool_parse_tree.children[1])
	else:
		print "ERROR"
		quit()


def generate_boolean_factor(bool_parse_tree):
	if len(bool_parse_tree.children) == 1: 			#can be simply a bool expr, a binary op or unary op
		return_code = generate_boolean_expression(bool_parse_tree.children[0])
	elif len(bool_parse_tree.children) == 2:
		return_code = generate_boolean_expression(bool_parse_tree.children[1]) + generate_bool_unary_op(bool_parse_tree.children[0])
	elif len(bool_parse_tree.children) == 3:
		return_code = generate_boolean_expression(bool_parse_tree.children[0])+generate_boolean_expression(bool_parse_tree.children[2])+generate_boolean_operation(bool_parse_tree.children[1])
	return return_code
	
def generate_boolean_operation(bool_parse_tree):
	'''modular boolean operation generator'''
	pop_gp0 = snippets["Popgp0"].generate_code({})
	pop_gp1 = snippets["Popgp1"].generate_code({})
	push_gp0 = snippets["Pushgp0"].generate_code({})
	if  bool_parse_tree.string == "and":
		return '\n'.join([pop_gp0,pop_gp1,"AND gp0 gp1",push_gp0])
	elif bool_parse_tree.string == "or":
		return '\n'.join([pop_gp0,pop_gp1,"OR gp0 gp1",push_gp0])
	elif bool_parse_tree.string == "xor":
		return '\n'.join([pop_gp0,pop_gp1,"XOR gp0 gp1",push_gp0])
	else:
		print "ERROR: unexpected boolean operation: ",bool_parse_tree.string
		quit()

def generate_bool_unary_op(bool_parse_tree):
	pop_gp0 = snippets["Popgp0"].generate_code({})
	push_gp0 = snippets["Pushgp0"].generate_code({})
	if bool_parse_tree.string == "not":
		return ''.join([pop_gp0,"NOT gp0",push_gp0])

def generate_comparison(bool_parse_tree):
	if len(bool_parse_tree.children) == 1: #just an if true comparison
		pop_gp0 = snippets["Popgp0"].generate_code({})
		push_gp0 = snippets["Pushgp0"].generate_code({})
		return generate_expression_code(bool_parse_tree.children[0]) + snippets["is true"].generate_code({"getgp0":pop_gp0,"Push gp0":push_gp0})
	elif len(bool_parse_tree.children) == 3:
		pop_gp0 = snippets["Popgp0"].generate_code({})
		pop_gp1 = snippets["Popgp1"].generate_code({})
		push_gp0 = snippets["Pushgp0"].generate_code({})

		############################################################		
		# Needs to check what kind of comparison before generations#
		############################################################

import sys
snippets = process_snippets(sys.argv[1])
IF_COUNT = 0
LOOP_COUNT = 0