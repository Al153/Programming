def webFilter(text):
	text = remove_caps(text)
	text = expand_abbreviations(text)
	text = spell_check(text)
	text = capitalise(text)
	return text

def remove_caps(line):
	line = line.lower()
	return line

























def expand_abbreviations(line):
	tokens = line.split(" ") #tokenises the line 
	for index,token in enumerate(tokens):
		if token in common_abbreviations: #common abreviations are easy to fix
			pass
		elif token in ambiguous_abbreviations: #abbreviations which have more than one meaning
			pass
		else:
			pass
	line = ' '.join(tokens)
	return line


def expand_2(tokens,index):
