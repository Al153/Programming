#print '['
#for i in range (16):
#    toprint = '[0'
#    for i in range (255):
#        toprint = toprint + ', 0'
#    toprint = toprint+']'
#    print toprint, ','
#print ']'



#myString = '''ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890
#'''
#myList = []
#for i in range(len(myString)):
#    myList.append(myString[i])
#print len(myString)
#print myList

alphabet = ['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z']
toprint = []
myString = "FVPJIAOYEDRZXWGCTKUQSBNMHL"
for i in myString:
    toprint.append(alphabet.index(i))
print toprint
