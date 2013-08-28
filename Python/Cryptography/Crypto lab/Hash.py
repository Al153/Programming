#An algorithm very close to (was meant to be) SHA 256

import math
def digest(plaintext):
        '''generate a hash of input'''
        #Initialize variables
        #(first 32 bits of the fractional parts of the square roots of the first 8 primes 2..19):
        h = [0x6a09e667, 0xbb67ae85, 0x3c6ef372, 0xa54ff53a, 0x510e527f, 0x9b05688c, 0x1f83d9ab, 0x5be0cd19]
   

        #Initialize table of round constants
        #(first 32 bits of the fractional parts of the cube roots of the first 64 primes 2..311):
        m =[0x428a2f98, 0x71374491, 0xb5c0fbcf, 0xe9b5dba5, 0x3956c25b, 0x59f111f1, 0x923f82a4, 0xab1c5ed5,
        0xd807aa98, 0x12835b01, 0x243185be, 0x550c7dc3, 0x72be5d74, 0x80deb1fe, 0x9bdc06a7, 0xc19bf174,
        0xe49b69c1, 0xefbe4786, 0x0fc19dc6, 0x240ca1cc, 0x2de92c6f, 0x4a7484aa, 0x5cb0a9dc, 0x76f988da,
        0x983e5152, 0xa831c66d, 0xb00327c8, 0xbf597fc7, 0xc6e00bf3, 0xd5a79147, 0x06ca6351, 0x14292967,
        0x27b70a85, 0x2e1b2138, 0x4d2c6dfc, 0x53380d13, 0x650a7354, 0x766a0abb, 0x81c2c92e, 0x92722c85,
        0xa2bfe8a1, 0xa81a664b, 0xc24b8b70, 0xc76c51a3, 0xd192e819, 0xd6990624, 0xf40e3585, 0x106aa070,
        0x19a4c116, 0x1e376c08, 0x2748774c, 0x34b0bcb5, 0x391c0cb3, 0x4ed8aa4a, 0x5b9cca4f, 0x682e6ff3,
        0x748f82ee, 0x78a5636f, 0x84c87814, 0x8cc70208, 0x90befffa, 0xa4506ceb, 0xbef9a3f7, 0xc67178f2]

        #preprocessing plaintext
        plaintext = str2bin(plaintext)
        plaintext = (plaintext<<1)+1 #append 1
        #print plaintext

        length = bitlength(plaintext) #append 0s to make len(plaintext)%512 = 448
        length = length%512
        if length >448:
                to_add = 448+(512-length)
        elif length <448:
                to_add = 448-length
        else: to_add = 0 #if length == 448
        plaintext = plaintext << to_add
        plaintext = (plaintext << 64)+length #append 64bit int of length
        #print plaintext
        
        #break plaintext into  512 bit chunks
        chunks = chunk(plaintext,512)
        #print chunks
        #break chunks into words
        for each_chunk in chunks:
                words = chunk(each_chunk,32)
                #print words
                
                

                #Extend the sixteen 32-bit words into sixty-four 32-bit words:
                for k in xrange(16,64):
                        s0 = right_rot(words[k-15],7)^right_rot(words[k-15],18)^(words[k-15]>>3)
                        s1 = right_rot(words[k-2],17)^right_rot(words[k-2],19)^words[k-2]>>10
                        words.append((words[k-16]+s0+words[k-7]+s1)&0xffffffff)
                
                #Initialize hash value for this chunk:
                a = h[0]
                b = h[1]
                c = h[2]
                d = h[3]
                e = h[4]
                f = h[5]
                g = h[6]
                x = h[7]

                #main loop

                for l in xrange(64):
                        s1 = right_rot(e,6)^right_rot(e,11)^right_rot(e,25)
                        ch = (e&f)^(NOT(e)&g)
                        temp = (x +s1 +ch +m[l]+words[l])&0xffffffff
                        d = (d + temp)&0xffffffff
                        s0 = right_rot(a,2)^right_rot(a,13)^right_rot(a,25)
                        maj = (a&(b^c))^(b&c)
                        temp = (temp + s0 + maj)&0xffffffff

                        x = g 
                        g = f
                        f = e
                        e = d
                        d = c
                        c = b
                        b = a
                        a = temp

                #Add this chunk's hash to result so far:
                h[0] = (h[0] + a)&0xffffffff
                h[1] = (h[1] + b)&0xffffffff
                h[2] = (h[2] + c)&0xffffffff
                h[3] = (h[3] + d)&0xffffffff
                h[4] = (h[4] + e)&0xffffffff
                h[5] = (h[5] + f)&0xffffffff
                h[6] = (h[6] + g)&0xffffffff
                h[7] = (h[7] + x)&0xffffffff


        digest = ''
        for i in xrange(8):
                digest += bin(h[i])[2:].zfill(32)
        return hex(int(digest,2))

def str2bin(string):
        bin_string = 0
        for character in string:
                bin_string = (bin_string<<8) + ord(character)
        return bin_string

def right_rot(a,by):
        return (a>>by)|(a<<(32-by))&0xffffffff

def NOT(a):
        c = a^0xffffffff
        return c

def bitlength(n):
        return int(math.log(n, 2)) + 1

def chunk(integer,chunklength):
        to_and= 0
        for i in xrange(chunklength):
                to_and = to_and << 1
                to_and += 1
        chunks = []
        for i in xrange(0,bitlength(integer),chunklength):
                chunks.append(integer&to_and)
                integer = integer >> chunklength
        chunks.reverse()
        return chunks


