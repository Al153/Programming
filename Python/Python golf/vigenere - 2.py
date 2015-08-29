e = lambda (t,m,k,p,l,r):  r if p == len(t) else e(t,m,k,p + 1,(l+1)%len(k) if (96<ord(t[p])<123) else l, (r + chr((ord(t[p])+ord(k[l])-194)%26+97) if m == "e" else r + chr((ord(t[p])-ord(k[l]))%26+97) if (96<ord(k[l])<123)and(96<ord(t[p])<123) else r))
print e(open("file.txt").read().lower(),"e","lemon",0,0,'')

##plaint,k,m
##print hello
#import sys
#print str(map(lambda char: ('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ')[char%26],
#	 [
#	 ('a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z').index(sys.argv[0][i]) + 
#	 ('a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z').index(sys.argv[1][i%len(sys.argv[1])])
#	for i in xrange(len(sys.argv[0]))]#
#

#	)) if sys.argv[2] == "e" else  str(map(lambda char: ('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ')[char%26],
#	 [
#	 ('a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z').index(sys.argv[0][i]) - 
#	 ('a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z').index(sys.argv[1][i%len(sys.argv[1])])
#	for i in xrange(len(sys.argv[0]))]
#))#

#filter(lambda char: char in 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ', sys.argv[0])