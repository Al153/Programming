import random #python random module for prime generation
from math import * #importing modules


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



class BBS1: #Creating a class of objects (BBS)
    def __init__(self): #When rand is called, the values p,q,seed are placed in brackets after it.
        self.random_file = open("BBS seed.txt","r+")
        self.mod = int(self.random_file.read_line())
        self.seed = int(self.random_file.read_line())
    def generate(self): #Generator, called Object_name.generate()
        'generates a Pseudo random number'
        self.seed = (self.seed**2)%self.mod #generates
        return self.seed #returns
    def advance(self,advance_by):#very similar to generates, but can advance by more than one step and does not return values
        'advance(advance_value): state(i) => state(i + advance_value)'
        for i in xrange (advance_by): 
            self.seed = (self.seed**2)%self.mod #generates
    def shut_down(self):
        self.random_file.write(str(self.mod)+'\n'+str(self.seed))
        self.random_file.close()
        del(self)

class Restart_RNG: #generates a new key set for RNG
    def __init__(self):
        random_file = open("BBS seed.txt","w")
        k = 2048
        r=100*(log(k,2)+1) #number of attempts max
        out = 0
        while not out:
            print "calculating p"
            while r>0:
                n = random.randrange(2**(k-1),2**(k))
                r-=1
                if isPrime(n) == True:
                    out = n
                    break
                out =  False

        p = out
        while not out:
            print "calculating q"
            while r>0:
                n = random.randrange(2**(k-1),2**(k))
                r-=1
                if isPrime(n) == True:
                    out = n
                    break
                out =  False
                break
        q = out
        mod = p*q
        seed = random.randrange(0,2**2048)
        random_file.write(str(mod)+'\n'+str(seed))
        random_file.close()
        BBS = BBS1()
        BBS.advance(random.randrage(256))
        BBS.shut_down()
