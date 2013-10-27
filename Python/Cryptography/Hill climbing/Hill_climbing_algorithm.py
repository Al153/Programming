import simple_substitution as cipher #put in here name of file for particular cipher, must have a "decrypt" function "decrypt(ciphertext,key"

import cipher_text_analyser as analysis

import random
import cipher_tools


key_length = cipher.Properties.key_length  #cipher file needs a properties class instance with a value of keylength (25 or 26)
key_alphabet = cipher.Properties.key_alphabet #the alphabet for a particular cipher, eg one without j or q for the playfair



#_______________________________transformations_________________________________

def swap(key,current_key_score,keylength,ciphertext):
	#swaps pairs of characters in the key, taking sample analysis and returns the best key
	analyse = analysis.analyse #stores analyse function as local for faster access
	key_to_return = key
	score = current_key_score
	key_list = list(key)       #stores a list of keys outside of loop for easy access
	for i in xrange(keylength):
		for j in xrange(i,keylength):
			trial_key = list(key_list)

			temp = trial_key[i]
			trial_key[i] = trial_key[j]
			trial_key[j] = temp   #swaps two characters
			
			trial_key = ''.join(trial_key)
			
			sample_plaintext = cipher.decrypt(ciphertext,trial_key)
			this_score = analysis.analyse(sample_plaintext)
			#print this_score
			
			if this_score >= score:
				score = this_score
				key_to_return = trial_key

	return key_to_return,score

def rotate(key,current_key_score,keylength,ciphertext): #shifts thekey around
	analyse = analysis.analyse #stores analyse function as local for faster access
	key_to_return = key
	score = current_key_score
	trial_key = key
	for i in xrange(keylength):
		trial_key = trial_key[1:]+trial_key[:1]
		sample_plaintext = cipher.decrypt(ciphertext,trial_key)
		this_score = analysis.analyse(sample_plaintext)
		if this_score >= score:
			score = this_score
			key_to_return = trial_key
			#print "rotating"
	return key_to_return,score

def flip(key,current_key_score, keylength,ciphertext):
	key_list = list(key)
	key_list.reverse()
	sample_plaintext = cipher.decrypt(ciphertext,''.join(key_list))
	this_score = analysis.analyse(sample_plaintext)
	if this_score > current_key_score:
		return ''.join(key_list),this_score
	else:
		return key,current_key_score


def hill_climb(ciphertext):
	ciphertext = cipher_tools.preprocess(ciphertext)
	key_length = cipher.Properties.key_length  #cipher file needs a properties class instance with a value of keylength (25 or 26)
	key_alphabet = cipher.Properties.key_alphabet #the alphabet for a particular cipher, eg one without j or q for the playfair
	#local_maxima = []
	score = analysis.analyse(cipher.decrypt(ciphertext,key_alphabet))

	while score< -2.4: #while score not high enough to constitute a plaintext
		shuffled_key = list(key_alphabet)
		random.shuffle(shuffled_key)#creates a random key at the start of each round
		current_key = ''.join(shuffled_key)
		previous_key = key_alphabet
		new_score = analysis.analyse(cipher.decrypt(ciphertext,current_key))
		while current_key != previous_key: #"until best key is current key"
			previous_key = str(current_key)
			for i in xrange(10):  #runs a swap round 10 times
				current_key,new_score = swap(current_key,new_score,key_length,ciphertext)
				#if current_key == previous_key:
				#	print "keys are equal"
			print current_key, new_score
			

			current_key,new_score = rotate(current_key,new_score,key_length,ciphertext) #runs a rotate round once
			current_key,new_score = flip(current_key,new_score,key_length,ciphertext) #runs a flip round once

			if current_key == previous_key:
				print "keys are equal"

			#print current_key, new_score
		#local_maxima.apppend([new_score,current_key])
		score = new_score

	return current_key,cipher.decrypt(ciphertext,current_key)










