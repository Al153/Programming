IMD1 = 120
a = []
IMD1 = str(bin(IMD1)[2:].zfill(8))
for j in range (8):
    if IMD1 [j] == '1':
        a.append(True)
    else:a.append(False)
#print a
#print a [0:4]
#print a [4:8]
c = [0,0,0,0,0,0,0,0]
c[0:4] = a[4:8]
c[4:8] = a[0:4]

#print c



class MyClass:
    value = 0
    def getValue(self,value):
        self.value = value
        one = 'one'
        #print one
    def switcheroo(self):
        value = self.value
        value += 1
        self.value = value
primes = [2,3,5,]
for i in primes:
    print i
    
