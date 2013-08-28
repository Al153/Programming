
def parallel_sort(labels,data):
    '''parallel_sort(labels,data)'''
    for
    return (newlabels,newdata)

def gcd(a,b):
    if a>b:
        temp = a
        a = b
        b = temp
    while 1:
        if a == 0:
            return b
            break
        elif b == 0:
            return a
            break
        else:
            temp = a
            a = b%a
            b = temp

def collision_find(string):
    results = []
    result_values = []
    for i in range(1,len(string)):
        tally = 0
        for j in range(len(string)):
            if string[j] == string[i+j]:
                tally += 1
        results.append(i)
        result_values.append(tally)
    sorted_results = parallel_sort(results,result_values)[0]
    
    
    
