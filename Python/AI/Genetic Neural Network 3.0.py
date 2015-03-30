import random
import math
import time

class GeneticSolver:
	def __init__(self,problem_function,using_graphics = 0,output_ticks = 32,genetic_drift = 250,min_genetic_drift = 20):
		self.output_ticks = output_ticks 
		self.genetic_drift = genetic_drift   #average number of mutations per genome per generation
		self.min_genetic_drift = min_genetic_drift ##,inimun average number of mutations per genome per generation
		self.problem_function = problem_function #problem function should take the output vector as an input and produce a tuple containing the next input vector or the score
		self.best_result = ''
		self.using_graphics = using_graphics
		if using_graphics:
			import pygame
			global PYGAME 
			PYGAME = pygame
			pygame.init()
			global screen
			screen = pygame.display.set_mode((256,256))
			global PIXEL_ARRAY
			PYGAME.display.set_caption("Genetic Neural Network v3.0")
			PIXEL_ARRAY = pygame.PixelArray(screen)


	def solve(self):
		generations = 0
		genomes = [self.random_genome() for i in xrange(20)]
		best_genomes = [('',0),('',0),('',0),('',0),('',0)]
		best_genome_threshold = 0.0
		count = 0
		start = time.time()
		try:
			while 1:
				#if count == 0: raw_input('')
				#count = (count + 1)%200
				print "generation",generations,", best score = ", best_genomes[0][1]
				print "Time elapsed: ", time.time() - start
				print "Genetic drift = ", self.genetic_drift
				#cont = raw_input('')
				for genome in genomes:
					#print genome[:20]
					input_vector = [1,1,1,1,1,1,1,1]
					test_network = Neural_Network(genome,range(120,128),range(8),self.output_ticks,self.using_graphics) #sets up a neural network
					while 1: #now run the neural network
						input_vector = self.problem_function(test_network.tick(input_vector))
						if len(input_vector) == 1: #if program fails, input vector becoems a tuple of the score
							if input_vector[0] > best_genome_threshold:  #if good enough to be in the best genome
								best_genome_threshold = self.insert_best_genome(best_genomes,genome,input_vector[0])
							break
				# now picks the best 5 genomes and breeds each with all others, and randomly mutates al five to give 20 new genomes
				#print best_genomes

				genomes = self.choose_new_genomes(best_genomes)
				generations += 1
				self.genetic_drift = self.new_genetic_drift(self.genetic_drift)
				print "Best result: ",
				input_vector = [1,1,1,1,1,1,1,1]
				test_network = Neural_Network(best_genomes[0][0],range(120,128),range(8),self.output_ticks,self.using_graphics) #sets up a neural network
				while 1: #now run the neural network
					input_vector = self.problem_function(test_network.tick(input_vector))
					if len(input_vector) == 1:
						break		
		except KeyboardInterrupt:
			store_file = open("Best genome.txt","w")
			store_file.write(best_genomes[0][0])


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
#		#10 by breeding them, 10 by mutating
#		pairs = [(0,1),(0,2),(0,3),(0,4),
#				(1,2),(1,3),(1,4),
#				(2,3),(2,4),
#				(3,4)]
		genomes = []
#		for pair in pairs:
#			genomes.append( self.breed_genomes(
#				best_genomes[pair[0]][0],best_genomes[pair[1]][0]
#				))
		for i in xrange(5):
			genomes.append(self.mutate_genome(best_genomes[i][0]))
			genomes.append(self.mutate_genome(best_genomes[i][0]))
			genomes.append(self.breed_genomes(best_genomes[i][0],self.random_genome()))
			genomes.append(self.mutate_genome(best_genomes[i][0]))
		return genomes

	def random_genome(self):
		#creates a random genome
		genome = ''
		for i in xrange(5120):
			genome+= chr(random.randrange(256))
		return genome
	def mutate_genome(self,genome):
		#mutates a genome slightly
		new_genome = ''
		mutate_probability = self.genetic_drift/5120.0
		for i in xrange(5120): 								#each base has a small chance to mutate
			if random.random()<mutate_probability:
				new_genome += chr(random.randrange(256))
			else:
				new_genome += genome[i]
		return new_genome

	def breed_genomes(self,genome1,genome2):
		#breeds genome then mutates it
		new_genome = ''
		for i in xrange(5120):
			#print i
			if random.random()>0.5:
				new_genome += genome1[i]
			else:
				new_genome += genome2[i]
		return self.mutate_genome(new_genome)

	def new_genetic_drift(self,genetic_drift):
		return max(genetic_drift*0.95, self.min_genetic_drift)




