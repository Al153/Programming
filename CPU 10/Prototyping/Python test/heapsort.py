def add_to_heap(heap,i):
	if heap[(i-1)>>1] < heap[i] and i != 0:
		heap[i],heap[(i-1)>>1] = heap[(i-1)>>1],heap[i]
		heap = add_to_heap(heap,(i-1)>>1)
	return heap

def remove_top(heap,target):
	heap[0],heap[target] = heap[target],heap[0]
	heap = work_down(heap,0,target)
	return heap

def work_down(heap,i,limit):

	if 2*i+1 < limit and   heap[2*i+1] > heap[2*i+2] :
		if heap[2*i+1]>heap[i]:
			heap[2*i+1],heap[i] = heap[i],heap[2*i+1]
			return work_down(heap,2*i+1,limit)

	elif 2*i+2 < limit:
		if heap[2*i+2]>heap[i]:
			heap[2*i+2],heap[i] = heap[i],heap[2*i+2]
			return work_down(heap,2*i+2,limit)
	else:
		return heap


def heapsort(array):
	for i in xrange(1,len(array)):
		array = add_to_heap(array,i)
	for i in xrange(len(array)-1,0,-1):
		remove_top(array,i)
	return array


print heapsort([1,3,5,2,6,1,5,73,1])

