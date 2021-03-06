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
		"SHRAddr":46,
		"ADDcAddr":47,
		"SUBbAddr":48
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
		"Out"
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
		"23":23,
		"Equal":24,
		"Greater":25,
		"Less":26,
		"Carry":27,
		"Borrow":28,
		"DivByZero":29,
		"StackOverflow":30,
		"StackUnderflow":31
		}

def low_level_assemble(line_list):
	machine_code_dict = {}
	print_tokens(line_list)
	for tokens in line_list:
		#tokens = tokenize(line)
		print tokens
		line_no = int(tokens[0])
		if tokens[1] == "Data":
			data = int(tokens[2])
			instr = []
			for i in xrange(4):
				instr.append(data&255)
				data >>= 8
			instr.reverse()

		else:
			if tokens[1] == "CondF":
				flag = tokens[2]
				cond = 128+conditional_addresses[flag]
				opcode = opcodes[tokens[3]]
				reg1 = register_addresses[tokens[4]]
				reg2 = register_addresses[tokens[5]] 
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
				addr = int(tokens[4])%4294967296
				addr3 = addr&255
				addr >>= 8
				addr2 = addr&255
				addr >>=8
				addr1 = addr&255
				addr >>=8
				addr0 = addr&255

			instr = [opcode,reg1,reg2,cond,addr0,addr1,addr2,addr3]
		
		for i in xrange(len(instr)):
			machine_code_dict[line_no+i] = instr[i]
	return machine_code_dict

def tokenize(line):
	tokens = []
	current_token = ''
	for char in line:
		if char == " ":
			tokens.append(current_token)
			current_token = ''
		else:
			current_token += char
	tokens.append(current_token)
	return tokens



#print low_level_assemble([
#			"0 Load gp0 Zero 32 ",
#			"8 Load gp1 Zero 36",
#			"16 MULReg gp0 gp1 0",
#			"24 Store gp0 Zero 32",
#			"32 Data 2",
#			"36 Data 3"
#							])

def assemble():
	file_object = get_code() #get the text of the file
	tokens = full_text_tokenize(file_object)
	tokens = expand_macros(tokens)  			#expand pseudo commands such as "Goto ... " or "if ... then ... " or "def ... ... "
	while things_to_import(tokens):
		tokens = do_import(tokens)
	number_of_lines,tokens = count_lines(tokens) 		#counts the number of valid lines for sorting out variables
	tokens = sort_out_variables(tokens,number_of_lines) 		#creates variable storage and places pointers
	tokens = fill_in_gaps(tokens) 				#final checks of compiling to low-level-assembly
#	print tokens
	print tokens
	machine_code = low_level_assemble(tokens)	#need to modify low level assemble function to take a non string entry
	store(machine_code)

def get_code():
	file_name = sys.argv[1]
	try:
		return open(file_name)
	except IOError:
		try:
			return open(file_name+".al")
		except IOError:
			print "Error: Invalid file name, please try again"
			quit()

def full_text_tokenize(text_file):
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
                token_list.append(line_tokens)
    #print token_list
    return token_list

def expand_macros(tokens):
	replace_dict = {}
	lines_to_remove = []
	i = 0
	while i < len(tokens):
		line = tokens[i]
		if line[0] == "def":					#defining a term
			lines_to_remove.append(i)
			replace_dict[line[1]] = line[2]
		i += 1

	lines_to_remove.reverse()
	for i in lines_to_remove:
		del tokens[i]


	i = 0
	#print "\n\n in subroutine"
#	print_tokens(tokens)
	while i < len(tokens):	
		line = tokens[i]
	#	print line, len(line)
		
		for j in xrange(len(line)):
	#		print type(line[j])
			#print repr(line[j])
			line[j] = replace_dict.get(line[j],line[j])

		if line[0] == "if":
			if line[1] in conditional_addresses:
				tokens[i] = ["CondF",line[1]]+line[3:] #line[2] = "then"
			else:
				tokens[i] = ["CondR",line[1]]+line[3:]
		
		line = tokens[i]
		if line[0] == "Goto":					  #non conditional goto regs
			if line[1] in register_addresses:
				tokens[i] =  ["Move","PC","Jump"]
				tokens.insert(i+1,["Move",line[1],"PC"])
			else: #"Goto @label []"
				tokens[i] = ["Move","PC","Jump"]
				tokens.insert(i+1,["Load","PC"]+line[1:])


		if len(line)>2 and line[2] == "Goto":				
			if line[3] in register_addresses:
				tokens[i] =  ["Move","PC","Jump"]
				tokens.insert(i+1,line[:2]+["Move",line[3],"PC"])
			else: #"Goto @label []"
				tokens[i] = ["Move","PC","Jump"]
				tokens.insert(i+1,line[:2]+["Load","PC"]+line[3:])

		i += 1
	return tokens

