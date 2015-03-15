import random

class GeneticSolver:
	def __init__(self,problem_function,output_ticks = 50,genetic_drift = 250):
		self.output_ticks = output_ticks 
		self.genetic_drift = genetic_drift   #average number of mutations per genome per generation
		self.problem_function = problem_function #problem function should take the output vector as an input and produce a tuple containing the next input vector or the score
		self.best_result = ''
	def solve(self):
		generations = 0
		genomes = [self.random_genome() for i in xrange(20)]
		best_genomes = [('',0),('',0),('',0),('',0),('',0)]
		best_genome_threshold = 0.0
		while 1:
			print "generation",generations,", best score = ", best_genomes[0][1]
			#cont = raw_input('')
			for genome in genomes:
				#print genome[:20]
				input_vector = [1,1,1,1,1,1,1,1]
				test_network = Neural_Network(genome,range(8),range(8,16),self.output_ticks) #sets up a neural network
				while 1: #now run the neural network
					input_vector = self.problem_function(test_network.tick(input_vector))
					#print input_vector
					if len(input_vector) == 1: #if program fails, input vector becoems a tuple of the score
						if input_vector[0] > best_genome_threshold:  #if good enough to be in the best genome
							#print "new best genome"
							best_genome_threshold = self.insert_best_genome(best_genomes,genome,input_vector[0])

						break
			# now picks the best 5 genomes and breeds each with all others, and randomly mutates al five to give 20 new genomes
			#print best_genomes
			genomes = self.choose_new_genomes(best_genomes)
			generations += 1
			print "Best result: ",
			input_vector = [0,0,0,0,0,0,0,0]
			test_network = Neural_Network(best_genomes[0][0],[0]*8,[0]*8,self.output_ticks) #sets up a neural network
			while 1: #now run the neural network
				input_vector = self.problem_function(test_network.tick(input_vector))
				if len(input_vector) == 1:
					break		

	def insert_best_genome(self,best_genomes,new_genome,score):
		#inserts new_best_genome, removes worst best genome and returns the threshold score to be a best genome
		if score > best_genomes[3][1]:
			if score > best_genomes[2][1]:
				if score > best_genomes[1][1]:
					if score > best_genomes[0][1]:
						best_genomes.insert(0,(new_genome,score))
						best_genomes.pop() 
					else:
						best_genomes.insert(1,(new_genome,score))
						best_genomes.pop()
				else:
					best_genomes.insert(2,(new_genome,score))
					best_genomes.pop()
			else:
				best_genomes.insert(3,(new_genome,score))
				best_genomes.pop()
		else:
			best_genomes.insert(4,(new_genome,score))
			best_genomes.pop()
		return best_genomes[4][1] #return worst-best score

	def choose_new_genomes(self,best_genomes):
		#generates a list of new genomes
		#10 by breeding them, 10 by mutating
		pairs = [(0,1),(0,2),(0,3),(0,4),
				(1,2),(1,3),(1,4),
				(2,3),(2,4),
				(3,4)]
		genomes = []
		for pair in pairs:
			genomes.append( self.breed_genomes(
				best_genomes[pair[0]][0],best_genomes[pair[1]][0]
				))
		for i in xrange(5):
			genomes.append(self.breed_genomes(best_genomes[i][0],self.random_genome()))
			genomes.append(self.mutate_genome(best_genomes[i][0]))
		return genomes

	def random_genome(self):
		#creates a random genome
		genome = ''
		for i in xrange(7168):
			genome+= chr(random.randrange(256))
		return genome
	def mutate_genome(self,genome):
		#mutates a genome slightly
		new_genome = ''
		mutate_probability = self.genetic_drift/7168.0
		for i in xrange(7168): 								#each base has a small chance to mutate
			if random.random()<mutate_probability:
				new_genome += chr(random.randrange(256))
			else:
				new_genome += genome[i]
		return new_genome

	def breed_genomes(self,genome1,genome2):
		#breeds genome then mutates it
		new_genome = ''
		for i in xrange(7168):
			#print i
			if random.random()>0.5:
				new_genome += genome1[i]
			else:
				new_genome += genome2[i]
		return self.mutate_genome(new_genome)




