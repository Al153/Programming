#imma pop some stacks, only got operands in my pocket
#shunt-shunt-shunting, this is freaking CompSci



#____________________ Words _____________________
#the only "true" in built words are the call and return words

#all word calls exist then as . . . word_address call

#the primitives if, while, else, endif and loop, return are also built in


#_____________________ memory access words _____________________
# value <name>      . . . a  ==> . . .          stores value into variable of name <name>
#<name>             . . .  ==> . . . a          Pushes value of name
#
#*<name>                                    address of variable <name>
#
#<address> Push                                 Pushes DWord at address (for indirect addressing) 
#<value> <address> Pop                          Pops to address
#
#<address> PushB                                Pushes Byte at address (for indirect addressing) 
#<value> <address> PopB                         Pops to address
#
#<address> PushW                                Pushes Word at address (for indirect addressing) 
#<value> <address> PopW                         Pops to address
#
#______________________ stack manipulation words ______________________
#- arithmetic-logic  operators
#   - binary operators: +-*/%&| etc
#   - unary operators: ~
#
#- stack operators
#   - DUP, SWAP, DROP
#   - . .s
#
#- comparison operators
#   - = < > etc
#
#
#______________________ flow control words _______________
#- if 
#- while 
#
#- (for?)
#
#- return
#
#
#______________________ words making use of assembly (assembly extension words) _______________
#
#- floating point, conversion
#- strings
#
#
#_______________ datatypes _______________
#int
#word
#char
#
#string
#Array
#CArray

import sys
#words built into forth
default_words = {
	"DUP":"Forth.dup",
	"SWAP":"Forth.swap",
	"DROP":"Forth.drop",
	".":"Forth.print",
	".S":"Forth.print_stack",
	"+":"Forth.ADD",
	"-":"Forth.SUB",
	"*":"Forth.MUL",
	"/":"Forth.DIV",
	"%":"Forth.MOD",
	"&":"Forth.AND",
	"|":"Forth.OR",
	"^":"Forth.XOR",
	"~":"Forth.NOT",
	"~&":"Forth.NAND",
	"~|":"Forth.NOR",
	"~^":"Forth.XNOR",
	"<<":"Forth.SHL",
	">>":"Forth.SHR",
	">":"Forth.Greater",
	"<":"Forth.Less",
	"=":"Forth.Equal",
	">=":"Forth.Greater_or_Equal",
	"<=":"Forth.Less_or_Equal",
	"=>?":"Forth.Greater_or_Equal",
	"=<":"Forth.Less_or_Equal",
	"!=":"Forth.Not_Equal",
}

#_____________________ special word definitions _____________________
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

#create an object which handles while loop constructs
class Loop_helper:
	def __init__(self):
		self.while_loop_counter = 0
		self.while_stack = []

	def deal_with_while(self):
		self.while_stack.append(self.while_loop_counter) # pushes return value
		assembly_lines = [
			"Pop gp0 %FORTH.while"+str(self.while_loop_counter),
			"if gp0 then {"
		]
		self.while_loop_counter += 1
		return assembly_lines

	def deal_with_loop(self):
		return_value = self.while_stack.pop()
		assembly_lines = [
			"Load PC FORTH.while"+str(return_value),
			"}"
		]
		return assembly_lines

deal_with_loops = Loop_helper()

special_words = {
	"if":deal_with_if,
	"else":deal_with_else,
	"endif":deal_with_end_if,
	"while":deal_with_loops.deal_with_while,
	"loop":deal_with_loops.deal_with_loop,
	"return":deal_with_return
}

defined_words = {}

def compile_forth():
	source = get_code()
	tokens = tokenize(source)
	words = get_words(tokens,'')
	variables,words = get_variables(words)
	
	assembly = base_compile(words["fib"],"fib")
	for line in assembly:
		print line

#   assembly = compile_words(words)
#   run_assembler(assembly)


def get_code():
	file_name = sys.argv[1]
	try:
		return open(file_name)
	except IOError:
		try:
			return open(file_name+".fth")
		except IOError:
			print "Error: Invalid file name, please try again"
			quit()

def tokenize(text_file):
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
	#print token_list
	return token_list






def get_words(tokens,name_space):
	"""
	Gathers words within program for execution
	"""
	defined_words = {"main":["return"]}
	current_word = []
	found_word = 0
	import_called = 0
	for token in tokens:
		if import_called:
			import_called = 0
			token = "..\\" + token+".fth"
			name = token
			#print token
			imported_program = open(token)
			defined_words.update(get_words(Tokenizer.tokenize(imported_program),name_space+token+"."))
			#print defined_words
			imported_program.close()

		elif found_word == "new word":
			found_word = "word body" #after this point the word will be body
			current_word_name = name_space+token

		elif found_word == "word body": #word body
			if token == ";":
				found_word = "no word"
				current_word.append("return")
				defined_words[current_word_name] = current_word
				current_word = []
			else:
				current_word.append(token)
		elif token == "import":
			import_called = 1
		elif token == ":":  #new word
			#print "found word: ",token
			found_word = "new word"

		else:
			defined_words["main"].insert(-1,token)
	return defined_words

def get_variables(words):
	#cuts out variable declaring tokens
	primitive_data_types = ["int","char","word","str"] #an identifier for these is 3 tokens long, eg int i 0
	primitive_array_data_types = ["Array","Byte_array"] #an identifier for these is 4 tokens long eg array list 5 [3,4,5,6,7]
	variables = {}
	for wordname in words:
		variables[wordname] = {} #creates variable space
		word = words[wordname]   #gets word tokens
		i = 0
		while i < len(word): #find variable identifying tokens and extract from text
			token = word[i]  #gets the token
			if token in primitive_data_types:
				variables[wordname][wordname + "." + word[i+1]] = word[i:i+3]
				word = word[:i]+word[i+3:]

			elif token in primitive_array_data_types:
				variables[wordname][wordname + "." + word[i+1]] = word[i:i+4]
				word = word[:i]+word[i+4:]
			i += 1 
		words[wordname] = word
	return variables, words





def base_compile(word,word_name):
	assembly = [] 
	for token in word:
		#check if int:
		try:
			int(token)
			token = "@"+token
		except ValueError:
			pass


		if token == "call":
			assembly.append("Pop gp0")
			assembly.append("Goto Programstack.call")

		elif token in special_words:
			assembly += special_words[token]()

		else:
			assembly.append("Push "+token)
		
	assembly[0] += " %"+word_name
	return assembly



compile_forth()