def things_to_import(tokens): #checks where there is anything to import
	for line in tokens:
		if line[0] == "import":
			return True
	return False

def do_import(tokens): #carries out one import
	for i in xrange(len(tokens)):
		if tokens[i][0] == "import":
			print "importing",
			import_name = tokens[i][1]
			if import_name[-3:]!= ".al":
				import_name += ".al"
			print import_name
			try:
				new_tokens= full_text_tokenize(open(import_name))
			except IOError:
				print "Invalid import name: ", import_name
				quit()
			new_tokens = expand_macros(new_tokens)
			#print_tokens(tokens[:i])
			#print "\n\n"
			#print_tokens(new_tokens)
			#print_tokens(tokens[i+1:])
			#quit()
			return tokens[:i] + new_tokens + tokens[i+1:]


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
	int_list = []
	array_list = []
	ptr_list = []
	i = 0
	count = number_of_lines
	while i < len(tokens):
		#print i,
		line = tokens[i]
		#print tokens[i]
		if line[0] == "int": #basic integer type
			name = "@"+line[1]
			address = str(count)
			
			tokens.append([address,"Data",line[2]])
			
			for j in xrange(len(tokens)): #now replace all calls of @name with pointer to variable
				 while name in tokens[j]:
				 	tokens[j][tokens[j].index(name)] = address
			del tokens[i]
			i -= 1 #countereffect plus one at end

			count += 4

		elif line[0] == "ptr":
			name = "@"+line[1]
			label = "%"+line[1]
			address = str(count)
			for line in tokens:
				if label in line:
					label_address = line[0]
					to_delete = tokens.index(line)
					del tokens[to_delete][tokens[to_delete].index(label)]
					break
			tokens.append([address,"Data",label_address])

			for j in xrange(len(tokens)): #now replace all calls of @name with pointer to variable
				 while name in tokens[j]:
				 	tokens[j][tokens[j].index(name)] = address
			del tokens[i]
			i -= 1
			count +=4

		elif line[0] == "array":
			name = "@"+line[1]
			length = int(line[2])
			data_array = json.loads(line[3])
			#print data_array
			address = str(count)



			for j in xrange(len(tokens)): #now replace all calls of @name with pointer to variable
				 while name in tokens[j]:
				 	tokens[j][tokens[j].index(name)] = address 

			address_copy = count
			for dword in data_array:
				tokens.append([str(address_copy),"data_array"])
				address_copy += 4
			count += 4*length
			del tokens[i]
			i-=1

		#elif line[0] == "str":
		#	name = "@"+line[1]
		#	string = line[2][1:-1]
		#	length = len()
		i+=1
	return tokens

def fill_in_gaps(tokens):
	#print "\n\n"
	results = []
	for line in tokens:
		results.append(fill_in_gaps_line(line))
		if fill_in_gaps_line(line) == None:
			print "NONE LINE:",line
	return results

