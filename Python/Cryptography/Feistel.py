from math import *

class Feistel_network:
    
    def __init__(self,keyArray):
        self.key = keyArray
        self.rounds = len(keyArray)

    def f(self,left,key):
        return left
    
    def chop_string(self,string,segment): #chops a string into "segment" lengthed segments 
        a = string
        l = len(a)
        segment = int(segment)
        b = 0
        e =[]
    
        for i in range(0,l,segment):
            c = b + segment
            d = a[b:c]
            e.append(d)
            b += segment
        return e
    
    def encrypt(self,plaintext):
        '''EncryptsIntegerplaintext according to key'''
        self.plaintext = bin(plaintext)[2:]
        blocks = []
        i = 0
        j = 16
        blocks = self.chop_string(self.plaintext,16)
        ciphertext = []
        for i in range(len(blocks)):
            left = blocks[i][0:8]
            right = blocks[i][8:16]
            if left == '': left = 0
            else: left = int(left,2)
            
            if right == '': right = 0
            else: right = int(right,2)
            for i in range(self.rounds):
                temp = right
                right = left^self.f(right,self.key[i])
                left = temp
                print 'rounds', i
                print  bin(left)
                print '\t\t\t\t\t', bin (right)
            ciphertext.append(256*left + right)
            print 'ciphertext', ciphertext
        ciphertext.reverse
        ciphertextint = 0
        for i in range(len(ciphertext)):
            ciphertextint += ciphertext[i]*(65536**i)
        del(self.plaintext)
        return ciphertextint
    
    def decrypt(self,ciphertext):
        self.ciphertext = bin(ciphertext)[2:]
        blocks = self.chop_string(self.ciphertext,16)
        self.plaintext = []
        for i in range(len(blocks)):
            left = blocks[i][0:8]
            right = blocks[i][8:16]
            print left,'\t\t\t',right
            if left == '': left = 0
            else: left = int(left,2)
            
            if right == '': right = 0
            else: right = int(right,2)
            
            for i in range(self.rounds-1,-1,-1):
                temp = left
                left = right^self.f(left,self.key[i])
                right = temp
                print 'rounds', i
                print bin(left)
                print '\t\t\t\t\t',bin(right)
            self.plaintext.append(256*left+right)
        self.plaintext.reverse
        plaintextint = 0
        for i in range(len(self.plaintext)):
            plaintextint += self.plaintext[i]*(65536**i)
        return plaintextint
Cipher = Feistel_network([0,0,0,0])
plaintext = 255
ciphertext = Cipher.encrypt(plaintext)
print ciphertext
plaintext = Cipher.decrypt(ciphertext)
print plaintext
            
            
            