def partial_hill_climb(ciphertext,key):
	#runs a partial hill climb to to attempt to improve an imperfect key
	ciphertext = cipher_tools.preprocess(ciphertext)
	key_length = cipher.Properties.key_length  #cipher file needs a properties class instance with a value of keylength (25 or 26)
	key_alphabet = cipher.Properties.key_alphabet #the alphabet for a particular cipher, eg one without j or q for the playfair

	shuffled_key = list(key_alphabet)
	random.shuffle(shuffled_key) #creates a random key at the start of each round
	previous_key = ''.join(shuffled_key)
	current_key = key
	new_score = analysis.analyse(cipher.decrypt(ciphertext,current_key))
	while current_key != previous_key: #"until best key is current key"
		previous_key = current_key
		for i in xrange(5):  #runs a swap round 5 times
			current_key,new_score = swap(current_key,new_score,key_length,ciphertext)

		current_key,new_score = rotate(current_key,new_score,key_length,ciphertext) #runs a rotate round once
		current_key,new_score = flip(current_key,new_score,key_length,ciphertext) #runs a flip round once

	return current_key,cipher.decrypt(ciphertext,current_key)	


plaintext = '''
Noon rings out. A wasp, making an ominous sound, a sound akin to a klaxon or a tocsin, flits about. Augustus, who has had a bad night, sits up blinking and purblind. Oh what was that word (is his thought) that ran through my brain all night, that idiotic word that, hard as I'd try to pun it down, was always just an inch or two out of my grasp - fowl or foul or Vow or Voyal? - a word which, by association, brought into play an incongruous mass and magma of nouns, idioms, slogans and sayings, a confusing, amorphous outpouring which I sought in vain to control or turn off but which wound around my mind a whirlwind of a cord, a whiplash of a cord, a cord that would split again and again, would knit again and again, of words without communication or any possibility of combination, words without pronunciation, signification or transcription but out of which, notwithstanding, was brought forth a flux, a continuous, compact and lucid flow: an intuition, a vacillating frisson of illumination as if caught in a flash of lightning or in a mist abruptly rising to unshroud an obvious sign - but a sign, alas, that would last an instant only to vanish for good.
'''

ciphertext = cipher.encrypt(plaintext,"theroncwasbyldmfgijkpquvxz"
)

print analysis.analyse(cipher_tools.preprocess(plaintext))
#ciphertext = '''NKRSA ZYIUA YOTYG XKOYA VVUYK QOTJO TZNKO XUCTC GEHAZ ZNKXK OYROZ ZRKCG XSZNO TZNKQ OTJTK YYOXK IKOBK GTTGZ XOKYZ USGQK SKIUS LUXZG HRKHA ZYNKO YGLXG OJZNK YYULL OIKXC NUHXO TMYAY ZNKVG OTZOT MYOYI XAKRG TJIUC GXJRE GTJNK HKGZY GTTGO LSECU XQOYT UZMUU JKTUA MNNKO YYIGX KJZNG ZOLNK HKGZY SKNKS OMNZJ GSGMK SENGT JYGTJ ZUUYI GXKJZ UHKGZ NKXNA YHGTJ JGTOK RGHKG XULGS GTCNU ZUCKX YUBKX NOSOZ JUKYT ZSGZZ KXZNK XKGRV UCKXR OKYCO ZNZNK HARRE NKIUA RJNGB KAYGR RYNUZ GTJCK GRRQT UCOZJ GTOKR YIGXK YSKZU UHAZU TREHK IGAYK NKXKS OTJYS KULNK RSAZG TJZNG ZXKSO TJYSK ULZNK IGSVN KTKBK XYVKG QYTKB KXRUU QYSKO TZNKK EKGTJ TKBKX CGTZY GTEZN OTMLX USSKO ZNOTQ NKNGZ KYSKL UXHXO TMOTM ZNKYY ZUNOY NUAYK HAZLU XGTTG YYGQK NKHXO TMYSK CNGZO TKKJC NGZOS UYZTK KJOYG CGEUA ZULNK XKCNK TOGSM UTKGT TGYHK GZOTM YCORR YZUVG TJSGE HKJGT OKRCO RRYZU VNGZO TMSKH AZOGS CGZIN KJGRR JGEGT JZNKN UAYKO YRUIQ KJGZT OMNZZ NGZCO RRTUZ YZUVS KLXUS ZXEOT M'''

print hill_climb(ciphertext)






