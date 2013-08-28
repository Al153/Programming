import assemblerTools

def assemble():
	file_object,file_name = assemblerTools.extract_program_prompt()
	print assemblerTools.assemble_program(file_object,file_name)
def pretokenize():
	file_object,file_name = assemblerTools.extract_program_prompt()
	assemblerTools.pretokenize(file_object,file_name)
def User_prompt():
	error = 1
	while error:
		operation = str(raw_input("Please enter desired operation: (assemble or tokenize) "))
		if operation == "assemble":
			assemble()
			error = 0
		elif operation == "tokenize":
			pretokenize()
			error = 0
		else:
			print "Failure, please check operation"

User_prompt()
