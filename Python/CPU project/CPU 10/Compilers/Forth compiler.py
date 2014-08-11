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
.  . . . a ==>  . . . 			 outputs integer value of a

=       . . . a b ==> . . . c       where c is result of (a == b)
<       . . . a b ==> . . . c       where c is result of (a < b)
>       . . . a b ==> . . . c       where c is result of (a > b)
<=      . . . a b ==> . . . c       where c is result of (a <= b)
>=      . . . a b ==> . . . c       where c is result of (a >= b)

index 	    . . . list index ==> . . . value of list [index*4]
			or
			. . . str index ==> . . . value of str [index]


return 								returns on the stack

_____________________ memory access words _____________________
 value <name>  	. . . a  ==> . . . 			stores value into variable of name <name>
<name> 			. . .  ==> . . . a			Pushes value of name

&<name>										variable pointed to by variable <name>
*<name>   									address of variable <name>

<address> Push 			      				Pushes DWord at address (for indirect addressing) 
<value> <address> Pop  						Pops to address

<address> PushB 			      				Pushes Byte at address (for indirect addressing) 
<value> <address> PopB  						Pops to address

<address> PushW 			      				Pushes Word at address (for indirect addressing) 
<value> <address> PopW  						Pops to address




_______________ datatypes _______________
int
word
char

string
Array
CArray
WArray







_______________ semi_compile_time_words _______________
<const>
<var name>

#words built into forth
default_words = {
	"DUP"
	"SWAP"
	"DROP"
	"."
	".S"
	"+":"Forth."
	"-":"Forth."
	"*":"Forth."
	"/":"Forth."
	"%":"Forth."
	"&":"Forth."
	"|":"Forth."
	"^":"Forth."
	"~":"Forth."
	"~&":"Forth."
	"~|":"Forth."
	"~^":"Forth."
	"<<":"Forth."
	">>":"Forth."
	">":"Forth."
	"<":"Forth."
	"=":"Forth."
	"<=":"Forth."
	">=":"Forth."
	"=<":"Forth."
	"=>":"Forth."
	"!=":"Forth."

	"f+":"FP."
	"f-":"FP."
	"f*":"FP."
	"f/":"FP."
	"fsin":"FP."
	"fcos":"FP."
	"fexp":"FP."
	"fsqrt":"FP."

	"c+":"Complex."
	"c-":"Complex."
	"c*":"Complex."
	"c/":"Complex."
	"csqrt":"Complex."
}

special_words = {
	"if":""
	"else":""
	"endif":""
	"while":""
	"loop":""
	"return":""
	
}




defined_words = {}

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
		elif token == ":":  #new word
			#print "found word: ",token
			found_word = 1
			current_word_name = name_space+token
		else:
			defined_words["main"].insert(-1,token)
	return defined_words

def compile_words(words):
	assembly = 'Load PC main\n'
	global_variables = []
	word_names =  [name for name in words]
	for name in words:
		assembly += compile_word(name,words[name],defined_words,default_words)
	return assembly





def compile_word(word_name,word,defined_words,default_words):
	assembly_lines = []
	for token in word:
		if token in special_words:
			assembly_lines.append(special_words[token](word))

		elif token in default_words:
			assembly_lines.append(["Call",default_words[token]])

		elif token in defined_words:
			assembly_lines.append(["Call",token])

		else:
			pass
	assembly_lines[0].append("%"+word_name)
	

