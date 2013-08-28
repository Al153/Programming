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
    
    def preprocess(self,string): #Removes spaces, punctuation etc
        result = []
        for i in range(len(string)):
            if string[i] in self.uppercase + self.lowercase:
                try: lookup = self.uppercase.index(string[i])
                except ValueError:
                    lookup = self.lowercase.index(string[i])
                result.append(self.uppercase[lookup])
        return result
    def process_crib(self,ciphertext,crib):
        ciphertext,crib = self.preprocess(ciphertext),self.preprocess(crib)
        possible_positions = []
        for i in range(30): #set limit for crib movement
            if i < len(ciphertext):
                check  = 1
                for j in range(len(crib)):
                    if i+j < len(ciphertext):
                        if crib[j] == ciphertext[j+i]:
                            check = 0
                            break
                if check: possible_positions.append(i)
        return possible_positions

class Rotor:
    def __init__(self,rotorConfig,key,ringposition):
        self.key = (key - ringposition)%26
        self.rotorConfig = rotorConfig
        self.ring = ringposition
    def operation(self,pt):
        pt = (pt + self.key)%26
        return (self.rotorConfig[pt] - self.key)%26
    def reverse(self,pt):
        pt = (pt + self.key)%26
        return (self.rotorConfig.index(pt) - self.key)%26
    def step(self):
        self.key = (self.key +1)%26
    def change_key(self,key):
        self.key = key + self.ring
    def change_ring(self,ring):
        self.ring = ring
    def change_config(self,config):
        self.rotorConfig = config
    def step_back(self):
        self.key = (self.key-1)%26

class Reflector:
    def __init__(self,reflectorConfig,position):
        self.config = reflectorConfig
        self.position = position
    def reflect(self,pt):
        pt = (pt + self.position)%26
        return (self.config[pt] - self.position)%26
        def change_position(self,position):
            self.position = position
        def change_config(self,config):
            self.config = config
	

class Plugboard:
    alphabet = ['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z']
    def __init__(self,plugboardCF):
        for i in plugboardCF:
            self.alphabet[i[0]],self.alphabet[i[1]] = self.alphabet[i[1]],self.alphabet[i[0]]
    def change_plugboard(self,plugboardCF):
        for i in plugboardCF:
            self.alphabet[i[0]],self.alphabet[i[1]] = self.alphabet[i[1]],self.alphabet[i[0]]


RI =((4,10,12,5,11,6,3,16,21,25,13,19,14,22,24,7,23,20,18,15,0,8,1,17,2,9),16)
RII = ((0,9,3,10,18,8,17,20,23,1,11,7,22,19,12,2,16,6,25,13,15,24,5,21,14,4),4)
RIII =((1,3,5,7,9,11,2,15,17,19,23,21,25,13,24,4,8,22,6,0,10,12,20,18,16,14),21)
RIV =((4, 18, 14, 21, 15, 25, 9, 0, 24, 16, 20, 8, 17, 7, 23, 11, 13, 5, 19, 6, 10, 3, 2, 12, 22, 1),9)
RV =((21, 25, 1, 17, 6, 8, 19, 24, 20, 15, 18, 3, 13, 7, 11, 23, 0, 22, 12, 9, 16, 14, 5, 4, 2, 10),25)
A = [4, 9, 12, 25, 0, 11, 24, 23, 21, 1, 22, 5, 2, 17, 16, 20, 14, 13, 19, 18, 15, 8, 10, 7, 6, 3] #Reflector configuarations
B = [24, 17, 20, 7, 16, 18, 11, 3, 15, 23, 13, 6, 14, 10, 12, 8, 4, 1, 5, 25, 2, 22, 21, 9, 0, 19]
C = [5, 21, 15, 9, 8, 0, 14, 24, 4, 3, 17, 25, 23, 22, 6, 2, 19, 10, 20, 16, 18, 1, 13, 12, 7, 11]

