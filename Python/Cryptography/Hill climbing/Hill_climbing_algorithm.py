<<<<<<< HEAD
#!/usr/bin/python
# -*- coding: latin-1 -*-
import os, sys
import simple_substitution as cipher #put in here name of file for particular cipher, must have a "decrypt" function "decrypt(ciphertext,key"
=======
import playfair as cipher #put in here name of file for particular cipher, must have a "decrypt" function "decrypt(ciphertext,key)"
>>>>>>> 54485397d3ef15cf5c82825fe9220a2136b5a9a3

import cipher_text_analyser as analysis

import random
import cipher_tools
import time


key_length = cipher.Properties.key_length  #cipher file needs a Properties class instance with a value of keylength (25 or 26)
key_alphabet = cipher.Properties.key_alphabet #the alphabet for a particular cipher, eg one without j or q for the playfair



#_______________________________transformations_________________________________

def swap(key,current_key_score,keylength,ciphertext):
	#swaps pairs of characters in the key, taking sample analysis and returns the best key
	analyse = analysis.analyse #stores analyse function as local for faster access
	key_to_return = key
	score = -1000#current_key_score
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
	ciphertext = cipher.Properties.preprocess(ciphertext)
	key_length = cipher.Properties.key_length  #cipher file needs a Properties class instance with a value of keylength (25 or 26)
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
			for function in cipher.Properties.extra_rounds:
				current_key,new_score = function(current_key,new_score,key_length,ciphertext,analysis) #runs a custom round round once

			if current_key == previous_key:
				print "keys are equal"

			#print current_key, new_score
		#local_maxima.apppend([new_score,current_key])
		score = new_score

	return current_key,cipher.decrypt(ciphertext,current_key)


