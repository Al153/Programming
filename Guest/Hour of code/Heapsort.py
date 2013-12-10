def heapsort(lst):
  ''' Heapsort. Note: this function sorts in-place (it mutates the list). '''

  compare_count = 0
  print "Creating heap"
  for start in range((len(lst)-2)/2, -1, -1):
    compare_count = siftdown(lst, start, len(lst)-1,compare_count)
    print lst
  print "decomposing heap"
  for end in range(len(lst)-1, 0, -1):
    lst[end], lst[0] = lst[0], lst[end]
    compare_count = siftdown(lst, 0, end - 1,compare_count)
    print lst
  print "result = ",lst
  print "\nSwapcount = ", compare_count
 
def siftdown(lst, start, end,compare_count):
  root = start
  while True:
    child = root * 2 + 1
    if child > end: break
    compare_count += 2 #two compares
    if child + 1 <= end and lst[child] < lst[child + 1]:
      child += 1
    if lst[root] < lst[child]:

      lst[root], lst[child] = lst[child], lst[root]
      root = child
    else:
      break
  return compare_count



def bubbleSort(alist):
  compare_count = 0
  for passnum in range(len(alist)-1,0,-1):
    for i in range(passnum):
      print alist
      compare_count += 1
      if alist[i]>alist[i+1]:
        
        temp = alist[i]
        alist[i] = alist[i+1]
        alist[i+1] = temp
  
  print "result = ",alist
  print "\nSwapcount = ", compare_count

def insertionSort(alist):
 compare_count = 0
 for index in range(1,len(alist)):

  currentvalue = alist[index]
  position = index
  while position>0 and alist[position-1]>currentvalue:
    print alist
    compare_count += 1
    alist[position]=alist[position-1]
    position = position-1

  alist[position]=currentvalue

def mergeSort(alist):
  print("Splitting ",alist)
  if len(alist)>1:
    mid = len(alist)//2
    lefthalf = alist[:mid]
    righthalf = alist[mid:]

    mergeSort(lefthalf)
    mergeSort(righthalf)

    i=0
    j=0
    k=0
    while i<len(lefthalf) and j<len(righthalf):
      if lefthalf[i]<righthalf[j]:
        alist[k]=lefthalf[i]
        i=i+1
      else:
        alist[k]=righthalf[j]
        j=j+1
      k=k+1

    while i<len(lefthalf):
      alist[k]=lefthalf[i]
      i=i+1
      k=k+1

    while j<len(righthalf):
      alist[k]=righthalf[j]
      j=j+1
      k=k+1
  print("Merging ",alist)

