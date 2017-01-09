#OriginaL Assembler for My CPU emulator - not a very good example of code! (written in about 2014)
# a far less bloated assembler exists in the disks directory. It is written in AlForth

import os
import sys
import json
opcodes = {
		"Halt":0,
		"Pass":1,
		"Move":2,
		"Load":3,
		"Store":4,
		"CompareReg":5,
		"CompareAddr":6,
		"OutReg":7,
		"OutAddr":8,
		"OutdReg":9,
		"OutdAddr":10,
		"LoadByte":11,
		"StoreByte":12,
		"LoadWord":13,
		"StoreWord":14,


		"ADDReg":16,
		"SUBReg":17,
		"MULReg":18,
		"DIVReg":19,
		"MODReg":20,
		"ANDReg":21,
		"ORReg":22,
		"XORReg":23,
		"NOTReg":24,
		"NANDReg":25,
		"NORReg":26,
		"XNORReg":27,
		"SHLReg":28,
		"SHRReg":29,
		"ADDcReg":30,
		"SUBbReg":31,

		"ADDAddr":32,
		"SUBAddr":33,
		"MULAddr":34,
		"DIVAddr":35,
		"MODAddr":36,
		"ANDAddr":37,
		"ORAddr":38,
		"XORAddr":39,
		"NOTAddr":40,
		"NANDAddr":41,
		"NORAddr":42,
		"XNORAddr":43,
		"SHLAddr":44,
		"SHRAddr":45,
		"ADDcAddr":46,
		"SUBbAddr":47,
		"InReg":48,
		"InAddr":49,
		"HDScanReg":50,
		"HDScanAddr":51,
		"HDRead":52,
		"HDWrite":53
		}

opcodes_to_count = [
		"Halt",
		"Pass",
		"Move",
		"Load",
		"Store",
		"Compare",
		"ADD",
		"SUB",
		"MUL",
		"DIV",
		"MOD",
		"AND",
		"OR",
		"XOR",
		"NOT",
		"NAND",
		"NOR",
		"XNOR",
		"SHL",
		"SHR",
		"ADDc",
		"SUBb",
		"CondR",
		"CondF",
		"Out",
		"Outd",
		"LoadByte",
		"StoreByte",
		"LoadWord",
		"StoreWord",
		"In",
		"HDScan",
		"HDRead",
		"HDWrite"
]

register_addresses = {
		"Zero":0,
		"One":1,
		"Accumulator":2,
		"Jump":3,
		"PC":4,
		"Flags_set":5,
		"Flags_reset":6,
		"Stack_pointer":7,
		"gp0":8,
		"gp1":9,
		"gp2":10,
		"gp3":11,
		"gp4":12,
		"gp5":13,
		"gp6":14,
		"gp7":15
		}

conditional_addresses = {
		"0":0,
		"1":1,
		"2":2,
		"3":3,
		"4":4,
		"5":5,
		"6":6,
		"7":7,
		"8":8,
		"9":9,
		"10":10,
		"11":11,
		"12":12,
		"13":13,
		"14":14,
		"15":15,
		"16":16,
		"17":17,
		"18":18,
		"19":19,
		"20":20,
		"21":21,
		"22":22,
		"EOF":23,
		"Equal":24,
		"Greater":25,
		"Less":26,
		"Carry":27,
		"Borrow":28,
		"DivByZero":29,
		"StackOverflow":30,
		"StackUnderflow":31
		}





