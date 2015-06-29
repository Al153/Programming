import math
import random

#_________________________ gene system _______________________________

#assumes maximum of 256 neurons

class connectionGene:
	def __init__(self,string):  #string is 3 ascii characters
		neuron_1 = ord(string[0])
		neuron_2 = ord(string[1])
		weight = ord(string[2])
		
		if neuron_1>neuron_2:  #assume neuron 1 is the smaller (so data flows in one direction)
			neuron_1,neuron_2 = neuron_2,neuron_1


		self.neuron_1 = neuron_1
		self.neuron_2 = neuron_2
		self.weight = (weight/128.0)-1.0


def GeneticNeuralNetwork(genome):
	#genome is a string of 3 byte genes
	#each gene represents a single connection
	neurons = [inputNeuron([],[]) for i in xrange(16)] = [Neuron([],[]) for i in xrange(240)] #creates 240 neurons
	for i in xrange(0,len(genome),3):   #for each gene:
		gene = connectionGene(genome[i:i+3])
		neurons[gene.neuron_2].input_indices.append(gene.neuron_1)   #the last neuron of each gene gets its input and weight vectors updated
		neurons[gene.neuron_2].input_weights.append(gene.weight)
	return NeuralNetwok(neurons[16:],neurons[:16],range(240,256))


def newGenome(connections):
	#creates a very simple genome
	genome = ''
	for i in xrange(connections):
		in_neuron = random.randrange(16)
		out_neuron = random.randrange(240,256)
		genome += chr(in_neuron) + chr(out_neuron) + chr(255) #simply links inputs to outputs
	return Genome(genome, range(16)+range(240,256))


def neatSystem(targetFunction,species_count,starting_species_size,starting_complexity):
	#starts with a simple Neural Network
	#target function takes a neural network object and runs it calculating a fitness
	species = [[newGenome(starting_complexity) for j in xrange(starting_species_size)] for i in xrange(species_count)]
	best = []
	best_scores = [0,0,0,0,0] #best not so important



class Genome:
	def __init__(self, genome,active_nodes):
		self.code = genome
		self.active_nodes = set(active_nodes) #assume active nodes are inputs and outputs

	
	#_____________ Mutation_strategies ____________________

	def insertNode(self):
		#adds a connection to, and from a new node:
		new_node = random.sample(set(range(256))-self.active_nodes,1)
		connected_neurons = random.sample(self.active_nodes,2)
		new_active_nodes = self.active_nodes + set([new_node])
		new_genome = self.genome +  chr(connected_neurons[0]) + chr(random.randrange(256)) + 
		new_genome += chr(connected_neurons[1]) + chr(random.randrange(256)) + chr(random.randrange(256))
		return Genome(new_genome,new_active_nodes)

	def addConnection(self):
		#picks two active nodes and creates a connection between them
		new_genome = self.genome + chr(random.sample(self.active_nodes,1)) + chr(random.sample(self.active_nodes,1)) + chr(random.randrange(256))
		return Genome(new_genome,self.active_nodes)

	def mutateConnection(self,mutation_rate):
		#modifies cannection_weights
		new_genome = list(self.genome)
		for i in xrange(0,len(new_genome),3)
			X = random.random()
			if x<mutation_rate:
				new_genome[i+2] = chr(random.randrange(256))
		return Genome




#___________________________ simple neural network _________________________

def sigmoid(x):
	return math.tanh(x)

class NeuralNetwok:
	def __init__(self,neurons,inputs,outputs):
		self.neurons = neurons
		self.inputs = inputs
		self.outputs = outputs
		self.neurons = self.neurons+self.inputs

	def Evaluate_network(self,input_vector):
		for i in xrange(len(input_vector)):
			self.inputs[i].value = input_vector[i]
		for neuron in self.neurons:
			neuron.evaluate(self)
		return_vector = []
		for index in self.outputs:
			return_vector.append(self.neurons[index].value)
		return return_vector

class Neuron:
	def __init__(self,input_indices,input_weights):
		self.input_indices = input_indices
		self.input_weights = input_weights
		self.connected = False
		self.value = 0

	def evaluate(self,network):
		total = 0
		for i in len(self.input_indices):
			total += network.neurons[self.input_indices[i]].value*self.input_weights[i]
		value = sigmoid(total)

class inputNeuron:
	def __init__(self,input_indices,input_weights):
		self.input_indices = input_indices
		self.input_weights = input_weights
		self.connected = False
		self.value = 0

	def evaluate(self,network):
		pass #do nothing since this is an input neuron





