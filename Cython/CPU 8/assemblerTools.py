import json

#Gaining program text/writing to file
def extract_program_prompt():
    '''prompts user for program name and extracts to an object'''
    error = 1
    while error:
        try:
            file_name = str(raw_input("Please enter file name: "))
            program_file = open(file_name)
            error = 0
        except IOError:
            try:
                file_name += '.txt'
                program_file = open(file_name)
                error = 0
            except:print "File Name Error\n\nPlease try again"
    return program_file,file_name

def store_list(code_list,file_name):
    file_name = file_name[:-4]+".aml"
    machine_code_file = open(file_name,"w")
    dumped_code = json.dumps(code_list)
    machine_code_file.write(dumped_code)

def store_tokenized_list(tokens,file_name):
    file_name = file_name[:-4]+".tok"
    machine_code_file = open(file_name,"w")
    dumped_code = json.dumps(tokens)
    machine_code_file.write(dumped_code)

def open_tokenized_list(file_name,subroutine_name):
    file_name +=".tok"
    token_file = open(file_name)
    extracted_dict = json.loads(token_file.read())
    extracted_tokens = extracted_dict[subroutine_name]
    return extracted_tokens



#Preprocessing
def tokenize(text_file):
    '''Goes through text file, splitting it into lines
    and breaks each line into "tokens", returns 2d array of tokens'''
    token_list = []
    for line in text_file:
        print line
        line_tokens = []
        current_token = ''
        string_literal = 0
        for character in line:
            if not string_literal:
                if character != " " and character != "\t" and character != "\n":
                    if character == "$":
                        string_literal = 1
                    current_token += character
                else:
                    if current_token != "":
                        line_tokens.append(current_token)
                        #print line_tokens
                        current_token = ""
            else:
                current_token += character
                if character == "$":
                    string_literal = 0
        #print line_tokens
        if current_token != "" and current_token != "\t":
            line_tokens.append(current_token)
        if line_tokens != []:
            token_list.append(line_tokens)
    return token_list

def remove_comments(token_list,is_main_routine):
    '''Removes comment tokens and tokens after them in lines'''
    if not is_main_routine:
        new_token_list = []
        for line in token_list:
            new_line_tokens = []
            commented = 0
            for token in line:
                if commented != 1:
                    if token[0] == "#":
                        commented = 1
                    else:
                        new_line_tokens.append(token)
            if new_line_tokens != []:
                new_token_list.append(new_line_tokens)
    else:
        new_token_list = []
        for line in token_list:
            new_line_tokens = []
            commented = 0
            for token in line:
                if commented != 1:
                    if token[0] == "#":
                        commented = 1
                    elif token == "<subroutine" or token == "<end>":
                        commented = 1
                    else:
                        new_line_tokens.append(token)
            if new_line_tokens != []:
                new_token_list.append(new_line_tokens)
    return new_token_list

def find_subroutines(token_list):
    subroutines = {}
    current_subroutine = []
    subroutine_found = 0
    for line in token_list:
        if subroutine_found:
            if line[0] == "<end>":
                subroutine_found = 0
                subroutines[subroutine_name] = current_subroutine
                current_subroutine = []
            else:
                current_soubroutine.append(line)
        else:
            if line[0] == "<subroutine":
                subroutine_name = line[1]
                if subroutine_name[-1] == ">":
                    subroutine_name = subroutine_name[:-1]
                subroutine_found = 1
    return subroutines



def find_definitions(token_list):
    '''finds "def" statements, removes them and builds a table of transformations'''
    defined_dict = {}
    lines_to_remove = []
    for line in token_list:
        if line[0] == "def": #finds define commands
            to_replace = line[1] #to replace is first argument
            new_token = line[2] #new token is the second - eg def x acc
            defined_dict[to_replace] = new_token
            lines_to_remove.append(token_list.index(line))
    lines_to_remove.reverse() #goes backwards so indexes do not change
    for index in lines_to_remove:
        del(token_list[index])

    return token_list, defined_dict