def assemble():
	flags = []
	for token in sys.argv:
		if token[0] == '-':
			flags.append(token)
	print "Getting code = ",
	file_object = get_code() #get the text of the file
	print "Okay"
	print "Extracting tokens = ",
	tokens = full_text_tokenize(file_object) #+ [["int","16","16"]]
	print "Okay"
	print "Unwinding program flow = ",
	tokens,code_block_count = unwind_control_flow(tokens,0)
	print "Okay"
	if "-p" in flags:
		log(tokens,"log\preparse.log")
	print "Extracting defined terms = ",
	tokens,string_counter = expand_macros(tokens,0)              #expand pseudo commands such as "Goto ... " or "if ... then ... " or "def ... ... "
	print "Okay"
	print "Importing external code = ",
	while things_to_import(tokens):
		tokens,code_block_count,string_counter = do_import(tokens,code_block_count,string_counter)
	print "Okay"
	print "Finding and replacing structs = ",
	tokens = find_structs(tokens)
	print "Okay"
	print "Allocating variables = ",
	number_of_lines,tokens = count_lines(tokens)        #counts the number of valid lines for sorting out variables
	if "-d" in flags:
		log(tokens,"log\Assembler.log")
	tokens = sort_out_variables(tokens,number_of_lines)         #creates variable storage and places pointers
	print "Okay"
	print "Compiling to low-level assembly = ",
	if "-l" in flags:
		log(tokens,"log\low_level.log")
	tokens = fill_in_gaps(tokens, "-comp" in flags)                 #final checks of compiling to low-level-assembly

	print "Okay"
	print "Assembling machine code = ",
	machine_code = prune_machine_code(low_level_assemble(tokens))   #need to modify low level assemble function to take a non string entry
	print "Okay"
	print "Writing to machine code file = ",
	file_name = store(machine_code)
	print "Okay"
	print "Creating C machine language file = ",
	os.system('python convert.py "' + file_name + '"')
	print "Okay"
	print "\n\nAssembly complete"

def get_code():
	file_name = sys.argv[1]
	print file_name
	try:
		return open(file_name)
	except IOError:
		try:
			return open(file_name+".al")
		except IOError:
			print "Error: Invalid file name, please try again"
			quit()

def full_text_tokenize(text_file):
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
			if line_tokens != []:
				token_list.append(line_tokens)
		i +=1
	#print token_list
	return token_list

