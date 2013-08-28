import json

#entry 

def add_to_log(entry):
	global data_list
	data_list.append(entry)


def search_for(species,postcode,data_list,timestamp):
	global species_pos #predefined positions in entry
	global postcode_pos
	global timestamp_pos
	relevant_data_list = []
	for entry in data_list:
		if entry[species_pos] == species:
			relevant_data_list.append(entry)
	data_list = relevant_data_list
	relevant_data_list = []

def expand_search(postcode_list):




def import_list(filename):
	data_file = open(filename,"r+")
	data_list = json.loads(data_file.read())
	return data_list

def export_list(filename,data_list):
	data_string = json.dumps(data_list)
	data_file = open(filename,"w")
	data_file.write(data_string)
