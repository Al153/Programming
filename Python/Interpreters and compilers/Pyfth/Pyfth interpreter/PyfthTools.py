#Implementation of a forth like language in python
import sys
import Tokenizer



class Pyfth:
	#A custom implementation o fforth written in python
	def __init__(self):
		self.Data_Stack = []
		#print self.Data_Stack
		self.defined_words = {}

		self.return_stack = []
		self.loop_stack = [] #to allow looping
		self.if_stack = []	 #to allow if statements
		self.defined_words = {}
		self.arrays = {}
					#word no, word name
		self.position = [0,		"main"]

		self.inbuilt_words = {
							  "+":self.add, 					#/
							  "-":self.subtract,				#/
							  "*":self.multiply,				#/
							  "/":self.divide,					#/
							  "//":self.floordivide,			#/
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
							  "<":self.compareLessthan,			#/
							  ">":self.compareGreaterthan,		#/
							  "if":self.If,						#/
							  "else":self.Else,					#/
							  "endif":self.endif,				#/
							  "for":self.For,					#/
							  "while":self.While,				#/
							  "loop":self.loop,					#/

							  "return": self.Return,			#/
							  "local":self.local_var,			#/
							  "global":self.global_var,			#/
							  "local_array":self.local_array,	#/
							  "global_array":self.global_array, #/
							  "ref_array": self.ref_array,      #/
							  "index":self.index,				#/
							  "insert":self.insert,				#/
							  "len":self.len,
							  "str":self.str,


  							  "unsigned": self.unsigned,		#/
							  "int": self.int,					#/
							  "char": self.char,				#/

							  "in":self.inData,					#/
							  "inChars":self.inChars,			#/
							  "wait":self.wait,					#/
							  "print": self.Print,				#/
							  "print_char": self.print_char,	#/
							  "print_stack":self.print_stack 	#/
							}



	#================ Error handling ======================
	def unrecognised_word(self):
		print """
Error: Unrecognised word Found: """,self.position[1]
		quit()


	def no_end_of_function(self):
		print """
Error: There is a missing word at end of '""",self.position[1]
		quit()

	def stack_empty(self):
		print "\nERROR: Stack is empty."
		quit()

	def invalid_index(self, array,index):
		print '''ERROR: invalid index for array''', array, "index = ",index
		quit()

	def invalid_reference(self,reference):
		print "ERROR: invalid reference: ", reference
		quit()
	# ============== Setup =====================
	def input_tokens(self, tokens):
		self.tokens = tokens

	def gather(self,tokens):
		"""
		Gathers words within program for execution
		"""
		defined_words = {}
		current_word = []
		found_word = 0
		import_called = 0
		for token in tokens:
			if import_called:
				import_called = 0
				token = "..\\" + token+".pyfth"
				#print token
				imported_program = open(token)
				defined_words.update(self.gather(Tokenizer.tokenize(imported_program)))
				#print defined_words
				imported_program.close()
			elif found_word:
				if token == ";":
					found_word = 0
					current_word.append("return")
					defined_words[current_word_name] = current_word
					current_word = []

				else:
					current_word.append(token)
			elif token == "import":
				import_called = 1


			else:
				#print "found word: ",token
				found_word = 1
				current_word_name = token
		return defined_words
		#print self.defined_words


	# ============= technical ===============
	def ifLoop(self):
		if_count = 1

		position =self.position #import into local space for speed
		if_stack = ["if"]
		defined_words = self.defined_words
		while if_count:

			position[0] += 1
			try:
				word = defined_words[position[1]][position[0]]
			except:
				self.no_end_of_function()
			if word == "if" or word == "else" or word == "endif":
				if word == "if":
					if_count += 1
					if_stack.append("if")
				elif word == "else":
					if_count -= 1
					if_stack.pop() #replaces top of stack with if
					if_stack.append("else")
				else: #== "endif"
					if if_stack.pop() == "if":
						if_count -= 1

		self.position = position


	def elseloop(self):

		if_count = 1

		position = self.position #moving into local memory
		defined_words = self.defined_words

		while if_count:
			position[0] += 1
			try:
				word = defined_words[position[1]][position[0]]
			except:
				self.no_end_of_function
			if word == "if":
				if_count += 1
			elif word == "endif":
				if_count -= 1

		self.position = position


	def forloop(self):
		try:
			start = self.Data_Stack.pop()
			end = self.Data_Stack.pop()
		except:
			self.stack_empty()
		self.position[0]+= 1
		variable = self.defined_words[self.position[1]][self.position[0]]
		if start == end:
			self.find_loop_word()
		elif start < end:
			self.defined_words[variable] = [str(start),"return"]
			self.loop_stack.append(["for",[self.position[0],self.position[1]],variable,end,"+"])#forloop format on stack
		else:
			self.defined_words[variable]= [str(start),"return"]
			self.loop_stack.append(["for",[self.position[0],self.position[1]],variable,end,"-"])

	def whileloop(self):
		try:
			data = self.Data_Stack.pop()
		except:
			self.stack_empty()
		if data:
			self.loop_stack.append(["while",[self.position[0],self.position[1]]])
		else:
			self.find_loop_word()

	def find_loop_word(self):
		loop_count = 1
		self.position[0] += 1
		while loop_count:
			self.position[0] += 1
			try: 
				if self.defined_words[self.position[1]][self.position[0]] == "loop":
					loop_count -= 1
				elif self.defined_words[self.position[1]][self.position[0]] == "for" or self.defined_words[self.position[1]][self.position[0]] == "while":
					self.loop_count += 1
			except:
				self.no_end_of_function()

	def init_array(self,name,size):
		reference = hash(name)
		self.arrays[reference] = [0]*size
		created_word = [str(reference), "return"] #calling the array will push a reference into the stack
		self.defined_words[name] = created_word 
		return reference

	def init_var(self,name,value):
		self.defined_words[name] = [str(value),"return"]
	# ============ Execution ===============

	def run(self):
		self.defined_words = self.gather(self.tokens)
		self.done = 0
		while not self.done:
			self.execute()

	def execute(self):
		try:
			parent_word = self.defined_words[self.position[1]]
		except KeyError:
			self.unrecognised_word()
		try:
			word = parent_word[self.position[0]]
			#print self.position[1], self.position[0], word
		except IndexError:
			self.no_end_of_function()

		#print word
		try:
			data = (float(word))
			if data == int(word):
				self.Data_Stack.append(int(word))
			else:
				self.Data_Stack.append(data)
			self.position[0]+=1
		except ValueError:
			try:
				#print self.position
				self.inbuilt_words[word]()
				#print word
				self.position[0]+=1
			except KeyError:
				if self.position[1]+"."+word in self.defined_words:
					word = self.position[1]+"."+word
				destination = [0,word]
				#self.position[0] += 1
				self.return_stack.append(self.position)
				#print self.return_stack
				self.position = destination



	# =================== individual inbuilt words =========

	#======================= ALU commands =======================
	def add(self):
		try:
			var1 = self.Data_Stack.pop()
			var2 = self.Data_Stack.pop()

		except:
			self.stack_empty()

		finally:
			var3 = var1+var2
			self.Data_Stack.append(var3)

	def subtract(self):
		try:
			var1 = self.Data_Stack.pop()
			var2 = self.Data_Stack.pop()

		except:
			self.stack_empty()
			
		finally:
			var3 = var2 - var1
			self.Data_Stack.append(var3)

	def multiply(self):
		try:
			var1 = self.Data_Stack.pop()
			var2 = self.Data_Stack.pop()

		except:
			self.stack_empty()
			
		finally:
			var3 = var1*var2
			self.Data_Stack.append(var3)

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
				self.Data_Stack.append(var3)

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
				self.Data_Stack.append(var3)

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
				self.Data_Stack.append(var3)

	def shiftleft(self):
		try:
			var1 = self.Data_Stack.pop()
			var2 = self.Data_Stack.pop()

		except:
			self.stack_empty()
			
		finally:
			var3 = var2 << var1
			self.Data_Stack.append(var3)

	def shiftright(self):
		try:
			var1 = self.Data_Stack.pop()
			var2 = self.Data_Stack.pop()

		except:
			self.stack_empty()
			
		finally:
			var3 = var2 >> var1
			self.Data_Stack.append(var3)


	def AND(self):
		try:
			var1 = self.Data_Stack.pop()
			var2 = self.Data_Stack.pop()

		except:
			self.stack_empty()

		finally:
			var3 = int(var1)&int(var2)
			self.Data_Stack.append(var3)

	def OR(self):
		try:
			var1 = self.Data_Stack.pop()
			var2 = self.Data_Stack.pop()

		except:
			self.stack_empty()

		finally:
			var3 = int(var1)|int(var2)
			self.Data_Stack.append(var3)

	def XOR(self):
		try:
			var1 = self.Data_Stack.pop()
			var2 = self.Data_Stack.pop()

		except:
			self.stack_empty()

		finally:
			var3 = int(var1)^int(var2)
			self.Data_Stack.append(var3)

	def NOT(self):
		try:
			var1 = self.Data_Stack.pop()

		except:
			self.stack_empty()

		finally:
			var3 = ~int(var1)
			self.Data_Stack.append(var3)


