########################## Not complete




Array list



#_____________ Heapsort _______________

def heap gp1

def i gp2
def left gp3
def right gp4

def index1 gp5
def index2 gp6
def index3 gp7


def parent gp3
def child gp4
# . . . i A ==> . . . A


#_______________ Add to heap _______________

Compare i Zero %add_to_heap
if equal then Return

Move i index1
Move i index2
SUB index1 One
SHR index1 One
ADD index1 heap
ADD index2 heap

LoadByte parent 0 [index1]
LoadByte child 0 [index2]

Compare parent child
if Less then Load PC add_to_heap.swap       #=====
Return										#     |
 											# 	  |
StoreByte parent 0 [index2] %add_to_heap.swap   # <====    
StoreByte child 0 [index1]
SUB i One
SHR i One
Call add_to_heap
Return

#_______________ remove_top _______________
Load index3 Heapsort.target %remove_top
ADD index3 heap
LoadByte gp3 0 [heap]
LoadByte gp4 0 [index3]
StoreByte gp3 0 [index3]
StoreByte gp4  0 [heap]
Move Zero i
Call work_down
Return

#_______________ work_down _______________
Move i index1   #index1 = i         %work_down
Move i index2   #index2 = 2i+1
Move i index3   #index3 = 2i+2

SHL index2 One
SHL index3 One
ADD index2 @1
ADD index3 @2

Compare index2 Heapsort.target
