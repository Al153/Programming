import random
from math import *
import binascii
import sys



def gcd(a,b): 
    while b != 0: 
        a, b = b, a % b
    return a


def totient(p,q): #generates the totient of pq while p amd q are prime
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
 
def generateKeys(p,q): #generate keys in form modulus, public, private
    p,q = int (p), int (q)
    phi = totient(p,q)
    n = p*q
    e = gen_e(phi)
    d = modinv(e,phi)
    return(n,e,d)

def mexp(base, exponent, modulus):
  result = 1
  while exponent > 0:
    bit = exponent%2
    exponent /= 2
    if bit:
      result = (result*base)%modulus
    base = (base**2)%modulus
  return result
	
	
def mexp_list(a,n,m):
    for i in range (len(a)):
        c = a[i]
        a[i] = mexp(c,n,m)
    return a
 

	
	
    
def text_to_int(a): #converts ascii to a decimal integer, for binary add bin()
                    #requires "import binascii"
    b = (int(binascii.hexlify(str(a)), 16))
    return b

def decToBin(a): #converts a binary number to a decimal
    if a==0: return ''
    else:
        return decToBin(a/2) + str(a%2)

def int_to_text(a):
    return binascii.unhexlify('%x' % a)

def chop_string(string,segment): #chops a string into "segment" lengthed segments 
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
        
    return (e)
    

    

#grab value 'b' from tuple or list 'a'
def grab(list_or_tuple,position):
    v=list_or_tuple[position]
    return v
    
def octofy(a):
    for i in range(len(a)):
        a[i] = oct(a[i])
    return a
    
def unoctofy(a):
    for i in range(len(a)):
        b = a[i]
        a[i] = int(b,8)
    return a
    
def stitch(List,filler):
    a = List
    b = str(filler)
    c = b.join(a)
    return c
    
def str_list(a):
    for i in range(len(a)):
        a[i] = str(a[i])
    return a
    
def int_list(a):
       for i in range(len(a)):
          c = a[i]
          a[i] = int(c)
       return a
    
def text_to_int_list(List):
    for i in range (len(List)):
        temp = List[i]
        List[i] = text_to_int(temp)
    return List
    
def int_to_text_list(List):
    for i in range (len(List)):
        t = int(List[i])
        List[i] = int_to_text(t)
    return List





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
 
def generateLargePrime(k):
     #k is the desired bit length
     r=100*(log(k,2)+1) #number of attempts max
    
     while r>0:
        #randrange is mersenne twister and is completely deterministic
        #unusable for serious crypto purposes
         n = random.randrange(2**(k-1),2**(k))
         r-=1
         if isPrime(n) == True:
             return n
     return 'Failure'
     
