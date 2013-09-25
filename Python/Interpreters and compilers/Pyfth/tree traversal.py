	
	self.return_stack = []
	self.defined_words = {}
	self.arrays = {}

					#word no, word name
	self.position = [0,		"main"]
	def unrecognised_word(self,word):
		print """
Error: Unrecognised word: """, word, " Found in word: ",self.position[1] 
		quit()

	def no_end_of_function(self):
		print """
Error:
There is likely to be a missing name at end of '""",self.position[1]

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

	def execute(self):
		try:
			word = self.defined_words[self.position[1]][self.position[0]]
		except KeyError:
			self.unrecognised_word(word)
		except IndexError:
			self.no_end_of_function()
		try:
			self.Data_stack.append(int(word))
			self.position[0]+=1
		except ValueError:
			try:
				self.inbuilt_words[word]()
				self.position[0]+=1
			except KeyError:
					
				destination = [word,0]
				self.position[0] += 1
				self.return_stack.append(self.position)
				self.position = destination

	def Return(self):
		self.postition = self.return_stack.pop()

	def Global(self):
		try:
			var1 = self.Data_stack.pop()
		except:
			self.empty_stack()
		finally: #A non existent var_name can never cause a problem, as return becomes the var_name
				self.position[0] += 1
				var_name = self.defined_words[self.position[1]][self.position[0]]
				self.defined_words[var_name] = [str(var1)]

	def Local(self):
		try:
			var1 = self.Data_stack.pop()
		except:
			self.empty_stack()
		finally: #A non existent var_name can never cause a problem, as return becomes the var_name
				self.position[0] += 1
				var_name = self.position[1]+"."+self.defined_words[self.position[1]][self.position[0]]
				self.defined_words[var_name] = [str(var1)]