def replace(token_list,defined_dict):
    '''Takes a replace table and a list of tokens, replaces tokens matching in the table'''
    for line in token_list:
        for i in xrange(len(line)):
            try:
                line[i] = defined_dict[line[i]]
            except KeyError:
                pass
    return token_list

def find_and_replace(token_list):
    '''combines finding "def" statements and replacing tokens'''
    new_token_list,defined_dict = find_definitions(token_list)
    return replace(new_token_list,defined_dict)

def find_names(name):
    file_name = ''
    subroutine_name = ''
    name_is_file_name = 1
    for character in name:
        if name_is_file_name:
            if character == ":":
                name_is_file_name = 0
            else:
                file_name += character
        else:
            subroutine_name += character

    return file_name,subroutine_name

def import_code(token_list):
    for line in token_list:
        if line[0] == "import":
            i = token_list.index(line)

            name = line[1]
            file_name,subroutine_name = find_names(name)
            print "Importing: ",file_name, "\n\n"
            imported_code = open_tokenized_list(file_name,subroutine_name)
            token_list = token_list[:i]+imported_code+token_list[i+1:]
    return token_list
    
def resolve_string_literals(token_list):
    '''replaces string literals, eg $ab with their numerical value'''
    for line in token_list:
        for i in xrange(len(line)):
            token = line[i]
            if token[0] == "$": #looks for string literal tag
                token = token[:-1]
                char1 = '\n'
                char2 = '\n'
                try:
                    char1 = token[1]#only first two characters in string are used
                    char2 = token[2]
                except:
                    pass
                line[i] = str((ord(char1)<<8)+ord(char2))
    return token_list

class Labellist: #allows for easy gotos and jumps
    def __init__(self):
        self.labels = {}

    def add_to_dict(self,label,location): #used when finding labels
        self.labels[label] = location

    def find_jump_offset(self,label,current_location): #used when a jump comman is used
        target_location = self.labels[label]
        offset = target_location - current_location
        offset -= 2 #allows for movement of program counter
        return offset

    def find_goto_location(self,label): #used when a goto command is used with a label
        return self.labels[label]

    def find_address(self,label): #used when a read or write command uses a label
        return self.labels[label]

def find_labels(token_list):
    '''Picks out labels and stores them'''
    global Label_list
    line_counter = 0
    for line in token_list:
        if line[0][0] == "%": #if is a label declaration
            Label_list.add_to_dict(line[0],line_counter)
            del(line[0])
        if line[0] == "data":
            line_counter +=1
        else:
            line_counter +=2
    return token_list



#Main assembly
def decode_instr_type(line):
    '''obtains opcodes and attributes for each instruction'''
    print "decoding",line
    instruction = line[0]
    try:
        opcode = op_lookup(instruction)
        return opcode,op_attributes(opcode)
    except KeyError:
        print "Unrecognised instruction"

def assemble_type_h(opcode,line,line_number):
    '''assembles a Halt type instruction'''
    opcode = 0 #to point out values
    reg1 = 0
    reg2 = 0
    address = 0
    flags = 0
    return [(0,0),(0,0)] #halt instruction always has this code

def assemble_type_r(opcode,line,line_number):
    '''assembles a register type instruction'''
    new_line,flag_value = resolve_flags(opcode,line)
    register1 = new_line[1]
    register2 = new_line[2]
    register1 = register_lookup(register1)
    register2 = register_lookup(register2)
    word1 = (0,(opcode<<8)+(register1<<4)+register2)
    word2 = (0,flag_value<<12)
    return [word1,word2]

def assemble_type_a(opcode,line,line_number):
    '''assembles an address based instruction'''
    new_line,flag_value = resolve_flags(opcode,line)
    register = new_line[1]
    register = register_lookup(register)
    word1 = (0,(opcode<<8)+(register<<4)+flag_value)
    if new_line[2][0] == "%":
        address = Label_list.find_address(new_line[2])
        word2 = (0,address)
    else:
        address = int(new_line[2])

        if address<0:
            word2 = (1,abs(address))
        else:
            word2 = (0,address)

    return [word1,word2]

