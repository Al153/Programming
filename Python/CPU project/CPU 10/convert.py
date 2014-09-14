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
	source_name = sys.argv[1]
	destination_name = "C machine code\\"+source_name.split("\\")[1][:-2]+"cml"
	json_file = open(source_name).read()
	json_dict = json.loads(json_file)
	binary_string = ''
	for key in json_dict:
		binary_string += bytify(int(key)) + chr(int(json_dict[key])&255)+chr(0) #the last byte is to tell whether it'sthe end of file
	binary_string = binary_string[:-1] + chr(1) #adds stop signal

	destination_file = open(destination_name,'wb')
	destination_file.write(binary_string)
	destination_file.close()

main()

