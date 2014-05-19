class Tools: #Arrays for lookups
    lowercase,uppercase = ('a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'),('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z')
    def char_to_int(self,char): #Character => integer
        try:return self.uppercase.index(char)
        except ValueError:
            try:return self.lowercase.index(char)
            except ValueError:
                print "Failure"
                return -1            
    def int_to_char(self,integer): #Integer => character
        return self.uppercase[integer]
    def preprocess(self,string): #Removes spaces, punctuation etc.
        result = []
        for i in range(len(string)):
            if string[i] in self.uppercase + self.lowercase:
                result.append(string[i])
        return result
class Cipher:
    def __init__(self,keyword):
        self.key,keyword = [],LookUp.preprocess(keyword)
        for i in range(len(keyword)):self.key.append(LookUp.char_to_int(keyword[i]))#loading key                           
    def encrypt(self,plaintext):
        plaintext,ciphertext = LookUp.preprocess(plaintext),''
        for i in range(len(plaintext)):ciphertext += LookUp.int_to_char((LookUp.char_to_int(plaintext[i]) + self.key[i%len(self.key)])%26) #Encryption step
        return ciphertext
    def decrypt(self,ciphertext):
        ciphertext,plaintext = LookUp.preprocess(ciphertext),''
        for i in range(len(ciphertext)):plaintext += LookUp.int_to_char((LookUp.char_to_int(ciphertext[i]) - self.key[i%len(self.key)])%26) #Decryption step
        return plaintext
LookUp = Tools()
Vignere = Cipher("lemon")
plaintext =  '''attack at dawn
'''
ciphertext = Vignere.encrypt(plaintext)
plaintext = Vignere.decrypt(ciphertext)
print ciphertext
print plaintext

