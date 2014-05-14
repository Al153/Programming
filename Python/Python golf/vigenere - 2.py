encrypt = lambda (text,mode,key,pointer,key_pointer,alphabet,result:  result if pointer == len(text) else encrypt(text,mode,key,pointer + 1,(key_pointer+1)%len(key) if text[pointer] in alphabet else key_pointer, alphabet,(result + alphabet[(alphabet.index(text[pointer]) + alphabet.index(key[key_pointer]))%26] if mode == "encrypt" else result + alphabet[(alphabet.index(text[pointer])%26 - alphabet.index(key[key_pointer])%26)%26]) if key[key_pointer] in alphabet and text[pointer] in alphabet else result))
print encrypt(open("file.txt").read(),"encrypt","lemon",0,0,('a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'),'')

##plaintext,key,mode
##print hello
#import sys
#print str(map(lambda char: ('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ')[char%26],
#	 [
#	 ('a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z').index(sys.argv[0][i]) + 
#	 ('a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z').index(sys.argv[1][i%len(sys.argv[1])])
#	for i in xrange(len(sys.argv[0]))]#
#

#	)) if sys.argv[2] == "encrypt" else  str(map(lambda char: ('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ')[char%26],
#	 [
#	 ('a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z').index(sys.argv[0][i]) - 
#	 ('a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z').index(sys.argv[1][i%len(sys.argv[1])])
#	for i in xrange(len(sys.argv[0]))]
#))#

#filter(lambda char: char in 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ', sys.argv[0])