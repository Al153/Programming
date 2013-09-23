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
							  "%":self.modulo,

							  "swap": self.swap,
							  "dup": self.dup,
							  "drop": self.drop,
							  "print": self.Print,

							  "AND":self.AND,
							  "OR": self.OR,
							  "NOT": self.NOT,
							  "XOR": self.XOR,

							  "compare":self.compare,
							  "if":self.If,
							  "endif":self.endif,
							  "for":self.FOR,
							  "while":self.While,
							  "loop":self.loop,

							  "word":self.word,
							  "endword": self.endword,
							  "local":self.local,
							  "global":self.Global,
							  "unsigned": self.unsigned,
							  "int": self.int,
							  "char": self.char,
							  "intarray":self.instarray,
							  "chararry":self.chararray,
							  "index":self.index,
							  }
		self.defined_words = {}
		self.instruction_pointer = -1
		self.tokens = []

	def input_tokens(self, tokens):
		self.tokens = tokens

	def sequential_execute(self):
		self.instruction_pointer += 1
		token = self.tokens[self.instruction_pointer]
		if token in self.inbuilt_words:
				self.inbuilt_words[token]()

	def stack_formatting(self,data):
		if data = 

	def add(self):
		try:
			var1 = self.Data_Stack.pop()
			var2 = self.Data_Stack.pop()
			var3 = self.stack_formatting(var1+var2)
			Data_Stack.append(var3)


