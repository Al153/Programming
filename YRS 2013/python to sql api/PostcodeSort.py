def filter_characters(postcode_list): #chops postcodes down to form ABxy (or equivalent)
	prefixes = []
	suffixes = []
	for line in postcode_list:
		prefix = ''
		state = "prefix"
		suffix = ''
		for character in line:
			if character == ' ':
				state = "suffix"
			else:
				if state == "prefix":
					prefix += character
				else:
					suffix += character
		prefixes.append(prefix)
		suffixes.append(suffix)
	return prefixes,suffixes

def count(postcode_list,suffixes): #turns into list of form [[3,RG12],[5,rg14].....]
	condensed_list = []
	numbers_list = []
	zipped_list = []
	chosen_suffixes = []
	for line in postcode_list:
		if line in condensed_list:
			numbers_list[condensed_list.index(line)] += 1
			chosen_suffixes[condensed_list.index(line)] = suffixes[postcode_list.index(line)]
		else:
			numbers_list.append(1)
			condensed_list.append(line)
			chosen_suffixes.append(suffixes[postcode_list.index(line)])

	for i in xrange(len(condensed_list)):
		zipped_list.append([numbers_list[i],condensed_list[i]+chosen_suffixes[i]])
			
	return zipped_list

def find_max(postcode_list): #finds maximum postcodes
	postcode_list.sort()
	sorted_list = []
	for line in postcode_list:
		sorted_list.append(line[1])
	#print sorted_list
	sorted_list.reverse()
	if len(sorted_list) < 5:
		if len(sorted_list) == 0:
			most_common = []
		else:
			length_needed = 5-len(sorted_list)
			most_common = sorted_list + sorted_list[0:1]*length_needed
	else: 
		most_common = sorted_list[:5]
	return most_common

def main(postcode_list):
	postcode_list,suffixes = filter_characters(postcode_list)
	#print "postcode list:", postcode_list
	zipped_list = count(postcode_list,suffixes)
	#print "counted list", zipped_list
	best = find_max(zipped_list)
	return best
