myList = [10,9,5,3,4,2,1]
myLabels = ['a','b','c','d','e','f','g']


for j in range (len(myList)-1):
    for i in range (len(myList)-1-j):
        a = myList[i]
        la = myLabels[i]
        b = myList [i+1]
        lb = myLabels[i+1]
        if a>b:
            myList [i+1] = a
            myList [i] = b
            myLabels[i+1] = la
            myLabels[i] = lb
            
            print myList
            print myLabels
        