def fill_in_gaps_line(line):
	#print line
	if line[1] == "CondR" or line[1] == "CondF":
		semi_line = [line[0]]+line[3:]
		#print semi_line
		return line[:3] + fill_in_gaps_line(semi_line)[1:]

	elif line[1] == "Data":
		return line
	else:
		length = len(line)
		if line[1] == "Halt":
			return [line[0],"Halt", "Zero", "Zero", "0"]
		elif line[1] == "Pass":
			return [line[0],"Pass","Zero","Zero","0"]
		elif line[1] == "Move":
			return line + ["0"]

		elif line[1] == "Load":
			if length == 5: #0 Load reg addr index
				return line[:3]+[line[4][1:-1]]+[line[3]]
			else:
				return line[:3]+["Zero"]+[line[3]]

		elif line[1] == "Store":
			#print	 line
			if length == 5: #0 Load reg addr index
				return line[:3]+[line[4][1:-1]]+[line[3]]
			else:
				return line[:3]+["Zero"]+[line[3]]

		elif line[1] == "Compare": #0 compare reg (reg/addr)
			if line[3] in register_addresses:
				#register-rgister compare
				return [line[0]] + [line[1]+"Reg"]+line[2:] + ["0"]
			else:
				if length == 5: #0 compare reg addr index
					return [line[0]] + [line[1]+"Addr"]+line[2:3]+[line[4][1:-1]]+line[3]
				else:
					return [line[0]] + [line[1]+"Addr"]+line[2:3]+["Zero"]+[line[3]]
		elif line[1] == "ADD":
			if line[3] in register_addresses:
				#register-rgister compare
				return [line[0]] + [line[1]+"Reg"]+line[2:] + ["0"]
			else:
				if length == 5: #0 compare reg addr index
					return [line[0]] + [line[1]+"Addr"]+line[2:3]+[line[4][1:-1]]+line[3]
				else:
					return [line[0]] + [line[1]+"Addr"]+line[2:3]+["Zero"]+[line[3]]

		elif line[1] == "SUB":
			if line[3] in register_addresses:
				#register-rgister compare
				return [line[0]] + [line[1]+"Reg"]+line[2:] + ["0"]
			else:
				if length == 5: #0 compare reg addr index
					return [line[0]] + [line[1]+"Addr"]+line[2:3]+[line[4][1:-1]]+line[3]
				else:
					return [line[0]] + [line[1]+"Addr"]+line[2:3]+["Zero"]+[line[3]]
		elif line[1] == "MUL":
			if line[3] in register_addresses:
				#register-rgister compare
				return [line[0]] + [line[1]+"Reg"]+line[2:] + ["0"]
			else:
				if length == 5: #0 compare reg addr index
					return [line[0]] + [line[1]+"Addr"]+line[2:3]+[line[4][1:-1]]+line[3]
				else:
					return [line[0]] + [line[1]+"Addr"]+line[2:3]+["Zero"]+[line[3]]
		elif line[1] == "DIV":
			if line[3] in register_addresses:
				#register-rgister compare
				return [line[0]] + [line[1]+"Reg"]+line[2:] + ["0"]
			else:
				if length == 5: #0 compare reg addr index
					return [line[0]] + [line[1]+"Addr"]+line[2:3]+[line[4][1:-1]]+line[3]
				else:
					return [line[0]] + [line[1]+"Addr"]+line[2:3]+["Zero"]+[line[3]]
		elif line[1] == "MOD":
			if line[3] in register_addresses:
				#register-rgister compare
				return [line[0]] + [line[1]+"Reg"]+line[2:] + ["0"]
			else:
				if length == 5: #0 compare reg addr index
					return [line[0]] + [line[1]+"Addr"]+line[2:3]+[line[4][1:-1]]+line[3]
				else:
					return [line[0]] + [line[1]+"Addr"]+line[2:3]+["Zero"]+[line[3]]
		elif line[1] == "AND":
			if line[3] in register_addresses:
				#register-rgister compare
				return [line[0]] + [line[1]+"Reg"]+line[2:] + ["0"]
			else:
				if length == 5: #0 compare reg addr index
					return [line[0]] + [line[1]+"Addr"]+line[2:3]+[line[4][1:-1]]+line[3]
				else:
					return [line[0]] + [line[1]+"Addr"]+line[2:3]+["Zero"]+[line[3]]
		elif line[1] == "OR":
			if line[3] in register_addresses:
				#register-rgister compare
				return [line[0]] + [line[1]+"Reg"]+line[2:] + ["0"]
			else:
				if length == 5: #0 compare reg addr index
					return [line[0]] + [line[1]+"Addr"]+line[2:3]+[line[4][1:-1]]+line[3]
				else:
					return [line[0]] + [line[1]+"Addr"]+line[2:3]+["Zero"]+[line[3]]
		elif line[1] == "XOR":
			if line[3] in register_addresses:
				#register-rgister compare
				return [line[0]] + [line[1]+"Reg"]+line[2:] + ["0"]
			else:
				if length == 5: #0 compare reg addr index
					return [line[0]] + [line[1]+"Addr"]+line[2:3]+[line[4][1:-1]]+line[3]
				else:
					return [line[0]] + [line[1]+"Addr"]+line[2:3]+["Zero"]+[line[3]]
		elif line[1] == "NOT":
			if line[3] in register_addresses:
				#register-rgister compare
				return [line[0]] + [line[1]+"Reg"]+line[2:] + ["0"]
			else:
				if length == 5: #0 compare reg addr index
					return [line[0]] + [line[1]+"Addr"]+line[2:3]+[line[4][1:-1]]+line[3]
				else:
					return [line[0]] + [line[1]+"Addr"]+line[2:3]+["Zero"]+[line[3]]
		elif line[1] == "NAND":
			if line[3] in register_addresses:
				#register-rgister compare
				return [line[0]] + [line[1]+"Reg"]+line[2:] + ["0"]
			else:
				if length == 5: #0 compare reg addr index
					return [line[0]] + [line[1]+"Addr"]+line[2:3]+[line[4][1:-1]]+line[3]
				else:
					return [line[0]] + [line[1]+"Addr"]+line[2:3]+["Zero"]+[line[3]]
		elif line[1] == "NOR":
			if line[3] in register_addresses:
				#register-rgister compare
				return [line[0]] + [line[1]+"Reg"]+line[2:] + ["0"]
			else:
				if length == 5: #0 compare reg addr index
					return [line[0]] + [line[1]+"Addr"]+line[2:3]+[line[4][1:-1]]+line[3]
				else:
					return [line[0]] + [line[1]+"Addr"]+line[2:3]+["Zero"]+[line[3]]
		elif line[1] == "XNOR":
			if line[3] in register_addresses:
				#register-rgister compare
				return [line[0]] + [line[1]+"Reg"]+line[2:] + ["0"]
			else:
				if length == 5: #0 compare reg addr index
					return [line[0]] + [line[1]+"Addr"]+line[2:3]+[line[4][1:-1]]+line[3]
				else:
					return [line[0]] + [line[1]+"Addr"]+line[2:3]+["Zero"]+[line[3]]
		elif line[1] == "SHL":
			if line[3] in register_addresses:
				#register-rgister compare
				return [line[0]] + [line[1]+"Reg"]+line[2:] + ["0"]
			else:
				if length == 5: #0 compare reg addr index
					return [line[0]] + [line[1]+"Addr"]+line[2:3]+[line[4][1:-1]]+line[3]
				else:
					return [line[0]] + [line[1]+"Addr"]+line[2:3]+["Zero"]+[line[3]]
		elif line[1] == "SHR":
			if line[3] in register_addresses:
				#register-rgister compare
				return [line[0]] + [line[1]+"Reg"]+line[2:] + ["0"]
			else:
				if length == 5: #0 compare reg addr index
					return [line[0]] + [line[1]+"Addr"]+line[2:3]+[line[4][1:-1]]+line[3]
				else:
					return [line[0]] + [line[1]+"Addr"]+line[2:3]+["Zero"]+[line[3]]
		elif line[1] == "ADDc":
			if line[3] in register_addresses:
				#register-rgister compare
				return [line[0]] + [line[1]+"Reg"]+line[2:] + ["0"]
			else:
				if length == 5: #0 compare reg addr index
					return [line[0]] + [line[1]+"Addr"]+line[2:3]+[line[4][1:-1]]+line[3]
				else:
					return [line[0]] + [line[1]+"Addr"]+line[2:3]+["Zero"]+[line[3]]
		elif line[1] == "SUBb":
			if line[3] in register_addresses:
				#register-rgister compare
				return [line[0]] + [line[1]+"Reg"]+line[2:] + ["0"]
			else:
				if length == 5: #0 compare reg addr index
					return [line[0]] + [line[1]+"Addr"]+line[2:3]+[line[4][1:-1]]+line[3]
				else:
					return [line[0]] + [line[1]+"Addr"]+line[2:3]+["Zero"]+[line[3]]
		elif line[1] == "Out":
			if line[2] in register_addresses:
				#register-rgister compare
				return [line[0]] + [line[1]+"Reg"]+[line[2]] +["Zero"] + ["0"]
			else:
				if length == 4: #0 out addr [index]
					return [line[0]] + [line[1]+"Addr","Zero"]+[line[3][1:-1]]+[line[2]]
				else:
					return [line[0]] + [line[1]+"Addr","Zero","Zero"]+[line[2]]