def expand_macros(tokens,string_counter):

	using_stack = 0
	using_strings = 0
	#string_counter = 0


	i = 0
	while i < len(tokens):
		line = tokens[i]
		#print line
		if line [0] == "Subroutine":
			try:
				subroutine_name = line[1] #adds a % to convert to pointer format
				parameters = line [2:]

			except IndexError:
				print "ERROR Un-named Subroutine: ",line
				quit()

			lines_to_add = []   #empty list of lines of code to add
			for variable in parameters:
				lines_to_add.append(["Pop",variable])
			if lines_to_add == []:
				lines_to_add = [["Pass"]]
			lines_to_add.reverse()
			lines_to_add[0].append("%" + subroutine_name)
			lines_to_add.insert(0,["Scope",subroutine_name])


			tokens = tokens[:i]+ lines_to_add + tokens[i+1:]
			#line = tokens[i]
			i -= 1
		i += 1

	replace_dict,tokens = find_and_replace(tokens)
	i = 0
	scope = ''
	while i < len(tokens):  
		if tokens[i][0] == "Scope":
			scope = tokens[i][1]
			del tokens[i]

		line = tokens[i]
		for j in xrange(len(line)):
			line[j] = replace_dict[scope].get(line[j],line[j])



		if line[0] == "if":
			if line[1] in conditional_addresses:
				tokens[i] = ["CondF",line[1]]+line[3:] #line[2] = "then"
			else:
				tokens[i] = ["CondR",line[1]]+line[3:]
		
		line = tokens[i]
		if line[0] == "Goto":                     #non conditional goto regs
			label = []
			if line[-1][0] == "%":
				label = [line[-1]]
				line = line[:-1]
			if line[1] in register_addresses:

				tokens[i] =  ["Move","PC","Jump"] + label

				tokens.insert(i+1,["ADD","Jump","@16"])
				tokens.insert(i+2,["Move",line[1],"PC"])
			else: #"Goto @label []"
				tokens[i] = ["Move","PC","Jump"] + label
				tokens.insert(i+1,["ADD","Jump","@16"])
				tokens.insert(i+2,["Load","PC"]+line[1:])



		if len(line)>2 and line[2] == "Goto":
			label = []
			if line[-1][0] == "%":
				label = [line[-1]]  
				line = line[:-1]            
			if line[3] in register_addresses:
				tokens[i] =  ["Move","PC","Jump"]+label
				tokens.insert(i+1,["ADD","Jump","@16"])
				tokens.insert(i+2,line[:2]+["Move",line[3],"PC"])
			else: #"Goto @label []"
				tokens[i] = ["Move","PC","Jump"]+label
				tokens.insert(i+1,["ADD","Jump","@16"])             
				tokens.insert(i+2,line[:2]+["Load","PC"]+line[3:])

		if line[0] == "Push":
			using_stack = 1

			if line[1] in register_addresses:
				tokens[i] = ["Move",line[1], "gp0"] + line[2:]
				tokens.insert(i+1,["Goto","Datastack.push"])
			else:
				tokens[i] = ["Load", "gp0"]+line[1:]
				tokens.insert(i+1,["Goto","Datastack.push"])
			i -= 1

		if len(line)>2 and  line[2] == "Push":
			using_stack = 1

			if line[3] in register_addresses:
				tokens[i] = ["Move",line[3], "gp0"] + line[4:]
				tokens.insert(i+1,line[:2] +["Goto","Datastack.push"])
			else:
				tokens[i] = ["Load", "gp0"]+line[3:]
				tokens.insert(i+1,[line[:2]]["Goto","Datastack.push"])
			i -= 1



		if line[0] == "Pop":
			using_stack = 1

			if line[1] in register_addresses:
				tokens[i] = ["Goto","Datastack.pop"] + line[2:]
				tokens.insert(i+1,["Move", "gp0",line[1]])
			else:
				if line[-1][0] == "[" and line[-1][-1] == "]":
					tokens[i] = ["Goto","Datastack.pop"] + line[2:-1]
					tokens.insert(i+1,["Store","gp0",line[1],line[-1]])
				elif line[-2][0] == "[" and line[-2][-1] == "]":
					tokens[i] = ["Goto","Datastack.pop"] + line[2:-2]+[line[-1]]
					tokens.insert(i+1,["Store","gp0",line[1],line[-2]])
				else:
					tokens[i] = ["Goto","Datastack.pop"] + line[2:]
					tokens.insert(i+1,["Store","gp0",line[1]])
			i -=1

		if len(line)>2 and line[2] == "Pop":
			using_stack = 1

			if line[3] in register_addresses:
				tokens[i] = ["Goto","Datastack.pop"] + line[4:]
				tokens.insert(i+1,line[:2]+["Move", "gp0",line[3]])
			else:
				if line[-1][0] == "[" and line[-1][-1] == "]":
					tokens[i] = ["Goto","Datastack.pop"] + line[4:-1]
					tokens.insert(i+1,line[2:]+["Store","gp0",line[3],line[-1]])
				elif line[-2][0] == "[" and line[-2][-1] == "]":
					tokens[i] = ["Goto","Datastack.pop"] + line[4:-2] + [line[-1]]
					tokens.insert(i+1,line[2:]+["Store","gp0",line[3],line[-2]])
				else:
					tokens[i] = ["Goto","Datastack.pop"] + line[4:]
					tokens.insert(i+1,line[2:]+["Store","gp0",line[3]])
			i -=1

		if line[0] == "Call":
			using_stack = 1

			if line[-1][0] == "%":         #checks for pointer
				label = [line[-1]]
				line = line[:-1]
			else:
				label = []

			if len(line)>2:
				#parameters needed
				parameters = line[2:]
				parameters = map((lambda parameter: ["Push",parameter]),parameters)  #converts parameters to a list of commands
				#print parameters
				#print line[:2]
				parameters += [line[:2]  + label] #adds the call command
				#print parameters
				tokens = tokens[:i] + parameters + tokens[i+1:]
				line = tokens[i]
				i -=1



			else:
				tokens[i] = ["Load","gp0"] + [line[1]] + label
				tokens.insert(i+1,["Goto","Programstack.call"])
				i -=1
 
		if len(line)>2 and line[2] == "Call":
			using_stack = 1

			if line[-1][0] == "%":         #checks for pointer
				label = [line[-1]]
				line = line[:-1]
			else:
				label = []

			if len(line)>4:
				#parameters needed
				parameters = line[4:]
				map((lambda parameter: ["Push",parameter]),parameters)  #converts parameters to a list of commands
				parameters += [line[:4]  + label] #adds the call command
				tokens = tokens[:i] + parameters + tokens[i+1:]
				line = tokens[i]
				i -=1

			else:
				tokens[i] = ["Load","gp0"]+ [line[3]] + label
				tokens.insert(i+1,line[:2]+["Goto","Programstack.call"])
				i -=1

		if line[0] == "Return":
			using_stack = 1
