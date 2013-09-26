#Implementation of a forth like language in python




class Forth:
	#A custom implementation of forth written in python
	def __init__(self):
		self.Data_Stack = []

		self.defined_words = {}
		self.tokens = []

		self.return_stack = []
		self.loop_stack = []
		self.if_stack = []
		self.defined_words = {}
		self.arrays = {}


		self.inbuilt_words = {
							  "+":self.add, 					#/
							  "-":self.subtract,				#/
							  "*":self.multiply,				#/
							  "/":self.divide,					#/
							  "//":self.floordivide				#/
							  "%":self.modulo,					#/
							  "<<":self.shiftleft,				#/
							  ">>":self.shiftright,				#/

							  "swap": self.swap,				#/
							  "dup": self.dup,					#/
							  "drop": self.drop,				#/
							  "clear": self.clear,				#/

							  "AND":self.AND,					#/
							  "OR": self.OR,					#/
							  "NOT": self.NOT,					#/
							  "XOR": self.XOR,					#/

							  "=":self.compareEqual,			#/
							  "<":self.compareSmallerthan,		#/
							  ">":self.compareGreaterthan,		#/
							  "if":self.If,						#			need technical function
							  "else":self.Else,					#			need technical function
							  "endif":self.endif,				#/
							  "for":self.FOR,					#			need technical function
							  "while":self.While,				#			need technical function
							  "loop":self.loop,					#			need technical function

							  "return": self.Return,			#/
							  "local_var":self.local,				#/
							  "global_var":self.Global,				#/
							  "local_array":self.array,			#			x
							  "global_index":self.index,				#			x
							  "insert":self.insert				#			x

  							  "unsigned": self.unsigned,		#/
							  "int": self.int,					#/
							  "char": self.char,				#/

							  "inInt":self.inInt,				#			x
							  "self.inChars":self.inChars,		#			x
							  "wait":self.wait,					#			x
							  "print": self.Print,				#			x
							  "printchar": self.printChar 		#			x
							  }

		self.defined_words = {}
		self.instruction_pointer = -1
		self.tokens = []

		self.return_stack = []
		self.defined_words = {}
		self.arrays = {}

					#word no, word name
		self.position = [0,		"main"]

	#================ Error handling ======================
	def unrecognised_word(self,word):
		print """
Error: Unrecognised word: """, word, " Found in word: ",self.position[1] 
		quit()

	def no_end_of_function(self):
		print """
Error:
There is likely to be a missing name at end of '""",self.position[1]
		quit()

	def stack_empty(self):
		print: """

ERROR: Stack is empty.

"""
		quit()

	
	# ============== Setup =====================
	def input_tokens(self, tokens):
		self.tokens = tokens
		self.instruction_pointer = -1

	def gather(self):
		"""
		Gathers words within program for execution
		"""
		current_word = []
		current_word_name = ""
		found_word = 0
		for token in self.tokens:
			if found_word:
				if token == ";":
					found_word = 0
					current_word.append("return")
					self.defined_words[current_word_name] = current_word
					current_word = []
				else:
					current_word.append(token)
			else:
				found_word = 1
				current_word_name = token


	# ============= technical ===============
	def ifLoop(self):

	def elseloop(self):

	def forloop(self):

	def whileloop(self):

	# ============ Execution ===============

	def run(self):
		while 1:
			self.execute()

	def execute(self):
		try:
			word = self.defined_words[self.position[1]][self.position[0]]
		except KeyError:
			self.unrecognised_word(word)
		except IndexError:
			self.no_end_of_function()
		try:
			data = (float(word))
			if data == int(word):
				self.Data_stack.append(int(word))
			else:
				self.Data_stack.append(data)
			self.position[0]+=1
		except ValueError:
			try:
				self.inbuilt_words[word]()
				self.position[0]+=1
			except KeyError:
				if self.position[0]+"."+word in self.defined_words:
					word = self.position[0]+"."+word
				destination = [word,0]
				self.position[0] += 1
				self.return_stack.append(self.position)
				self.position = destination



	# =================== individual inbuilt words =========
	def add(self):
		try:
			var1 = self.Data_Stack.pop()
			var2 = self.Data_Stack.pop()

		except:
			self.stack_empty()

		finally:
			var3 = var1+var2
			Data_Stack.append(var3)

	def subtract(self):
		try:
			var1 = self.Data_Stack.pop()
			var2 = self.Data_Stack.pop()

		except:
			self.stack_empty()
			
		finally:
			var3 = var2 - var1
			Data_Stack.append(var3)

	def multiply(self):
		try:
			var1 = self.Data_Stack.pop()
			var2 = self.Data_Stack.pop()

		except:
			self.stack_empty()
			
		finally:
			var3 = var1*var2
			Data_Stack.append(var3)

	def divide(self):
		try:
			var1 = self.Data_Stack.pop()
			var2 = self.Data_Stack.pop()

		except:
			self.stack_empty()
			
		finally:
			try:
				var3 = var2/float(var1)
			except:
				self.divide_by_zero()
			finally:
				Data_Stack.append(var3)

	def floordivide(self):
		try:
			var1 = self.Data_Stack.pop()
			var2 = self.Data_Stack.pop()

		except:
			self.stack_empty()
			
		finally:
			try:
				var3 = int(var2/var1)
			except:
				self.divide_by_zero()
			finally:
				Data_Stack.append(var3)

	def modulo(self):
		try:
			var1 = self.Data_Stack.pop()
			var2 = self.Data_Stack.pop()

		except:
			self.stack_empty()
			
		finally:
			try:
				var3 = var2%var1
			except:
				self.divide_by_zero()
			finally:
				Data_Stack.append(var3)

	def shiftleft(self):
		try:
			var1 = self.Data_Stack.pop()
			var2 = self.Data_Stack.pop()

		except:
			self.stack_empty()
			
		finally:
			var3 = var2 << var1
			Data_Stack.append(var3)

	def shiftright(self):
		try:
			var1 = self.Data_Stack.pop()
			var2 = self.Data_Stack.pop()

		except:
			self.stack_empty()
			
		finally:
			var3 = var2 >> var1
			Data_Stack.append(var3)


	def swap(self):
		try:
			var1 = self.Data_Stack.pop()
			var2 = self.Data_Stack.pop()

		except:
			self.stack_empty()
			
		finally:
			self.Data_Stack.append(var1)
			self.Data_Stack.append(var2)

	def dup(self):
		try:
			var1 = self.Data_Stack.pop()

		except:
			self.stack_empty()
			
		finally:
			self.Data_Stack+=[var1,var1]

	def drop(self):
		try:
			var1 = self.Data_Stack.pop()
		except:
			self.stack_empty()
			
	def Print(self):

		print self.Data_Stack

	def printChar(self):
		try:
			var1 = self.Data_Stack.pop()
		except:
			self.stack_empty()
		finally:
			print chr(int(var1)%256)

	def clear(self):

		self.Data_Stack = []


	def AND(self):
		try:
			var1 = self.Data_Stack.pop()
			var2 = self.Data_Stack.pop()

		except:
			self.stack_empty()

		finally:
			var3 = int(var1)&int(var2)
			Data_Stack.append(var3)

	def OR(self):
		try:
			var1 = self.Data_Stack.pop()
			var2 = self.Data_Stack.pop()

		except:
			self.stack_empty()

		finally:
			var3 = int(var1)|int(var2)
			Data_Stack.append(var3)

	def XNOR(self):
		try:
			var1 = self.Data_Stack.pop()
			var2 = self.Data_Stack.pop()

		except:
			self.stack_empty()

		finally:
			var3 = int(var1)^int(var2)
			Data_Stack.append(var3)

	def NOT(self):
		try:
			var1 = self.Data_Stack.pop()

		except:
			self.stack_empty()

		finally:
			var3 = ~int(var1)
			Data_Stack.append(var3)

	def compareEqual(self):
		try:
			var1 = self.Data_Stack.pop()
			var2 = self.Data_Stack.pop()

		except:
			self.stack_empty()

		finally:
			if var1 == var2:
				self.Data_Stack.append(1)
			else:
				self.Data_Stack.append(0)

	def compareLessthan(self):
		try:
			var1 = self.Data_Stack.pop()
			var2 = self.Data_Stack.pop()

		except:
			self.stack_empty()

		finally:
			if var1 > var2:
				self.Data_Stack.append(1)
			else:
				self.Data_Stack.append(0)

	def compareGreaterthan(self):
		try:
			var1 = self.Data_Stack.pop()
			var2 = self.Data_Stack.pop()

		except:
			self.stack_empty()

		finally:
			if var1 > var2:
				self.Data_Stack.append(1)
			else:
				self.Data_Stack.append(0)

	def If(self):
		try:
			var1 = self.Data_Stack.pop()

		except:
			self.stack_empty()

		finally:
			if not var1:
				self.ifLoop()

	def Else(self):

		self.else_loop()

	def endif(self):

		pass



	def unsigned(self):
		try:
			var1 = self.Data_Stack.pop()

		except:
			self.stack_empty()

		finally:
			self.Data_Stack.append(abs(var1))

	def int(self):
		try:
			var1 = self.Data_Stack.pop()

		except:
			self.stack_empty()

		finally:
			self.Data_Stack.append(int(var1))

	def char(self):
		try:
			var1 = self.Data_Stack.pop()

		except:
			self.stack_empty()

		finally:
			self.Data_Stack.append(int(var1)%256)


