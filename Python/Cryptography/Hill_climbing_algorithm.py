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
			this_score = analyse(sample_plaintext)
			
			if this_score <= score:
				score = this_score
				key_to_return = trial_key
				#]print score
#			#print key_to_return
#	if key == key_to_return:
#		print "returning original key"
#	else:
#		print "returning new key"
	return key_to_return,score

def rotate(key,current_key_score,keylength,ciphertext): #shifts thekey around
	analyse = analysis.analyse #stores analyse function as local for faster access
	key_to_return = key
	score = current_key_score
	trial_key = key
	for i in xrange(keylength):
		trial_key = trial_key[1:]+trial_key[:1]
		sample_plaintext = cipher.decrypt(ciphertext,trial_key)
		this_score = analyse(sample_plaintext)
		if this_score < score:
			score = this_score
			key_to_return = trial_key
			print "rotating"
	return key_to_return,score

def flip(key,current_key_score, keylength,ciphertext):
	key_list = list(key)
	key_list.reverse()
	sample_plaintext = cipher.decrypt(ciphertext,''.join(key_list))
	this_score = analysis.analyse(sample_plaintext)
	if this_score < current_key_score:
		return ''.join(key_list),this_score
	else:
		return key,current_key_score


def hill_climb(ciphertext):
	ciphertext = cipher_tools.preprocess(ciphertext)
	key_length = cipher.Properties.key_length  #cipher file needs a properties class instance with a value of keylength (25 or 26)
	key_alphabet = cipher.Properties.key_alphabet #the alphabet for a particular cipher, eg one without j or q for the playfair
	#local_maxima = []
	score = analysis.analyse(cipher.decrypt(ciphertext,key_alphabet))

	while score>20: #while score not high enough to constitute a plaintext
		shuffled_key = list(key_alphabet)
		random.shuffle(shuffled_key)#creates a random key at the start of each round
		current_key = ''.join(shuffled_key)
		previous_key = key_alphabet
		new_score = analysis.analyse(cipher.decrypt(ciphertext,current_key))
		while current_key != previous_key: #"until best key is current key"
			previous_key = str(current_key)
			for i in xrange(5):  #runs a swap round 5 times
				current_key,new_score = swap(current_key,new_score,key_length,ciphertext)
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



ciphertext = cipher.encrypt('''dear phil, 

how could i pass up the opportunity to work on this? i had a crack at another of the notes you found in montmartre. it looks like the oldest item in the packet and i thought it might be a good place to start. it makes some sense of the buchenwald reference in the later note you sent. 

it didn't explain the paris link so i sent a team into that neighbourhood to gather intel but they didn't come up with very much. we did get one report that the house had been owned by a german family before the war, but that it had been taken over by an ss officer in nineteen forty one. surete records suggest that the family came from weimar in august nineteen thirty seven, which is suggestive given the timing and the geography, so i have sent the team to buchenwald to see what they can find. 

i am jumping to conclusions here, but the portrait sarah mentions has to be the mona lisa. i have been trying to get access to it, but the french authorities are spooked. the theft of the painting by peruggia back in nineteen eleven has made them very sensitive. the name chaudron was mentioned more than once, and i need some time to look into the history. 

if you have any influence at all at the museum i think we need a proper examination of the painting, and i need to know what happened to it during the war. 

all the best, 

harry''',"helowrdabcfgijkmnpqstuvxyz")

ciphertext = '''YWBRBSGG WG HC PS TCIBR SJSFMKVSFS, SJSB WB HVWG GHWBYWBU DZOQS. HVS UIOFRG HOYS OKOM OBMHVWBU HVSM QOB HVOH AWUVH PFWBU IG GCAS XCM, PIH HVSM QOB'H HOYS SJSFMHVWBU. GCAS CT HVS UWFZG GWBU, CHVSFG HSZZ GHCFWSG HC YSSD HVS TSOF OH HVS SRUS CT CIF VSOFHG - WH BSJSF QCADZSHSZM ZSOJSG IG - OBR AM DWQHIFSG OFS OZZ W VOJS HC CTTSF WB FSHIFB. DODSF WG DFSQWCIG OBR ACGH CT AM DOWBHWBUG OBR GYSHQVSG OFS VWRRSB CB HVS FCIUV KCCRSB GZOHG CT CIF PIBYG IBRSF HVS HVWB AOHHFSGGSG. RSHOWZ WG WADCGGWPZS, PIH KCIZR PS VOFR SJSB CB TWBS QOBJOG UWJSB HVS DWUASBHG W QOB AOYS TFCA HVS PFWQY RIGH, GCWZ OBR GQFIPPM KSSRG WB HVS QOAD. W OA HVOBYTIZ SJSFMROM TCF AM UFOBRTOHVSF'G WBGWGHSBQS HVOH OB OFHWGH GVCIZR PS OPZS HC AOYS HVSWF CKB QCZCIFG. KVSB W RC TWBR DODSF, W KFWHS. HVWG UFSOGM GQFOD KOG HVS KFODDWBU CB O UIOFR'G GOBRKWQV OBR HVS UFSOGS KCIZR AOYS WH WADCGGWPZS HC DOWBH CB SJSB WT W KOBHSR HC, PIH QVOFQCOZ TOZZSB TFCA O UIOFR'G PFONWSF GSSAG HC KCFY TWBS. 

HVS CHVSFG WB AM RCFAWHCFM HSZZ AS HC FSQCFR OG AIQV OG W QOB. BCBS CT IG YBCK WT KS KWZZ ZWJS HC HSZZ HVS KCFZR CT HVS HSFFWPZS HVWBUG HVOH VODDSB VSFS, GC W RFOK OBR, KVSB W QOB, W KFWHS, OZKOMG KWHV CBS SOF ZWGHSBWBU TCF HVS QFIBQV CT O PCCH CB HVS UFOJSZ CIHGWRS. HVS GHCBSG OFS GVOFD OBR HVS GCZRWSFG RCB'H UWJS IG TCCHKSOF. WH WG OBCHVSF KOM HC VIAWZWOHS IG OBR KSOF IG RCKB, PIH HVSM RC BCH FSOZWGS HVOH HVWG ASOBG HVOH KS QOB OZKOMG HSZZ KVSB HVSM OFS QCAWBU. YWBRBSGG WG HC PS TCIBR SJSFMKVSFS VSFS, SJSB WB HVSWF GHIDWR QFISZHM. 

'''

#print analysis.analyse('''dear phil, 
#
#how could i pass up the opportunity to work on this? i had a crack at another of the notes you found in montmartre. it looks like the oldest item in the packet and i thought it might be a good place to start. it makes some sense of the buchenwald reference in the later note you sent. 
#
#it didn't explain the paris link so i sent a team into that neighbourhood to gather intel but they didn't come up with very much. we did get one report that the house had been owned by a german family before the war, but that it had been taken over by an ss officer in nineteen forty one. surete records suggest that the family came from weimar in august nineteen thirty seven, which is suggestive given the timing and the geography, so i have sent the team to buchenwald to see what they can find. 
#
#i am jumping to conclusions here, but the portrait sarah mentions has to be the mona lisa. i have been trying to get access to it, but the french authorities are spooked. the theft of the painting by peruggia back in nineteen eleven has made them very sensitive. the name chaudron was mentioned more than once, and i need some time to look into the history. 
#
#if you have any influence at all at the museum i think we need a proper examination of the painting, and i need to know what happened to it during the war. 
#
#all the best, 
#
#harry''')
print hill_climb(ciphertext)






