# This code is a significant simplification of a hillclimber I wrote a few years ago to
# solve several types of cipher which take an alphabet as a key.

from cipher_text_analyser import analyse

def encrypt(plaintext, key):
	base = ord('A')
	plaintext = plaintext.upper()

	chars = map(lambda c: ord(c)-base ,list(plaintext))
	chars = filter(lambda v: v < 26 and v >= 0, chars)

	ciphertext = ''.join(map(lambda c: chr((c+key)%26 + base), chars))
	return ciphertext



if __name__ == "__main__":
	import sys
	if len(sys.argv) > 0:
		ciphertext = sys.argv[1]
		potential_plaintexts = map(lambda k: encrypt(ciphertext, -k), range(26))
		max_value = -10000.0
		max_index = 0
		for i in xrange(26):
			# the analyser uses english bigram frequencies to analyse text.
			# Hence it struggles with very short pieces of text, or those using uncommon markers as
			# spaces

			# A typical score for a piece of english is around -2.2, and greater than -2.4
			this_score = analyse(potential_plaintexts[i]) 
			print this_score, potential_plaintexts[i]
			if this_score > max_value:
				max_value = this_score
				max_index = i

		print "Most likely key =", max_index, "Most likely plaintext = ", potential_plaintexts[max_index ], "score =", max_value

	else:
		print "Error: please give some ciphertext"