#           label = []
#           if line[-1][0] == "%":
#               label = [line[-1]]  
#               line = line[:-1]
			if line[-1][0] == "%":         #checks for pointer
				label = [line[-1]]
				line = line[:-1]
			else:
				label = []

			if len(line)>1:
				#parameters needed
				parameters = line[1:]
				parameters = map((lambda parameter: ["Push",parameter]),parameters)  #converts parameters to a list of commands
				#print parameters
				#print line[:2]

				parameters.append(["Load","PC", "Programstack.return"]) #adds the return command
				parameters[0] += label
				#print parameters
				tokens = tokens[:i] + parameters + tokens[i+1:]
				line = tokens[i]
				i -=1

			else:
				tokens[i] = ["Load","PC", "Programstack.return"] + label
				i -=1

		if len(line)>2 and line[2] == "Return":
			using_stack = 1
#           label = []
#           if line[-1][0] == "%":
#               label = [line[-1]]
#               line = line[:-1]
			if line[-1][0] == "%":         #checks for pointer
				label = [line[-1]]
				line = line[:-1]
			else:
				label = []

			if len(line)>3:
				#parameters needed
				parameters = line[3:]
				parameters = map((lambda parameter: ["Push",parameter]),parameters)  #converts parameters to a list of commands
				#print parameters
				#print line[:2]
				parameters += ["Load","PC", "Programstack.return"] + label #adds the return command
				#print parameters
				tokens = tokens[:i] + parameters + tokens[i+1:]
				line = tokens[i]
				i -=1

			else:
				tokens[i] = line[:2] + ["Load","PC", "Programstack.return"] + label
				i -=1

		if line[0] == "str":
			using_strings = 1

			name = line[1]
			string = line[2]

			start_of_string = "$str"+ (str(string_counter) if len(string)>0 else "0")
			tokens[i] = ["int",name,start_of_string]
			for j in xrange(len(string)):
				if j == len(string)-1:
					tokens.append(["String", "str"+str(string_counter) , "'"+string[j]+"'", "0" ])
				else:
					tokens.append(["String", "str"+str(string_counter) , "'"+string[j]+"'", "$str"+str(string_counter+1) ])
				string_counter += 1

		for j in xrange(len(tokens[i])): 																							#check for char literals
			if len(tokens[i][j]) == 3 and tokens[i][j][0] == "'" and tokens[i][j][2] == "'":										#if direct value 'X'
				tokens[i][j] = str(ord(tokens[i][j][1]))
			if len(tokens[i][j]) == 4 and tokens[i][j][0] == "@" and tokens[i][j][1] == "'" and tokens[i][j][3] == "'":				#if non direct value @'X' create a variable with value ord(chr)
				tokens[i][j] = "@" + str(ord(tokens[i][j][2]))

		i += 1

	const_lines = []
	i = 0
	#while i<len(tokens):
		#j = 0
		#while j <len(tokens[i]):
			#if tokens[i][j][0] == "@" and not (tokens[i][j][1:] in const_lines):
				#try:
					#int(tokens[i][j][1:])
					#const_lines.append(tokens[i][j][1:])
					#tokens.append(["int", tokens[i][j][1:], tokens[i][j][1:] ])
					##print tokens[-1]
				#except:
					#print "Invalid Constant: ", tokens[i][j]
			#j += 1
		#i += 1

	i = 0
	while i<len(tokens):
		if tokens[i] == ["Move","gp0","gp0"]:
			del tokens[i]
			i -= 1
		i += 1

	if using_stack and tokens[0] != ["import","lib\Stack"]:
		tokens.insert(0,["import","lib\Stack"])
	if using_strings and tokens[0] != ["import","lib\Strings"]:
		tokens.insert(0,["import","lib\Strings"])

	return tokens,string_counter



