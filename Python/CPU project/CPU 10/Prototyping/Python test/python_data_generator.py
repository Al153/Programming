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
t_set = [
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

print create_training_set(t_set,"training_set")