done = False
while not done:
      print '''welcome to Al's RSA implementation. This program will
generate keys based on randomly generated large primes of a 
specified bit-length, encrypt or decrypt text of any length
including new lines and tabs, implement "vanilla" RSA - ie.
encrypt individual integers via the original RSA algorithm, or
explain the RSA algorithm.'''

      function = int(input('''1 - Generate a set of keys.
2 - Encrypt or decrypt text.
3 - Vanilla RSA.
4 - Explanation.
: '''))
      
      
      if   function ==1:
           print '''This will generate two primes and then use these
to generate a public key and a private key'''
           bits = int(input('''Select bit length of primes
(512 - 2048 recommended): '''))
           check = 1
           while check == 1:
             error = 1
             while error == 1:
                 print 'Checking keys'
                 p = generateLargePrime(bits)
                 q = generateLargePrime(bits)
                 if p == 'Failure' or q == 'Failure':
                     error = 1
                 else:
                     error = 0
                 
                 
             n, e, d = generateKeys(p,q)
             p = 0
             q = 0
             r = random.randrange(3,1000)
             p = mexp(r,e,n)
             p = mexp(p,d,n)
                 
             if p == r:
                check = 0
             else:
                check = 1
           
           
           
           
           print '''This is your public key, distribute it amongst people
who you want to send you messages, though it's okay if people you
don't trust get hold of it: they can only send you messages and 
cannot read messages sent to you: ''' + str (e)
           
           print '''This is your modulus, distribute it alongside your public
key, but keep a copy to yourself: ''' + str (n)
           
           p =  str(raw_input('When no-one is looking, press enter.'))
           
           print '''This is your private key. You must note this down somewhere 
secure. Never show it to ANYONE. It is needed to decrypt messages sent
to you:''' + str (d)
           d = 0
           error = 1
           while error == 1:
                 choice = int(input('''1 - Return to main menu.
2 - Quit.
:'''))
                 if choice == 1:
                     break       
                 elif choice == 2:
                     done = True
                     print 'Quitting'
                     break        
           
      
      elif function == 2:
         while 1:
           choice = int(input('''1 - encrypt
2 - decrypt
:'''))
           if   choice == 1:
                p = int(input('Public key = '))
                mod = int(input('Modulus = '))
                m = str(raw_input('Enter plaintext Message: '))
                bits = log(mod,2)
                bits = bits//8
                m = chop_string(m,bits)
                m = text_to_int_list(m)
                m = mexp_list(m,p,mod) 
                m = str_list(m)
                ciphertext = 'L'.join(m)
                print "Ciphertext = ",ciphertext
                
                
                
           
           elif choice == 2:
                d = int(input('Private key = '))
                mod = int(input("Modulus = "))
                c = raw_input('Ciphertext = ')
                p = c.split('L')
                p = int_list(p)
                p = mexp_list(p,d,mod)
                d = 0
                p = int_to_text_list(p)
                p = ''.join(p)
                print "plaintext = " + p
                p = 0
           
           
              
                
                
           choice = int(input('''1 - Go back to encrypt/decrypt.
2 - Go back to main menu.
3 or any other number - Quit.
:'''))
           if choice == 1:
               x=1
               
           elif choice == 2:
                break
           else:
                done = True
                print 'Quitting'
                break
           
      
      elif function == 3:
        finished = False
        while not finished:
           print '''This function allows basic encryption using the 'vanilla'
RSA algorithm. It will only encrypt integers. It can be used for
testing, experimenting or other uses.'''
           
           
           e = int(input('Exponent = '))
           mod = int(input('Modulus = '))
           print '''Enter integers here, enter nothing and press
           return to display a menu'''
           f = False
           while not f:
                op = raw_input(":")
                if op != '':
                    print mexp(int(op),e,mod)
                else:
                    choice = raw_input('''1 - Change keys
2 - Go back to main menu
3 - Quit
Press enter to continue
:''')
                    if choice != '':
                       choice = int(choice) 
                       if choice == 1:
                          break
                       if choice == 2:
                          finished = True
                          break
                       if choice == 3:
                          finished = True
                          done = True
                          print 'Quitting'
                          break
           
    
      elif function == 4:
          print ("""RSA is a form of public or asymmetric key encryption.
It's security is based around the factorization problem.
In other words, it gains security from the difficulty
of finding the prime factors of large numbers.

--------------How does it work?--------------
First we need to define some mathematical ideas.

tot(a)    - Euler's ("Oiler's") totient function is another
            way of saying "the number of integers less than
            a which are coprime to it (total of i where i<a,
            gcd(i,a)). the totient of a number is normally
            shown using the greek letter phi, but as this
            is absent in ascii I will use simply tot(a).
            If a is the product of two prime numbers,
            p and q, tot(a)=(p-1)(q-1).
            
a mod b - Modular arithmetic as shown here is a branch
            of number theory. The most basic explanation
            is: a mod b is equal to the remainder of a/b.
            Also, ab mod n = (a mod n)(b mod n)mod n
            and a^b mod n = (a mod n)^(b mod (tot(n))
            mod n. Have fun working out why!

            Modular multiplicative inverses (quite a
            mouthful): If a is comprime with b, then
            it can have a MMI. An MMI is a number
            (which also happens to be comprime with
            b where a * a' mod n = 1 (a' being the
            inverse of a)

            """)

          b = raw_input('''Now we are ready to tackle the RSA algorithm.
                        press Enter to continue''')
          if b == '':
              print ("""
------------------------------Key Generation------------------------
As we already know, RSA is based on the dificulty of factorising large numbers,
so first we need to generate            
large primes p and q. (The work         p = 11, q =17
through on the right uses small
primes as an example, as you may
have seen in key generator, keys
tend to be huge with 300 digit
primes.)

Next, we need to calculate
n = pq and t = tot(n) = (p-1)(q-1)      n = pq = 187
                                        t =tot(n) = (p-1)(q-1) = 160


Now we need to find a
number which is coprime with t,         e = 3
which we will name 'e'.
(It helps if e is small and
if it is prime we only need to
check if it is a factor of t)
Here, we will make e 3

Lastly, we need to find d, where:       d = 107
d = e' (mod (t)) (ie. d * e mod        
(t) = 1) again, it's good if d          d*e = 321
is relatively small, as it will 
speed up our calculations, so           321 mod 160 =1
we will find the first number to
satisfy d's role. in this case,
107 is good.

Now we have generated our keys. We will tell all our friends e and n and call
it our public key, whilst keeping d secret.we will also get rid of all traces
of what p,q and t were, so no-one can find out our secret key (d).

""")

              t = raw_input('''Now we can move onto encryption and decryption.
Press Enter to continue''')
              if t == '':
                  print("""
--------------------Encryption and Decryption -----------------

The encryption of plaintext integer 'm' to ciphertext 'c' is defined as:

c = m ^ e mod n

And the decryption of 'c' to 'm' as:

m = c ^ d mod n

So if our friend Alice (A name used very often in cryptography) wishes to
send us a message, let's say m = 2, she must first calculate:

2 ^ 3 mod 187 = 8 mod 187 = 8

When we recieve this, we then calculate:

8^107 mod 187 = 2 (I have left out the intermediate steps as  8 ^ 107 has
                        96 digits.)


If an eavesdropper named 'Eve', who has been given a copy of our public key by
Bob, who is one of our friends to whom we gave it, wants to try and read Alice's
message (and is familiar with the RSA algorithm), will have to find t in order
to generate her own version of d (assuming we have kept it secret). To find t,
she will either have to factorise n, or use a computer program to count the
coprimes of n and therefore the totient of n. Whiles this is easy for the numbers
we have used as eamples, the 'brute force' tactics used here would take vast amounts
of time (thousands and millions of years respectively).

""")
                  f = raw_input('''Now we will find out WHY RSA works.
Press Enter to continue''')

                  if f == '':
                      print('''
-----------------------------Why it Works-----------------------

Lets make x so that:

(m ^ e mod n)^d mod n = x (ie. x is the decrypted message)

Because it invloves modular muliplying, the above equation can be reduced to:

                        x = (m^e)^d mod n

Because (a^b)^c = a^(bc):

                        x = m^de mod n

Because we know that a^b mod n = a^(b mod tot(n)) mod n (and that tot n = t):

                        x = m^(de mod t) mod n
                        
Because we have made sure that de mod t = 1:

                        x = m^1 mod n = m mod n

Therefore, aslong as m is less than n, the output after decryption will equal
m. As d and e are multiplied as exponents, it is possible to encrypt with d and
decrypt with e.

This particular implementation of RSA encrypts text in the following steps:

To encrypt

1 - Split up the ascii text into chunks only very slightly smaller than n.
    This increases the chance that the cipher text will be relatively short.
2 - Convert the chunks of ascii characters into their binary integer form.
3 - Apply the RSA algorithm to each of these numbers to create a set of cipher
text numbers.
4 - Stitch these numbers together using 'L's to mark where the decryption
algorithm should cut up the numbers. (L is hard for the eye to spot in a huge
list of numbers.

To decrypt:

1 - Split up the string of numbers using the markers (Ls).
2 - Apply the RSA algorithm using the given private key.
3 - Convert the numbers back into ascii characters.
4 - Stitch the text together again.
                        

''')


                      f = int(input('''That concludes the explanation.
1 - Go back to main menu
2 - Quit



'''))
                      if f == 1:
                              done = False
                      else:
                              print 'Quitting'
                             
                              break
      
      else:
          y = 1
          n = 2
         
          choice = int(input("repeat choice? (y/n) "))
          
          if choice == 1:
             done = False
          else:
             print "Quiting"
             done = True
          












