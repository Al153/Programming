import sys

def main():
	python_file_names = get_file_names()
	pyfth_source = list(open("PyfthTools.py"))
	for name in python_file_names:
		pyfth_source = modify_source(pyfth_source,name)
	create_new_pyfth_interpreter(pyfth_source)
	import modded_interpreter

def get_file_names():
	python_file_names = []
	for name in sys.argv[1:]:
		python_file_names.append(name)
	return python_file_names


def modify_source(source_lines,python_file_name):
	source_lines.insert("import "+python_file_name,0) #adds inmport <file_name> line
	new_lines = extract_new_lines(python_file_name)
	for i in xrange(len(source_lines)): #inserts new lines into code
		if source_lines[i-1] == "		self.inbuilt_words = {":
			for j in xrange(len(new_lines)):
				source_lines.insert(new_lines[j],i+j)
			break
	return source_lines

def extract_new_lines(python_file_name):
	python_file_name += ".py"
	python_file = open(python_file_name)
	found_code = 0
	code_lines = []
	for line in python_file:
		if not found_code:
			if line == "#code_to_import":
				found_code = 1
		else:
			if line == "#end_of_code_to_import":
				break
			else:
				code_lines.append(line+",")
	python_file.close()
	return code_lines

def create_new_pyfth_interpreter():
