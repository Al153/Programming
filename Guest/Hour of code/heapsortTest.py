def getLChild(i):
    return 2*i + 1

def getRChild(i):
    return 2*i + 2

def getParent(i):
    return (i-1)/2

def siftDown(array, root, end):
    # sifts down a value to its right spot
    while True:
        # get children
        lChild = getLChild(root)
        rChild = getRChild(root)
        
        if lChild >= end: # if there are no children:
            break
        if rChild >= end and (array[lChild] < array[rChild]): # if there are both children, then find the minimum child to compare
            maxChild = rChild
        else: # otherwise the maximum child is the left child
            maxChild = lChild
            
        if array[root] < array[maxChild]: # see if we need to swap out the root
            array[root], array[maxChild] = array[maxChild], array[root]
            root = maxChild
        else: # if we don't then we're done
            break
            
            
  
            

def create_heap(array):
    # linear heap construction
    # build a max heap
    for i in xrange(len(array)/2,-1,-1):
        siftDown(array,i, len(heap))
        
    
def heapToSorted(heap):
    for i in xrange(len(heap)-1,0,-1):
        heap[i], heap[0] = heap[0], heap[i]
        siftDown(heap,0,i)

def sortIntegers(n):
    # create heap
    createHeap(n)
    heapToSorted(n1)
    return n
