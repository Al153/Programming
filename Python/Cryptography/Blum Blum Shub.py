import random #python random module for prime generation
from math import * #importing modules
import binascii
#import sys


def mexp(base, exp, mod): #tools for our prime generator (kind of cheating as 1) I copied this code for the Rabin-Miller test. 2) it uses the built in python random module.)
                   #this all came from my RSA implementation
	bits = []
	while exp:
		bits.append(exp%2)
		exp /= 2
	solution = 1
	bits.reverse()
	for x in bits:
		solution = (solution*solution)%mod
		if x:
			solution = (solution*base)%mod
	return solution
    
def rabinMiller(n):
    s = n-1
    t = 0
    while s&1 == 0:
        s = s/2
        t +=1
    k = 0
    while k<128:
        a = random.randrange(2,n-1)
        #a^s is computationally infeasible.  we need a more intelligent approach
        #v = (a**s)%n
        #python's core math module can do modular exponentiation
        v = mexp(a,s,n) #where values are (num,exp,mod)
        if v != 1:
            i=0
            while v != (n-1):
                if i == t-1:
                    return False
                else:
                    i = i+1
                    v = (v**2)%n
        k+=2
    return True
 
def isPrime(n):
     #lowPrimes is all primes (sans 2, which is covered by the bitwise and operator) 
     #under 1000. taking n modulo each lowPrime allows us to remove a huge chunk 
     #of composite numbers from our potential pool without resorting to Rabin-Miller
     lowPrimes =   [3,5,7,11,13,17,19,23,29,31,37,41,43,47,53,59,61,67,71,73,79,83,89,97
                   ,101,103,107,109,113,127,131,137,139,149,151,157,163,167,173,179
                   ,181,191,193,197,199,211,223,227,229,233,239,241,251,257,263,269
                   ,271,277,281,283,293,307,311,313,317,331,337,347,349,353,359,367
                   ,373,379,383,389,397,401,409,419,421,431,433,439,443,449,457,461
                   ,463,467,479,487,491,499,503,509,521,523,541,547,557,563,569,571
                   ,577,587,593,599,601,607,613,617,619,631,641,643,647,653,659,661
                   ,673,677,683,691,701,709,719,727,733,739,743,751,757,761,769,773
                   ,787,797,809,811,821,823,827,829,839,853,857,859,863,877,881,883
                   ,887,907,911,919,929,937,941,947,953,967,971,977,983,991,997]
     if (n >= 3):
         if (n&1 != 0):
             for p in lowPrimes:
                 if (n == p):
                    return True
                 if (n % p == 0):
                     return False
             return rabinMiller(n)
     return False



class BBS: #Creating a class of objects (BBS)
    def __init__(self,mod,seed): #When rand is called, the values p,q,seed are placed in brackets after it.
        self.mod = mod #loading the modulus into the object
        self.seed = seed #Loadingt the seed into the object
    def generate(self): #Generator, called Object_name.generate()
        'generates a Pseudo random number'
        self.seed = (self.seed**2)%self.mod #generates
        return self.seed #returns
    def advance(self,advance_by):#very similar to generates, but can advance by more than one step and does not print values
        'advance(advance_value): state(i) => state(i + advance_value)'
        for i in range (advance_by): 
            self.seed = (self.seed**2)%self.mod #generates


class BBScipher1:
    def __init__(self,key_length):
        self.key_length = key_length
 
    def generateLargePrime(self):
         k = self.key_length
         r=100*(log(k,2)+1) #number of attempts max
    
         while r>0:
            #randrange is mersenne twister and is completely deterministic
            #unusable for serious crypto purposes
             n = random.randrange(2**(k-1),2**(k))
             r-=1
             if isPrime(n) == True:
                 return n
             return False

    def encrypt(self,plaintext):
        key = BBS1.generate()%128 #last 7 bits of random number from BBS1 (this is created from class BBS below)
        plaintext = (int(binascii.hexlify(str(plaintext)), 16)) #converts ascii characters into integers
        ciphertext = key^plaintext #'^' takes the bit wise XOR of two integers XOR(1100,1010) => 0110 ie if one = 1 and the other 0, the output is 1, else: 0
        return chr(ciphertext) #converts ciphertext integer into an ascii character


#____________________________________________Actual script begins here________

    
Cipher = BBScipher1(512) #creates Cipher machine object
key_picker = int(input('''Choose key input:
1 - generate new key
2 - use existing key
1 or 2: '''))
if key_picker == 1:                       
    p = Cipher.generateLargePrime()
    q = Cipher.generateLargePrime()
    counter = 0
    while not p:
        print 'recalculating'
        p = Cipher.generateLargePrime()
        counter += 1
    while not q:
        print 'recalculating'
        q = Cipher.generateLargePrime()
        counter += 1
    modulus = p*q
    p = 0 #deletes p and q
    q = 0
    print 'Key = ',modulus
else:
    modulus = int(input('Enter key: '))
start_point = int(input('Input a starting point, preferably a small prime: '))
BBS1 = BBS(modulus,start_point)
plaintext = str(raw_input("Put plain/cipher text in here: "))
ciphertext = [] #empty list
for i in range (len(plaintext)): #loops, adding 1 to i until it reaches the length of the plaintext - 1
    ciphertext.append(Cipher.encrypt(plaintext[i])) #adds to the ciphertext the encrypted version of the i-th member of the plaintext string
plaintext = '' #deletes plaintext
ciphertext = ''.join(ciphertext) # joins up ciphertext
print 'result: ',ciphertext
    
                