def store(machine_code):
	to_store = json.dumps(machine_code)
	print to_store
	if len(sys.argv)>2:
		file_name = sys.argv[2]
	else:
		file_name = sys.argv[1]
	if file_name[-3:] == ".al":
		file_name = file_name[:-3]+".ml"
	elif file_name[-3:] != ".ml":
		file_name += ".ml"
	open_file = open(file_name,"w")
	open_file.write(to_store)
	open_file.close()



def print_tokens(tokens):
	for line in tokens:
		print line

#tokens =  full_text_tokenize([
#"def Areg gp0",
#"def Breg gp1",
#"def temp gp2",
#
#"ptr loop",
#"int A 12",
#"int B 9",
#
#"Load Areg @A",
#"Load Breg @B",
#
#"MOD Breg Areg %loop",
#"if DivByZero then Halt",
#"Move Areg temp",
#"Move Breg Areg",
#"Move temp Breg",
#"if Areg then Goto @loop",
#"Halt" 
	#]
	#)
#print "raw tokens"
#print_tokens(tokens)
#
#
#expanded = expand_macros(tokens)
#
#print "\n\nremoved definitions"
#print_tokens(expanded)





#number_of_lines,counted = count_lines(expanded) 		#counts the number of valid lines for sorting out variables#

#print "\n\ncounted"
#print_tokens(counted)#

#variables_sorted = sort_out_variables(tokens,number_of_lines)
#print "\n\nvariables sorted"
#print_tokens(variables_sorted)#

#filled_in_gaps = fill_in_gaps(variables_sorted)
#print "\n\ngaps filled in"
#print_tokens(filled_in_gaps)#

#machine_code = low_level_assemble(filled_in_gaps)
#print machine_code

assemble()