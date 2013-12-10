import cipher_tools
def swap_rows(key,current_key_score,keylength,ciphertext,analysis):
	analyse = analysis.analyse #stores analyse function as local for faster access
	key_to_return = key
	score = current_key_score
	rows = find_rows(key)
	for i in xrange(5):
		for j in xrange(i+1,5):
			trial_rows = list(rows) 
			trial_rows[i],trial_rows[j] = trial_rows[j],trial_rows[i]
			trial_key = ''
			for row in trial_rows:
				trial_key += row
			sample_plaintext = decrypt(ciphertext,trial_key)
			this_score = analysis.analyse(sample_plaintext)
			if this_score >= score:
				score = this_score
				key_to_return = trial_key	
	return key_to_return,score
	
def swap_columns(key,current_key_score,keylength,ciphertext,analysis):
	analyse = analysis.analyse #stores analyse function as local for faster access
	key_to_return = key
	score = current_key_score
	columns = find_columns(key)
	for i in xrange(5):
		for j in xrange(i+1,5):
			trial_columns = list(columns) 
			try:
				trial_columns[i],trial_columns[j] = trial_columns[j],trial_columns[i]
			except: 
				print i, j
				quit()
			trial_key = ''
			for k in xrange(25):
				trial_key += columns[k%5][k//5]
			sample_plaintext = decrypt(ciphertext,trial_key)
			this_score = analysis.analyse(sample_plaintext)
			if this_score >= score:
				score = this_score
				key_to_return = trial_key	
	return key_to_return,score

class Properties:
	def __init__(self):
		self.key_length = 25
		self.key_alphabet = "ABCDEFGHIKLMNOPQRSTUVWXYZ"
		self.preprocess = cipher_tools.preprocess
		self.extra_rounds = [swap_rows,swap_columns]

Properties = Properties()

def create_grid(custom_alphabet): #creates a grid from a custom alphabet  #alphabet must exclude j
	grid = [
		list(custom_alphabet[0:5]),
		list(custom_alphabet[5:10]),
		list(custom_alphabet[10:15]),
		list(custom_alphabet[15:20]),
		list(custom_alphabet[20:25])
	]
	return grid
def find_columns(alphabet):
	grid = ['']*5
	for i in xrange(25):
		grid[i%5] += alphabet[i]
	return grid
def find_rows(alphabet):
	grid = [
		alphabet[0:5],
		alphabet[5:10],
		alphabet[10:15],
		alphabet[15:20],
		alphabet[20:25]
	]
	return grid



def find_in_grid(character,key_grid): #returns coordinates of character in grid
	if character == "J": character = "I" #i and j are the same
	for i in xrange(5):
		if character in key_grid[i]:
			for j in xrange(5):
				if key_grid[i][j] == character:
					return [i,j]
	print character

def return_from_grid(coordinates,key_grid): #returns character from grid at given coordinates
	return key_grid[coordinates[0]][coordinates[1]]


def create_bigrams(text):
	# creates a stack of chars then breaks into bigrams, including adding an x when bigram is duplicate
	char_stack = []
	for letter in text: #create stack
		char_stack.append(letter)
	char_stack.reverse() #reverse stack
	bigrams = []
	while char_stack != []:
		try:
			char1 = char_stack.pop()
			char2 = char_stack.pop()
		except:
			if char1 != "X": #stops "xx" clogging up final bigrams
				char2 = "X"
			else:
				break
		if char1 == char2:
			char_stack.append(char2)
			char2 = "X"
		bigrams.append(char1+char2)
	#print bigrams
	return bigrams

def find_new_coords_encryption(coords1,coords2): #uses playfair rules to implement encryption
	if coords1[0] == coords2[0]:
		new_coords1 = [(coords1[0]+1)%5,coords1[1]]
		new_coords2 = [(coords2[0]+1)%5,coords2[1]]
	elif coords1[1] == coords2[1]:
		new_coords1 = [coords1[0],(coords1[1]+1)%5]
		new_coords2 = [coords2[0],(coords2[1]+1)%5]
	else:
		new_coords1 = [coords1[0],coords2[1]]
		new_coords2 = [coords2[0],coords1[1]]
	#print coords1, coords2, new_coords1, new_coords2
	return new_coords1,new_coords2

def find_new_coords_decryption(coords1,coords2):
	if coords1[0] == coords2[0]:
		new_coords1 = [(coords1[0]-1)%5,coords1[1]]
		new_coords2 = [(coords2[0]-1)%5,coords2[1]]
	elif coords1[1] == coords2[1]:
		new_coords1 = [coords1[0],(coords1[1]-1)%5]
		new_coords2 = [coords2[0],(coords2[1]-1)%5]
	else:
		new_coords1 = [coords1[0],coords2[1]]
		new_coords2 = [coords2[0],coords1[1]]
	#print coords1, coords2, new_coords1, new_coords2
	return new_coords1,new_coords2

def put_bigrams_together(bigrams): #rejoins bigrams to form text
	text = ''
	for bigram in bigrams:
		text += bigram
	return text

def encrypt(plaintext,key): #runs through algorithm
	#print "encrypting"
	key_grid = create_grid(cipher_tools.preprocess(key))
	plaintext = cipher_tools.preprocess(plaintext)
	bigrams = create_bigrams(plaintext)
	encrypted_bigrams = []
	for bigram in bigrams:
		coords1 = find_in_grid(bigram[0],key_grid)
		coords2 = find_in_grid(bigram[1],key_grid)
		new_coords1,new_coords2 = find_new_coords_encryption(coords1,coords2)
		char1 = return_from_grid(new_coords1,key_grid)
		char2 = return_from_grid(new_coords2,key_grid)
		encrypted_bigrams.append(char1+char2)
	ciphertext = put_bigrams_together(encrypted_bigrams)
	return ciphertext

def decrypt(plaintext,key):
	key_grid = create_grid(key)
	#plaintext = cipher_tools.preprocess(plaintext)
	bigrams = create_bigrams(plaintext)
	encrypted_bigrams = []
	for bigram in bigrams:
		coords1 = find_in_grid(bigram[0],key_grid)
		coords2 = find_in_grid(bigram[1],key_grid)
		new_coords1,new_coords2 = find_new_coords_decryption(coords1,coords2)
		char1 = return_from_grid(new_coords1,key_grid)
		char2 = return_from_grid(new_coords2,key_grid)
		encrypted_bigrams.append(char1+char2)
	ciphertext = put_bigrams_together(encrypted_bigrams)
	return ciphertext


#plaintext = """Obtaining the key is relatively straightforward if both plaintext and ciphertext are known, however we want to find the key without knowing the plaintext. Guessing some of the words using knowledge of where the message came from, when it came from, etc. can be a huge help in reconstructing the key square. It should be recognized that guessing some of the plaintext and using that to reconstruct the keysquare is by far the easiest way to crack this cipher.
#
#Cryptanalysis of the playfair cipher is much more difficult than normal simple substitution ciphers, because digraphs (pairs of letters) are being substituted instead of monographs (single letters). If we use frequency analysis of english digraphs, we can use this information in the same way as we used the monograph frequencies, however, there are ~600 digraphs and only 26 monographs. We need far more ciphertext for the digraphic system to make reliable key choices compared to the monographic system.
#
#When cryptanalysing by hand, the following trick can be used. A Playfair digraph and its reverse (e.g. AB and BA) will decrypt to the same letter pattern in the plaintext (e.g. RE and ER). In English, there are many words which contain these reversed digraphs such as REceivER and DEpartED. Identifying nearby reversed digraphs in the ciphertext and matching the pattern to a list of known plaintext words containing the pattern is an easy way to generate possible plaintext strings with which to begin constructing the key. A good tutorial on reconstructing the key for a Playfair cipher can be found in chapter 7, "Solution to Polygraphic Substitution Systems," of Field Manual 34-40-2, produced by the United States Army.
#
#When trying to decide which algorithm was used to encrypt some ciphertext, it is useful to know that Playfair will never contain a double-letter digraph, e.g. EE. If there are no double letter digraphs in the ciphertext and the length of the message is long enough to make this statistically significant, it is very likely that the method of encryption is Playfair. Other things that will be true about the ciphertext message:
#
#The cipher message contains an even number of letters.
#A frequency count will show no more than 25 letters (with no letter J).
#If long repeats occur, they will be separated by an even number of characters. Repeated sequences will usually be an even number of characters.
#When Solving by computer, an easy way of finding a key is to start with a random square of letters. Minor changes are then introduced (i.e. swapping letters in the key) to see if the candidate plaintext is more like standard plaintext than before the change (e.g. using markov models, or trigram frequency counts). If the new square is deemed to be an improvement (plaintext has higher likelyhood), then it is adopted and then further mutated to find an even better candidate. Eventually, the plaintext or something very close to it is found by chosing the key that provides a plaintext with the highest likelyhood."
#"""
#
#key = "abcdefghiklmnopqrstuvwxyz"
#
#ciphertext = encrypt(plaintext,key)
#print ciphertext
#plaintext = decrypt(ciphertext,key)
#print plaintext