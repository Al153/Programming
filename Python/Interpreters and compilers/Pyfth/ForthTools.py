#Implementation of a forth like language in python




class Forth:
	#A custom implementation of forth written in python
	def __init__(self):
		self.Data_Stack = []

		self.intarrays = {} #stack data_types are always signed 16bit ints
		self.chararrys = {}
		self.chars = {}
		self.ints = {}

		self.inbuilt_words = {
							  "+":self.add,
							  "-":self.subtract,
							  "*":self.multiply,
							  "/":self.divide,
							  "//":self.floordivide
							  "%":self.modulo,

							  "swap": self.swap,
							  "dup": self.dup,
							  "drop": self.drop,
							  "clear": self.clear,

							  "AND":self.AND,
							  "OR": self.OR,
							  "NOT": self.NOT,
							  "XOR": self.XOR,

							  "=":self.compareEqual,
							  "<":self.compareSmallerthan,
							  ">":self.compareGreaterthan,
							  "if":self.If,
							  "endif":self.endif,
							  "for":self.FOR,
							  "while":self.While,
							  "loop":self.loop,

							  "word":self.word,
							  "endword": self.endword,
							  "local":self.local,
							  "global":self.Global,
							  "intarray":self.instarray,
							  "chararry":self.chararray,
							  "index":self.index,

  							  "unsigned": self.unsigned,
							  "int": self.int,
							  "char": self.char,

							  "inInt":self.inInt,
							  "self.inChars":self.inChars,
							  "wait":self.wait,
							  "print": self.Print,
							  "printchar": self.printChar
							  }

		self.defined_words = {}
		self.instruction_pointer = -1
		self.tokens = []

	def input_tokens(self, tokens):
		self.tokens = tokens
		self.instruction_pointer = -1

	def sequential_execute(self):
		self.instruction_pointer += 1
		token = self.tokens[self.instruction_pointer]
		if token in self.inbuilt_words:
				self.inbuilt_words[token]()

	def stack_empty(self):
		print: """

ERROR: Stack is empty.

"""
		quit()

	def ifLoop(self):





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
			var3 = var1-var2
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
				var3 = var1/float(var2)
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
				var3 = int(var1/var2)
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
				var3 = var1%var2
			except:
				self.divide_by_zero()
			finally:
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


