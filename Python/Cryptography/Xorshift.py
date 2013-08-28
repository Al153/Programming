
class BBS1: #Creating a class of objects (BBS)
    def __init__(self): #When rand is called, the values p,q,seed are placed in brackets after it.
        self.random_file = open("BBS seed.txt","r+")
        self.mod = int(self.rando_file.read_line())
        self.seed = int(self.rando_file.read_line())
    def generate(self): #Generator, called Object_name.generate()
        'generates a Pseudo random number'
        self.seed = (self.seed**2)%self.mod #generates
        return self.seed #returns
    def advance(self,advance_by):#very similar to generates, but can advance by more than one step and does not print values
        'advance(advance_value): state(i) => state(i + advance_value)'
        for i in range (advance_by): 
            self.seed = (self.seed**2)%self.mod #generates
    def shut_down(self):
        self.random_file.write(str(self.mod)+'\n'+str(self.seed))
        self.random_file.close()
        del(self)


class Xorshift:
	def __init__(self,w,x,y,z):
		self.state = [w,x,y,z]
		self.rounds = 0
	def reset(self,w,x,y,z):
		self.state = [w,x,y,z]
		self.rounds = 0
	def generate(self):
		t = (self.state[0]^(self.state[0]<<11))%2**32 #generates a temp value
		del(self.state[0]) #shifts along the array
		self.state.append((self.state[2]^(self.state[2]>>19)^(t^(t >>8)))%2**32)
		self.rounds += 1

class Binary_tools:
    def string2IArray(self,string):
        array = []
        for character in string:
            array.append(ord(character))
        return array
    def iArray2string(self,array):
        string = ''
        for i in array:
            string+=chr(i)
    def iArray2BArray(self,array):
        barray = []
        for integer in array:
            binary = bin(integer)[2:].zfill(8)
            for i in binary:
                barray.append(int(i))
        return barray
    def bArray2IArray(self,array):
        iarray = []
        for i in xrange(0,len(binary_array),8):
            blist = binary_array[i,i+8]
            temp_string = ''
            for i in blist:
                temp_string += str(i)
            iarray.append(int(temp_string,2))
        return iarray
    def string2BArray(self,string):
        array = []
        for character in string:
            integer = ord(character)
            binary = bin(integer)[2:].zfill(8)
            for i in binary:
                array.append(int(i))
        return array
    def bArray2String(self,binary_array):
        string = ''
        for i in xrange(0,len(binary_array),8):
            blist = binary_array[i,i+8]
            temp_string = ''
            for i in blist:
                temp_string += str(i)
            integer = int(temp_string,2)
            string += chr(integer)
        return string



class Dynamic_transposition:
    def __init__(self): #gets plain/ciphertext
            error = 1
            while error:
                    try:
                        file_name = str(raw_input("Please enter file name: "))
                        self.pt_file = open(file_name,'rb')
                        error = 0
                    except IOError:
                        try:
                            file_name += '.txt'
                            self.pt_file = open(file_name, 'rb')
                            error = 0
                        except:print "File Name Error,\nPlease try again"
            self.text = self.pt_file.read()
            self.pt_file.close
            error = 1
            while error:
                try:
                    self.mode = int(input"Please choose a mode: Encypt: [0], decrypt: [1]\n:")
                    if self.mode == 0 or self.mode == 1:
                        error = 0
                    else:
                        print "ERROR: Pease enter 0 or 1"
                except: print "ERROR: Pease enter 0 or 1"
            if self.mode == 0:
                        self.generate_key()
            else:
                print "Please enter your decryption key"
                self.init_vector = int(input(":"))
                self.construct()
        def construct(self):
            self.init_vector = self.init_vector%(2**512)
            w = self.init_vector//(2**480)
            x = (self.init_vector%(2**480))//(2**448)
            y = (self.init_vector%(2**448))//(2**416)
            z = (self.init_vector%(2**416))//(2**384)
            self.Xorshift =Xorshift(w,x,y,z)
            for i in range(32)
                self.Xorshift.generate()
        def generate_key():
            BBS1 = BBS1()
            self.init_vector = BBS1.generate()
            BBS1.shut_down()
        
        def operate(self):
            if self.mode == 0: #encrypt
                    pass
            else: #decrypt
                    pass
Cipher = Dynamic_transposition()



