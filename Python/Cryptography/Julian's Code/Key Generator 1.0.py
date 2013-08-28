import time
while True:
    try:
        keylen = int(raw_input("Enter the keylength: "))
        break
    except ValueError:
        pass
start = time.time()
cddkey = (keylen + 1)*[0]
while cddkey[keylen] != 1:
    print cddkey
    cddkey[0] += 1
    for n in range(keylen):
        if cddkey[n] == 26:
            cddkey[n] = 0
            cddkey[n+1] += 1
        else:
            break
print time.time() - start
