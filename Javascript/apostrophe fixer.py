class frequency_profile:
	#class which generates a list of common words to find with particular word patterns
	def __init__(self,word_patterns_array):
		self.target_patterns = word_patterns_array
		self.result_patterns = {}
		for i in xrange(len(word_patterns_array)):
			self.result_patterns[i] = {
				forwards:{
					1:{},   #depth of 1 -    only looking one word ahead
					2:{},  #depth of 2 - 	two words ahead
					3:{},   #depth of 3 -    threee words ahead
					},
				backwards:{
					1:{},
					2:{},
					3:{},
					}
				}


	def pattern_search(self,text,target_pattern_index):
		words = text.split(" ")
		occurrences = self.find_occurences(words,self.target_patterns[target_pattern_index])
		for index in occurrences:
			self.forwards_search(target_pattern_index,words)
			self.backwards_search(target_pattern_index,words)





	def find_occurences(self,words,target_pattern):
		#find where a a particular pattern of words occurs within a body of text
		occurrences = []
		for i in xrange(len(words)):
			if self.compare_word_patterns(target_pattern,words,i):
				occurrences.append(i)

	def compare_word_patterns(self,word_pattern,words,index):
		#checks if a word pattern is equal to the text at that point
		equal = True
		try:
			for index,word in enumerate(word_pattern):
				if word != words[index+i]:
					equal = False
			return equal
		except IndexError:
			return False

	def 





