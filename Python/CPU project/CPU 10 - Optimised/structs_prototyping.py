#define style


"""
Struct <name> [param1] [param2]
[element1]
[element2]
.
.
.
end Struct

"""
#to call
"""
<name> instance 5 6

Load gp0 @instance.[element1]
"""
def find_structs(tokens):
	struct_names = []
	i = 0
	while i < len(tokens):
		line = tokens[i]
		if line[0] == "Struct":
			struct = []
			struct_names.append(line[1])
			while tokens[i] != ["end","Struct"]:
				struct.append(line) 
				del tokens[i]
			tokens = execute_struct(struct,tokens,struct_names)
		else:
			i += 1
	return tokens

def execute_struct(struct,tokens,struct_names):
	name = struct[0][1]
	parameters  = struct[0][2:]

	i = 0
	while i <len(tokens):

		if tokens[i][0] != name:
			i += 1
		else: #struct detected
			instance_name = tokens[i][1]
			find_replace_dict = {}
			for j in xrange(len(parameters)):
				find_replace_dict[parameters[j]] = tokens[i][2+j]

			instance = []
			for line in struct[1:]:
				instance_line = []
				if line[0] == "int" or line[0] == "char" or line[0] == "ptr" or line[0] =="array" or line[0] in struct_names:
					line[1] = instance_name+"."+line[1]
				instance_line.append([find_replace_dict.get(token,token) for token in line]) #copy across
				instance.append(instance_line)
			tokens = tokens[:i]+instance+tokens[i+1:]
	return tokens









