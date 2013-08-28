def gcd(a,b):
    while b != 0:
        t = b
        b = a % t
        a = t
    return a

count = 1

for i in range (8):
    if gcd(i,2013) != 1:
        count += 1

print count


