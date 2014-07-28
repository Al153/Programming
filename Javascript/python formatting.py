def filter(text):
	text = remove_caps(text)
	text = expand_abbreviations(text)
	text = spell_check(text)
	return text


