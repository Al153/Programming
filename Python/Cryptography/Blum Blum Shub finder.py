primes = [2,3,5,7,11,13,17,19,23,29,31,37,41,43,47,53,59,61,67,71,73,79,83,89,97
                   ,101,103,107,109,113,127]
highscore = 0
attempt = 0
print 'begin'
for p in primes:
    for q in primes:
        m = p*q
        
        if m < 256:
            for seed in primes:
                #print seed
                attempt += 1
                #print attempt
                period = 1
                if seed**2%m == 0:
                    break
                new_seed = (seed**2) % m
                test_array = []
                while new_seed != seed:
                    
                    test_array.append(new_seed)
                    new_seed = (new_seed**2)%m
                    period += 1
                    for i in range (len(test_array)):
                        if new_seed == test_array[i]:
                            new_seed = seed
                            break
                    test_array.append(new_seed)
                
                if period>highscore:
                    highscore = period
                    print 'highscore:',highscore , 'P,Q,SEED:', p,q,seed
    
        else: attempt+=1
print 'done'