def assemble_type_v(opcode,line,line_number):
    '''assembles a variable argument instruction'''
    new_line,flag_value = resolve_flags(opcode,line)
    variable_value =  new_line[1]
    if variable_value[0] == "%": #label
        register = 0
        if opcode == 22: #jump
            address = Label_list.find_jump_offset(variable_value,line_number)
        elif opcode == 23: #goto
            address = Label_list.find_goto_location(variable_value)
        else: #push or pop
            address = Label_list.find_address(variable_value)
    else:
        try: #if address
            address = int(variable_value)
            register = 0
        except: #if register
            address = 0
            register = register_lookup(variable_value)
    word1 = (0,(opcode<<8)+(register<<4)+flag_value)
    if address < 0:
        word2 = (1,abs(address))
    else:
        word2 = (0,address)
    return [word1,word2]

def assemble_type_c(opcode,line,line_number):
    '''Assembles a conditional instruction'''
    new_line,flag_value = resolve_flags(opcode,line)
    condition = new_line[1]
    condition = condition_lookup(condition)
    address = new_line[2]
    try:
        address = int(address)
    except:
        if opcode == 25: #jump
            address = Label_list.find_jump_offset(address,line_number)
        else: #goto
            address = Label_list.find_goto_location(address)
    word1 = (0,(opcode<<8)+(condition<<4)+flag_value)
    if address<0:
        word2 = (1,abs(address))
    else:
        word2 = (0,address)
    return [word1,word2]

def assemble_type_d(opcode,line,line_number):
    '''assembles a data instruction'''
    data = line[1]
    if data[0] == "%":
        data = Label_list.find_address(data)
    else:
        data = int(data)
    if data<0:
        return [(1,abs(data))]
    else:
        return [(0,data)]


def resolve_flags(opcode,line):
    '''bootstrap flags function'''
    global op_attributes
    attributes = op_attributes(opcode)
    op_flags = attributes[1]
    flags_to_lookup,new_line = gather_flags(line)
    flag_value = create_flag_value(op_flags,flags_to_lookup)
    return new_line,flag_value

def gather_flags(line):
    '''finds flags in a line and gathers them into a list'''
    flag_list = []
    flags_to_lookup =[]
    for token in line:
        if token[0] == "@":
            flag_list.append(token)
    for flag in flag_list:
        del(line[line.index(flag)]) #removes flag from tokens
        if not(flag[1:] in flags_to_lookup):
            flags_to_lookup.append(flag[1:])
    return flags_to_lookup,line

def create_flag_value(op_flags,flags_to_lookup):
    '''generates a flag value from falgs passed to it'''
    flag_value = 0
    for flag in flags_to_lookup:
        try:
            flag_number = op_flags.index(flag)
            flag_bit = (3-flag_number)
            flag_value += 1<<flag_bit
        except:
            print "Invalid flag: ",flag
    return flag_value

#lookup instructions
def op_lookup(instruction):
    table = {
            "data":-1,
            "HLT":0,
            "ADD":1,
            "SUB":2,
            "MUL":3,
            "DIV":4,
            "MOD":5,
            "AND":6,
            "ORR":7,
            "XOR":8,
            "NOT":9,
            "NND":10,
            "NOR":11,
            "XNR":12,
            "SHR":13,
            "SHL":14,
            "ROR":15,
            "ROL":16,
            "MOV":17,
            "LOD":18,
            "STR":19,
            "PUS":20,
            "POP":21,
            "JMP":22,
            "GTO":23,
            "CMP":24,
            "CJP":25,
            "CGT":26,
            "OUT":27
            }
    try:
        return table[instruction]
    except:
        print "Unrecognised instruction:",instruction

