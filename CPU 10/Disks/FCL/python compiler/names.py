def createFASMName(name,scope):
	# ( str -> str )
	# converts a name longer than 8 chars to one which is simply 8 chars
	# done by taking the first 6 bytes of the name and appending a simple hash of the name to it
	# if that name is already taken, then apply a linear probing technique to generate the new name



def getFASMName(name,scope):