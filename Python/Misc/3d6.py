myList = [0]*19


for i in xrange(6):
    for j in xrange(6):
        for k in xrange(6):
            a = i + j +k +3
            myList[a] += 1
            

for i in xrange(3,19):
    print i, myList[i]