def op_attributes(opcode):
    table = [   #Type, Flags     #type can be "h" - halt, "r" - register based, "c" -cond, "a" -address based, "v" = may not take register or addr input
                    ["h",["N","N","N","N"]],    #halt
                    ["r",["cin","cout","ain","aout"]],   #add
                    ["r",["all","cfb","ain","aout"]],    #subtract
                    ["r",["noe","nof","ain","aout"]],  #multiply
                    ["r",["ndf","N","ain","aout"]],    #divide
                    ["r",["ndf","N","ain","aout"]],  #mod
                    ["r",["N","N","ain","aout"]],    #and
                    ["r",["N","N","ain","aout"]],  #or
                    ["r",["N","N","ain","aout"]],    #xor
                    ["r",["N","N","ain","aout"]],    #not
                    ["r",["N","N","ain","aout"]],  #nand
                    ["r",["N","N","ain","aout"]],    #nor
                    ["r",["N","N","ain","aout"]],  #xnor
                    ["r",["ins","N","ain","aout"]],    #shift right
                    ["r",["ins","N","ain","aout"]],  #shift left
                    ["r",["ins","N","ain","aout"]],    #rotate right
                    ["r",["ins","N","ain","aout"]],  #rotate left
                    ["r",["des","mova","ovwr","kds"]],    #move
                    ["a",["des","lda","ldd","kds"]],  #load
                    ["a",["des","sta","N","kds"]],    #store
                    ["v",["puad","pud","pur","puab"]],  #push
                    ["v",["poad","N","por","poab"]],    #pop
                    ["v",["str","jd","jr","jab"]],  #jump
                    ["v",["str","gd","gr","iid"]],    #goto
                    ["r",["wf","ab","N","N"]],  #compare
                    ["c",["str","N","dcf","jab"]],    #conditional jump
                    ["c",["str","N","dcf","iid"]],  #conditional goto
                    ["v",["ov","oa","od","or"]], #out

                    ["d",["N","N","N","N"]] #data
                   ]
    return table[opcode]

def register_lookup(register):
    table = {
                "acc": 0,
                "ext": 1,
                "ind": 2,
                "flg": 3,
                "zro": 4,
                "one": 5,
                "ons": 6,
                "jmp": 7,
                "gp0": 8,
                "gp1": 9,
                "gp2": 10,
                "gp3": 11,
                "gp4": 12,
                "gp5": 13,
                "gp6": 14,
                "gp7": 15
                }
    try:
        return table[register]
    except KeyError:
        print "Unrecognised register:",register

def condition_lookup(condition):
    table = {
            "C":0,
            "B":1,
            "O":2,
            "D":3,
            "S":4,
            "s":5,
            "G":6,
            "L":7,
            "E":8,
            "N0":9,
            "N1":10,
            "N2":11,
            "N3":12,
            "N4":13,
            "N5":14,
            "N6":15
            }
    try:
        return table[condition]
    except:
        print "Unrecognised condition: ", condition



#bootstrap functions
def assemble_instruction(line,line_number):
    opcode,op_attributes = decode_instr_type(line)
    function_dict = {"h":assemble_type_h,"r":assemble_type_r,"a":assemble_type_a,"v":assemble_type_v,"c":assemble_type_c,"d":assemble_type_d}
    assembled_instruction = function_dict[op_attributes[0]](opcode,line,line_number)
    return assembled_instruction

def preprocess(program_file_object):
    global Label_list
    Label_list = Labellist()
    tokens =tokenize(program_file_object)
    tokens = remove_comments(tokens,1)
    tokens = find_and_replace(tokens)
    tokens = resolve_string_literals(tokens)
    tokens = import_code(tokens)
    for line in tokens:
        print line
    #tokens = space_out(tokens)
    tokens = find_labels(tokens)
    return tokens

def assemble_program(program_file_object,file_name):
    tokens = preprocess(program_file_object)
    print "\n\n"
    line_number = 0
    program = []
    for line in tokens:
        program += assemble_instruction(line,line_number)
        if line[0] == "data":
            line_number +=1
        else:
            line_number +=2
    store_list(program,file_name)
    print "\n\n"
    return program

def pretokenize_subroutine(program_file,file_name):
    tokens = find_and_replace(tokens)
    tokens = resolve_string_literals(tokens)
    return tokens


def pretokenize(program_file,file_name):
    tokens = tokenize(program_file)
    tokens = remove_comments(tokens,0)
    subroutines = find_subroutines(tokens)
    for subroutine in subroutines:
        subroutines[subroutine] = pretokenize_subroutine(subroutines[subroutine])
    store_tokenized_list(subroutines)
    return subroutines

    