def partial_hill_climb(ciphertext,key):
	#runs a partial hill climb to to attempt to improve an imperfect key
	ciphertext = cipher.Properties.preprocess(ciphertext)
	key_length = cipher.Properties.key_length  #cipher file needs a Properties class instance with a value of keylength (25 or 26)
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
WHENIARRIVEDTHESTUDIOWASALREADYSTOCKEDWITHPAINTS
ANDCANVASBUTTHEPROFESSORHELPEDMEEXPLAINTODANIELTHATTHEFORGERIESWOULDBEQUICKLYDET
ECTEDIFWEUSEDTHEMSHEWASPAINTEDONAPOPLARBOARDRATHERTHANASTRETCHEDCANVASANDTHEPIGM
ENTSUSEDBYTHEMASTERWEREVERYDIFFERENTFROMTHEONESWEUSETODAYNOWTHEYBRINGMETHEPIGMEN
TSIASKFORSOFTCHALKYBLOODREDSANGUINEANDMUSTARDYELLOWOCHRESFROMTHESOILSOFITALYIMIX
THEMWITHLINSEEDOILBOILEDANDAGEDINAKETTLEPROPERLYPREPAREDTHESEPAINTSAREINDISTINGU
ISHABLEFROMTHEONESUSEDONTHEORIGINALANDTHECOPYISMORELIKELYTOBEBETRAYEDBYACARELESS
BRUSHSTROKEORAMISPLACEDHIGHLIGHTTHEPROFESSORSEESQUICKLYWHENMYTIREDEYESHAVEMISSED
ATONEANDIHAVEMADEENOUGHDELIBERATEMISTAKESTOCONVINCETHEMTOMOVEMYSTUDIOTOTHEATTICW
HERETHELIGHTISBETTERFROMTHEREIHAVEAVIEWOFTHECITYANDAREMINDEROFFREEDOMTHEYSTILLIN
SISTTHATISLEEPHEREINTHECELLARBUTTHATGIVESMEANOTHERFREEDOMTHEFLICKERINGCANDLESCAS
TDEEPSHADOWSWHICHHIDEMYOTHERWORKIFICANNOTBEFREEPERHAPSSHECAN
'''
<<<<<<< HEAD
ciphertext = cipher.encrypt(plaintext,"theroncwasbyldmfgijkpquvxz")
#print ciphertext
ciphertext = '''
WWPA, AWHCRH MDY IOT NJHGK HJWLSBALH HI AWL BBHLJT, X DTUI PC VC MGPSHN HCK AHXK AVL BCAXS PMILG JAVHPCN IPBL. PZ ESPUCLS AWL RYPAT DPZ SLAPKLGLS AD AWLXY NHGK DU UYXKPF PMILGUDVC, ADV AHIL UVG HCFDUT AD WGVRLHZ XA, PUS AWL QVPYS DPZ THHF IV SLIHRO UYDT IOT IPZT. LMJTSALCA XKTH IV BHZL IOT WPPCAXUV SDVZ SXRT WPYI VU AWL QVM IN AWL LHN - UD-VCL LHH NDPCN IV IBGU XA DCTY IV AVDR XM IOTF SPSU’I RCVL PI DPZ IOTYT, HCK IOTF LLGL EYTAIF JUAPZLAF IV QL AVDRXUV MDY HVBLDUT AD ZBBVNAL P WPPCAXUV PC HCFLHN. 
HRJTZH AD AWL VHASTYN DPZ HAGHXNWAUVGDPYS HCK XA IVDR PYDBCK IDTUIF BPCBILH AD ZLPIJW AWL RVEF LPIO IOT VGPVPCHA. P WPS AWL EHXUIPCN PTDUV H QBCJW VU YTWGVSBRAXVCZ XU IOT TJZTBB ZWVE HCK RHBWTK DBI MDY IOT UXNWA XU IOT NJHGKH’ IPAWYDVB. AJYCZ DBI AWLN WGLULG AD BHL IOT KXYTJIVGZ’ UHRPAPIPTZ JW DU IOT ADW USDVG. DXAW AWL CLL LMOXIXAXVC VELCPCN DU HHIBGKPF IOT WAHRL LHH IJZN LCVJNW AD ZAPE VJA UPGZI AWPCN PUS, HH HGYPUVLS, P BHSL HBGL X DPZ UPGZI PCAD AWL HODW. X UDD WHKL IOT ODUDBG VU OPCXUV IDBVOI AWL ROTHELHA TCTY LVGR QF SH KPCJX. VG UDA. 
IOT E-GHN YTZJSIZ RHBL QHRR IOXZ BVGUXUV HCK, PZ NVJ ZJZELRATK, IOXZ XZ DUT VU ZPYP’Z UHZLH. P PT IVAK XA XZ RSDZT AD WTYULRA, QBI, OXKSLC BCKTY IOT SPFTYH VU WPPCA, HOT ZRYXIQSTK P WXJIBGL DM IOT UPGX LPNAL TTQSTT XU ALPK. HOT ZXNCLS PI Z IVD. AWL ILRO VBNZ IOXUZ ZWL BHN OPCT BHLS H QPI VU VAK EPEL APZL P JGHNVC AD KTMPJT AWL QVPYS ITMDYT ZWL HAPYILS DDYZ VC PI. HCFLHN, AWHI STHKLH AWL FBTZIPDU DM LOTYT AWL WLAS IOT YTHA WPPCAXUV TXNWA QL. XA’H OPYS AD ITSXLKL IOPA HOT STMI PI DXAW AWL HZ PUS P RHC’A HLT OTY VVXUV VC AWL GBC DXAW PI ZIBRR JUSLG OTY RVPA. XA’H UDA APZL HOT JDBAK GVAS XA JW. 
X DDYZLS AWYDBVO HVBL BVGL DM IOT UPGX WPWTYH HCK UVJUS AWPH UDAT. HI STHHA XA ILASH BH DWLGL HOT DTUI. SDVZZ APZL IOT JXWWLG JALGR LHH IPJZ IN AWL LHN. P WHKL BVKLS VC AD CTUXJT AD AGF IV UPCK PUN AGHRL DM HHGH IOTYT, IJA X OPCT H ULTSXUV AWL HVABIPDU IV IOXZ BFHATYN PH IPJZ PC WPYXZ LOTYT PI HAS QLVHC. P ALUA IOT WPPCAXUV HI AWL EHGPH VUMXJT. TPFQL NVJ JDBAK PYGHCNT AD YTAJYC PI? PI ZWVJSS IT LPZXLG AD NTA XA XU IOPU XA LHH AD LMAGHRA XA. 
PSA AWL QLHA, 
WHGYN'''
#print analysis.analyse(cipher_tools.preprocess(plaintext))
=======
ciphertext = cipher.encrypt(plaintext,"theroncwasbyldmfgikpquvxz")

#ciphertext = '''
#HITHH NFRFE RTEAO FFTNA SLTYO RRREQ THIMS ERULR HFSET AEEIU IWSIH BNRRT SIOII ENIRH MRPYT DTOEI RCITA LNBRP NHTOH ORLIE WTSHT ESPOS OTOYN UWHRE DHHCP ICMNO OTAHA SHTIJ EANET OFRNE USRAG MXURT TOWLE ATBRT EPPTR AAESE NETHH RISNR STSTR NFLDO GHAUM GSESE AKUNT IAHYT TNYUN TNNVH IGWLE WFIAP ASREL FAIEB APCMC PLAHE THTOL HWSUL ADSEU VEAEO TAEUT ATEEF EHLBH TRSHG ATLIA CEEHT RNHGA ASIET UFNNP UREHR ELITT MUDYI NNUEG ICOUE NDEEI AHSUE LHTNO AHTIE AINYF DNIAU OENAT IYEFO HEDAL UAROE RYHUR AERAT ERAHI AONGT WISWS AITBU LTAOM XLETO REOTO TONAO ORTGB CVAIP NLEEW FYRTA EOADU WWETR RTNLR PFPAI ELLRI MNTRO WIEQR ECUAR NDOTA FNROT ELETP ENRPM SHNDD ETDEW HEFOY PEDEN NSNEE GTATE EANES ERTGD LUEOS RBURO WHDGB RPAHE NYTTE KRERT RRHNF NEDOL TSWSI ANIYP OTHMO UOCTY EIEEP ONHKR NNTAI RLTEE IUREM NITAP HOEAO HHNOU UMTKV SENED EEOID PWKIE GTIII OSENH UUFAN BEUIT HRAER HIEEH UAYAS RUSIW GADSI SITRL GFPHI LTWII SIHES URMRO MACEI SOILV DEOEL USAIR IDEOT NFIES OBNTS APOFG SODRT FIRPL TANET RLYIO SOTYO ESSFN TPHEA IGEAO RAIEI TDMTA AEGRH YASRR CFELR TLEEA NEHVE HIVMH NASSI EROIX LMPSJ TTESO FBMRH NDIOC HECNB TTNCO MPUSE SOEHT ENETF IENOO TNWOO TEERI LTOIG DOSME HOIFM LROEF FDTUE SOFLE RWIIY QDBZO TTNRF ANTDI GONTA LAEPD SHEAM NTHLP SNBTU OAHAA LPLEM NPDRS HVNAI AELNH CALIS KACDO AEDTJ GHOIE ADGWA YNDET ENHEG EEUEO EEDNO RYYRF CTEMT TWNTG DETAS UOOOT FWYMI HRGRH OESIN RRAOF RETFE NPOYA ISSES STNHH AYEUL HIWPC TEATU APEAN LUEEL WAHAO ELURE SNBII EASAE TEAGC DCSOR EPSRO ENSEL VOSED UDSIT LTEIT TFSEO ESNLN GINOE RNTEI EIWWL WHTEI RSIIL HTDSR NDESR FHRNT LGRSU ASEDA DOYTA SADUT ENWIT CNAME TERTP OESYT OTOCN YUTSO GCMUD LPADL EADOT EFDSB FELEA HAXRS ONIDT IEIPR ASHIC DCSHI PBIEL SLNAL HORFR ENTAT ORAIE MKLAG RETMR DCWSN AYNWS VNULD OREKU TNNOU TIIUN NHVNI EILOH LTEFN AEATU IFTTA CETLN NRBHB EGLOS NAONM IFKOA RONSN VNFRE TRCFT HDETP SWSUC PERCW TPOAW FHDAY ISOOA GOAEL NDFIG NGRTE BLTLL GFO
#'''#print analysis.analyse(cipher_tools.preprocess(plaintext))