class Neuron:
	def __init__(self,grid,weight_vector,connection_vector,start_value,threshold):
		#chromosome is 8*2 bytes for weight vector, 8*1 byte for connection vector, 2 bytes for start value, 2 bytes for threshold = 28 bytes
		self.weight_vector = self.unpack_weights(weight_vector) 			#weight vector gives the weightings for each of the sample points
		self.output = abs(self.unpack(start_value) )			#output starts at the start value
		self.connection_vector = connection_vector
		#print self.weight_vector
		self.threshold = self.unpack(threshold)
		self.grid = grid
		self.new_output = self.output

	def tick1(self):
		self.new_output = self.output
		for i in xrange(8):
			self.new_output += self.weight_vector[i]*self.grid[self.connection_vector[i]].output
		self.new_output -= self.threshold
		self.new_output = sigmoid(self.new_output)
		#self.new_output = 1/(1+math.exp(-0.5*self.new_output))

	def tick2(self):
		self.output  = self.new_output
		#print self.output, self.new_output



	def unpack(self,byte_pair):
		#creates a float from a pair of bytes:
		#SFFFFFFF FFFFFFFF
		#where s is the sign and F the fraction
		#print byte_pair
		integer_form = (byte_pair[0]<<8)|(byte_pair[1])
		sign = integer_form>>15
		fraction = integer_form&32767
		float_form = ((-1)**sign)*((fraction)/32768.0)
		#print float_form
		return float_form

	def unpack_weights(self,weight_vector):
		#unpacks a series of weights
		new_weights = []
		for i in range(8):
			new_weights.append(self.unpack(weight_vector[2*i:(2*i) + 2]))
		return new_weights

