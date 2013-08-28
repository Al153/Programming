x = [1,1]
t = type(x)
print t
print type(t)
if isinstance(x,list):
    print 'x = list'
    
mylist = (1,2)
if isinstance(mylist,list) or isinstance(mylist,tuple):
    print'True'

tape = (1,2,3)
tape2 = list(tape)
print tape2

for i in range (3):
    print i
