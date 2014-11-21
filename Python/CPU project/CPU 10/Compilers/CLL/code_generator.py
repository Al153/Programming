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


import sys
process_snippets(sys.argv[1])