def find_and_replace(tokens):
	replace_dict = {'':{}}
	lines_to_remove = []
	i = 0
	scope = ''
	while i < len(tokens):
		try:
			line = tokens[i]
			if line[0] == "Scope":
				scope = line[1]
				if not scope in replace_dict:
					replace_dict[scope] = {}
			if line[0] == "def":                    #defining a term
				lines_to_remove.append(i)
				replace_dict[scope][line[1]] = line[2]
				replace_dict[scope]["["+line[1]+"]"] = "["+line[2]+"]"
		except IndexError:
			print "ERROR. Line too short: ", line
			quit()

		i += 1

	lines_to_remove.reverse()
	for i in lines_to_remove:
		del tokens[i]
	
	return replace_dict,tokens

def things_to_import(tokens): #checks where there is anything to import
	for line in tokens:
		if line[0] == "import":
			return True
	return False

imported_files = []

def do_import(tokens,code_block_count,string_counter): #carries out one import
	i = 0
	while i <len(tokens):

		if tokens[i][0] == "import" and not tokens[i][1] in imported_files:
			print "importing",
			import_name = tokens[i][1]
			imported_files.append(import_name)
			if import_name[-3:]!= ".al":
				import_name += ".al"
			print import_name
			try:
				new_tokens= full_text_tokenize(open(import_name))
			except IOError:
				print "Invalid import name: ", import_name
				quit()
			new_tokens,code_block_count = unwind_control_flow(new_tokens,code_block_count)
			new_tokens,string_counter = expand_macros(new_tokens,string_counter)

			return tokens[:i] + tokens[i+1:] + new_tokens,code_block_count,string_counter
		elif tokens[i][0] == "import"  and tokens[i][1] in imported_files:
			del tokens[i]
		i += 1
	return tokens, code_block_count,string_counter

def unwind_control_flow(tokens,code_block_count):
	#unwinds if statements and bracketed off code eg {}
	i = 0
	#codeblock count starts at 0, but to account for imports, it is set by the parent function
	tokens.append(["Halt"])
	debug_state = 'not_found'
	while i < len(tokens):


		if "{" in tokens[i]: 														#if there is a section of code to snip out and unwind:
			bracket_location =tokens[i].index("{")  								#find location of bracket in line
			tokens[i] = tokens[i][:bracket_location] + ["Load","PC","Code_block"+str(code_block_count)] + tokens[i][bracket_location+1:]  #creates first jump
			cut_code,end_pointer = matching_bracket_search(tokens,i)				#find the line of the matching bracket, and the code cut out
			cut_code[0].append("%Code_block"+str(code_block_count)) 				#add the correct label to the cut out code
			code_block_count +=1                                   					#increment the code block count
			cut_code.append(["Load", "PC", "Code_block"+str(code_block_count)]) 	#add the return command
			tokens.insert(end_pointer,["Pass","%Code_block"+str(code_block_count)]) #add a label to the code which stays in place
			code_block_count += 1                                                   #increment code block count
			del tokens[i+1:end_pointer]                                             #remove intermediate code (duplicated code)
			tokens += cut_code                                                      #add cut out code to the end of the tokens

			if tokens[i+2][0] == "else":                                            #checks for an else statement
				cut_code,end_pointer = matching_bracket_search(tokens,i+2)          #finds new matching } and new cut code
				label_to_move = tokens[i+1][-1]                                     #we want to send the end of the true bit (eg if a then {a b c}) to a point after the else jump

				tokens[i+1] = ["Load", "PC", "Code_block" + str(code_block_count)]  #insert else jump
				cut_code.append(["Load","PC",label_to_move[1:]])                    #tell the end of the else bit to the same label as the end of the true bit (endif)
				cut_code[0].append("%Code_block"+str(code_block_count))             #add a label to the start of the else code
				code_block_count +=1                                                #increment code block pointer

				tokens.insert(end_pointer,["Pass",label_to_move])                   #gives return label
				del tokens[i+2:end_pointer]                                         #get rid of cut out code
				tokens += cut_code                                                  #add cut out code to the end of the tokens

		i += 1
#	for line in tokens: print line
	return tokens,code_block_count

