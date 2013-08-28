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

class Rotor:
    def __init__(self,rotorConfig,key,ringposition):
        self.key = (key - ringposition)%26
        self.rotorConfig = rotorConfig
    def operation(self,pt):
        pt = (pt + self.key)%26
        return (self.rotorConfig[pt] - self.key)%26
    def reverse(self,pt):
        pt = (pt + self.key)%26
        return (self.rotorConfig.index(pt) - self.key)%26
    def step(self):
        self.key = (self.key +1)%26

class Reflector:
    def __init__(self,reflectorConfig,position):
        self.config = reflectorConfig
        self.position = position
    def reflect(self,pt):
        pt = (pt + self.position)%26
        return (self.config[pt] - self.position)%26

class Plugboard:
    alphabet = ['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z']
    def __init__(self,plugboardCF):
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
        print self.Rotor3.key, self.Rotor2.key, self.Rotor1.key
        pt = self.alphabet.index(plaintextletter)
        pt = self.Rotor1.operation(pt)
        pt = self.Rotor2.operation(pt)
        pt = self.Rotor3.operation(pt)
        pt = self.Reflector.reflect(pt)
        pt = self.Rotor3.reverse(pt)
        pt = self.Rotor2.reverse(pt)
        pt = self.Rotor1.reverse(pt)
        return self.alphabet[pt]
    
        
print '''Welcome to Al's army enigma emulator
I have tried to make this machine as close to the real thing
as possible, but I cannot make promises as to its accuracy'''
success = 0
while success == 0:
    try:
        R3 = input('''Please enter chosen rotors (RI - RV):
Left (slow) Rotor: ''')
        success = 1
    except NameError:
        print "ERROR: try again, remember to use capitals"
        success = 0

success = 0
while success == 0:
    try:
        R2 = input('''Middle Rotor: ''')
        success = 1
    except NameError:
        print "ERROR: try again, remember to use capitals"
        success = 0

success = 0
while success == 0:
    try:
        R1 = input('''Right (Fast) Rotor: ''')
        success = 1
    except NameError:
        print "ERROR: try again, remember to use capitals"
        success = 0

success = 0
while success == 0:
    try:
        refConfig = input('''Please enter chosen reflector (A,B, or C): ''')
        success = 1
    except NameError:
        print "ERROR: try again, remember to use a capital"
        success = 0
        
print '''please enter ring position keys (integers)'''

success = 0
while success == 0:
    try:
        ring3 = int(input("Left: "))
        success = 1
    except ValueError:
        print "Error: make sure you enter an integer between 0 and 25 (inclusive)"
        success = 0
    except NameError:
        print "Error: make sure you enter an integer between 0 and 25 (inclusive)"
        success = 0
    except TypeError:
        print "Error: make sure you enter an integer between 0 and 25 (inclusive)"
        success = 0
        
success = 0
while success == 0:
    try:
        ring2 = int(input("Middle: "))
        success = 1
    except ValueError:
        print "Error: make sure you enter an integer between 0 and 25 (inclusive)"
        success = 0
    except NameError:
        print "Error: make sure you enter an integer between 0 and 25 (inclusive)"
        success = 0
    except TypeError:
        print "Error: make sure you enter an integer between 0 and 25 (inclusive)"
        success = 0

success = 0
while success == 0:
    try:
        ring1 = int(input("Right: "))
        success = 1
    except ValueError:
        print "Error: make sure you enter an integer between 0 and 25 (inclusive)"
        success = 0
    except NameError:
        print "Error: make sure you enter an integer between 0 and 25 (inclusive)"
        success = 0
    except TypeError:
        print "Error: make sure you enter an integer between 0 and 25 (inclusive)"
        success = 0

print "please enter rotor position values (integers)"

success = 0
while success == 0:
    try:
        key3 = int(input("Left: "))
        success = 1
    except ValueError:
        print "Error: make sure you enter an integer between 0 and 25 (inclusive)"
        success = 0
    except NameError:
        print "Error: make sure you enter an integer between 0 and 25 (inclusive)"
        success = 0
    except TypeError:
        print "Error: make sure you enter an integer between 0 and 25 (inclusive)"
        success = 0
        
success = 0
while success == 0:
    try:
        key2 = int(input("Middle: "))
        success = 1
    except ValueError:
        print "Error: make sure you enter an integer between 0 and 25 (inclusive)"
        success = 0
    except NameError:
        print "Error: make sure you enter an integer between 0 and 25 (inclusive)"
        success = 0
    except TypeError:
        print "Error: make sure you enter an integer between 0 and 25 (inclusive)"
        success = 0

success = 0
while success == 0:
    try:
        key1 = int(input("Right: "))
        success = 1
    except ValueError:
        print "Error: make sure you enter an integer between 0 and 25 (inclusive)"
        success = 0
    except NameError:
        print "Error: make sure you enter an integer between 0 and 25 (inclusive)"
        success = 0
    except TypeError:
        print "Error: make sure you enter an integer between 0 and 25 (inclusive)"
        success = 0

success = 0
while success == 0:
    try:
        refpos = int(input("Reflector: "))
        success = 1
    except ValueError:
        print "Error: make sure you enter an integer between 0 and 25 (inclusive)"
        success = 0
    except NameError:
        print "Error: make sure you enter an integer between 0 and 25 (inclusive)"
        success = 0
    except TypeError:
        print "Error: make sure you enter an integer between 0 and 25 (inclusive)"
        success = 0

plugboardCF = input("Please place here your plugboard configuration (eg - [[1,2],[5,17]], for no changes input []): ")
plaintext = str(raw_input("Please enter your plain or ciphertext: "))


        
Enigma = Enigma(R1,R2,R3,refConfig,key1,key2,key3,ring1,ring2,ring3,refpos,plugboardCF)
Tools = Tools()
plaintext = Tools.preprocess(plaintext)
ciphertext = ''
count = -1
for i in plaintext:
    ciphertext += (Enigma.encrypt(i))
    count += 1
    if count %5 == 4:
        ciphertext += ' '
        

print ciphertext
