def find_key(ciphertext):
	ciphertext = UpperCase_to_LowerCase(ciphertext)
	frequency = frequency_count(ciphertext)
	ordered_results = order(frequency)
	print ordered_results
	key = find_differences(ordered_results)
	return key

def UpperCase_to_LowerCase(text):
	new_text = ''
	lookup = {
	"A": "a",
	"B": "b",
	"C": "c",
	"D": "d",
	"E": "e", 
	"F": "f",
	"G": "g",
	"H": "h",
	"I": "i",
	"J": "j",
	"K": "k",
	"L": "l",
	"M": "m",
	"N": "n",
	"O": "o", 
	"P": "p",
	"Q": "q",
	"R": "r",
	"S": "s",
	"T": "t",
	"U": "u",
	"V": "v",
	"W": "w",
	"X": "x",
	"Y": "y",
	"Z": "z"
	}

	for char in text:
		new_text += lookup[char]
	return new_text

def char_to_int(letter):
	alphabet = "abcdefghijklmnopqrstuvwxyz"
	return alphabet.index(letter)

def frequency_count(text):
	alphabet = "abcdefghijklmnopqrstuvwxyz"
	results_table = []
	text_lookup = {
		"a":0,
		"b":0,
		"c":0,
		"d":0,
		"e":0,
		"f":0,
		"g":0,
		"h":0,
		"i":0,
		"j":0,
		"k":0,
		"l":0,
		"m":0,
		"n":0,
		"o":0,
		"p":0,
		"q":0,
		"r":0,
		"s":0,
		"t":0,
		"u":0,
		"v":0,
		"w":0,
		"x":0,
		"y":0,
		"z":0
		}


	for char in text:
		text_lookup[char] +=1
	for letter in alphabet: #transfers results into list form
		results_table.append([text_lookup[letter],letter])
	return results_table

def order(frequency_count):
	"""digests frequency_count result into an array of chars"""
	frequency_count.sort()
	print frequency_count
	results = []
	for entry in frequency_count:
		results.append(entry[1])
	results.reverse() #sort in python goes from lowest....highest
	return results

def find_differences(ordered_count):
	result_weights =range(26)
	for i in xrange(26):
		if result_weights[i]>10:
			result_weights[i]**=2
	result_weights.reverse()

	key_weightings = [0]*26
	english_frequency_values = ["e","t","a","i","o","n","s","h","r","d","l","c","u","m","w","f","g","y","p","b","v","k","j","x","q","z"]
	for i in xrange(26):
		possible_key = char_to_int(ordered_count[i])-char_to_int(english_frequency_values[i])
		key_weightings[possible_key]+=result_weights[i] #stores weighted results

	high_score = 0
	print key_weightings
	for i in xrange(26):
		if key_weightings[i] > high_score:
			high_score = key_weightings[i]
			high_score_holder = i
	return high_score_holder