>>>>>>> 54485397d3ef15cf5c82825fe9220a2136b5a9a3
#ciphertext = '''NKRSA ZYIUA YOTYG XKOYA VVUYK QOTJO TZNKO XUCTC GEHAZ ZNKXK OYROZ ZRKCG XSZNO TZNKQ OTJTK YYOXK IKOBK GTTGZ XOKYZ USGQK SKIUS LUXZG HRKHA ZYNKO YGLXG OJZNK YYULL OIKXC NUHXO TMYAY ZNKVG OTZOT MYOYI XAKRG TJIUC GXJRE GTJNK HKGZY GTTGO LSECU XQOYT UZMUU JKTUA MNNKO YYIGX KJZNG ZOLNK HKGZY SKNKS OMNZJ GSGMK SENGT JYGTJ ZUUYI GXKJZ UHKGZ NKXNA YHGTJ JGTOK RGHKG XULGS GTCNU ZUCKX YUBKX NOSOZ JUKYT ZSGZZ KXZNK XKGRV UCKXR OKYCO ZNZNK HARRE NKIUA RJNGB KAYGR RYNUZ GTJCK GRRQT UCOZJ GTOKR YIGXK YSKZU UHAZU TREHK IGAYK NKXKS OTJYS KULNK RSAZG TJZNG ZXKSO TJYSK ULZNK IGSVN KTKBK XYVKG QYTKB KXRUU QYSKO TZNKK EKGTJ TKBKX CGTZY GTEZN OTMLX USSKO ZNOTQ NKNGZ KYSKL UXHXO TMOTM ZNKYY ZUNOY NUAYK HAZLU XGTTG YYGQK NKHXO TMYSK CNGZO TKKJC NGZOS UYZTK KJOYG CGEUA ZULNK XKCNK TOGSM UTKGT TGYHK GZOTM YCORR YZUVG TJSGE HKJGT OKRCO RRYZU VNGZO TMSKH AZOGS CGZIN KJGRR JGEGT JZNKN UAYKO YRUIQ KJGZT OMNZZ NGZCO RRTUZ YZUVS KLXUS ZXEOT M'''
start = time.time()
print hill_climb(ciphertext)
print "Time taken: ", time.time()-start,"seconds"





