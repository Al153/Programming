primes = [2,3,5,7,11,13,17,19,23,29,31,37,41,43,47,53,59,61,67,71,73,79,83,89,97
                   ,101,103,107,109,113,127]
highscore = 0
print 'begin'
for p in primes:
    for q in primes:
        m = p*q
        if m < 256:
            print "testing", m
            for seed in primes:
                period = 1
                new_seed = (seed**2)%m
                while new_seed != seed:
                    new_seed = (new_seed**2)%m
                    period += 1
                if period>highscore:
                    highscore = period
                    print 'highscore:',highscore , 'P,Q,SEED:', p,q,seed
    
print "finished"
