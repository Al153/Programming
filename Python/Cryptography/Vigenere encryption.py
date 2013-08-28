import time 

class Tools: #Arrays for lookups
    lowercase = ('a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z')
    uppercase = ('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z')
    def char_to_int(self,char): #Character => integer
        try:
            return self.uppercase.index(char)
            
        except ValueError:
            try:
                return self.lowercase.index(char)
                
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
        self.key = []
        keyword = LookUp.preprocess(keyword)
        for i in range(len(keyword)):
            self.key.append(LookUp.char_to_int(keyword[i]))#loading key
        
                            
    def encrypt(self,plaintext):
        plaintext = LookUp.preprocess(plaintext)
        ciphertext = ''
        for i in range(len(plaintext)):
            temp = (LookUp.char_to_int(plaintext[i]) + self.key[i%len(self.key)])%26 #Encryption step
            ciphertext += LookUp.int_to_char(temp)
        return ciphertext
    def decrypt(self,ciphertext):
        ciphertext = LookUp.preprocess(ciphertext)
        plaintext = ''
        for i in range(len(ciphertext)):
            temp = (LookUp.char_to_int(ciphertext[i]) - self.key[i%len(self.key)])%26 #Decryption step
            plaintext += LookUp.int_to_char(temp)
        return plaintext


LookUp = Tools()
start = time.time() #benchmarking
Vignere = Cipher("Hello")
plaintext =  '''

hereuponlegrandarosewithagraveandstatelyairandbroughtmethebeetlefromaglasscasei
nwhichitwasencloseditwasabeautifulscarabaeusandatthattimeunknowntonaturalistsof
courseagreatprizeinascientificpointofviewthereweretworoundblackspotsnearoneextr
emityofthebackandalongoneneartheotherthescaleswereexceedinglyhardandglossywitha
lltheappearanceofburnishedgoldtheweightoftheinsectwasveryremarkableandtakingall
thingsintoconsiderationicouldhardlyblamejupiterforhisopinionrespectingi

'''
print plaintext, '\n\n'
ciphertext = Vignere.encrypt(plaintext)
end = time.time()
plaintext = Vignere.decrypt(ciphertext)
print ciphertext, '\n\n'
print plaintext
print "Run time",end - start,"sec"
