#beaver test
l = [1,2,3,4,5,6,0]
for i in range (len(l)-1):
    t = len(l)-(i+1)
    l[t] = l[t-1]
    print l
