def low_level_assemble(line_list):
	for line in line_list:
		tokens = tokenize(line)
		line_no = int(tokens[0])






def tokenise(line):
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