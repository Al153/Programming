to_sort = [5,4,3,2,1]
for i in range(1,len(to_sort)):
    j = i
    while j>0 and to_sort[j] < to_sort[j-1]:
        holder = to_sort[j]
        to_sort[j] = to_sort[j-1]
        to_sort[j-1] = holder
        j = j - 1
        print to_sort
    
            
