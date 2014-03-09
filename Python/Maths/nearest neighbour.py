def nearest_neighbour(node,array,route,i):
	array = delete_row(array,node)
	if i == len(array):
		return route
	else:
		route[i] = node
		new_node = find_min(array[node])
		return nearest_neighbour(new_node,array,route,i+1)

def find_min(array):
	minimum = 4294967295
	index = 0
	for i in xrange(len(array)):
		if array[i]<=minimum:
			index = i
			minimum = array[i]
	return index

def delete_row(array,node):
	for i in xrange(len(array)):
		array[i][node] = 4294967295
	return array


test_array = [
	[4294967295,     	 5,			 3,		     6],
	[		  5,4294967295,			10,	         5],
	[		  3,		10,	4294967295,			 7],
	[		  6,		 5,			 7,	4294967295]
]
print nearest_neighbour(0,test_array,[0,0,0,0],0)