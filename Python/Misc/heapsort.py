class Heap(list):
	def __init__(self,array):
		for heap_pointer in xrange(len(array)):
			print array
			ptr = heap_pointer
			stop = False
			while (not stop) and (ptr != 0):
				new_ptr = (ptr-1)/2
				if array[new_ptr]<array[ptr]: #if child is greater than parent
					array[ptr],array[new_ptr] = array[new_ptr],array[ptr] #swap
				ptr = new_ptr
		self.heap = array

	def sort(self):
		array =self.heap
		value_range = list(xrange(len(array)))
		value_range.reverse()
		for heap_pointer in value_range:
			print array
			temp = array[0]
			ptr = 0
			while ptr <= heap_pointer:
				try:
					if array[(2*ptr)+1]>array[(2*ptr)+2]:
						if (2*ptr)+1<=heap_pointer:
							array[ptr] = array[(2*ptr)+1]
						ptr = (2*ptr)+1
					else:
						if (2*ptr)+2<=heap_pointer:
							array[ptr] = array[(2*ptr)+2]
						ptr = (2*ptr)+2
				except IndexError:
					try:
						if (2*ptr)+1<=heap_pointer:
							array[ptr] = array[(2*ptr)+1]
						break
					except:
						break
			array[heap_pointer] = temp
		return array

print "creating heap"
Heap = Heap([0,4,2,4,6,8,7,2,9,1])
print "\n\n\nSorting heap"
print Heap.sort()
