import sys

opcode_lookup = {
"HLT": 0x0,
"LTA": 0x1,
"LTI": 0x2,
"LDA": 0x3,
"STA": 0x4,
"MVT": 0x5,
"MVF": 0x6,
"CMP": 0x7,
"JMP": 0x8,
"JPE": 0x9,
"JPG": 0xa,
"JPL": 0xb,
"ADD": 0xc,
"AND": 0xd,
"NOT": 0xe,
"SHR": 0xf
}

def assemble():
	tokens = full_text_tokenize(open(sys.argv[-1]))
	tokens = sort_out_labels(tokens)
	tokens = fill_gaps(tokens)
	machine_code = low_level_assemble(tokens)
	print machine_code

def full_text_tokenize(text_file):
    token_list = []
    string = 0
    escaped = 0
    array = 0
    for line in text_file:
        if not string and not array:
            line_tokens= []
            current_token = ''
        if line[:7] == "<Python>":
        	line = str(eval(line[7:]))
        for character in line:
            if not string and not array:
                if character == '"' and current_token == '':
                    string = 1
                elif character == '[' and current_token == '':
                	array = 1
                	current_token = "["

                elif character == "#" and current_token == '':
                    break
                elif character != " " and character != "\t" and character != "\n":
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
                    if character == '"':
                        current_token += '"'
                    if character == "n":
                        current_token += "\n"
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
    #print token_list
    return token_list

def sort_out_labels(tokens):
	count = 0
	label_dict = {}
	for i in xrange(len(tokens)):
		#print tokens[i]
		for j in xrange(len(tokens[i])):
			if tokens[i][j][0] == "%":
				label_dict[tokens[i][j][1:]] = str(count)
				del tokens[i][j]
			count +=2
	for i in xrange(len(tokens)):
		for j in xrange(len(tokens[i])):
			tokens[i][j] = label_dict.get(tokens[i][j],tokens[i][j])
	return tokens

def fill_gaps(tokens):
	for i in xrange(len(tokens)):
		if tokens[i][0] == "HLT":
			tokens[i] = ["HLT",0,0]
		elif tokens[i][0] == "LTA":
			tokens[i] = ["LTA",0,int(tokens[i][1])%256]
		elif tokens[i][0] == "LTI":
			tokens[i] = ["LTI",int(tokens[i][1])%16,int(tokens[i][2])%256]
		elif tokens[i][0] == "LDA":
			tokens[i] = ["LDA",int(tokens[i][1])%16 if len(tokens[i]) else 0 ,int(tokens[i][-1])%256]
		elif tokens[i][0] == "STA":
			tokens[i] = ["STA",int(tokens[i][1])%16 if len(tokens[i]) else 0 ,int(tokens[i][-1])%256]
		elif tokens[i][0] == "MVT":
			tokens[i] = ["MVt",int(tokens[i][1])%16,0]
		elif tokens[i][0] == "MVF":
			tokens[i] = ["MVF",int(tokens[i][1])%16,0]
		elif tokens[i][0] == "CMP":
			tokens[i] = ["CMP",int(tokens[i][1])%16 if len(tokens[i]) else 0 ,int(tokens[i][-1])%256]
		elif tokens[i][0] == "JMP":
			tokens[i] = ["JMP",int(tokens[i][1])%16 if len(tokens[i]) else 0 ,int(tokens[i][-1])%256]
		elif tokens[i][0] == "JPE":
			tokens[i] = ["JPE",int(tokens[i][1])%16 if len(tokens[i]) else 0 ,int(tokens[i][-1])%256]
		elif tokens[i][0] == "JPG":
			tokens[i] = ["JPG",int(tokens[i][1])%16 if len(tokens[i]) else 0 ,int(tokens[i][-1])%256]
		elif tokens[i][0] == "JPL":
			tokens[i] = ["JPL",int(tokens[i][1])%16 if len(tokens[i]) else 0 ,int(tokens[i][-1])%256]
		elif tokens[i][0] == "ADD":
			tokens[i] = ["ADD",int(tokens[i][1])%16 if len(tokens[i]) else 0 ,int(tokens[i][-1])%256]
		elif tokens[i][0] == "AND":
			tokens[i] = ["AND",int(tokens[i][1])%16 if len(tokens[i]) else 0 ,int(tokens[i][-1])%256]
		elif tokens[i][0] == "NOT":
			tokens[i] = ["NOT",0,0]
		elif tokens[i][0] == "SHR":
			tokens[i] = ["SHR",int(tokens[i][1])%16 if len(tokens[i]) else 0 ,int(tokens[i][-1])%256]
	return tokens

def low_level_assemble(tokens):
	byte_list = [0 for i in xrange(256)]
	i = 0
	for line in tokens:
		if i == 256:
			print "TOo MANY INSTRUCTIONS"
			quit()
		byte_list[i] = opcode_lookup[line[0]]<<4+line[1]
		byte_list[i+1] = line[2]
		i +=2
	return byte_list
		 

assemble()