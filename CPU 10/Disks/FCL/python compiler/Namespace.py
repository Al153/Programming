class NameSpace(value):
	# Instances of this class hold a dictionary
	
	def __init__(self,nSpaceName):
		self.__valueDict = {} # ( hashedName -> fullName * value)
		self.__nameDict= {} # ( regular name -> fasmName )
		self.name = nSpaceName
	def process(self,intermediate):
		# (string -> string)
		# wraps up fasm in an namespace
		return self.name +" ->\n" + intermediate + "\n;;\n"

	def containsName(self,name):
		# (string -> bool)
		return name in self.__nameDict
	def addName(self,name,value):
		# ( string * object -> void)
		if name in self.__nameDict:
			self.__valueDict[self.__namedict[name]] = (name,value)
		else:
			thisName = name
			while 1:
				fName = self.getFasmName(thisName)
				if fName in __valueDict:
						thisName = thisName + "a"
				else:
					self.__valueDict[fName] = (name,value) 

	def getName(self,name):
		# ( string -> string )
		# returns the fasm name of a name
		if name in self.__namedict:
			return self.__namedict[name]
		else:
			raise Exceptions.NameError(name,self.name)
	def getValue(self,name):
		# ( string -> object )
		# returns the value of a name
		thisName = name
		while 1:
			fName = self.getFasmName(thisName)
			if fName in __valueDict:
				(fullName,value) = self.__valueDict[fName]
				if fullName == thisName:
					return value
				else:
					thisName = thisName + "a"
			else:
				raise Exceptions.NameError(name,self.name)




	def getFasmName(self,string):
		# ( str -> str )
		# converts a name longer than 8 chars to one which is simply 8 chars
		# done by taking the first 6 bytes of the name and appending a simple hash of the name to it
		if len(string)<8:
			return string
		else:
			bhash = self.byteHash(string)
			result = string[:6]+hexLookup[bhash>>4]+hexLookup[bhash&15]			 

	def byteHash(self,string):
		h = 0
		i = 0
		nonce = len(string)
		for char in string:
			h = hashTable[(h ^ ord(char)+nonce)&255]
			nonce = hashTable[(nonce+(nonce<<4)-(nonce>>4)+ i)&255] # increases nonlinearity produced by adding characters
			i += 1
		return h^nonce



hashTable = [ 98,  6, 85,150, 36, 23,112,164,135,207,169,  5, 26, 64,165,219,
61, 20, 68, 89,130, 63, 52,102, 24,229,132,245, 80,216,195,115,
90,168,156,203,177,120,  2,190,188,  7,100,185,174,243,162, 10,
237, 18,253,225,  8,208,172,244,255,126,101, 79,145,235,228,121,
123,251, 67,250,161,  0,107, 97,241,111,181, 82,249, 33, 69, 55,
59,153, 29,  9,213,167, 84, 93, 30, 46, 94, 75,151,114, 73,222,
197, 96,210, 45, 16,227,248,202, 51,152,252,125, 81,206,215,186,
39,158,178,187,131,136,  1, 49, 50, 17,141, 91, 47,129, 60, 99,
154, 35, 86,171,105, 34, 38,200,147, 58, 77,118,173,246, 76,254,
133,232,196,144,198,124, 53,  4,108, 74,223,234,134,230,157,139,
189,205,199,128,176, 19,211,236,127,192,231, 70,233, 88,146, 44,
183,201, 22, 83, 13,214,116,109,159, 32, 95,226,140,220, 57, 12,
221, 31,209,182,143, 92,149,184,148, 62,113, 65, 37, 27,106,166,
3, 14,204, 72, 21, 41, 56, 66, 28,193, 40,217, 25, 54,179,117,
238, 87,240,155,180,170,242,212,191,163, 78,218,137,194,175,110,
43,119,224, 71,122,142, 42,160,104, 48,247,103, 15, 11,138,239]

hexLookup = ["0","1","2","3","4","5","6","7","8","9","a","b","c","d","e","f"]