class Neuron:
	def __init__(self,grid,weight_vector,connection_vector,start_value,threshold):
		#chromose is 8*2 bytes for weight vector, 8*1 byte for connection vector, 2 bytes for start value, 2 bytes for threshold = 28 bytes
		self.weight_vector = self.unpack_weights(weight_vector) 			#weight vector gives the weightings for each of the sample points
		self.output = self.unpack(start_value) 			#output starts at the start value
		self.connection_vector = connection_vector
		self.threshold = self.unpack(threshold)
		self.grid = grid

	def tick(self):
		self.output = sum([self.weight_vector[i]*self.grid[self.connection_vector[i]].output for i in range(8)])
		self.output = self.output if(self.output > self.threshold)else 1.0
		#print self.output

	def unpack(self,byte_pair):
		#creates a float from a pair of bytes:
		#SFFFFFFF FFFEEEEE, exponent excess 16, where there is an assumed 11th bit on the fraction parts
		#print byte_pair
		integer_form = (byte_pair[0]<<8)|(byte_pair[1])
		sign = integer_form>>15
		fraction = (integer_form>>5)&1023
		exponent = (integer_form&31)-16
		float_form = ((-1)**sign)*((1024+fraction)/1024.0)*(2.0**exponent)
		return float_form

	def unpack_weights(self,weight_vector):
		#unpacks a series of weights
		new_weights = []
		for i in range(8):
			new_weights.append(self.unpack(weight_vector[2*i:(2*i) + 2]))
		return new_weights

class Neural_Network:
	def __init__(self,genome,output_indices,input_indices,output_ticks):
		#genome must be of size 7168 bytes
		#input and output_indices are the indices of the neurons to add values to and read from respectively
		#output_ticks is the number of ticks between inputs and outputs
		genome = self.pad(genome)
		self.genome = genome
		self.input_indices = input_indices
		self.output_indices = output_indices
		self.output_ticks = output_ticks

		self.grid = []
		for i in xrange(256):
			self.grid.append(self.createNeuron(genome[28*i:28*(i+1)]))


	def pad(self,genome):
		#pads genome to 7168 bytes
		length = len(genome)
		genome += '\x00' * (7168-length)
		return genome

	def createNeuron(self,genome_fragment):
		#breaks a genome fragment into a series of fields, then generates a neuron
		weight_vector = [ord(char) for char in genome_fragment[0:16]]
		connection_vector = [ord(char) for char in genome_fragment[16:24]]
		start_value = [ord(char) for char in genome_fragment[24:26]]
		threshold = [ord(char) for char in genome_fragment[26:28]]
		return Neuron(self.grid,weight_vector,connection_vector,start_value,threshold)


	def tick(self,inputs):
		#adds input values to input nodes
		#carries out output_ticks number of ticks across the network, then reads out off of output nodes
		output_vector = []
		for i in xrange(8):
			self.grid[self.input_indices[i]].output += inputs[i]
		for i in xrange(self.output_ticks):
			for j in xrange(256):
				self.grid[j].tick()
		for i in xrange(8):
			output_vector.append(self.grid[i].output)
		#print output_vector
		return output_vector



class hello_world_test:
	def __init__(self):
		self.state = 0
		self.score = 0
		self.target = "hello world"
		self.previous_character = '\x00'

	def score_function(self,input_vector):
		#print input_vector
		if self.state == len(self.target):
			print "		" , self.score
			score = self.score
			self.score = 0
			self.state = 0
			self.previous_character = '\x00'
			return [score]
		else:
			try:
				chosen_character = int(input_vector[0])%256
			except OverflowError:
				chosen_character = 255
			print chr(chosen_character),
			dscore =  0.001 * (256-(abs(ord(self.target[self.state])-chosen_character)))**2
			if chosen_character == self.previous_character and chr(chosen_character) != self.target[self.state]:
				dscore *= 0.1
			if chr(chosen_character) == self.target[self.state]:
				dscore += 100
			self.score += dscore
			self.state += 1
			self.previous_character = chosen_character
			return [1,1,1,1,1,1,1,1]

	def test(self):
		self.GeneticSolver = GeneticSolver(self.score_function)
		self.GeneticSolver.solve()

test = hello_world_test()
test.test()