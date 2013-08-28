class Lookups(): #Arrays for lookups
    lookupTable = {'A':0,'B':1,'C':2,'D':3,'E':4,'F':5,'G':6,'H':7,'I':8,'J':9,'K':10,'L':11,
             'M':12,'N':13,'O':14,'P':15,'Q':16,'R':17,'S':18,'T':19,'U':20,'V':21,'W':22,
             'X':23,'Y':24,'Z':25} # Dictionary
    lowercase = ('a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z')
    uppercase = ('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z')


    def char_to_int(self,char): #Character => integer
        
        for i in range(26):
            if char == self.lowercase[i]: #Linear search to convert lowercase letters
                char = self.uppercase[i]
                break
            elif char == self.uppercase[i]:
                break
        return self.lookupTable[char]
    
    def int_to_char(self,integer): #Integer => character
        return self.uppercase[integer]
    
    def preprocess(self,string): #Removes spaces, punctuation etc
        result = []
        for i in range(len(string)):
            if string[i] in self.uppercase + self.lowercase:
                result.append(string[i])
        return result

Lookup = Lookups()

plaintext = str(raw_input("plain/ciphertext: "))
key = int(input("Key (put minus sign in front of key for decryption): "))
plaintext = Lookup.preprocess(plaintext)
ciphertext = []
for i in range (len(plaintext)):
    temp = Lookup.char_to_int(plaintext[i])
    temp += key # Caesar shift is here
    temp %= 26
    ciphertext.append(Lookup.int_to_char(temp))
print ''.join(ciphertext)



    
