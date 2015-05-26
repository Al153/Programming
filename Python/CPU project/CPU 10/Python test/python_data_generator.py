#script for generating CLL data sets

def create_training_set(training_set,ouput_set_name):
	cll_string = ''
	i = 0
	for example in training_set:
		expected = example[0]
		data = example[1]
		size = len(data)
		line = '@int '+str(size + 1) + " v"+str(i) + " = ["+str(size)
		for item in data:
			line += ', ' + str(float(item))
		line += "]; @int e" +str(i) + " = malloc(2); e"+ str(i) + "[0] = " + str(float(expected)) + ";"
		line += "e"+str(i) + "[1] = vector(v"+str(i)+");	setInsert("+ouput_set_name+", e"
		line += str(i)+");\n"
		
		cll_string+=line
		i += 1

	return cll_string



t_set = []
for i in range(5):
	for j in range(5):
		for k in range(5):
			t_set.append([
					2.3+4.5*i-2.0*j+3.3*k,[1.0,i,j,k]
				])

print create_training_set(t_set,"training_set")