def matching_bracket_search(tokens,i):
	#finds start and end lines of a branched piece of code
	#returns end of cut out code line number and the cut out tokens
	#print "Called"
	branch_count = 1
	i += 1
	code_to_cut_out = []
	while branch_count:
		if "{" in tokens[i]:
			branch_count += 1
		if "}" in tokens[i]:
			branch_count -= 1
		if branch_count or tokens[i] != ["}"]:
			code_to_cut_out.append(tokens[i])

		i +=1
		if i == len(tokens):
			print "ERROR: unclosed brackets"
			quit()
	#print code_to_cut_out
	return code_to_cut_out,i

def find_structs(tokens):
	struct_names = []
	i = 0
	while i < len(tokens):
		line = tokens[i]
		if line[0] == "Struct":
			struct = []
			struct_names.append(line[1])
			while tokens[i] != ["end","Struct"]:
				struct.append(tokens[i]) 
				del tokens[i]
			del tokens[i]
			tokens = execute_struct(struct,tokens,struct_names)
		else:
			i += 1
	return tokens

def execute_struct(struct,tokens,struct_names):
	name = struct[0][1]
	parameters  = struct[0][2:]

	i = 0
	while i <len(tokens):

		if tokens[i][0] != name:
			i += 1
		else: #struct detected
			instance_name = tokens[i][1]
			#print instance_name
			find_replace_dict = {}
			for j in xrange(len(parameters)):
				find_replace_dict[parameters[j]] = tokens[i][2+j]

			instance = []
			for line in struct[1:]:
				instance_line = []
				temp = str(line[1])
				initialisation_statements = ["int","char","word","ptr","array","Byte_array"] + struct_names
				if line[0] in initialisation_statements:
					line[1] = instance_name+"."+line[1]
				instance_line = [find_replace_dict.get(token,token) for token in line] #copy across
				line[1] = temp
				instance.append(instance_line)

			#print "\n\ninstance = ",instance,"\n\n"
			tokens = tokens[:i]+instance+[["int",instance_name,instance[0][1]]]+tokens[i+1:] #creates a pointer to the instance and adds in the instance
	return tokens


def count_lines(tokens):
	count = 0
	for i in xrange(len(tokens)):
		line = tokens[i]
		if line[0] in opcodes_to_count or line[0] == "CondF" or line[0] == "CondR":
			tokens[i].insert(0,count)
			if line[0]!="Data":
				count += 4
			count +=4
			
	return count,tokens

def sort_out_variables(tokens,number_of_lines):
	#variables can be of types:
	#int,char,word,array,byteArray
	
	int_list = []
	array_list = []
	ptr_list = []
	i = 0
	count = number_of_lines
	variable_dict = {}  
	while i < len(tokens):
		line = tokens[i]
		#print line

		if line[0] == "int": #basic integer type
			#print line
			name = line[1]
			try:
				int(name)
				name = "@"+name
			except ValueError:
				pass
			address = str(count)
			value = "$"+line[1]
			try:
				data = line[2]
			except IndexError:
				data = "0"
			tokens.append([address,"Data",data])
			variable_dict[name] =  address
			variable_dict[value] = data

			del tokens[i]
			i -= 1 #countereffect plus one at end

			count += 4

		elif line[0]=="char":
			name = line[1]
			address = str(count)
			value = "$"+line[1]
			try:
				data = line[2]
			except IndexError:
				data = "0"
			tokens.append([address,"Byte",data])
			variable_dict[name] =  address
			variable_dict[value] = data

			del tokens[i]
			i -= 1 #countereffect plus one at end

			count += 1

		elif line[0]=="word":
			name = line[1]
			address = str(count)
			value = "$"+line[1]
			try:
				data = line[2]
			except IndexError:
				data = "0"
			tokens.append([address,"Word",data])
			variable_dict[name] =  address
			variable_dict[value] = data

			del tokens[i]
			i -= 1 #countereffect plus one at end

			count += 2


		elif line[-1][0] == "%":
			name = line[-1][1:]
			label = line[-1]
			address = str(count)
			label_address = str(tokens[i][0])
			del tokens[i][-1]
			tokens.append([address,"Data",label_address])

			variable_dict[name] =  address
			variable_dict["$"+name] = label_address
			i -= 1
			count +=4

		elif line[0] == "array":
			#print line[3]
			name = line[1]
			length = int(line[2])
			data_array = json.loads(line[3])
			address = str(count)
			
			variable_dict[name] =  address
			

			address_copy = count
			for dword in data_array:
				tokens.append([str(address_copy),"Data",str(dword)])
				address_copy += 4
			count += 4*length
			del tokens[i]
			i-=1

		elif line[0] == "byteArray":
			name = line[1]
			length = int(line[2])
			data_array = json.loads(line[3])
			address = str(count)

			variable_dict[name] =  address

			address_copy = count
			for byte in data_array:
				tokens.append([str(address_copy),"Byte",str(byte)])
				address_copy += 1
			count += length
			del tokens[i]
			i-=1

		i+=1
	for i in xrange(len(tokens)):
		for j in xrange(len(tokens[i])):
			while tokens[i][j] in variable_dict:
				tokens[i][j] = variable_dict[tokens[i][j]]
	return tokens

