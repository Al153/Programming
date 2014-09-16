#imma pop some stacks, only got operands in my pocket
#shunt-shunt-shunting, this is freaking CompSci



#____________________ Words _____________________
#the only "true" in built words are the call and return words

#all word calls exist then as . . . word_address call

#the primitives if, while, else, endif and loop, return are also built in

#All other words are defined in assembly and imported via header and header lib files

#___________________________ compiler structure _____________________________

#Wrapper - finds file to compile


#Preparse layer - split code into Header parts and body part, imports .al and .hlib files, gets words

#variable handling layer (VHL) - indentifies variables, creates assembly words which allow for the pushing into variables and adds them to the header

#word exansion layer (WEL) - recognise word calls and converts them into AIL word calls (word_label call)

#Assembly Interface Layer (AIL) - converts body into a series of assembly function calls

#Header Final Layer (HFL) - fixes Header to be joined with body assembly

#optimization layer  - optimises by removing unnecessary stack calls.

#wrapper - combines header and body and writes assembly to a file, calls assembler

#____________________________ Header vs Body _______________________________

#Header contains:   The assembly word definitions - definition for each base word used in a program
#				 	Variable definitions
#					initialisation - calls the main function

#Body - consists purely of variable pushes, control flow, and word calls


#__________________________ Storing Headers ______________________________

#Headers are stored in .al files
#Meta data on headers is stored in .hlib files
#.hlib files are json files containing dictionaries:
#		- keys:
#				- "source" - list of header files to import
#				- "import" - list of more hlib files to import
#				- "words"  - dict to link keywords to words eg "+":Forth.ADD
#.hlib files are specifiec by "using example.hlib"



#____________________ word syntax _______________________________________
#all used words should be defined in the hlib files for a program or in the program itself
#just word_name will push the address of the word onto the stack and then call it
#just __word_name will push the address of the word onto the stack and will not call it (for meta programming)

#when calling words in the original forth, use . to separate name_spaces ie imported_file.function_name
#when calling variables, use : instead ie  imported_file:main:x


#____________________ variable names _____________________________________
# var means a variable
# *var means a pointer to a variable

# will add non int types later












#_______________ datatypes _______________
#int
#word
#char
#
#string
#Array
#CArray

import sys
import json
import copy



def Wrapper_layer():
	print "Getting file names...",
	source_file,destination_file,flags = get_file_names()
	print "DONE!\nGetting source...",
	source = get_code(source_file)
	print "DONE!\nTokenizing source...",
	tokens = tokenize(source)
	print "DONE!\nFinding declared words and importing hlib files...",
	body,header,word_dict = PPL_step(tokens)
	print "DONE!\nProcessing words...",

	body = WEL_step(body,word_dict)
	print "DONE!\nProcessing variables...",
	body,header = VHL_step(body,header,word_dict)
	print "DONE!\nCompiling body...",

	body_assembly = AIL_step(body)
	print "DONE!\nCompiling header...",
	header_assembly = HFL_step(header)
	print "DONE!\nCarrying out optimisations...",
	body_assembly = optimisation(body_assembly)
	print "DONE!\nWriting to file...",
	assembly = header_assembly + '\n'.join(body_assembly)
	store_to_file(assembly,destination_file)
	print "DONE!\nCompilation complete"


def get_file_names():
	'''
	works out where to get the source from and send the assembly
	'''
	tokens = sys.argv[1:]
	i = 0
	flags = []
	destination_file = 0
	state = "no_source" 
	while i < len(tokens):
		token = tokens[i]
		if token[0] == "-":
			flags.append(tokens)
		else:
			if state == "no_source":
				source_file = token
				state = "found_source"
			elif state == "found_source":
				destination_file = token
				state = "found_dest"
		i += 1

	if not destination_file:
		destination_file = "..\\..\\Compiled code\\"+source_file.split("\\")[-1][:-3]+"al" 
	return source_file,destination_file,flags

def get_code(file_name):
	'''
	gets code from file
	'''
	try:
		return open(file_name)
	except IOError:
		try:
			return open(file_name+".fth")
		except IOError:
			print "Error: Invalid file name, please try again"
			quit()

