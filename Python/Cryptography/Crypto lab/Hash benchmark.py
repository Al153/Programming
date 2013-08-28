import Hash
import time

start = time.time()
for i in xrange(1000):
    x = Hash.digest(str(i))
    if i%100 == 0:
        print i//10
print time.time()-start
