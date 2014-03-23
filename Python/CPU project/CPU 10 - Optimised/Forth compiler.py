import sys



def compile():
	source = get_code()
	tokens = tokenise(source)
	words = get_words(tokens,'')
	assembly = compile_words(words)
	run_assembler(assembly)


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
    token_list = []
    string = 0
    escaped = 0
    for line in text_file:
        if not string:
            line_tokens= []
            current_token = ''
        for character in line:
            if not string:
                if character == '"' and current_token == '':
                    string = 1
                    token_list += line_tokens
                    line_tokens = []
                elif character == "#" and current_token == '':
                    break
                elif character != " " and character != "\t" and character != "\n":
                    current_token += character
                else:
                    if current_token != "":
                        line_tokens.append(current_token)
                        #print line_tokens
                        current_token = ""
            else:
                if not escaped:
                    if character == '"':
                        string = 0
                        token_list.append(current_token) 
                        current_token = ''
                    elif character == "\\":
                        escaped = 1
                    else:
                        current_token += character
                else:
                    escaped = 0
                    if character == '"':
                        current_token += '"'
                    if character == "n":
                        current_token += "\n"
        if not string:
            if current_token != "" and current_token != "\t":
                line_tokens.append(current_token)
            if line_tokens != []:
                token_list+=line_tokens
    #print token_list
    return token_list


def get_words(tokens,name_space):
	"""
	Gathers words within program for execution
	"""
	defined_words = {}
	current_word = []
	found_word = 0
	import_called = 0
	for token in tokens:
		if import_called:
			import_called = 0
			token = "..\\" + token+".pyfth"
			name = token
			#print token
			imported_program = open(token)
			defined_words.update(get_words(Tokenizer.tokenize(imported_program),name_space+token+"."))
			#print defined_words
			imported_program.close()
		elif found_word:
			if token == ";":
				found_word = 0
				current_word.append("return")
				defined_words[current_word_name] = current_word
				current_word = []
			else:
				current_word.append(token)
		elif token == "import":
			import_called = 1
		else:
			#print "found word: ",token
			found_word = 1
			current_word_name = name_space+token
	return defined_words

def compile_words(words):
	assembly = 'Goto @main\n'
	global_variables = []
	word_names =  [name for name in words]
	for name in words:
		assembly += compile_word(words[name],name,word_names,global_variables)
	return assembly

def compile_word(word,name,word_names,global_variables):



def compile_block(name,block,return1,return2,word_names,global_variables):


class block:
	def __init__(self,name,)