def fill_in_gaps(tokens,print_flag):
	#print "\n\n"
	results = []
	for line in tokens:
		results.append(fill_in_gaps_line(line,print_flag))
		if fill_in_gaps_line(line,print_flag) == None:
			print "NONE LINE:",line
	return results

def fill_in_gaps_line(line,print_flag):
	''' fills in gaps, giving instructions nearly uniform format before final assembly'''
#	print line
	try:
		if print_flag: print line #if there is a call to print from elsewhere
		if line[1] == "CondR" or line[1] == "CondF":  #if there is a conditional instruction
			semi_line = [line[0]]+line[3:] #cuts out conditional part
			return line[:3] + fill_in_gaps_line(semi_line,print_flag)[1:] #combines conditional part (line[:3]) with the result of compiling the rest of the line
	
		elif line[1] in ("Data","Byte","Word"):
			return line
	
#		elif line[1] == "Byte":
#			return line
#		elif line[1] == "Word":
#			return line
		else:
			length = len(line)
			if line[1] == "Halt":
				return [line[0],"Halt", "Zero", "Zero", "0"]
			elif line[1] == "Pass":
				return [line[0],"Pass","Zero","Zero","0"]
			elif line[1] == "Move":
				return line + ["0"]
			elif line[1] in ["Load","Store","LoadByte","StoreByte","LoadWord","StoreWord"]:
				if length == 5: #0 Load reg addr index
					return line[:3]+[line[4][1:-1]]+[line[3]]
				else:
					return line[:3]+["Zero"]+[line[3]]
	
			elif line[1] in ["Compare","ADD","SUB","MUL","DIV","MOD","AND","OR","XOR","NAND","NOR","XNOR","SHR","SHL","ADDc","SUBb"]: #0 compare reg (reg/addr)
				if line[3] in register_addresses:
					#register-rgister op
					return [line[0]] + [line[1]+"Reg"]+line[2:] + ["0"]
				else:
					if length == 5: #0 op reg addr index
						return [line[0]] + [line[1]+"Addr"]+[line[2]]+[line[4][1:-1]]+[line[3]]
					else:
						return [line[0]] + [line[1]+"Addr"]+[line[2]]+["Zero"]+[line[3]]

			elif line[1] in ["NOT"]:
				return [line[0]] + [line[1]+ "Reg"]+ line[2:] + ["Zero","0"]

			elif line[1] in ["Out","In","Outd","HDScan"]: # if this doesnt work, change me
				if line[2] in register_addresses:
					#register-rgister compare
					return [line[0]] + [line[1]+"Reg"]+[line[2]] +["Zero"] + ["0"]
				else:
					if length == 4: #0 out addr [index]
						return [line[0]] + [line[1]+"Addr","Zero"]+[line[3][1:-1]]+[line[2]]
					else:
						return [line[0]] + [line[1]+"Addr","Zero","Zero"]+[line[2]]
			elif line[1] in ["HDWrite","HDRead"]:
				if length == 5: #0 compare reg addr index
					return [line[0], line[1], line[2], line[3], line[4]]
				else:
					return [line[0],line[1],line[2],"Zero",line[3]]
			else:
				print "Unknown command: ",line
	
				quit()
	except:
		print "Error in line: ", line
		quit()