def tokenize(text_file):
	'''
	Monolithic tokenizer
	'''
	text_file = [line for line in text_file]
	token_list = []
	string = 0
	escaped = 0
	array = 0
	i = 0
	token_separators = [" ","\t","\n",",","(",")"]
	escaped_replace_dict = {"n":"\n",'"':'"',"\\":"\\"} #converts escaped n to \n etc
	while i < len(text_file):
		line = text_file[i]
		if not string and not array:
			line_tokens= []
			current_token = ''
		if line[:8] == "<Python>":
			text_file = text_file[:i]+ str(eval(line[8:])).split("\n")+text_file[i+1:]
			line = text_file[i]
		for character in line:
			if not string and not array:
				if character == '"' and current_token == '':
					current_token = '"'
					string = 1
				elif character == '[' and current_token == '':
					array = 1
					current_token = "["
				elif character == "#" and current_token == '':
					break
				elif not character in token_separators:
					current_token += character
				else:
					if current_token != "":
						line_tokens.append(current_token)
						current_token = ""
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
			elif array:
				if character == "]":
					array = 0
					line_tokens.append(current_token+"]") 
					current_token = ''
				else:
					current_token += character
		if not string and not array:
			if current_token != "" and current_token != "\t":
				line_tokens.append(current_token)
			
			token_list+=line_tokens
		i +=1

	for i in xrange(len(token_list)):
		if token_list[i][-1] == "F" or token_list[i][-1] == "f":
			try:
				float_value = float(token_list[i][:-1])

				token_list[i] = str(convert_float(float_value))

			except ValueError:
				pass
		elif len(token_list)> 1 and token_list[i][0] == "[" and token_list[i][-1] == "]":
			#if an array, need to check elements in array
			for element in token_list[i][1:-1].split(","):
				new_elements = []
				if element[-1] == "F" or element[-1] == "f":
					try:
						new_elements.append(str(convert_float(float(element[:-1]))))
					except ValueError:
						new_elements.append(element)
				else:
					new_elements.append(element)
			token_list[i] = "["+(", ".join(new_elements))+"]"
 

	return token_list


def PPL_step(tokens):
	'''
	Step which handles word extraction, header importing, and body/header separation
	'''
	#uses get_words, imports code from other files, deals with hlibs
	hlib_files = [] #starts with an empty list
	body,hlib_files = get_words(tokens,"main",hlib_files)
	word_lookup,header_files,hlib_names = parse_hlibs(hlib_files)
	header = generate_header(hlib_names,header_files)
	return body,header,word_lookup

def VHL_step(body,header,word_dict):
	'''
	step which identifies variable  declarations in the code and generates header assembly words for popping to that variable + accessing pointers 
	'''
	variable_dict,body = get_variables(body)  						#finds variables and cuts declarations out of main body
	variable_dict = create_variable_pointers(variable_dict)			#creates a pointer to each variable
	body = fix_variable_calls(body,variable_dict,word_dict) 			#adds full name path for variable calls
	header += parse_variable_dict(variable_dict) 					#converts variable dict into a string containing variable declarations
	
	return body,header

def WEL_step(body,word_dict):
	'''
	uses word dictionary from .hlibs to identify word calls and converts them to AIL calls (function_name call) 
	'''
	for name_space in body:
		for word_name in body[name_space]:
			word = body[name_space][word_name]				#body is a dict
			i = 0
			while i <len(word):
				token = word[i]

				if token[:2] == "__": 										#checks if it is a raw word ie, push word's address
					raw = True
					token = token[2:]
				else:
					raw = False


				if token in word_dict: 										#checks assembly words first
					if raw:
						word[i] = word_dict[token]
					else:
						word[i] = word_dict[token] 								#pushes word address and calls it
						word.insert(i+1,"call")
					
				else:
					if token in body[name_space]: 							#checks local name_space to see if it's a word
						if raw:
							word[i] = name_space+"."+token 					#splits word names by : instead of .
						else:
							word[i] = name_space+"."+token 							#pushes word address and calls it
							word.insert(i+1,"call")
					else:
						if "." in token:
							split_word = token.split(".") 					#checks global name_space
							if split_word[0] in body:
								if ':'.join(split_word[1:]) in body[split_word[0]]:
									if raw:
										word[i] = token
									else:
										word[i] = token 								#pushes word address and calls it
										word.insert(i+1,"call")

							else:
								print "Error: unrecognised word call: " + token
								quit()





	
	
				i += 1
			body[name_space][word_name] = word
	return body

def AIL_step(body):
	'''
	compiles words one at a time into assembly then returns them
	'''
	#body in the form of lists of words
	assembly = []
	for name_space in body:
		for word in body[name_space]:
			assembly += AIL_compile(body[name_space][word],name_space+ "."+word)
	return assembly

