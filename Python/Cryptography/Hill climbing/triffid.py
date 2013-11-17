

class Properties():
	def __init__(self):
		self.key_length = 27
		self.key_alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ/"  #"/" is the 27th character
		self.block_length = 5

Properties = Properties()

def preprocess(text):
	#modified preprocess function
	lookup = {
	'A':'A',
	'B':'B',
	'C':'C',
	'D':'D',
	'E':'E',
	'F':'F',
	'G':'G',
	'H':'H',
	'I':'I',
	'J':'J',
	'K':'K',
	'L':'L',
	'M':'M',
	'N':'N',
	'O':'O',
	'P':'P',
	'Q':'Q',
	'R':'R',
	'S':'S',
	'T':'T',
	'U':'U',
	'V':'V',
	'W':'W',
	'X':'X',
	'Y':'Y',
	'Z':'Z',
	'a':'A',
	'b':'B',
	'c':'C',
	'd':'D',
	'e':'E',
	'f':'F',
	'g':'G',
	'h':'H',
	'i':'I',
	'j':'J',
	'k':'K',
	'l':'L',
	'm':'M',
	'n':'N',
	'o':'O',
	'p':'P',
	'q':'Q',
	'r':'R',
	's':'S',
	't':'T',
	'u':'U',
	'v':'V',
	'w':'W',
	'x':'X',
	'y':'Y',
	'z':'Z',
	'/':'/'
	}
	output_text = ''
	for char in text:
		try:
			output_text += lookup[char]
		except:
			pass
	return output_text


def create_key_matrix(key):
	#"ABCDEFGHIJKLMNOPQRSTUVWXYZ/" means A = 000 B = 001 etc
	key = preprocess(key)
	if not "/" in key:
		key += "/"
	forwards_lookup = {}
	backwards_lookup = {}
	for i in xrange(27):
		lookup_result = (i//9,(i//3)%3,i%3)
		forwards_lookup[key[i]] = lookup_result
		backwards_lookup[lookup_result] = key[i]
	return forwards_lookup,backwards_lookup

def create_blocks(text):
	block_length = Properties.block_length
	text = preprocess(text)
	blocks = []
	i = 0
	length = len(text)
	needs_padding = length%block_length
	if needs_padding:
		text += "X" *(block_length-needs_padding)
	while i < length:
		block = text[i:i+block_length]
		blocks.append(block)
		i += block_length
	return blocks


def encrypt_block(block,lookup,lookup_reverse):
	row_1 = []
	row_2 = []
	row_3 = []
	for character in block:
		trinary = lookup[character]
		row_1.append(trinary[0])
		row_2.append(trinary[1])
		row_3.append(trinary[2])
	row = row_1+row_2+row_3
	block = ''
	#print row
	for trit_1,trit_2,trit_3 in zip(row[0::3], row[1::3],row[2::3]):
		block += lookup_reverse[(trit_1,trit_2,trit_3)]
	return block

def decrypt_block(block,lookup,lookup_reverse):
	row = []
	for character in block:
		row += lookup[character]
	row_1 = row[:Properties.block_length]
	row_2 = row[Properties.block_length:Properties.block_length*2]
	row_3 = row[Properties.block_length*2:]
	block = ''
	for i in xrange(Properties.block_length):
		try:
			block += lookup_reverse[(row_1[i],row_2[i],row_3[i])]
		except IndexError:
			pass
	return block

def encrypt(text,key):
	blocks = create_blocks(text)
	lookup,lookup_reverse = create_key_matrix(key)
	text = ''
	for block in blocks:
		text += encrypt_block(block,lookup,lookup_reverse)
	return text


def decrypt(text,key):
	blocks = create_blocks(text)
	lookup,lookup_reverse = create_key_matrix(key)
	text = ''
	for block in blocks:
		text += decrypt_block(block,lookup,lookup_reverse)
	return text
	

#key = "ABCDEFGHIJKLMNOPQRSTUVWXYZ/"
#plaintext = '''WHENIARRIVEDTHESTUDIOWASALREADYSTOCKEDWITHPAINTS
#ANDCANVASBUTTHEPROFESSORHELPEDMEEXPLAINTODANIELTHATTHEFORGERIESWOULDBEQUICKLYDET
#ECTEDIFWEUSEDTHEMSHEWASPAINTEDONAPOPLARBOARDRATHERTHANASTRETCHEDCANVASANDTHEPIGM
#ENTSUSEDBYTHEMASTERWEREVERYDIFFERENTFROMTHEONESWEUSETODAYNOWTHEYBRINGMETHEPIGMEN
#TSIASKFORSOFTCHALKYBLOODREDSANGUINEANDMUSTARDYELLOWOCHRESFROMTHESOILSOFITALYIMIX
#THEMWITHLINSEEDOILBOILEDANDAGEDINAKETTLEPROPERLYPREPAREDTHESEPAINTSAREINDISTINGU
#ISHABLEFROMTHEONESUSEDONTHEORIGINALANDTHECOPYISMORELIKELYTOBEBETRAYEDBYACARELESS
#BRUSHSTROKEORAMISPLACEDHIGHLIGHTTHEPROFESSORSEESQUICKLYWHENMYTIREDEYESHAVEMISSED
#ATONEANDIHAVEMADEENOUGHDELIBERATEMISTAKESTOCONVINCETHEMTOMOVEMYSTUDIOTOTHEATTICW
#HERETHELIGHTISBETTERFROMTHEREIHAVEAVIEWOFTHECITYANDAREMINDEROFFREEDOMTHEYSTILLIN
#SISTTHATISLEEPHEREINTHECELLARBUTTHATGIVESMEANOTHERFREEDOMTHEFLICKERINGCANDLESCAS
#TDEEPSHADOWSWHICHHIDEMYOTHERWORKIFICANNOTBEFREEPERHAPSSHECAN'''
#ciphertext = encrypt(plaintext,key)

#print len(preprocess(plaintext)),len(ciphertext)

#print ciphertext
#print decrypt(ciphertext,key)
