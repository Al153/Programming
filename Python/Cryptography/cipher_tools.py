# A selection of tools fro classical cryptography
def preprocess(text):
	lookup = {'A':'a','B':'b','C':'c','D':'d','E':'e','F':'f','G':'g','H':'h','I':'i','J':'j','K':'k','L':'l','M':'m','N':'n','O':'o','P':'p','Q':'q','R':'r','S':'s','T':'t','U':'u','V':'v','W':'w','X':'x','Y':'y','Z':'z','a':'a','b':'b','c':'c','d':'d','e':'e','f':'f','g':'g','h':'h','i':'i','j':'j','k':'k','l':'l','m':'m','n':'n','o':'o','p':'p','q':'q','r':'r','s':'s','t':'t','u':'u','v':'v','w':'w','x':'x','y':'y','z':'z'}
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
    alphabet = "abcdefghijklmnopqrstuvwxyz"
    return alphabet[integer%26]
    