# A selection of tools fro classical cryptography
def preprocess(text):
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
	'z':'Z'
	}
	output_text = ''
	for char in text:
		try:
			output_text += lookup[char]
		except:
			pass
	return output_text




def char_to_int(char): #Character => integer
		#converts a char to a number from 0-25
	lookup =  {
		'A':0,
		'B':1,
		'C':2,
		'D':3,
		'E':4,
		'F':5,
		'G':6,
		'H':7,
		'I':8,
		'J':9,
		'K':10,
		'L':11,
		'M':12,
		'N':13,
		'O':14,
		'P':15,
		'Q':16,
		'R':17,
		'S':18,
		'T':19,
		'U':20,
		'V':21,
		'W':22,
		'X':23,
		'Y':24,
		'Z':25,
		'a':0,
		'b':1,
		'c':2,
		'd':3,
		'e':4,
		'f':5,
		'g':6,
		'h':7,
		'i':8,
		'j':9,
		'k':10,
		'l':11,
		'm':12,
		'n':13,
		'o':14,
		'p':15,
		'q':16,
		'r':17,
		's':18,
		't':19,
		'u':20,
		'v':21,
		'w':22,
		'x':23,
		'y':24,
		'z':25
		} 
	return lookup[char]
    
def int_to_char(integer): #Integer => character
    alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    return alphabet[integer%26]
    