class Neural_Network:
	def __init__(self,genome,output_indices,input_indices,output_ticks,display = 0):
		#genome must be of size 5120 bytes
		#input and output_indices are the indices of the neurons to add values to and read from respectively
		#output_ticks is the number of ticks between inputs and outputs
		genome = self.pad(genome)
		self.genome = genome
		self.input_indices = input_indices
		self.output_indices = output_indices
		self.output_ticks = output_ticks
		self.display = display

		self.grid = []
		for i in xrange(256):
			self.grid.append(self.createNeuron(genome[20*i:20*(i+1)],i))


	def pad(self,genome):
		#pads genome to 5120 bytes
		length = len(genome)
		genome += '\x00' * (5120-length)
		return genome

	def createNeuron(self,genome_fragment,index):
		#breaks a genome fragment into a series of fields, then generates a neuron
		weight_vector = [ord(char) for char in genome_fragment[0:16]]
		connection_vector = self.get_connections(index)
		start_value = [ord(char) for char in genome_fragment[16:18]]
		threshold = [ord(char) for char in genome_fragment[18:20]]
		return Neuron(self.grid,weight_vector,connection_vector,start_value,threshold)


	def tick(self,inputs):
		#adds input values to input nodes
		#carries out output_ticks number of ticks across the network, then reads out off of output nodes
		if self.display:
			return self.tick_with_display(inputs)
		else: 
			return self.tick_no_display(inputs)

	def tick_with_display(self,inputs):
		output_vector = []
		for j in xrange(8):
			self.grid[self.input_indices[j]].output += inputs[j]
		for i in xrange(self.output_ticks):

			#print "\n\n\n\n", i
			#raw_input('')
			for j in xrange(256):
				self.grid[j].tick1()
			for j in xrange(256):
				self.grid[j].tick2()
				self.display_network(self.grid[j].output,j)
			PYGAME.display.update()
			PYGAME.event.get()
		for i in xrange(8):
			output_vector.append(self.grid[self.output_indices[i]].output)
		return output_vector

	def tick_no_display(self,inputs):
		output_vector = []
		for j in xrange(8):
			self.grid[self.input_indices[j]].output += inputs[j]
		for i in xrange(self.output_ticks):

			#print "\n\n\n\n", i
			#raw_input('')
			for j in xrange(256):
				self.grid[j].tick1()
			for j in xrange(256):
				self.grid[j].tick2()
		for i in xrange(8):
			output_vector.append(self.grid[self.output_indices[i]].output)
		return output_vector

	def get_connections(self,index):
		#gets the neighbors of an index (8 surrounding indices)
		x = index//16
		y = index%16
		vector = [
			(x,(y+1)%16),
			(x,(y-1)%16),
			((x+1)%16,y),
			((x-1)%16,y),
			((x+1)%16,(y+1)%16),
			((x+1)%16,(y-1)%16),
			((x-1)%16,(y+1)%16),
			((x-1)%16,(y-1)%16),
		]
		return [(xy[0]<<4) + xy[1] for xy in vector]

	def display_network(self,output_value,index):
		#print index
		x = index>>4
		y = index &15
		#print (x,y)
		global PIXEL_ARRAY
		PIXEL_ARRAY[16*x:16*(x+1),16*y:16*(y+1)] = self.get_colour(output_value)

	def get_colour(self,value):
		value = int((value+1)*128) if value <1 else 255
		return (value<<16)+(value<<8)+value





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
			chosen_character = 0
			for i in range(8):
				chosen_character <<= 1
				chosen_character += self.round(input_vector[i])
			#print input_vector
			print chr(chosen_character),
			dscore = (8 - self.hamming_distance(chosen_character,ord(self.target[self.state])))**2
			if chosen_character == self.previous_character and chr(chosen_character) != self.target[self.state]:
				dscore *= 0.1
			if chr(chosen_character) in "abcdefghijklmnopqrstuvwxyz" or chr(chosen_character) == ' ':
				dscore += 1
			self.score += dscore
			self.state += 1
			self.previous_character = chosen_character
			return [1,1,1,1,1,1,1,1]

	def test(self):
		self.GeneticSolver = GeneticSolver(self.score_function,1)
		self.GeneticSolver.solve()
	def round(self,number):
		if number > 0.0:
			return 1
		else:
			return 0

	def hamming_distance(self,x,y):
		difference = x^y
		return sum([(difference>>i)&1 for i in range(8)])


class Sprint_program_test:
	def __init__(self):
		self.timer = 20
		self.distance = 0
		self.state = 0

	def score_function(self,input_vector):
		#how far can the brain "sprint" by outputting [1,0...] then [0,1...]?
		input_vector = [self.round(bit) for bit in input_vector] 
		if self.timer == 0:
			print "			", self.distance
			score = self.distance
			self.distance = 0
			self.timer = 20
			self.state = 0
			return [score]
		else:
			self.timer -= 1
			if self.state == 0:
				if input_vector[0] and not input_vector[1]:
					print 1,
					self.distance +=1
					self.state = 1
					return [0,1,0,0,0,0,0,0]
				else:
					print 0,
					return [1,0,0,0,0,0,0,0]
			else:
				if input_vector[1] and not input_vector[0]:
					self.distance +=1
					self.state = 0
					print 2,
					return [1,0,0,0,0,0,0,0]
				else:
					print 0,
					return [0,1,0,0,0,0,0,0]		
	def test(self):
		self.GeneticSolver = GeneticSolver(self.score_function,1)
		self.GeneticSolver.solve()			
	def round(self,number):
		if number > 0.5:
			return 1
		else:
			return 0	




def sigmoid(x):
	return (math.tanh(x))


test = hello_world_test()
test.test()


test = Sprint_program_test()
test.test()