def HFL_step(header):
	'''
	finalises header assembly
	'''
	return header

def optimisation(assembly):
	'''
	optimises the assembly code generated - such as removing unnecessary pushes and pulls
	'''
	i = 0
	while i <len(assembly):
		if assembly[i][:4] == "Push" and assembly[i+1] == "Pop gp0":
			assembly[i] = "Load gp0"+ assembly[i][4:]
			assembly = assembly[:i+1] + assembly[i+2:]
		i += 1
	return assembly

def store_to_file(assembly,file_name):
	'stores assembly code to a file'
	if file_name[-4:] == ".fth":
		file_name = file_name[:-4] + ".al"
	open(file_name,'w').write(assembly)


def get_hlibs(tokens):
	'''
	finds header use declarations and returns a list of .hlib files to use
	'''
	i = 0
	hlib_files = []
	while i < len(tokens):
		if tokens[i] == "using":
			hlib_files.append(tokens[i+1])
			del tokens[i:i+2]
			i -= 1  						#compensates for removal of two lines

		i += 1
	return tokens,hlib_files

def parse_hlibs(hlib_list):
	'''
	parses hlib files to import more,get the .al header files and create a word lookup table
	'''
	to_import = hlib_list 								
	imported = []
	source_files = set([])
	word_dict = {}
	for hlib_file in to_import:
		if not hlib_file in imported:								#checks the hlib file has not been imported yet
			try:
				hlib_dict = json.loads(open("Headers\\"+hlib_file).read())   	#extracts the dictionary from the file
				imported.append(hlib_file) 						  	#appends file name to a list of imported hlibs, so the same file isnt imported again
				source_files |=  set(hlib_dict.get("source",[])) 	#extracts a list of the names of source files and appends to main list, removing duplicates using sets
				word_dict.update(hlib_dict.get("words",{}))			#extracts the word lookup table and appends it to the main one
			except IOError:
				print "ERROR: Unknown hlib file imported:", hlib_file 	#creates an error message
				quit()
	return word_dict,list(source_files),imported

def generate_header(imported_hlib_files,source_files):
	'''
	generates header text based on the source files needed. Also adds a list detailing the imported hlib files
	'''
	hlib_text = '#<FORTH COMPILER: Using these .hlib files:\n\t\t#' +  '\n\t\t#'.join(imported_hlib_files)
	#print hlib_text
	source_text = "#<FORTH COMPILER: These files are imported by the .hlib files: \n\t\t"
	for source_file in source_files:
		try:
			test = open("Headers\\"+source_file)
			source_text += "import Compilers\\Forth\\Headers\\"+ source_file +"\t\t\n"
		except IOError:
			print "ERROR: Unknown source file: "+source_file
			quit()
	header = "Call main.main\n Halt\n\n" + hlib_text + "\n\n\n\n"+source_text + "\n\n\n\n"
	return header

def get_words(tokens,name_space,hlib_list):
	"""
	Gathers words within program for execution
	"""
	defined_words = {
	'main':{
		"main":["return"]
		},
	
	}
	if name_space != 'main':
		defined_words[name_space] = {}
	current_word = []
	found_word = 0
	import_called = 0
	tokens, new_hlib_list = get_hlibs(tokens)
	hlib_list += new_hlib_list
	for token in tokens:
		if import_called:
			import_called = 0
			token = "Compilers\\Forth\\" + token+".fth"
			#print token
			try:	
				imported_program = open(token)
				imported_tokens = tokenize(imported_program)
				new_words_dict,hlib_list = get_words(imported_tokens,token,hlib_list)  #name space of imported words is that of the imported file's name
			
			#print defined_words
				imported_program.close()
			except IOError:
				print "ERROR: Could not find file: "+name
				quit()

		elif found_word == "new word":
			found_word = "word body" #after this point the word will be body
			current_word_name = token

		elif found_word == "word body": #word body
			if token == ";":
				found_word = "no word"
				current_word.append("return")
				defined_words[name_space][current_word_name] = current_word
				current_word = []
			else:
				current_word.append(token)
		elif token == "import":
			import_called = 1
		elif token == ":":  #new word
			#print "found word: ",token
			found_word = "new word"

		else:
			defined_words['main']["main"].insert(-1,token)
	return defined_words,hlib_list