#================== Stack manipulation ===============

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
			#print self.Data_Stack

	def drop(self):
		try:
			var1 = self.Data_Stack.pop()
		except:
			self.stack_empty()

	def clear(self):

		self.Data_Stack = []

# =================== Conditional + looping ==================

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

		self.elseloop()

	def endif(self):

		pass

	def For(self):
		self.forloop()

	def While(self):
		self.whileloop()

	def loop(self):
		loop_type = self.loop_stack.pop()
		if loop_type[0] == "while":
			try:
				if self.Data_Stack.pop():
					self.position = list(loop_type[1])
					self.loop_stack.append(loop_type) #regenerates loop
				else:
					pass
			except IndexError:
				self.stack_empty
		else: #for loop
			#print "forloop",
			variable = loop_type[2]
			end = loop_type[3]
			direction = loop_type[4]
			var_value = int(self.defined_words[variable][0])
			#print "i = ",var_value, "end =",end, "direction =", direction

			if direction == "+":
				var_value += 1
				if var_value < end:
					self.defined_words[variable][0] = str(var_value)
					self.loop_stack.append(loop_type)
					self.position = list(loop_type[1])
					#print self.position, loop_type[1], self.loop_stack
			else: #directionm == "-"
				var_value -= 1
				if var_value > end:
					self.defined_words[variable][0] = str(var_value)
					self.loop_stack.append(loop_type)
					self.position = list(loop_type[1])


				



    #============== Datatype words ==================

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


	#=============== Array words ====================

	def local_array(self):
		self.position[0] += 1
		name = self.position[1] + "." + self.defined_words[self.position[1]][self.position[0]]
		try:
			size = self.Data_Stack.pop()
			self.init_array(name,size)
		except:
			self.stack_empty()

	def global_array(self):
		self.position[0] += 1
		name = self.defined_words[self.position[1]][self.position[0]]
		try:
			size = self.Data_Stack.pop()
			self.init_array(name,size)
		except:
			self.stack_empty()

	def ref_array(self):
		try:
			reference = self.Data_Stack.pop()
			size = self.Data_Stack.pop()
		except:
			self.stack_empty()
		self.arrays[reference] = [0]*size

	def insert(self):
		try:
			reference = self.Data_Stack.pop()
			position = self.Data_Stack.pop()
			data = self.Data_Stack.pop()
		except:
			self.stack_empty()
		finally:
			try:
				#print "inserting to", reference
				self.arrays[reference][position] = data
			except IndexError:
				self.invalid_index(self.arrays[reference],position)
			except KeyError:
				self.invalid_reference(reference)


	def index(self):
		try:
			reference = self.Data_Stack.pop()
			position = self.Data_Stack.pop()
		except:
			self.stack_empty()
		finally:
			try:
				self.Data_Stack.append(self.arrays[reference][position])
			except IndexError:
				self.invalid_index(self.arrays[reference],position)
			except KeyError:
				self.invalid_reference(reference)

	def len(self):
		try:
			reference = self.Data_Stack.pop()
		except:
			self.stack_empty()
		try:
			self.Data_Stack.append(len(self.arrays[reference]))
		except KeyError:
			self.invalid_reference(reference)

	def str(self):
		self.position[0] += 1
		name = self.defined_words[self.position[1]][self.position[0]]
		try:
			self.position[0] += 1
			#print self.position[0]
			string = self.defined_words[self.position[1]][self.position[0]]
			#print "name = ", name, "string = ",string
		except IndexError:
			self.no_end_of_function()
		finally:
			length = len(string)
			reference = self.init_array(name,length)
			for i in xrange(length):
				self.arrays[reference][i] = ord(string[i])
			#print self.arrays		
	#===================== Variable_words =====================

	def global_var(self):
		self.position[0] += 1
		name = self.defined_words[self.position[1]][self.position[0]]
		try:
			data = self.Data_Stack.pop()
		except:
			self.stack_empty()
		finally:
			self.init_var(name,data)

	def local_var(self):
		self.position[0] += 1
		name = self.position[1] + "." + self.defined_words[self.position[1]][self.position[0]]
		try:
			data = self.Data_Stack.pop()
		except:
			self.stack_empty()
		finally:
			self.init_var(name,data)

	# ===================== IO words =================
	def inData(self):
		try:
			data = input()
			if int(data) == float(data): #if integer
				self.Data_Stack.append(int(data))
			else:
				self.Data_Stack.append(float(data))
		except:
			self.invalid_data()


	def inChars(self):
		data = str(raw_input())
		self.position[0] += 1
		try:
			name = self.defined_words[self.position[1]][self.position[0]]
		except KeyError:
			self.no_end_of_function

		reference = self.init_array(name,0) #empty array which is filled by forloop
		for char in data:
			self.arrays[reference].append(ord(char))



	def wait(self):
		value = str(raw_input("Press enter to continue:"))

	def Print(self):
		try:
			value = self.Data_Stack.pop()
		except:
			self.stack_empty()
		
		print value,
		sys.stdout.write('')

	def print_stack(self):
		print self.Data_Stack

	def print_char(self):
		try:
			value = self.Data_Stack.pop()
		except:
			self.stack_empty()
		finally:
			print chr(int(value)%256),
			sys.stdout.write('')

	def Return(self):
		try:
			self.position = self.return_stack.pop()
		except IndexError: #end of program
			self.done = 1