from decimal import Decimal
from math import *
import time

x = 2
guess = 2
start = time.time()
for i in range (10):
    guess2 = Decimal(x/guess)
    guess = Decimal((guess/2)+(guess2/2))
end = time.time()
print "Time one",end - start, "sec"
print "result one", guess

start = time.time()
root = Decimal(sqrt(x))
end = time.time()
print "Time two:", end - start, "sec"
print "result two:", root
