from decimal import Decimal

def parallelSort(labels,data):
    for j in range (len(data)-1):
        for i in range (len(data)-j):
            a = data[i]
            la = labels[i]
            b = data[i+1]
            lb = labels[i+1]
            if a>b:
                data[i+1] = a
                data[i] = b
                labels[i+1] = la
                labels[i] = lb
    return labels

class Datadiffusion:
    def __init__(self,text):
        self.text = text
        self.alphabet = []
        for i in text:
            if i not in self.alphabet:
                self.alphabet.append(i)
                
    def change_alphabet(self,newcharacters):
        for i in newcharacters:
            if i not in self.alphabet:
                self.alphabet.append(i)
        self.frequency_analysis() #recalculates
                
    def delete_characters(self,characters_to_delete):
        for i in characters_to_delete:
            if i in self.alphabet:
                del(self.alphabet[self.alphabet.index(i)])
                
    def change_text(self,text):
        self.text = text
        #self.alphabet = []
        for i in text:
            if i not in self.alphabet:
                self.alphabet.append(i)
        self.frequency_analysis()
                
    def frequency_analysis(self):
        self.values = [0]*len(self.alphabet)
        for i in self.text:
            self.values[self.alphabet.index(i)]+=1
            
    def run_test(self):
        try:
            self.values.sort()
            result = 0
            length = len(self.values)
            for i in xrange(length//2):
                result += self.values[length-1 -i] - self.values[i]
            length = len(self.text)
            result = result/float(length)
            return 1 - result
        except AttributeError:
            self.frequency_analysis()
            return self.run_test()



class Length_finder:
    def __init__(self,ciphertext):
        self.ciphertext = LookUp.preprocess(ciphertext)

    def findLength(self):
        differences = []
        for i in range(len(self.ciphertext)):
            self.ciphertext[i] = LookUp.char_to_int(self.ciphertext[i])
        for i in range(len(self.ciphertext)-2):
            base_trigram = self.ciphertext[i:i+3]
            for j in range(i+3,len(self.ciphertext)-2):
                test_trigram = self.ciphertext[j:j+3]
                if test_trigram[0] == base_trigram[0] and test_trigram[1] == base_trigram[1] and test_trigram[2] == base_trigram[2]: #if trigrams match
                  differences.append(j-i) #Count the distance
                  
        print "found differences"          
        if len(differences) <= 2: #For texts with very few coincidences
            if len(differences) == 0:return "failure", False
            elif len(differences) == 1:return (differences[0],False)
            else: return (differences,[1,1])
        result = []
        for i in range(len(differences)): #Takes GCD of each possible pair of differences
            for j in range(i+1,len(differences)):
                a = LookUp.gcd(differences[i],differences[j])
                if a>2: result.append(a)#ignore GCDs of 1 or 2, this tolerence can be increased
        print "GCDs calculated"
        result.sort() #sorts differences list
        counter =0
        highscore,highscore_holder = [0,0,0],[0,0,0]
        for i in result: # This section picks out the most frequent GCDs of the differences
            #print i
            if result.index(i) == 0:x = result[0] #x is the stored GCD
            
            else:
                if i == x: counter+=1
                else:
                    if counter >= highscore[0]: 
                        highscore[2] = highscore[1]
                        highscore[1] = highscore[0]
                        highscore[0] = counter
                        highscore_holder[2] = highscore_holder[1]
                        highscore_holder[1] = highscore_holder[0]
                        highscore_holder[0]=x
                    elif counter >= highscore[1]:
                        highscore[2] = highscore[1]
                        highscore[1] = counter
                        highscore_holder[2] = highscore_holder[1]
                        highscore_holder[1] = x
                    else:
                        highscore[2] = counter
                        highscore_holder[2] = x
                    
                    counter = 0
                    x = i
        print "No. trigram coincidences:" ,len(differences)#Tells user how many repeated trigrams it has logged
        return (highscore_holder, highscore)

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
    
    def preprocess(self,string): #Removes spaces, punctuation etc
        result = []
        for i in range(len(string)):
            if string[i] in self.uppercase + self.lowercase:
                result.append(string[i])
        return result
    def gcd(self,a,b): #Euclid's algorithm
        while a != 0:
            a,b = b%a,a
        return b
    def full_process(self,string):#preprocess + int_to_char
        result = []
        for i in range(len(string)):
            if string[i] in self.uppercase + self.lowercase:
                result.append(self.char_to_int(string[i]))
        return result


class Splitter:
    def __init__(self,ciphertext,keylength):
        self.ciphertext = ciphertext
        self.keylength = keylength
    def change_settings(self,ciphertext,keylength): #reinitiallises the ciphertext and keylength
        self.ciphertext = ciphertext
        self.keylength = keylength
        self.split()
    def split(self): #splits up the ciphertext
        self.sections = []
        for i in xrange(self.keylength):
            self.sections.append('')
        for i in xrange(len(self.ciphertext)):
            self.sections[i%self.keylength] += self.ciphertext[i]
    def find_indv_keys(self):
        keys  = []
        for text in self.sections:
            Diffusion.change_text(text)
            highscore = 0
            for i in xrange(26):
                #print i
                if Diffusion.values[i] >= highscore:
                    possible_e = i
                    highscore = Diffusion.values[i]
            keys.append((possible_e - 4)%26)
            print LookUp.int_to_char(possible_e)
        return keys

class Vigenere_cipher:
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
ciphertext = ''' 


OICPIWSYWSNVLYRHVZDSDMESONVLGSHRODHHXPWMHMCLBKFCZINLEXSALPMSLXWPTYSXLUSEDDQHWPTBDLTNVPXHLGLRNWCZIOTHDEDLPLEFEWMYWDQHVLMOLYDLBKEEEVHXETALYYVBVAYECUEEFFHPTDHZSQNCBVDPONVPLHWVTKSPRLDQPIYEWMMNACPREZTCMPHHOICPKLVPEKVVZFBKFWLQRWAZHZRPLFVRPPLAVPXWACZQHOIMLQREYOOSSYRCUIYPOYXSPCALPCHOIDNOSIDHSYIPIQLIOTBNPJSOYHLYRNPZDGFATEVHPWEVLEAASHVLYQLSQMIYRTDVLHRZZKXSPKLMRSHVJESSPRDPQAALDJLVJCSTECVOIPPLBKXLVWUKLWZALTYUZMYECJSYDWKICLHPSYTQVYWOVHVOWMIPLXSQYATHLVQZFOMDZDPRTZBYIDASJXTYUP


''' #Ciphertext is placed here
ciphertext = LookUp.preprocess(ciphertext)
Diffusion = Datadiffusion('')
Diffusion.alphabet = ('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z')


Length_finder = Length_finder(ciphertext)
possible_keylengths = Length_finder.findLength()
print "Guessed keylengths:", possible_keylengths[0],"Weighting:",possible_keylengths[1]
Splitter = Splitter(ciphertext,possible_keylengths[0][0])
Splitter.split()
#print Splitter.sections
keys = Splitter.find_indv_keys()

key = ''
for i in keys:
    key += LookUp.int_to_char(i)
print key

Vigenere = Vigenere_cipher(key)
print Vigenere.decrypt(ciphertext)