class Enigma:
    def __init__(self,rotor1CF,rotor2CF,rotor3CF,reflectorCF,key1,key2,key3,ring1,ring2,ring3,reflector_pos,plugboardCF):
        self.Rotor1 = Rotor(rotor1CF[0],key1,ring1)
        self.Rotor2 = Rotor(rotor2CF[0],key2,ring1)
        self.Rotor3 = Rotor(rotor3CF[0],key3,ring1)
        self.shiftposition = (rotor1CF[1],rotor2CF[1])
        self.Reflector = Reflector(reflectorCF,reflector_pos)
        self.Plugboard = Plugboard(plugboardCF)
        self.alphabet = self.Plugboard.alphabet
    def encrypt(self,plaintextletter):
        if self.Rotor2.key == self.shiftposition[1]:
            self.Rotor3.step()
            self.Rotor2.step() #double stepping
        if self.Rotor1.key == self.shiftposition[0]:
            self.Rotor2.step()
        self.Rotor1.step()
        #print self.Rotor3.key, self.Rotor2.key, self.Rotor1.key
        pt = self.alphabet.index(plaintextletter)
        pt = self.Rotor1.operation(pt)
        pt = self.Rotor2.operation(pt)
        pt = self.Rotor3.operation(pt)
        pt = self.Reflector.reflect(pt)
        pt = self.Rotor3.reverse(pt)
        pt = self.Rotor2.reverse(pt)
        pt = self.Rotor1.reverse(pt)
        return self.alphabet[pt]
    def change_rotor_keys(self,key1,key2,key3):
        self.Rotor1.change_key(key1)
        self.Rotor2.change_key(key2)
        self.Rotor3.change_key(key3)
    def change_rotor_rings(self,ring1,ring2,ring3):
        self.Rotor1.change_ring(ring1)
        self.Rotor2.change_ring(ring2)
        self.Rotor3.change_ring(ring3)
    def change_rotors(self,rotor1,rotor2,rotor3):
        self.Rotor1.change_config(rotor1)
        self.Rotor2.change_config(rotor2)
        self.Rotor3.change_config(rotor3)
        self.shiftposition = (rotor1[1],rotor2[1])
    def change_reflector(self,config):
        self.Reflector.change_config(config)
    def change_reflector_position(self,position):
        self,Reflector.change_position(position)
    def change_plugboard(self,config):
        self.Plugboard.change_plugboard(config)
    def step_back(self,steps):
        i = 0
        while i < steps:
            self.Rotor1.step_back()
            if self.Rotor2.key == self.shiftposition[1]+1 and self.Rotor1.key == self.shiftposition[0]+1:
                self.Rotor3.step_back()
                self.Rotor2.step_back() #double stepping
            if self.Rotor1.key == self.shiftposition[0]:
                self.Rotor2.step_back()
            i += 1
            #print self.Rotor3.key,self.Rotor2.key,self.Rotor1.key
            
        

        
class Bombe:
        def __init__(self,ciphertext,crib,crib_positions):
                self.configs = [RI,RII,RIII,RIV,RV]
                self.reflectorConfigs = [A,B,C]
                self.crib = Tools.preprocess(crib)
                self.ciphertext = Tools.preprocess(ciphertext)
                self.Enigma = Enigma(RIII,RII,RI,B,0,0,0,0,0,0,0,[])
                self.ciphertexts = []
                for i in crib_positions: #generates texts to test again crib
                    if i+len(self.crib) < len(self.ciphertext):
                        newtext  = '' 
                        for j in range(len(self.crib)):
                            newtext += self.ciphertext[i+j]
                        self.ciphertexts.append(newtext)
                    else:break
                self.crib_positions = crib_positions
                
        def run(self):
            keys =[]
            for i in xrange(180):
                reflector = self.reflectorConfigs[i//60] #allows multiple reflector +rotor configs to be used
                rotors = i%60
                rtrl = rotors//12 #first rotor chosen
                lastrotors = rotors%12
                rtrm = lastrotors//3
                if rtrm >= rtrl:
                    rtrm +=1
                rtrr = lastrotors%3
                check,check1 = 0,0
                if rtrr >= rtrl:
                    rtrr+=1
                    check = 1
                if rtrr >= rtrm:
                    rtrr+=1
                    check1 = 1
                if rtrr >= rtrl and check == 0:
                    rtrr+=1
                if rtrr >= rtrm and check1 == 0:
                    rtrr += 1
                    
                print rtrl,rtrm,rtrr, i//60
                self.Enigma = Enigma(self.configs[rtrr],self.configs[rtrm],self.configs[rtrl],reflector,0,0,0,0,0,0,0,[])
                
                for i2 in xrange(26**3):
                    key = (i2//(26*26),(i2%26**2)//26,i2%26)
                    self.Enigma.change_rotor_keys(key[0],key[1],key[2])
                    ciphertext_copies = list(self.ciphertexts)
                    success = 1
                    for j in xrange(len(self.crib)):
                        test = self.Enigma.encrypt(self.crib[j])
                        for k in ciphertext_copies:
                            print test, '\t\t',k[j]
                            if k[j] != test:
                                del ciphertext_copies[ciphertext_copies.index(k)]
                        if ciphertext_copies == []:
                            success = 0
                            break       
                                
                        
                
                    if success: #if correct key found
                    
                        position = self.crib_positions[self.ciphertexts.index(k)]
                       
                        self.Enigma.change_rotor_keys(key[2],key[1],key[0])
                        self.Enigma.step_back(position) #finding key at message start
                        realKey = (self.Enigma.Rotor3.key,self.Enigma.Rotor2.key,self.Enigma.Rotor1.key)
                        print "found key", realKey
                        keys.append(realKey)
            
        def indicator_break(self,indicator):
            pass
            

ciphertext = 'ILBDA AMTAZ BERNM X'
crib = 'world'
Tools = Tools()

Bombe = Bombe(ciphertext,crib,Tools.process_crib(ciphertext,crib))
start = time.time()
Bombe.run()
print time.time() - start
#Bombe.Enigma.change_rotor_keys(25,5,1)
#print Bombe.Enigma.Rotor3.key,Bombe.Enigma.Rotor2.key,Bombe.Enigma.Rotor1.key
#Bombe.Enigma.step_back(4)
