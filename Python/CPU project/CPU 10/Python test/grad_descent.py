def dot(v1,v2):
	if len(v1)!=len(v2):
		print "Error: dotted vectors different lengths"
		quit()
	return sum([v1[i]*v2[i] for i in xrange(len(v1))])

def partialDerivatives(model,training_set):
	n = len(training_set)
	gradient_vector = [0]*len(model)
	n = -2.0/float(n)

	model_size = len(model)

	for training_example in training_set:
		error = training_example[0]-dot(model,training_example[1])
		for i in xrange(len(model)):
			gradient_vector[i] += training_example[1][i]*error
	return [i*n for i in gradient_vector]


def Error(model,training_set):
	error = 0.0
	n = len(training_set)
	for example in training_set:
		partial_error = example[0] - dot(example[1],model)
		error += partial_error*partial_error
	return error/float(n)

def updateTheta(model, training_set, learning_rate):
	gradients = partialDerivatives(model,training_set)
	print gradients
	error = Error(model,training_set)
	gradients = [learning_rate * grad/error for grad in gradients]
	model = [model[i]-gradients[i] for i in range(len(model))]
	return model


def GradientDescent(training_set,rounds,temperature,cool_rate):
	n = len(training_set[0])
	model = [0]*n
	for i in xrange(rounds):
		print "round: ",i
		model = updateTheta(model,training_set,temperature)
		temperature *= cool_rate
	return model

training_set = [
	[0.0	,[1.0,3.0]],
	[0.5	,[1.0,1.0]],
	[1.0	,[1.0,1.1]],
	[1.0	,[1.0,1.5]],
	[1.21,[1.0,2.3]],
	[1.9	,[1.0,2.5]],
	[2.3	,[1.0,2.7]],
	[2.5	,[1.0,3.0]],
	[2.5	,[1.0,2.9]],
	[2.7	,[1.0,3.1]],
	[2.7	,[1.0,3.0]],
	[2.6	,[1.0,3.6]],
	[2.7	,[1.0,3.7]],
	[2.7	,[1.0,4.4]],
	[3.7	,[1.0,4.1]],
	[6.7	,[1.0,3.9]],
	[7.8	,[1.0,4.7]],
	[4.5	,[1.0,4.6]],
	[4.6	,[1.0,4.8]],
	[5.6	,[1.0,5.1]],
	[5.43,[1.0,5.5]],
	[7.8	,[1.0,5.6]],
	[5.9	,[1.0,5.7]],
	[6.21,[1.0,6.3]],
	[6.8	,[1.0,6.1]],
	[7.1	,[1.0,6.9]],
	[5.6	,[1.0,7.1]],
	[8.1	,[1.0,7.9]],
	[8.3	,[1.0,8.5]],
	[8.4	,[1.0,11.6]],
	[2.7	,[1.0,10.0]],
	[9.0	,[1.0,15.7]],
	[9.1	,[1.0,19.9]],
]

model = GradientDescent(training_set,50,0.01,0.9999)

print "model = ",model