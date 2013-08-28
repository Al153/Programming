import random
from math import *
import binascii



def gcd(a,b): 
    if a < b:
        a, b = b, a 
    while b != 0: 
        a, b = b, a % b
    return a


def totient(p,q):
    tot  = (p-1)*(q-1)
    return tot

def gen_mod(P,Q):
    modulus = P*Q
    return modulus
    
def gen_e(phi):
    
    r = random.randrange(2,100)
    
    for i in xrange (1,r):
        if gcd(i,phi)==1:
           e = i
    return e

def egcd(a, b): #extended euclidean algorithm
    if a == 0:
        return (b, 0, 1)
    else:
        g, y, x = egcd(b % a, a)
        return (g, x - (b // a) * y, y)
    
def modinv(a, m): #generates a modular inverse
    g, x, y = egcd(a, m)
    return x % m


def gen_d(e, phi):
 return modinv(e, phi)

def mexp(a, n, m):
	bits = []
	while n:
		bits.append(n%2)
		n /= 2
	solution = 1
	bits.reverse()
	for x in bits:
		solution = (solution*solution)%m
		if x:
			solution = (solution*a)%m
	return solution
    
def text_to_int(a): #converts ascii to a decimal integer, for binary add bin()
                    #requires "import binascii"
    b = (int(binascii.hexlify(str(a)), 16))
    return b

def decToBin(a): #converts a binary number to a decimal
    if a==0: return ''
    else:
        return decToBin(a/2) + str(a%2)

def int_to_text(a): #turns an integer into ascii text - requires decToBin
    a = decToBin(a)
    n = int(a, 2)
    return binascii.unhexlify('%x' % n)

def chop_string(a,segment): #chops a string into "segment" lengthed segments 
    l = len(a)
    segment = int(segment)
    b = 0
    e =[]
    f = 0
    for i in range(0,l,segment):
        c = b + segment
        d = a[b:c]
        e.append(d)
        b += segment
        f+=1
    return (e,f)

#grab value 'b' from tuple 'a'
def grab(a,b):
    v=a[b]
    return v




    
    








