import json #for the .json file
import time #to use as states for random number generators
import random # for pre key generation
import hashlib #for hashing values for the .json file
import sys #for command line interface

#_______________ program flow ___________________
#
#setup:
#
#	- create passwords Json_file
#	- use time, then random.randrange to create a Blum Blum Shub key
#	- use Blum Blum Shub with time as state to create a modulus
#	- Use blum Blum Shub to change state of random module
#	- Create a password_compromised string and encrypt it with the keypair to the given fake password
#	- clear variables
#
#
#Add_password:
#	- Take account name - e.g. "Facebook", then password_key (the string which is hashed to be the base password for this account)
#	- Hash the key and place into json dict file
#	- clear password variables
#
#generate_password:
#	- Take account name and master password
#	- Using the json dict hashed password_key as the plaintext, the stored modulus as the modulus and the master password as the exponent,
#	  use RSA to encrypt the hashed password key, and the password_compromised string.
#	- if the password compromised string iss decrypted correctly, delete the Json_file,
#	- else return the encrypted key









def main():
	
	pass


#__________________________________ setup____________________________________
def setup(password_compromised_key):
	#create passwords.json
	#instantiate BBS 
	#use BBS to create a modulus and a password_compromised key
	#clear variables
	json_file = open("passwords.json","w")
	BBS = BlumBlumShub()
	password_compromised_value = hashlib.sha256(password_compromised_key).hexdigest()
	modulus = RSA_key_generator().main()
	json_dict = {"modulus":modulus,"password_compromised":password_compromised_value,"passwords":{}} #the dictionary to become the json file
	json_file.write(json.dumps(json_dict))
	json_file.close()





class RSA_key_generator:
	def __init__(self,BBS_instance,key_length):
		self.BBS_instance = BBS_instance #for random nuimber generation
		self.key_length = key_length



    def main(self):
    	p = self.generateLargePrime(1024)
    	q = self.generateLargePrime(1024)
    	return p*q

	def rabinMiller(self,n):
	     s = n-1
	     t = 0
	     while s&1 == 0:
	         s = s/2
	         t +=1
	     k = 0
	     while k<128:
	         a = self.BBS_instance.randrange(2,n-1)
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
 	
	def isPrime(self,n):
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
	             return self.rabinMiller(n)
	     return False
 	
	def generateLargePrime(self,k):
	     #k is the desired bit length
	     r=100*(log(k,2)+1) #number of attempts max
    	
	     while r>0:
	        #randrange is mersenne twister and is completely deterministic
	        #unusable for serious crypto purposes
	         n = self.BBS_instance.randrange(2**(k-1),2**(k))
	         r-=1
	         if self.isPrime(n) == True:
	             return n
	     return 'Failure'



class BlumBlumShub:

 	#main methods are setup, set_state and randrange
 	def __init__(self):
 		self.setup()


	# Main methods (front end)
 	def rand_range(start,end):
 		width = start-end
 		n = self.random()
 		return int(start+((width*n)>>2048))

 	 def setup(self):
 		self.create_key()
 		self.set_state(int(time.time()<<6)))
		for i in range(10):
			self.random()
		random.seed(self.random()) #sets the seed value to a random value

 	def set_state(self,state):
 		self.seed = int(state)%self.modulus


 	#auxilary methods

 	def create_key(self):
 		random.seed(int(time.time()<<6)) #set the random seed a  value derived from time, uses << 3 to make the seed vary more over short time frams
 		p = self.generate_blum_blum_shub_prime()
 		random.seed(int(time.time()<<6)+int(hashlib.sha256(str(p).hexdigest(),16))) #sets a new random seed
 		q = self.generate_blum_blum_shub_prime()
 		self.modulus = p*q
 		q = 0 #deletes p and q
 		p = 0



 	def random(self): 
 		#steps on the generator and returns the seed.
 		self.seed = (self.seed**2)%self.modulus
 		return self.seed

	# for creating keys

	def generate_blum_blum_shub_prime(self):
	     k = 1024
	     #k is the desired bit length
	     r=1000*(log(k,2)+1) #number of attempts max

	     while r>0:
	        #randrange is mersenne twister and is completely deterministic
	        #unusable for serious crypto purposes
	         n = random.randrange(2**(k-1),2**(k))
	         r-=1
	         if isPrime(n) == True:
	             return n




	def rabinMiller(self,n):
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
 	
	def isPrime(self,n):
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
	             return self.rabinMiller(n)
	     return False

#_____________________________ Add_password _________________________________

def Add_password(account,password_base):
	json_file = open("passwords.json","r")
	json_dict = json.loads(json_file.read())
	json_file.close()
	json_dict["passwords"][account] = hashlib.sha256(password_base).hexdigest()
	json_file = open("passwords.json","w")
	json_file.write(json.dumps(json_dict))
	json_file.close()

#___________________________ Generate_password _____________________________
def generate_password(account,master_password):
	json_file = open("passwords.json","r")
	json_dict = json.loads(json_file.read())
	json_file.close()

	if hashlib.sha256(master_password).hexdigest == json_dict[password_compromised]:
		print "Password-compromised password entered: deleting password storage file"
		open("passwords.json","w").close()
		print "\n\nFile deleted"
		quit()
	else:
		try:
			return hex(mexp(int(json_dict["passwords"][account],16),text_to_int(master_password),json_dict["modulus"])) #encrypts the password and returns a hex string
		except KeyError:
			print "ERROR: Account not found"
			quit()



#_________________ main tools ________________________


def mexp(base, exponent, modulus): #allows for fast O(log exponent)time modular exponentiation
  	result = 1
  	while exponent > 0:
    	bit = exponent%2
    	exponent /= 2
    	if bit:
    		result = (result*base)%modulus
    	base = (base**2)%modulus
  	return result


def text_to_int(string):
 	result = 0
 	for char in string:
 		result = result << 8
 		result += ord(char)
 	return result





 	





