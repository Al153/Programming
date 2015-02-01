def assembly_optimise(assembly_code):
	assembly_code = remove_tabs_and_spaces(assembly_code)
	assembly_code = peephole_optimise(assembly_code)
	assembly_code = reorder_pops(assembly_code)
	assembly_code = peephole_optimise(assembly_code) #second round of peephoing to take advantage of any peepholes opened by reordering
	assembly_code = merge_loads_and_moves(assembly_code)
	return assembly_code + "\n"

def peephole_optimise(assembly_code):
	'''a peephole optimiser, looks for simple instruction level optimisations'''
	#remove unnecessary push-pop pairs, optimises by up to 40%

	push_pop_type_0 = '''Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
SUB gp7 @4 															#POP GP0
Load gp0  Expression_stack [gp7]
'''
	push_pop_type_1 = '''Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
'''

	push_pop_type_2 = '''Store gp0 Expression_stack [gp7]									#PUSH GP0
ADD gp7 @4
Compare gp7 stack_length
if Greater then Load PC Stack_overflow_error
SUB gp7 @4 															#POP TO INDEX REGISTER
Load gp6 Expression_stack [gp7]
'''

	while push_pop_type_0 in assembly_code:
		#print "optimisations"
		index = assembly_code.index(push_pop_type_0)
		assembly_code = assembly_code[:index]+assembly_code[index+len(push_pop_type_0):]
	while push_pop_type_1 in assembly_code: #push gp0 pop gp1 ==> Move gp0 gp1
		#print "optimisations"
		index = assembly_code.index(push_pop_type_1)
		assembly_code = assembly_code[:index]+"Move gp0 gp1 						#PUSH gp0 POP gp1\n"+assembly_code[index+len(push_pop_type_1):]
	while push_pop_type_2 in assembly_code: #push gp0 pop gp1 ==> Move gp0 gp1
		#print "optimisations"
		index = assembly_code.index(push_pop_type_2)
		assembly_code = assembly_code[:index]+"Move gp0 gp6 						#PUSH gp0 POP gp6\n"+assembly_code[index+len(push_pop_type_2):]	

	return assembly_code

def remove_tabs_and_spaces(assembly_code):
	#removes whitespace in whitespace only lines
	lines = assembly_code.split("\n")
	i = 0
	whitespace = (" ","\t")
	while i<len(lines):
		is_whitespace_line = 1
		for character in lines[i]:
			if character not in whitespace:
				is_whitespace_line = 0
				break
		if is_whitespace_line:
			lines = lines[:i]+lines[i+1:]
			i -= 1
		i = i + 1
	assembly_code = '\n'.join(lines)
	return assembly_code

def reorder_pops(assembly_code):
	#looks for instructions of the form
	'''Load gp0 <address>
											

SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]
'''
	#and converts them to 
	'''SUB gp7 @4 															#POP GP1
Load gp1 Expression_stack [gp7]

Load gp0 <address>
'''
	#which allows further peephole optimisations (push-pops)
	#improves coe length by around 10%
	lines = assembly_code.split("\n")
	i = 0
	while i<len(lines):
		if (len(lines[i])>8) and (lines[i][:8] == "Load gp0") and (lines[i] != "Load gp0  Expression_stack [gp7]"):
			if (lines[i+1] == "SUB gp7 @4 															#POP GP1") and (lines[i+2] == "Load gp1 Expression_stack [gp7]"):
				lines = lines[:i]+[lines[i+1],lines[i+2],lines[i]] + lines[i+3:]

		i = i + 1
	assembly_code = '\n'.join(lines)
	return assembly_code

def merge_loads_and_moves(assembly_code):
	lines = assembly_code.split("\n")
	i = 0
	while i<len(lines):
		if (len(lines[i])>8) and (lines[i][:8] == "Load gp0"):
			if lines[i+1][:9] == "Move gp0 ":
				lines = lines[:i]+["Load "+lines[i+1][9:12] +lines[i][8:]] + lines[i+2:]



		i = i + 1
	assembly_code = '\n'.join(lines)
	return assembly_code


