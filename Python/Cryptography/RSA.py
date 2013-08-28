import random
from math import *

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
              
    
    
gen_keys = 1
encrypt_decrypt = 2
quit = 0 
while quit != 1: #allows program to end

 f= input("Welcome to RSA! please select a function" +
 " - to generate keys, please type 'gen_keys'." +
 " To encrypt or decrypt a message, please type" +
 "'encrypt_decrypt'") 
 error = 1 #stops program crashing due to input mistakes
 while error == 1:
  if f == 1:
   p = int(input("Please enter two prime numbers. Prime 1: "))
   q = int(input("prime 2: "))
   print("loading")
   modulus = gen_mod(p,q)
   phi = totient(p,q)
   e = gen_e(phi)
   d = gen_d(e,phi)
   phi,p,q = 0, 0, 0 #resets the parts required to generate keys
                     #to stop them being retrieved and the code broken.
   
   print ("modulus = " + str(modulus) + " public key = " + str(e) + " private key = " + str(d))
   
   y = 1
   n = 2
   
   next = input("Encrypt using these keys? (y/n) ")
   
   while error == 1:
   
    if next==2:
      error = 0
      quit = input("quit? (y/n) ")
    elif next == 1:
       error = 0
       print ("exponent (public key) = " + str(e) + " modulus = " + str(modulus))
       op = input("input plaintext (integer) ")
       ciphertext = mexp(op,e,modulus)
       print ("Ciphertext = " + str(ciphertext))
       quit = input("quit? (y/n) ")
    else:
        error = 1
  elif f==2:
   op = int(input("Please enter plaintext/ciphertext (integer) "))
   exp = int(input("Please enter exponent (public/private key) "))
   mod = int(input("Please enter modulus "))
   quotient = mexp(op,exp,mod)
   print ("Result = " + str(quotient))
   y = 1
   n = 2
   l = input("loop? (y/n)")
   while error ==1:
    
    if l == 2:
     error = 0
     quit = 1
    elif l == 1:
     error = 0 
     print ("type 'quit' to quit, enter integers seperated by returns "+
     "to encrypt or decrypt")
     op =1
     
     while op != "quit":
         op = input(":")
         if op != "quit":
             q = mexp(op,exp,mod)
             print q
     quit = 1
    else :
        error = 1
         
         
         