def get_variables(words):
	#cuts out variable declaring tokens
	primitive_data_types = ["int","char","word","str"] #an identifier for these is 3 tokens long, eg int i 0
	primitive_array_data_types = ["array","byteArray"] #an identifier for these is 4 tokens long eg array list 5 [3,4,5,6,7]
	variables = { 				#variables stored as name:[type,(size),value]
		"global":{
			"global":{}
		}				#sets up global variables
	}
	for name_space in words:
		variables[name_space] = {}
		for word_name in words[name_space]:
			variables[name_space][word_name] = {} #creates variable space
			word = words[name_space][word_name]   #gets word tokens
			generated_string_count = 0 #number of strings in text without declaration (for thngs like ' "hello" ECHO' )
			i = 0
			while i < len(word): #find variable identifying tokens and extract from text
				token = word[i]  #gets the token
				if token in primitive_data_types: 											#simple data types
					variables[name_space][word_name][word[i+1]] = [word[i],word[i+2]] 		#in forth word[i:i+3] = [int, name, size]
					word = word[:i]+word[i+3:] 												#cuts out declaration
					i -= 1

				elif token in primitive_array_data_types:									#creates variable declaration
					variables[name_space][word_name][word[i+1]] = [word[i], word[i+2], word[i+3]] 		
					word = word[:i]+word[i+4:]
					i -= 1

				elif token == "global":														#same for globals
					if word[i+1] in primitive_data_types:						
						variables["global"]["global"][word[i+2]] = [word[i+1], word[i+3]]
						word = word[:i]+word[i+4:]
						i -= 1
					elif word[i+1] in primitive_array_data_types:
						variables["global"]["global"][word[i+2]] = [word[i+1],word[i+3],word[i+4]]
						word = word[:i]+word[i+5:]
						i -= 1
				elif token[0] == '"' and token[-1] == '"' and word[i-2] != "str": 			#if an undeclared string is used
					variables[name_space][word_name]["gen_string"+str(generated_string_count)] = ["str",word[i]]	#string declared
					word[i] = "gen_string"+str(generated_string_count) 												#string use replaced with a reference
					generated_string_count += 1 																	#increment count of generated strings

				i += 1 
			words[name_space][word_name] = word
	return variables, words

def create_variable_pointers(variable_dict):
	'''
	for each variable, this creates a pointer to it within the same name_space
	so the pointer to global.global.var is global.global.*var
	'''
	new_variable_dict = copy.deepcopy(variable_dict) 														#copies existing variables
	for name_space in variable_dict:																		#traversing dict
		for word_name in variable_dict[name_space]:
			for variable_name in variable_dict[name_space][word_name]:
				full_variable_name = name_space + ":" + word_name + ":" + variable_name 					#generates a variable name in the normal fashion (paths separated by :)
				new_variable_dict[name_space][word_name]["*"+variable_name] = ["int",full_variable_name]	#creates entry for new token

	return new_variable_dict

def fix_variable_calls(body,variable_dict,word_dict):
	'''
	uses the variable dict and word structure to convert all local variable calls to  global ones with the correct name_space and word etc, so  variable x in main.word1 becomes main.word1.x
	'''
	for name_space in body:
		for word_name in body[name_space]:
			word = body[name_space][word_name]
			i = 0
			while i < len(word):
				token = word[i]

				try:  #check if pushing an integer literal
					int(token)
					word[i] = "@" + token

				except ValueError:
					if "." not in token: 						#checks it's not a word call
						if token in variable_dict[name_space][word_name]:  #checks if a local variable
							word[i] = name_space + ":" + word_name + ":" + token #puts in full path of variable

						elif token in variable_dict["global"]["global"]: 	#checks if a global variable
							word[i] = "global:global:"+token

						elif ":" in token:
							variable_path_list = token.split(":") 				#splits name into path, ie main.main.x ==> main,   main,   x

							if len(variable_path_list) == 2: 					#in same name space but different word
								#long if statement checking that the variable exists
								if variable_path_list[0] in variable_dict[name_space] and variable_path_list[-1] in variable_dict[name_space][variable_path_list[0]]: #checks variable exists
									word[i] = name_space+":"+token  			#adds namespace to path
								else:
									print "ERROR: Undeclared variable: "+ token
									quit()
	
							elif len(variable_path_list) == 3: 					#variable anywhere
								#super long if statement (having lazy evaluation helps this a lot) checking variable exists
								if variable_path_list[0] in variable_dict and variable_path_list[1] in variable_dict[variable_path_list[0]] and variable_path_list[2] in variable_dict[variable_path_list[0]][variable_path_list[1]]:
									word[i] = token
									
								else:
									print "ERROR: Undeclared variable: "+ token
									quit()
							else:
								print "ERROR: Badly declared variable (should have path length of 2 or 3): "+token
								quit()
						else:
							if token not in key_words and token not in word_dict.values():
								print word_name, word
								print "ERROR: Undefined token: "+ token
								quit()



				i += 1

			body[name_space][word_name] = word 


	return body