def low_level_assemble(line_list):
	machine_code_dict = {}
	for tokens in line_list:
		line_no = int(tokens[0])
		try:
			if tokens[1] == "Data":
				data = int(tokens[2])
				instr = []
				for i in xrange(4):
					instr.append(data&255)
					data >>= 8
				instr.reverse() 

			elif tokens[1] == "Word":
				data = int(tokens[2])
				instr = []
				for i in xrange(2):
					instr.append(data&255)
					data >>= 8
				instr.reverse() 

			elif tokens[1] == "Byte":
				instr = [int(tokens[2])%256]

			else:
				if tokens[1] == "CondF":
					flag = tokens[2]
					cond = 128+conditional_addresses[flag]
					opcode = opcodes[tokens[3]]
					reg1 = register_addresses[tokens[4]]
					reg2 = register_addresses[tokens[5]]
					if tokens[6][0] == '@': # if IMD addression
						tokens[6] = tokens[6][1:]
						opcode |= 128
					addr = int(tokens[6])%4294967296
					addr3 = addr&255
					addr >>= 8
					addr2 = addr&255
					addr >>=8
					addr1 = addr&255
					addr >>=8
					addr0 = addr&255
				elif tokens[1] == "CondR":
					cond = 128+64+register_addresses[tokens[2]]
					opcode = opcodes[tokens[3]]
					reg1 = register_addresses[tokens[4]]
					reg2 = register_addresses[tokens[5]]
					if tokens[6][0] == '@': # if IMD addression
						tokens[6] = tokens[6][1:]
						opcode |= 128
					addr = int(tokens[6])%4294967296
					addr3 = addr&255
					addr >>= 8
					addr2 = addr&255
					addr >>=8
					addr1 = addr&255
					addr >>=8
					addr0 = addr&255    

				else:
					opcode = opcodes[tokens[1]]
					reg1 = register_addresses[tokens[2]]
					reg2 = register_addresses[tokens[3]] 
					cond = 0
					if tokens[4][0] == '@': # if IMD addression
						tokens[4] = tokens[4][1:]
						opcode |= 128
					addr = int(tokens[4])%4294967296
					addr3 = addr&255
					addr >>= 8
					addr2 = addr&255
					addr >>=8
					addr1 = addr&255
					addr >>=8
					addr0 = addr&255    

				instr = [opcode,reg1,reg2,cond,addr0,addr1,addr2,addr3]
		except Exception as e:
			print "Error: line: ",tokens
			print e
			quit()
		for i in xrange(len(instr)):
			machine_code_dict[line_no+i] = instr[i]
	return machine_code_dict

def prune_machine_code(machine_code_dict):
	#removes zero bytes in machine code dict
	new_dict = {}
	for key in machine_code_dict:
		if machine_code_dict[key]: 
			new_dict[key] = machine_code_dict[key]
	return new_dict

def store(machine_code):
	to_store = json.dumps(machine_code)
	#print to_store
	#print sys.argv[1][:13]
	if len(sys.argv)>2 and sys.argv[2][0] != "-":
		file_name = sys.argv[2]
	else:
		if sys.argv[1][:13] == 'Assembly code':
			file_name = 'Machine code'+sys.argv[1][13:]

		elif sys.argv[1][:13] == 'Compiled code':
			file_name = 'Machine code'+sys.argv[1][13:]

		else: #default sends to machine code
			CURRENT_DIR = os.path.dirname(__file__)
			source_file_name = sys.argv[1].split("\\")[-1]
			file_name = os.path.join(CURRENT_DIR, 'Machine code\\'+source_file_name)

	if file_name[-3:] == ".al":
		file_name = file_name[:-3]+".ml"
	elif file_name[-3:] != ".ml":
		file_name += ".ml"
	open_file = open(file_name,"w")
	open_file.write(to_store)
	open_file.close()
	return file_name

def log(tokens,name):
	log_file = open(name,"w")
	for line in tokens:
		log_file.write(json.dumps(line)+"\n")
	log_file.close



def print_tokens(tokens):
	for line in tokens:
		print line

if __name__ == "__main__":
	assemble()
