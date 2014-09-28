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

def main2():
	source_name = sys.argv[1]
	destination_name = "Bootstrap Machine Code\\"+source_name.split("\\")[1][:-2]+"bml"
	json_file = open(source_name).read()
	json_dict = json.loads(json_file)
	list_size = 1048000
	binary_list = [0]*list_size
	for key in json_dict:
		if int(key)<list_size:
			binary_list[int(key)] = int(json_dict[key])&255
	new_binary_list = []
	for i in xrange(len(binary_list)-1,-1,-1):
		if binary_list[i]:
			break
		else:
			binary_list = binary_list[:i]
	binary_list.reverse

	for i in binary_list:
		if i:
			new_binary_list += [chr(16 + (i>>4)),chr(16 + (i&15))]

	new_binary_list += [chr(128)]
	destination_file = open(destination_name,'wb')
	destination_file.write(''.join(new_binary_list))
	destination_file.close()

main()
main2()