def parse_variable_dict(variable_dict):
	'''
	traverses variable dict creating variable declarations for the header
	'''
	variable_declaration_string = '#<FORTH COMPILER the following are declarations for all variables used in the forth program\n'
	for name_space in variable_dict: 																					#traverses tree structure
		for word_name in variable_dict[name_space]:
			for variable in variable_dict[name_space][word_name]:
				full_variable_name = name_space + ":" + word_name + ":" + variable 										#constructs full name of variable
				variable_type = variable_dict[name_space][word_name][variable][0] 										#type is first part in list
				variable_data = " ".join(variable_dict[name_space][word_name][variable][1:])							#extracts rest of information: value, size etc
				variable_declaration_string += "\t\t\t"+ variable_type + " "+ full_variable_name + " " + variable_data + "\n"		#builds declaration string

	variable_declaration_string += "#<FORTH COMPILER: end of variable declarations\n\n\n"
	return variable_declaration_string

def AIL_compile(word,word_name):
#	print word
	assembly = ["#<FORTH COMPILER: Assembly generated for word: " + word_name] 	#adds comments to improve readability of assembly produced 
	for token in word:
		if token in key_words:													#compiles key words (call,return,if,else,endif,while,loop)
			assembly += key_words[token]()					

		else:
			assembly.append("Push "+token) 										#otherwise token is something to be pushed (var or function pointer)
		
	assembly[1] += " %"+word_name 												#adds label
	assembly.append("\n\n\n\n") 												#new lines for readability
	return assembly

#_____________________ key word definitions for AIL_compile _____________________
def deal_with_if():
	assembly_lines = [
	"Pop gp0",
	"if gp0 then {"
					]
	return assembly_lines

def deal_with_else():
	assembly_lines = [
	"}",
	"else {"
	]
	return assembly_lines

def deal_with_end_if():
	return ["}"]

def deal_with_return():
	return ["Return"]

def deal_with_call():
	return ["Pop gp0","Goto Programstack.call"]

#create an object which handles while loop constructs, since it needs to keep track of loop calls
class Loop_helper:
	def __init__(self):
		self.while_loop_counter = 0 #because loops require jumping to specific points, this produces labels and the jumps needed
		self.while_stack = []

	def deal_with_while(self):
		self.while_stack.append(self.while_loop_counter) # pushes return value
		assembly_lines = [
			"Pop gp0 %FORTH.while"+str(self.while_loop_counter),
			"if gp0 then {"
		]
		self.while_loop_counter += 1                    #increments to make sure a new label is produced each time
		return assembly_lines

	def deal_with_loop(self):
		return_value = self.while_stack.pop() 		#gets corresponding return value
		assembly_lines = [
			"Load PC FORTH.while"+str(return_value),
			"}"
		]
		return assembly_lines

def convert_float(number): #to convert floats to 32bit numbers
	if number == 0:
		return 0

	if  number<0:

		sign = 1
	else:
		sign = 0

	number = abs(number)
	exponent = 128
	while number>=2:
		exponent += 1
		number /= 2.0
		if exponent >= 256:
			number = 1.9999998807907104
		 	exponent = 255
		 	break


	while number<1:

		exponent -= 1
		number *= 2.0
		if exponent < 0:
			number = 1
			exponent = 0
			break

	number *= 2**23
	number = int(number)
	mantissa = number
	return ((sign&1)<<31)+((mantissa & (2**23   -1)) <<8) + exponent


deal_with_loops = Loop_helper()  					#instantiates objects

key_words = {										#creates switching table
	"call": deal_with_call,
	"if":deal_with_if,
	"else":deal_with_else,
	"endif":deal_with_end_if,
	"while":deal_with_loops.deal_with_while,
	"loop":deal_with_loops.deal_with_loop,
	"return":deal_with_return
}



Wrapper_layer()