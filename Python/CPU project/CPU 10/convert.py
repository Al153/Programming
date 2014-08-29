#Converts a JSON file for ml to a C style one
import json
import sys

def bytify(integer):
	return_array = [0,0,0,0]
	for i in range(4):
		return_array[i] = integer&255    
		integer >>= 8
	return_array.reverse()
	return_string = ''
	for char in return_array:
		return_string += chr(char)
	return return_string

def main():
	json_file = open(sys.argv[1]).read()
	json_dict = json.loads(json_file)
	binary_string = ''
	for key in json_dict:
		binary_string += bytify(int(key)) + chr(int(json_dict[key])&255)+chr(0) #the last byte is to tell whether it'sthe end of file
	binary_string = binary_string[:-1] + chr(1) #adds stop signal

	destination_file = open(sys.argv[1][:-2]+"cml",'w')
	destination_file.write(binary_string)
	destination_file.close()


def set_memory(data,address):
	pass

def test():
	print open("Machine code\\Fibonacci.cml",'r').read()
	test_file = open("Machine code\\Fibonacci.cml",'r')
	address = 0
	state = 0
	for char in test_file.read():
		if state == 0:
			address = ord(char)
			state = 1
		elif state == 1:
			address <<= 8
			address += ord(char)
			state = 2
		elif state == 2:
			address <<= 8
			address += ord(char)
			state = 3
		elif state == 3:
			address <<= 8
			address += ord(char)
			state = 4
		elif state == 4:
			set_memory(ord(char),address)
			state = 5
		elif state == 5:
			print hex(ord(char))[2:]
			if char == chr(1):
				state = 6
			else:
				state = 0

		if state == 6:
			quit()

def alternate_convert():
	char_array = []
	json_file = open(sys.argv[1]).read()
	json_dict = json.loads(json_file)
	for key in json_dict:
		address = int(key)
		char = chr(int(json_dict[key]))
		if len(char_array)>address: #if space then sticks in correct space
			char_array[address] =  char
		else:  #else extend array
			char_array += [char(0) for i in range(address - len(char_array) + 1)]

	char_string = ''.join(char_array)
	destination_file = open(sys.argv[1][:-2]+"cml",'w')
	destination_file.write(binary_string)
	destination_file.close()





main()
test()

