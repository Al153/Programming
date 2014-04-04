#imma pop some stacks, only got operands in my pocket
#shunt-shunt-shunting, this is freaking CompSci



import sys

#________________________ basic syntax ______________________
fib:

. . . n ==> . . . fib n

fib
	dup 1 = if
			drop 1 return
	else
		dup 0 = if
			drop 1 return
		endif
	endif 
	dup 1 - fib
	2 - fib n
	+ 
;




#____________________ commands _____________________

 		_________ run_time_words : _________

+         . . . a b ==> . . . a+b
-
*
/
%

&
|
^
~

drop 	. . . a ==> . . . 
swap    . . . a b ==> . . . b a
dup     . . . a ==> . . . a a

echo    . . . 'a' ==> . . .              outputs 'a'
print   . . . a ==>  . . . 			 outputs integer value of a

=       . . . a b ==> . . . c       where c is result of (a == b)
<       . . . a b ==> . . . c       where c is result of (a < b)
>       . . . a b ==> . . . c       where c is result of (a > b)
<=      . . . a b ==> . . . c       where c is result of (a <= b)
>=      . . . a b ==> . . . c       where c is result of (a >= b)

index 	    . . . list index ==> . . . value of list [index
insert 		. . . data list index ==> . . . inserts into array at correct place


return 								returns on the stack

_____________________ Compile_time_words _____________________


global 								creates a global variable/list etc
ptr <name> variable 				creates pointer variable to a variable
int <name> 	. . . a ==> . . .       Loads local int of name name with value a
char <name> . . . 'a' ==> . . . 	Loads local char of name name with value a&255
list <name> [ . . .] 				creates a list
str <name>  "blah blah blah"		creates a string


if      . . . a ==> . . .   		carries on if a is True, else go to corresponding else or end if
else 	. . .   ==> . . . 			if in a positive if, then goto corresponding endif 
endif   . . .   ==> . . . 			pass 

while 	. . . ==> . . . 			if top of stack, then crarry on, else go to corresponding loop		
loop    . . . ==> . . . 			go to corresponding while


_______________ semi_compile_time_words _______________
<const>
<var name>



def compile_header():
	assembly = '''
#_______________ HEADER _______________
Import Stack

ptr FORTH.greater_or_equal
ptr FORTH.less_or_equal
ptr FORTH.Equal
ptr FORTH.Greater
ptr FORTH.Less

ptr FORTH.push0
ptr FORTH.push1


Pop gp1	%FORTH.Equal
Pop gp0

Compare gp0 gp1
if Equal then Goto FORTH.push1
Goto FORTH.push0


Pop gp1	%FORTH.Greater
Pop gp0

Compare gp0 gp1
if Greater then Goto FORTH.push1
Goto FORTH.push0


Pop gp1	%FORTH.Less
Pop gp0

Compare gp0 gp1
if Less then Goto FORTH.push1
Goto FORTH.push0




Pop gp1	%FORTH.greater_or_equal
Pop gp0

Compare gp0 gp1
if Less then Goto FORTH.push0
Goto FORTH.push1




Pop gp1	%FORTH.less_or_equal
Pop gp0

Compare gp0 gp1
if Greater then Goto FORTH.push0
Goto FORTH.push1



Push One %FORTH.push1
Return

Push Zero %FORTH.push0
Return




#_______________ END HEADER _______________

'''

def compile_add():
	assembly = "Pop gp2\nPop gp1\nADD gp2 gp1\nPush gp2\n"
	return assembly
def compile_sub():
	assembly = "Pop gp2\nPop gp1\nSUB gp2 gp1\nPush gp2\n"
	return assembly
def compile_mul():
	assembly = "Pop gp2\nPop gp1\nMUL gp2 gp1\nPush gp2\n"
	return assembly
def compile_div():
	assembly = "Pop gp2\nPop gp1\nDIV gp2 gp1\nPush gp2\n"
	return assembly
def compile_mod():
	assembly = "Pop gp2\nPop gp1\nMOD gp2 gp1\nPush gp2\n"
	return assembly
def compile_and():
	assembly = "Pop gp2\nPop gp1\nAND gp2 gp1\nPush gp2\n"
	return assembly
def compile_or():
	assembly = "Pop gp2\nPop gp1\nOR gp2 gp1\nPush gp2\n"
	return assembly
def compile_xor():
	assembly = "Pop gp2\nPop gp1\nXOR gp2 gp1\nPush gp2\n"
def compile_not():
	assembly = "Pop gp0\nNOT gp0\nPush gp0\n"
	return assembly

def compile_drop():
	assembly = "Pop gp0\n"
	return assembly

def compile_swap():
	assembly = "Pop gp2\nPop gp1\nPush gp2\nPush gp1\n"
	return assembly

def compile_dup():
	assembly = "Pop gp0\nPush gp0\nPush gp0 \n"
	return assembly


def compile_echo():
	assembly = "Pop gp0\nOut gp0\n"
	return assembly

def compile_print():
	assembly = "Pop gp0\nOutd gp0\n"
	return assembly

def compile_equal():
	assembly = "Call FORTH.Equal\n"
	return assembly

def compile_greater():
	assembly = "Call FORTH.Greater\n"
	return assembly

def compile_less():
	assembly = "Call FORTH.Less\n"
	return assembly

def compile_greater_or_equal():
	assembly = "Call FORTH.greater_or_equal\n"
	return assembly

def compile_less_or_equal():
	assembly = "Call FORTH.less_or_equal\n"
	return assembly

def compile_index():
	assembly = "Pop gp1\nPop gp0\nADD gp0 gp1\nLoad gp0 0 [gp0]\nPush gp0\n"
	return assembly

def compile_insert():
	assembly = "Pop gp2\nPop gp1\nPop gp0\nADD gp1 gp2\nStore gp0 0 [gp1]\n"
	return assembly

def compile_return():
	assembly =  "Return\n"
	return assembly

def compile_const(constant):
	assembly = "Push @" + str(constant)+"\n"
	return assembly

def compile_variable_call(variable_name):
	assembly = "Push "+variable_name
	return assembly

def compile_branch(conditional_direction,default_direction):
	assembly = "Pop gp0\nMove PC Jump\nAdd Jump @24\nif gp0 then Load PC "+ conditional_direction +"\nLoad PC"  +  default_direction+"\n"
	return assembly

def compile_while(break_address):
	assembly ="Pop gp0\nCOmpare gp0 Zero\nif Equal then Load PC "+break_address+"\n"
	return assembly
	
def compile_loop(start_address):
	assembly = "Load PC" + start_address + "\n"
	return assembly






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





def compile_word(word,name,name_space,word_names,global_variables):
	local_variables = []
	assembly = ''
	if_stack = []
	i = 0
	while < len(word):
		if word[i] == "if":
			j = i








def compile_block(name,block,return1,return2,word_names,global_variables):


class Start:
	def __init__(self,suboutine_name,child):
		self.name = suboutine_name
		self.child = child

	def blockify(self):
		self.child.blockify
	def compile(self):
		return self.child.compile()


class Return:
	def __init__(self):
		pass
	def blockify(self):
		pass
	def compile(self):
		return "Return\n"

class Block:
	def __init__(self,name_space,subroutine_number,tokens,child):
		self.name_space = name_space
		self.subroutine_number = subroutine_number
		self.tokens = tokens
		self.child = child
	
	def blockify(self):
		new_tokens = []
		child_tokens = []
		hit_if =  0

		for token in self.tokens:
			if not hit_if:
				if token == "if":
					hit_if = 1
				else:
					new_tokens.append(token)
			else:
				child_tokens.append(token)



		if hit_if:

			if_counter = 1
			for token in child_tokens




	def compile(self):

	def expand(self):


class Branch:
	def __init__(self,name_space,subroutine_number,tokens,child0,child1):
		pass

	def blockify(self):

	def compile(self):
